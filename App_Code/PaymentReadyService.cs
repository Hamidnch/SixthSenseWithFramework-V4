using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
/// <summary>
/// Summary description for PaymentReadyService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class PaymentReadyService : System.Web.Services.WebService {
    
    private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
    private static IDbConnection CreateConnection()
    {
        IDbConnection cnn = new System.Data.SqlClient.SqlConnection(ConnectionString);
        cnn.Open();
        return cnn;
    }
    public PaymentReadyService (){}
    public class UserPayment : BaseEntity
    {
        private int rowIndex;
        private int payment_UserID;
        private string bankName;
        private string payment_Amount;
        private string payment_SettleDate;
        private string payment_VerificationDate;
        private string payment_ReservationNumber;
        private string payment_ReferenceNumber;
        private string payment_TransactionState;
        private string payment_UserName;

        public int RowIndex
        {
            get { return rowIndex; }
            set { rowIndex = value; }
        }
        public int Payment_UserID
        {
            get { return payment_UserID; }
            set { payment_UserID = value; }
        }

        public string Payment_UserName
        {
            get { return payment_UserName; }
            set { payment_UserName = value; }
        }
        public string BankName
        {
            get { return bankName; }
            set { bankName = value; }
        }
        public string Payment_Amount
        {
            get { return payment_Amount; }
            set { payment_Amount = value; }
        }
        public string Payment_SettleDate
        {
            get { return payment_SettleDate; }
            set { payment_SettleDate = value; }
        }
        public string Payment_VerificationDate
        {
            get { return payment_VerificationDate; }
            set { payment_VerificationDate = value; }
        }
        public string Payment_ReservationNumber
        {
            get { return payment_ReservationNumber; }
            set { payment_ReservationNumber = value; }
        }
        public string Payment_ReferenceNumber
        {
            get { return payment_ReferenceNumber; }
            set { payment_ReferenceNumber = value; }
        }
        public string Payment_TransactionState
        {
            get { return payment_TransactionState; }
            set { payment_TransactionState = value; }
        }

    }
    private static UserPayment BuildUserPayment(IDataReader reader)
    {
        UserPayment userPayment = new UserPayment();
        userPayment.RowIndex = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);
        userPayment.Payment_UserID = reader.IsDBNull(1) ? 0 : reader.GetInt32(1);
        userPayment.Payment_UserName = reader.IsDBNull(2) ? string.Empty : reader.GetString(2).Trim();
        userPayment.BankName = reader.IsDBNull(3) ? string.Empty : reader.GetString(3).Trim();
        userPayment.Payment_Amount = reader.IsDBNull(4) ? string.Empty : PersianClass.getPersianNumberStyle(string.Format("{0:n0}",reader.GetInt32(4)));
        userPayment.Payment_SettleDate = reader.IsDBNull(5) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(5),"D",  true, "H");
        userPayment.Payment_VerificationDate = reader.IsDBNull(6) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(6), "D", true, "H");
        userPayment.Payment_ReservationNumber = reader.IsDBNull(7) ? string.Empty : PersianClass.getPersianNumberStyle(reader.GetString(7).Trim());
        userPayment.Payment_ReferenceNumber = reader.IsDBNull(8) ? string.Empty : reader.GetString(8).Trim();
        userPayment.Payment_TransactionState = reader.IsDBNull(9) ? string.Empty : reader.GetString(9).Trim();
        return userPayment;
    }
    [WebMethod()]
    public PagedResult<UserPayment> getUserPaymentUnSuccessFull(int start, int max, string sortColumn, string sortOrder)
    {
        if (max == 0) { max = 10; }
        if (string.Compare(sortColumn, "Payment_UserName") == 0)
        { sortColumn = "Payment_UserID"; }
        if (string.Compare(sortColumn, "BankName") == 0)
        { sortColumn = "Payment_BankID"; }
        else if (string.Compare(sortColumn, "Payment_Amount") == 0)
        { sortColumn = "Payment_Amount"; }
        else if (string.Compare(sortColumn, "Payment_SettleDate") == 0)
        { sortColumn = "Payment_SettleDate"; }
        else if (string.Compare(sortColumn, "Payment_VerificationDate") == 0)
        { sortColumn = "Payment_VerificationDate"; }
        else if (string.Compare(sortColumn, "Payment_ReservationNumber") == 0)
        { sortColumn = "Payment_ReservationNumber"; }
        else if (string.Compare(sortColumn, "Payment_ReferenceNumber") == 0)
        { sortColumn = "Payment_ReferenceNumber"; }
        else if (string.Compare(sortColumn, "Payment_TransactionState") == 0)
        { sortColumn = "Payment_TransactionState"; }
        if (string.IsNullOrEmpty(sortOrder))
        { sortOrder = "DESC"; }
        List<UserPayment> listForm = new List<UserPayment>();
        int total = 0;

        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                string SQL = @"DECLARE @UserTable TABLE(RowIndex INT, Payment_UserID INT,Payment_UserName NVARCHAR(50),BankName NVARCHAR(50), Payment_Amount INT,Payment_SettleDate DATETIME,
                            Payment_VerificationDate DATETIME,Payment_ReservationNumber NVARCHAR(25),Payment_ReferenceNumber NVARCHAR(20),
                            Payment_TransactionState NVARCHAR(20))                            
                            INSERT INTO @UserTable SELECT DISTINCT RowIndex,Payment_UserID,
                            (SELECT tm.Member_UserName FROM tbl_Membership tm WHERE tm.Member_ID = Payment_UserID) AS Payment_UserName,
                            (SELECT tb.Bank_Name FROM tbl_Banks tb WHERE tb.Bank_ID = Payment_BankID) AS BankName,
                            Payment_Amount,Payment_SettleDate,Payment_VerificationDate,
                            Payment_ReservationNumber,Payment_ReferenceNumber,Payment_TransactionState                         
                            FROM ( 
		                    SELECT Payment_UserID,Payment_ReservationNumber, Payment_Amount,Payment_SettleDate,                                 
								Payment_BankID,
								Payment_ReferenceNumber, Payment_TransactionState,Payment_VerificationDate,
                                ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS RowIndex
								FROM  tbl_SportPayments       
								WHERE Payment_TransactionState <> 'Approved' AND Payment_TransactionState <>'Ok' 
                                AND Payment_TransactionState <> '3'
                                )as NewTable	
                            							
							SELECT RowIndex,Payment_UserID,Payment_UserName,BankName,Payment_Amount,Payment_SettleDate,Payment_VerificationDate,
                            Payment_ReservationNumber,Payment_ReferenceNumber,Payment_TransactionState
                            FROM @UserTable
                            WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}) )                            
                            SELECT COUNT(*) FROM @UserTable";
                cmd.CommandText = string.Format(SQL, sortColumn, sortOrder, start, max);
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        UserPayment p = BuildUserPayment(rdr);
                        listForm.Add(p);
                    }
                    if ((rdr.NextResult()) && (rdr.Read()))
                    {
                        total = rdr.GetInt32(0);
                    }
                }
            }
        }
        if ((listForm.Count == 0) || (total == 0)) { return null; }
        PagedResult<UserPayment> result = new PagedResult<UserPayment>();
        result.Rows = listForm;
        result.Total = total;
        return result;
    }
    [WebMethod]
    public PagedResult<UserPayment> getUserPaymentByUserID(String userID, int start, int max, string sortColumn, string sortOrder)
    {
        DateTime customDate = BLL.GetIranDateTime().AddDays(-14);
        if (max == 0) { max = 10; }
        if (string.Compare(sortColumn, "BankName") == 0)
        { sortColumn = "Payment_BankID"; }
        else if (string.Compare(sortColumn, "Payment_Amount") == 0)
        { sortColumn = "Payment_Amount"; }
        else if (string.Compare(sortColumn, "Payment_SettleDate") == 0)
        { sortColumn = "Payment_SettleDate"; }
        else if (string.Compare(sortColumn, "Payment_VerificationDate") == 0)
        { sortColumn = "Payment_VerificationDate"; }
        else if (string.Compare(sortColumn, "Payment_ReservationNumber") == 0)
        { sortColumn = "Payment_ReservationNumber"; }
        else if (string.Compare(sortColumn, "Payment_ReferenceNumber") == 0)
        { sortColumn = "Payment_ReferenceNumber"; }
        else if (string.Compare(sortColumn, "Payment_TransactionState") == 0)
        { sortColumn = "Payment_TransactionState"; }
        if (string.IsNullOrEmpty(sortOrder))
        { sortOrder = "DESC"; }
        List<UserPayment> listForm = new List<UserPayment>();
        int total = 0;

        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                string SQL = @"DECLARE @date DateTime SET @date = GetDate() SET @date = DateAdd(day, -14, @date)
                            DECLARE @UserTable TABLE(RowIndex INT, Payment_UserID INT,Payment_UserName NVARCHAR(50),BankName NVARCHAR(50), Payment_Amount INT,Payment_SettleDate DATETIME,
                            Payment_VerificationDate DATETIME,Payment_ReservationNumber NVARCHAR(25),Payment_ReferenceNumber NVARCHAR(20),
                            Payment_TransactionState NVARCHAR(20))                            
                            INSERT INTO @UserTable SELECT DISTINCT RowIndex,Payment_UserID,
                            (SELECT tm.Member_UserName FROM tbl_Membership tm WHERE tm.Member_ID = Payment_UserID) AS Payment_UserName,
                            (SELECT tb.Bank_Name FROM tbl_Banks tb WHERE tb.Bank_ID = Payment_BankID) AS BankName,
                            Payment_Amount,Payment_SettleDate,Payment_VerificationDate,
                            Payment_ReservationNumber,Payment_ReferenceNumber,Payment_TransactionState                         
                            FROM ( 
		                    SELECT Payment_UserID,Payment_ReservationNumber, Payment_Amount,Payment_SettleDate,                                 
								Payment_BankID,
								Payment_ReferenceNumber, Payment_TransactionState,Payment_VerificationDate,
                                ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS RowIndex
								FROM  tbl_SportPayments WHERE Payment_SettleDate >= @date AND Payment_UserID = " + userID +                                  
                                @")as NewTable	
                            							
							SELECT RowIndex,Payment_UserID,Payment_UserName,BankName,Payment_Amount,Payment_SettleDate,Payment_VerificationDate,
                            Payment_ReservationNumber,Payment_ReferenceNumber,Payment_TransactionState
                            FROM @UserTable
                            WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}) )                            
                            SELECT COUNT(*) FROM @UserTable";
                cmd.CommandText = string.Format(SQL, sortColumn, sortOrder, start, max);
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        UserPayment p = BuildUserPayment(rdr);
                        listForm.Add(p);
                    }
                    if ((rdr.NextResult()) && (rdr.Read()))
                    {
                        total = rdr.GetInt32(0);
                    }
                }
            }
        }
        if ((listForm.Count == 0) || (total == 0)) { return null; }
        PagedResult<UserPayment> result = new PagedResult<UserPayment>();
        result.Rows = listForm;
        result.Total = total;
        return result;
    }

    [WebMethod()]
    public string DetectTransactionForMelli(String reservation_Number, int userID)
    {
        string loginID = "113140784";
        string state = "خطای نابهنگام";
        string sequence = "";
        string timeStamp = "";
        string amount = "";
        string currencyCode = "";
        string fpHash = "";
        string description = "";
        string status = "";
        String transactionInfo = DAL.Sport_GetPaymentTransactionByReservationNumber(reservation_Number);
        if (transactionInfo != "")
        {
            string[] data = transactionInfo.Split(';');
            sequence    = data[0];
            timeStamp   = data[1];
            amount      = data[2];
            currencyCode= data[3];
            fpHash      = data[4];
            description = data[5];
        }
        PaymentVerification paymentVerification = new PaymentVerification();
        PaymentResult paymentResult = new PaymentResult();
        paymentResult = paymentVerification.DamoonVerifyMelli(loginID, sequence, timeStamp, amount, currencyCode, fpHash, description, false);
        if (paymentResult.ResponseCode == "1")
        {
            state = "Approved";
            if (DAL.Sport_GetPaymentStatus(reservation_Number, sequence, timeStamp) != "واریز")
            {
                DAL.Sport_AddPaymentAmountToChargeBox(int.Parse(amount), userID);
                Int32 userChargeBoxAmountRemain = DAL.Sport_GetChargeInventoryByUserID(userID);
                DAL.Sport_InsertIntoUserChargeBoxTurnover(userID, "واریز از طریق بانک ملی", float.Parse(amount),0, (float)userChargeBoxAmountRemain, "The Verification was used");
            }
            status = "واریز";
        }
        else if (paymentResult.ResponseCode == "2")
        {
            state = "Declined";
            status = "اطلاعات نادرست";
        }
        else if (paymentResult.ResponseCode == "3")
        {
            state = "Error";
            status = "خطا";
        }
        else if (paymentResult.ResponseCode == "4")
        {
            state = "Ambiguous";
            status = "مبهم";
        }
        if (paymentResult.TransID == null) paymentResult.TransID = "نامشخص";
        if (paymentResult.Fp_sequence == null) paymentResult.Fp_sequence = "---";
        if (paymentResult.Fp_timestamp == null) paymentResult.Fp_timestamp = "---";
        if (paymentResult.Amount == null) paymentResult.Amount = "0";
        if (paymentResult.Fp_hash == null) paymentResult.Fp_hash = "---";
        if (paymentResult.Currency_code == null) paymentResult.Currency_code = "---";
        if (paymentResult.Login == null) paymentResult.Login = "---";
        if (paymentResult.Response_reason_code == null) paymentResult.Response_reason_code = "---";
        if (paymentResult.Response_reason_text == null) paymentResult.Response_reason_text = "---";
        if (paymentResult.ResponseCode == null) paymentResult.ResponseCode = "---";
        if (paymentResult.ResponseSubCode == null) paymentResult.ResponseSubCode = "---";

        DAL.Sport_UpdatePeymentsMelli("1", paymentResult.TransID, state, paymentResult.Fp_sequence,
               paymentResult.Fp_timestamp,paymentResult.Fp_hash, paymentResult.ResponseCode, paymentResult.ResponseSubCode, paymentResult.Response_reason_code, paymentResult.Response_reason_text, status);
        return paymentResult.TransID;
    }
    [WebMethod()]
    public string DetectTransactionForSaderat(String reservation_Number, int userID)
    {
        string loginID = "739959200018";
        string state = "خطای نابهنگام";
        string sequence = "";
        string timeStamp = "";
        string amount = "";
        string currencyCode = "";
        string fpHash = "";
        string description = "";
        string status = "";
        String transactionInfo = DAL.Sport_GetPaymentTransactionByReservationNumber(reservation_Number);
        if (transactionInfo != "")
        {
            string[] data   = transactionInfo.Split(';');
            sequence        = data[0];
            timeStamp       = data[1];
            amount          = data[2];
            currencyCode    = data[3];
            fpHash          = data[4];
            description     = data[5];
        }
        PaymentVerification paymentVerification = new PaymentVerification();
        PaymentResult paymentResult = new PaymentResult();
        paymentResult = paymentVerification.DamoonVerifySaderat(loginID, sequence, timeStamp, amount, currencyCode, fpHash, description, false);
        if (paymentResult.ResponseCode == "1")
        {
            state = "Approved";
            if (DAL.Sport_GetPaymentStatus(reservation_Number, sequence, timeStamp) != "واریز")
            {
                DAL.Sport_AddPaymentAmountToChargeBox(int.Parse(amount), userID);
                Int32 userChargeBoxAmountRemain = DAL.Sport_GetChargeInventoryByUserID(userID);                
                DAL.Sport_InsertIntoUserChargeBoxTurnover(userID, "واریز از طریق بانک صادرات", float.Parse(amount),0, (float)userChargeBoxAmountRemain, "The Verification was used");
            }
            status = "واریز";
        }
        else if (paymentResult.ResponseCode == "2")
        {
            state = "Declined";
            status = "اطلاعات نادرست";
        }
        else if (paymentResult.ResponseCode == "3")
        {
            state = "Error";
            status = "خطا";
        }
        else if (paymentResult.ResponseCode == "4")
        {
            state = "Ambiguous";
            status = "مبهم";
        }
        if (paymentResult.TransID == null) paymentResult.TransID = "نامشخص";
        if (paymentResult.Fp_sequence == null) paymentResult.Fp_sequence = "---";
        if (paymentResult.Fp_timestamp == null) paymentResult.Fp_timestamp = "---";
        if (paymentResult.Amount == null) paymentResult.Amount = "0";
        if (paymentResult.Fp_hash == null) paymentResult.Fp_hash = "---";
        if (paymentResult.Currency_code == null) paymentResult.Currency_code = "---";
        if (paymentResult.Login == null) paymentResult.Login = "---";
        if (paymentResult.Response_reason_code == null) paymentResult.Response_reason_code = "---";
        if (paymentResult.Response_reason_text == null) paymentResult.Response_reason_text = "---";
        if (paymentResult.ResponseCode == null) paymentResult.ResponseCode = "---";
        if (paymentResult.ResponseSubCode == null) paymentResult.ResponseSubCode = "---";

        DAL.Sport_UpdatePeymentsMelli("2", paymentResult.TransID, state, paymentResult.Fp_sequence,
               paymentResult.Fp_timestamp, paymentResult.Fp_hash, paymentResult.ResponseCode, paymentResult.ResponseSubCode, paymentResult.Response_reason_code, paymentResult.Response_reason_text, status);
        return paymentResult.TransID;
    }
}
