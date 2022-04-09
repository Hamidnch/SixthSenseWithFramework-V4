using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public abstract class BaseEntity{}
public class PagedResult<T> where T : BaseEntity
{
    private int _total;
    private List<T> _rows;
    public int Total
    {
        get{return _total;}
        set{_total = value;}
    }
    public List<T> Rows
    {
        get{return _rows;}
        set{_rows = value;}
    }
}
public class RacingInfo : BaseEntity
{
    private String racingInfoID;
    private String racingTitle;
    private String racingDetails;
    private String country;
    private String racingCreationDate;
    private String racingLastUpdate;
    private int rowIndex;

    public String RacingInfoID
    {
        get { return racingInfoID; }
        set { racingInfoID = value; }
    }
    public String RacingTitle
    {
        get { return racingTitle; }
        set { racingTitle = value; }
    }
    public String RacingDetails
    {
        get { return racingDetails; }
        set { racingDetails = value; }
    }
    public String Country
    {
        get { return country; }
        set { country = value; }
    }
    public String RacingCreationDate
    {
        get { return racingCreationDate; }
        set { racingCreationDate = value; }
    }
    public String RacingLastUpdate
    {
        get { return racingLastUpdate; }
        set { racingLastUpdate = value; }
    }
    public int RowIndex
    {
        get { return rowIndex; }
        set { rowIndex = value; }
    }
}
public class RacingForms : BaseEntity
{
    private String formInfo_FormID;
    private String form_RacingInfoID;
    private String member_UserName;
    private String form_CreationDate;
    private String form_LastUpdate;
    private String form_Amount;
    private String form_Prominence;
    private String form_ActiveStatus;
    private int rowIndex;

    public String FormInfo_FormID
    {
        get { return formInfo_FormID; }
        set { formInfo_FormID = value; }
    }
    public String Form_RacingInfoID
    {
        get { return form_RacingInfoID; }
        set { form_RacingInfoID = value; }
    }
    public String Member_UserName
    {
        get { return member_UserName; }
        set { member_UserName = value; }
    }
    public String Form_CreationDate
    {
        get { return form_CreationDate; }
        set { form_CreationDate = value; }
    }
    public String Form_LastUpdate
    {
        get { return form_LastUpdate; }
        set { form_LastUpdate = value; }
    }
    public String Form_Amount
    {
        get { return form_Amount; }
        set { form_Amount = value; }
    }
    public String Form_Prominence
    {
        get { return form_Prominence; }
        set { form_Prominence = value; }
    }
    public String Form_ActiveStatus
    {
        get { return form_ActiveStatus; }
        set { form_ActiveStatus = value; }
    }
    public int RowIndex
    {
        get { return rowIndex; }
        set { rowIndex = value; }
    }
}
public class RacingWins : BaseEntity
{
    private string formInfo_FormID;
    private string member_UserName;
    private String form_Prominence;

    public string FormInfo_FormID
    {
        get { return formInfo_FormID; }
        set { formInfo_FormID = value; }
    }
    public string Member_UserName
    {
        get { return member_UserName; }
        set { member_UserName = value; }
    }
    public String Form_Prominence
    {
        get { return form_Prominence; }
        set { form_Prominence = value; }
    }
}
/// <summary>
/// وب سرویس برای فراخوانی کدهای سمت سرور بدون رفرش کامل صفحه
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class RacingService : System.Web.Services.WebService
{
    private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
    public RacingService()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    private static IDbConnection CreateConnection()
    {
        IDbConnection cnn = new System.Data.SqlClient.SqlConnection(ConnectionString);
        cnn.Open();
        return cnn;
    }
    private static RacingInfo BuildRacingInfo(IDataReader reader)
    {
        RacingInfo racingInfo = new RacingInfo();
        racingInfo.RacingInfoID = reader.IsDBNull(0) ? string.Empty : reader.GetString(0).Trim();
        racingInfo.RacingTitle = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        racingInfo.RacingDetails = reader.IsDBNull(2) ? string.Empty : reader.GetString(2).Trim();
        racingInfo.Country = reader.IsDBNull(3) ? string.Empty : reader.GetString(3);
        racingInfo.RacingCreationDate = reader.IsDBNull(4) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(4), "D", true, "H");
        racingInfo.RacingLastUpdate = reader.IsDBNull(5) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(5), "D", true, "H");
        racingInfo.RowIndex = reader.IsDBNull(6) ? 0 : reader.GetInt32(6);
        return racingInfo;
    }
    private static RacingForms BuildRacingForms(IDataReader reader)
    {
        RacingForms racingForms = new RacingForms();
        racingForms.FormInfo_FormID = reader.IsDBNull(0) ? string.Empty : reader.GetString(0).Trim();
        racingForms.Form_RacingInfoID = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        racingForms.Member_UserName = reader.IsDBNull(2) ? string.Empty : reader.GetString(2).Trim();
        racingForms.Form_CreationDate = reader.IsDBNull(3) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(3), "D", true, "H");
        racingForms.Form_LastUpdate = reader.IsDBNull(4) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(4), "D", true, "H");
        racingForms.Form_Amount = reader.IsDBNull(5) ? string.Empty : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", reader.GetInt32(5)));
        racingForms.Form_Prominence = reader.IsDBNull(6) ? string.Empty : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", reader.GetInt32(6)));
        racingForms.Form_ActiveStatus = reader.IsDBNull(7) ? string.Empty : (reader.GetBoolean(7) == true) ? "فعال" : "غیرفعال";
        racingForms.RowIndex = reader.IsDBNull(8) ? 0 : reader.GetInt32(8);
        return racingForms;
    }
    private static RacingWins BuildRacingFirstWins(IDataReader reader)
    {
        RacingWins racingFirstWins = new RacingWins();
        racingFirstWins.FormInfo_FormID = reader.IsDBNull(0) ? string.Empty : reader.GetString(0).Trim();
        racingFirstWins.Member_UserName = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        racingFirstWins.Form_Prominence = reader.IsDBNull(2) ? string.Empty : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", reader.GetInt32(2)));
        return racingFirstWins;
    }
    private static RacingWins BuildRacingSecondWins(IDataReader reader)
    {
        RacingWins racingSecondWins = new RacingWins();
        racingSecondWins.FormInfo_FormID = reader.IsDBNull(0) ? string.Empty : reader.GetString(0).Trim();
        racingSecondWins.Member_UserName = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        racingSecondWins.Form_Prominence = reader.IsDBNull(2) ? string.Empty : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", reader.GetInt32(2)));
        return racingSecondWins;
    }
    [WebMethod()]
    public PagedResult<RacingWins> getAllFirstWins(String racingInfoID)
    {
        int total = 0;
        List<RacingWins> list = new List<RacingWins>();
        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                cmd.CommandText = "SP_Sport_GetFirstProminenceForms";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@racingInfoID", racingInfoID));
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        RacingWins p = BuildRacingFirstWins(rdr);
                        list.Add(p);
                    }
                    if ((rdr.NextResult()) && (rdr.Read()))
                    {
                        total = rdr.GetInt32(0);
                    }
                }
            }
        }
        if ((list.Count == 0) || (total == 0)) { return null; }
        PagedResult<RacingWins> result = new PagedResult<RacingWins>();
        result.Rows = list;
        result.Total = total;
        return result;
    }
    [WebMethod()]
    public PagedResult<RacingWins> getAllSecondWins(String racingInfoID)
    {
        int total = 0;
        List<RacingWins> list = new List<RacingWins>();
        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                cmd.CommandText = "SP_Sport_GetSecondProminenceForms";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@racingInfoID", racingInfoID));
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        RacingWins p = BuildRacingSecondWins(rdr);
                        list.Add(p);
                    }

                    if ((rdr.NextResult()) && (rdr.Read()))
                    {
                        total = rdr.GetInt32(0);
                    }
                }
            }
        }
        if ((list.Count == 0) || (total == 0)) { return null; }
        PagedResult<RacingWins> result = new PagedResult<RacingWins>();
        result.Rows = list;
        result.Total = total;
        return result;
    }
    [WebMethod()]
    public String GetSumFormsAmountByRacingInfoID(string racingInfoID)
    {
        return DAL.Sport_GetSumFormsAmountByRacingInfoID(racingInfoID).ToString();
    }
    [WebMethod()]
    public bool IsRacingUltimate(string racingInfoID)
    {
        return DAL.Sport_GetRacingStatus(racingInfoID) == "تائيد نهائي" ? true : false;
    }
    [WebMethod()]
    public PagedResult<RacingForms> getRacingFormsByRacingInfoIDCustom(String racingInfoID, int start, int max, string sortColumn, string sortOrder)
    {
        if (max == 0) { max = 10; }
        if (string.IsNullOrEmpty(sortColumn) || (string.Compare(sortColumn, "Form_RacingInfoID", true) == 0))
        { sortColumn = "Form_RacingInfoID"; }
        else if (string.Compare(sortColumn, "FormInfo_FormID") == 0)
        { sortColumn = "FormInfo_FormID"; }
        else if (string.Compare(sortColumn, "Member_UserName") == 0)
        { sortColumn = "Member_UserName"; }
        else if (string.Compare(sortColumn, "Form_CreationDate") == 0)
        { sortColumn = "Form_CreationDate"; }
        else if (string.Compare(sortColumn, "Form_LastUpdate") == 0)
        { sortColumn = "Form_LastUpdate"; }
        else if (string.Compare(sortColumn, "Form_Amount") == 0)
        { sortColumn = "Form_Amount"; }
        else if (string.Compare(sortColumn, "Form_Prominence") == 0)
        { sortColumn = "Form_Prominence"; }
        else if (string.Compare(sortColumn, "Form_ActiveStatus") == 0)
        { sortColumn = "Form_ActiveStatus"; }
        if (string.IsNullOrEmpty(sortOrder)){sortOrder = "ASC";}
        List<RacingForms> listForm = new List<RacingForms>();
        int total = 0;

        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                //cmd.CommandText = "SP_Sport_GetRacingFormsCustom";
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new SqlParameter("@racingInfoID", racingInfoID));
                //cmd.Parameters.Add(new SqlParameter("@STARTIndex", start));
                //cmd.Parameters.Add(new SqlParameter("@MaxIndex", max));
                //cmd.Parameters.Add(new SqlParameter("@sortColumn", sortColumn));

                String SQL = @"DECLARE @FormTable TABLE(FormInfo_FormID NVARCHAR(50), Form_RacingInfoID NVARCHAR(50), Member_UserName NVARCHAR(255),
                            Form_CreationDate DATETIME,Form_LastUpdate DATETIME, Form_Amount INT, Form_Prominence INT, Form_ActiveStatus BIT, RowIndex INT);
                            
                            INSERT INTO @FormTable SELECT DISTINCT FormInfo_FormID, Form_RacingInfoID, Member_UserName,
                            Form_CreationDate, Form_LastUpdate, Form_Amount,Form_Prominence,Form_ActiveStatus,RowIndex
                            FROM (                            
                            SELECT FormInfo_FormID, Form_RacingInfoID, Member_UserName,
                            Form_CreationDate, Form_LastUpdate, Form_Amount,SUM(FormInfo_Prominence) AS Form_Prominence,Form_ActiveStatus,
                            ROW_NUMBER() OVER (ORDER BY Form_CreationDate ASC ) AS RowIndex
                            FROM tbl_SportRacingFormInfo , tbl_SportRacingForms , tbl_Membership  
                            WHERE (FormInfo_FormID = Form_ID)AND(Form_RacingInfoID = '" + racingInfoID + @"') AND (Member_ID = Form_UserID)                            
                            GROUP BY FormInfo_FormID,Form_RacingInfoID,Form_CreationDate,Form_LastUpdate, Member_UserName,Form_ActiveStatus, Form_Amount
                            )AS NewTable

                            DECLARE @MyTable TABLE(FormInfo_FormID NVARCHAR(50), Form_RacingInfoID NVARCHAR(50), Member_UserName NVARCHAR(255),
                            Form_CreationDate DATETIME,Form_LastUpdate DATETIME, Form_Amount INT, Form_Prominence INT, Form_ActiveStatus BIT, RowIndex INT);
                            INSERT INTO @MyTable 
                            SELECT FormInfo_FormID, Form_RacingInfoID, Member_UserName,
                            Form_CreationDate, Form_LastUpdate, Form_Amount, Form_Prominence,Form_ActiveStatus, RowIndex
                            From @FormTable                        
                            ORDER BY [{0}] {1}

                            SELECT FormInfo_FormID, Form_RacingInfoID, Member_UserName,
                            Form_CreationDate, Form_LastUpdate, Form_Amount, Form_Prominence,Form_ActiveStatus, RowIndex
                            From @FormTable
                            WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}) )                           
                            SELECT COUNT(*) FROM @FormTable";
                cmd.CommandText = string.Format(SQL, sortColumn, sortOrder, start, max);
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        RacingForms p = BuildRacingForms(rdr);
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
        PagedResult<RacingForms> result = new PagedResult<RacingForms>();
        result.Rows = listForm;
        result.Total = total;
        return result;
    }


    [WebMethod()]
    public PagedResult<RacingInfo> GetRacingInfoList(int start, int max, string sortColumn, string sortOrder)
    {
        if (max == 0) { max = 10; }
        if (string.IsNullOrEmpty(sortColumn) || (string.Compare(sortColumn, "RacingInfoID", true) == 0))
        {sortColumn = "RacingInfo_ID";}
        else if (string.Compare(sortColumn, "RacingTitle") == 0)
        {sortColumn = "Race_Title";}
        else if (string.Compare(sortColumn, "RacingDetails") == 0)
        {sortColumn = "RacingInfo_Details";}
        else if (string.Compare(sortColumn, "Country") == 0)
        {sortColumn = "Country_Name";}
        else if (string.Compare(sortColumn, "RacingCreationDate") == 0)
        { sortColumn = "RacingInfo_CreationDate"; }
        else if (string.Compare(sortColumn, "RacingLastUpdate") == 0)
        { sortColumn = "RacingInfo_LastUpdate"; }
        //else if (string.Compare(sortColumn, "RowIndex") == 0)
        //{sortColumn = "RowIndex";}
        if (string.IsNullOrEmpty(sortOrder))
        {sortOrder = "ASC";}
        //const String SQL = "SELECT RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, Racing_LastUpdateDate,RowIndex " +
        //                    "From ( " +
        //                    "SELECT RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, Racing_LastUpdateDate" +
        //                    ",ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS RowIndex " +
        //                    "FROM tbl_SportRacingInfo, tbl_SportRace, tbl_Country " +
        //                    "WHERE (Race_ID = RacingInfo_RaceID) AND (Country_ID = RacingInfo_CountryID)" +
        //                    ") AS Hamid " +
        //                    "WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3})) " +
        //                    "SELECT COUNT(RacingInfo_ID) FROM [tbl_SportRacingInfo]";
//                const String SQL = @"DECLARE @FormTable Table(RacingInfo_ID NVARCHAR(50),Race_Title NVARCHAR(50),
//                    RacingInfo_Details NVARCHAR(50),Country_Name NVARCHAR(50), Racing_LastUpdateDate DateTime,RowIndex INT);                    
//                    INSERT INTO @FormTable SELECT DISTINCT RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, 
//                    Racing_LastUpdateDate,ROW_NUMBER() OVER (ORDER BY RacingInfo_ID ASC ) AS RowIndex 
//                    FROM tbl_SportRacingInfo, tbl_SportRace, tbl_Country 
//                    WHERE (Race_ID = RacingInfo_RaceID) AND (Country_ID = RacingInfo_CountryID)
//                    SELECT RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, 
//                    Racing_LastUpdateDate,RowIndex 
//                    From @FormTable 
//                    WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}))
//                    ORDER BY [{0}] {1}, Racing_LastUpdateDate
//                    SELECT COUNT(RacingInfo_ID) FROM [tbl_SportRacingInfo]";

        const String  SQL = @"DECLARE @FormTable2 Table(RacingInfo_ID NVARCHAR(50),Race_Title NVARCHAR(50),
                    RacingInfo_Details NVARCHAR(50),Country_Name NVARCHAR(50),RacingInfo_CreationDate DATETIME,
                    RacingInfo_LastUpdate DATETIME,RowIndex INT);
                    
                    INSERT INTO @FormTable2 SELECT DISTINCT RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, 
                    RacingInfo_CreationDate,RacingInfo_LastUpdate,RowIndex 
                   FROM
                   (
                   	SELECT DISTINCT RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, 
						RacingInfo_CreationDate,RacingInfo_LastUpdate,ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS RowIndex
					FROM tbl_SportRacingInfo, tbl_SportRace, tbl_Country
                    WHERE (Race_ID = RacingInfo_RaceID) AND (Country_ID = RacingInfo_CountryID)
                   	)AS Hamid			                    
                    SELECT RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, 
                    RacingInfo_CreationDate,RacingInfo_LastUpdate,RowIndex 
                    From @FormTable2
                    WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}))
                    SELECT COUNT(RacingInfo_ID) FROM [tbl_SportRacingInfo]";

        int total = 0;
        List<RacingInfo> list = new List<RacingInfo>();
        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                cmd.CommandText = string.Format(SQL, sortColumn, sortOrder, start, max);
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        RacingInfo p = BuildRacingInfo(rdr);
                        list.Add(p);
                    }
                    if ((rdr.NextResult()) && (rdr.Read()))
                    {
                        total = rdr.GetInt32(0);
                    }
                }
            }
        }
        if ((list.Count == 0) || (total == 0)) { return null; }
        PagedResult<RacingInfo> result = new PagedResult<RacingInfo>();
        result.Rows = list;
        result.Total = total;
        return result;
    }
    //[WebMethod()]
    //public RacingInfo[] getAllRacingInfo()
    //{
    //    List<RacingInfo> list = new List<RacingInfo>();

    //    using (IDbConnection cnn = CreateConnection())
    //    {
    //        using (IDbCommand cmd = cnn.CreateCommand())
    //        {
    //            cmd.CommandText = "SP_Sport_LoadAllRacingWithInfo";
    //            cmd.CommandType = CommandType.StoredProcedure;

    //            using (IDataReader rdr = cmd.ExecuteReader())
    //            {
    //                while (rdr.Read())
    //                {
    //                    RacingInfo p = BuildRacingInfo(rdr);
    //                    list.Add(p);
    //                }
    //            }
    //        }
    //    }
    //    if (list.Count == 0)
    //    {
    //        return null;
    //    }
    //    return list.ToArray();
    //}
    //[WebMethod]
    //public RacingForms[] getRacingFormsByRacingInfoID(String racingInfoID)
    //{
    //    List<RacingForms> list = new List<RacingForms>();
    //    using (IDbConnection cnn = CreateConnection())
    //    {
    //        using (IDbCommand cmd = cnn.CreateCommand())
    //        {
    //            cmd.CommandText = "SP_Sport_GetFormsByRacingInfoID";
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.Add(new SqlParameter("@racingInfoID", racingInfoID));
    //            using (IDataReader rdr = cmd.ExecuteReader())
    //            {
    //                while (rdr.Read())
    //                {
    //                    RacingForms f = BuildRacingForms(rdr);
    //                    list.Add(f);
    //                }
    //            }
    //        }
    //    }
    //    if (list.Count == 0)
    //    {
    //        return null;
    //    }
    //    return list.ToArray();
    //}
}