using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Sport_Sport_GetBack : System.Web.UI.Page
{
    private string refrenceNumber = string.Empty;
    private string reservationNumber = string.Empty;
    private string transactionState = string.Empty;
    private string merchantID = "02193207-189071"; // Every merchant has a special ID & password
    private string password = "791092";
    private string succeedMsg = string.Empty;
    private double result;

    string errorMsg = string.Empty;
    bool isError = false;
    Color color = Color.Yellow;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.ForeColor = color;
            com.sb24.acquirer.ReferencePayment SamanPaymentServices = new com.sb24.acquirer.ReferencePayment();
            // unpack and get info from request object
            if (RequestUnpack())
            {
                // ======================= << checking for transaction state  >>=======================================
                if (transactionState.Equals("OK"))            // Transaction is OK
                {
                    ///////////////////////////////////////////////////////////////////////////////////
                    //   *** IMPORTANT  ****   ATTENTION
                    // Here you should check refrenceNumber in your DataBase tp prevent double spending
                    ///////////////////////////////////////////////////////////////////////////////////
                    if (!DAL.Sport_CheckDoubleSpendingReferenceNumber(refrenceNumber))
                    {
                        Session["RefNum"] = refrenceNumber; // add refrenceNumber in session object
                        try
                        {
                            result = SamanPaymentServices.verifyTransaction(refrenceNumber, merchantID);
                            if (result > 0)
                            {
                                // when result >0, its amount of transaction
                                double clientAmount = 0;
                                try
                                {
                                    clientAmount = GetClientAmount();
                                }
                                catch (Exception ex)
                                {
                                    lblMsg.Text = ex.Message;
                                }
                                if (result > clientAmount)
                                {
                                    int i = ReverseTransaction(result - clientAmount);
                                    if (i == 1)
                                    {
                                        color = Color.Green;
                                        errorMsg = "بانک صحت رسيد ديجيتالي شما را تصديق نمود. فرايند پرداخت نیز تکميل گشت";
                                        errorMsg += "<br /> ";
                                        errorMsg += "اما مبلغ درخواستی شما با مبلغ ارسالی به بانک یکی نیست،";
                                        errorMsg += "درنتیجه مبلغ واریزی به حسابتان برگشت خورد";
                                        isError = false;
                                    }
                                    else
                                    {
                                        //  reverse was not posible
                                        result = i;
                                    }
                                }
                                else if (result < clientAmount)
                                {
                                    int i = ReverseTransaction(result);
                                    if (i == 1)
                                    {
                                        errorMsg = "بروز خطا درهنگام بررسي صحت رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                                        errorMsg += "<br /> مبلغ ارسالی به بانک از مقدار درخواستی شما کمتر است.";
                                        isError = true; ;
                                    }
                                    else
                                    {
                                        //  reverse was not posible
                                        result = i;
                                    }
                                }
                                else if (result.Equals(clientAmount)) //Total Amount of Basket
                                {
                                    try
                                    {
                                        DAL.Sport_UpdatePeymentsSaman("3", reservationNumber, refrenceNumber, transactionState, "واریز");
                                        int userID = DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name);                           
                                        DAL.Sport_AddPaymentAmountToChargeBox(int.Parse(result.ToString()), userID);
                                        Int32 userChargeBoxAmountRemain = DAL.Sport_GetChargeInventoryByUserID(userID);
                                        float remain = userChargeBoxAmountRemain;
                                        DAL.Sport_InsertIntoUserChargeBoxTurnover(userID, "واریز از طریق بانک سامان", float.Parse(result.ToString()), 0, remain, "");
                                    }
                                    catch
                                    {
                                        lbl_DBInfo.ForeColor = System.Drawing.Color.Yellow;
                                        lbl_DBInfo.Text = "خطا در هنگام ثبت اطلاعات پرداخت روی داد.";
                                    }
                                    lbl_TransactionState.Text = transactionState;
                                    lbl_Amount.Text = result.ToString() + " ریال ";
                                    lbl_ReferenceNumber.Text = refrenceNumber;
                                    lbl_ReservationNumber.Text = reservationNumber;
                                    isError = false;
                                    color = Color.Lime;
                                    lbl_Date.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "H", false);
                                    lbl_Time.Text = BLL.GetTime();
                                    succeedMsg = "بانک صحت رسيد ديجيتالي شما را تصديق نمود. فرايند پرداخت تکميل گشت";
                                    lbl_Success.Text = "کاربر گرامی " + Context.User.Identity.Name + " عملیات پرداخت با موفقیت انجام شد و حساب کاربری شما مبلغ " +
                                        lbl_Amount.Text + " شارژ گردید.";
                                }
                            }
                            TransactionChecking((int)result);
                        }
                        catch (Exception ex)
                        {
                            isError = true;
                            color = Color.Yellow;
                            errorMsg = "سرور بانک براي تاييد رسيد ديجيتالي در دسترس نيست<br><br>" + ex.Message;
                        }
                    }
                }
                else
                {
                    lbl_DBInfo.ForeColor = System.Drawing.Color.Yellow;
                    lbl_DBInfo.Text = "اطلاعات پرداخت با این رسید دیجیتالی قبلا به سایت ارسال گردیده و به ثبت است";
                }
            }
            else
            {
                isError = true;
                errorMsg = "متاسفانه بانک پرداخت شما را تاييد نکرده است";

                if (transactionState.Equals("Canceled By User") || transactionState.Equals(string.Empty))
                {
                    // Transaction was canceled by user
                    isError = true;
                    color = Color.Yellow;
                    errorMsg = "تراكنش توسط پرداخت کننده كنسل شد";
                    //Response.Redirect("http://www.hesesheshom.com/Sport/Sport_SelectRacing.aspx");
                }
                else if (transactionState.Equals("Invalid Amount"))
                {
                    // Amount of revers teransaction is more than teransaction
                }
                else if (transactionState.Equals("Invalid Transaction"))
                {
                    // Can not find teransaction
                }
                else if (transactionState.Equals("Invalid Card Number"))
                {
                    // Card number is wrong
                }
                else if (transactionState.Equals("No Such Issuer"))
                {
                    // Issuer can not find
                }
                else if (transactionState.Equals("Expired Card Pick Up"))
                {
                    // The card is expired
                }
                else if (transactionState.Equals("Allowable PIN Tries Exceeded Pick Up"))
                {
                    // For third time user enter a wrong PIN so card become invalid
                }
                else if (transactionState.Equals("Incorrect PIN"))
                {
                    // Pin card is wrong
                }
                else if (transactionState.Equals("Exceeds Withdrawal Amount Limit"))
                {
                    // Exceeds withdrawal from amount limit
                }
                else if (transactionState.Equals("Transaction Cannot Be Completed"))
                {
                    // PIN and PAD are currect but Transaction Cannot Be Completed
                }
                else if (transactionState.Equals("Response Received Too Late"))
                {
                    // Timeout occur
                }
                else if (transactionState.Equals("Suspected Fraud Pick Up"))
                {
                    // User did not insert cvv2 & expiredate or they are wrong.
                }
                else if (transactionState.Equals("No Sufficient Funds"))
                {
                    // there are not suficient funds in the account
                }
                else if (transactionState.Equals("Issuer Down Slm"))
                {
                    // The bank server is down
                }
                else if (transactionState.Equals("TME Error"))
                {
                    // unknown error occur
                }
            }
            /////////////////////////////////////////////////////////////////////////////////////////////////////////
            //                      Page initialize
            /////////////////////////////////////////////////////////////////////////////////////////////////////////
            if (isError)
            {
                lblMsg.ForeColor = color;
                lblMsg.Text = errorMsg;
                lblMsg.Visible = true;
            }
            else
            {
                lblMsg.ForeColor = color;
                lblMsg.Text = succeedMsg;
                lblMsg.Visible = true;
            }
        }
        catch
        {
            lblMsg.Visible = true;
            lblMsg.ForeColor = Color.Yellow;
            lblMsg.Text = "عملیات پرداخت توسط کاربر لغو گردید";
        }
    }
    // Unpack info sent by Bank Server from request object
    private bool RequestUnpack()
    {
        if (RequestFeildIsEmpity()) return false;
        try
        {
            refrenceNumber = Request.Form["RefNum"].ToString();
            reservationNumber = Request.Form["ResNum"].ToString();
            transactionState = Request.Form["state"].ToString();
        }
        catch (Exception ex)
        {
            lbl_Trace.Text += "\n   Error in RequestUnpack:" + ex.Message;
        }
        return true;
    }
    private bool RequestFeildIsEmpity()
    {
        //try
        //{
        //    lbl_Trace.Text += "1." + Request.Form["RefNum"].ToString() + "\n";
        //    lbl_Trace.Text += "2." + Request.Form["state"].ToString() + "\n";
        //    lbl_Trace.Text += "3." + Request.Form["ResNum"].ToString();
        //}
        //catch (Exception ex)
        //{
        //    lbl_Trace.Text += "error1:" + Request["RefNum"].ToString() + "\n";
        //    lbl_Trace.Text += "error2:" + Request["state"].ToString() + "\n";
        //    lbl_Trace.Text += "error3:" + Request["ResNum"].ToString();
        //    lbl_Trace.Text += "\n error in RequestFeildIsEmpity: " + ex.Message;
        //}
       if (Request.Form["RefNum"].ToString().Equals(string.Empty))
        {
            isError = true;
            color = Color.Yellow;
            errorMsg = "فرايند انتقال وجه با موفقيت انجام شده است اما فرايند تاييد رسيد ديجيتالي با خطا مواجه گشت";
            return true;
        }
       else
        if (Request.Form["state"].ToString().Equals(string.Empty))
        {
            color = Color.Yellow;
            isError = true;
            errorMsg = "پرداخت شما توسط بانک تاييد شده است اما رسيد ديجيتالي شما تاييد نگشت! مشکلي در فرايند رزرو پرداخت شما پيش آمده است";
            return true;
        }
        else
        if (Request.Form["ResNum"].ToString().Equals(string.Empty))
        {
            color = Color.Yellow;
            isError = true;
            errorMsg = "خطا در برقرار ارتباط با بانک";
            return true;
        }
        return false;
    }
    private double GetClientAmount()
    {
        try
        {
            double amount = DAL.Sport_GetPaymentsAmountByResNumber(reservationNumber);
            return amount;
        }
        catch
        {
            return 0;
        }
    }
    private int ReverseTransaction(double revAmount)
    {
        com.sb24.acquirer.ReferencePayment SamanPaymentServices = new com.sb24.acquirer.ReferencePayment();
        int res = SamanPaymentServices.reverseTransaction(refrenceNumber, merchantID, password, revAmount);
        return res;
    }
    private void TransactionChecking(int i)
    {
        switch (i)
        {
            case -1:		//TP_ERROR
                isError = true;
                errorMsg = "بروز خطا درهنگام بررسي صحت رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -2:		//ACCOUNTS_DONT_MATCH
                isError = true;
                errorMsg = "بروز خطا در هنگام تاييد رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -3:		//BAD_INPUT
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -4:		//INVALID_PASSWORD_OR_ACCOUNT
                isError = true;
                errorMsg = "خطاي دروني سيستم درهنگام بررسي صحت رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -5:		//DATABASE_EXCEPTION
                isError = true;
                errorMsg = "خطاي دروني سيستم درهنگام بررسي صحت رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -7:		//ERROR_STR_NULL
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -8:		//ERROR_STR_TOO_LONG
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -9:		//ERROR_STR_NOT_AL_NUM
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -10:	//ERROR_STR_NOT_BASE64
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -11:	//ERROR_STR_TOO_SHORT
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -12:		//ERROR_STR_NULL
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -13:		//ERROR IN AMOUNT OF REVERS TRANSACTION AMOUNT
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -14:	//INVALID TRANSACTION
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -15:	//RETERNED AMOUNT IS WRONG
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -16:	//INTERNAL ERROR
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -17:	// REVERS TRANSACTIN FROM OTHER BANK
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                break;
            case -18:	//INVALID IP
                isError = true;
                errorMsg = "خطا در پردازش رسيد ديجيتالي در نتيجه پرداخت شما تاييد نگرييد";
                errorMsg += "<br /> " + "IPثبت شده در بانک نامعتبر میباشد";
                break;
        }
    }
    //protected void btnReverse_Click(object sender, EventArgs e)
    //{
    //    double reverseAmount = 0;
    //    if (txtReverseAmount.Text.Equals(string.Empty)) reverseAmount = result;
    //    else reverseAmount = double.Parse(txtReverseAmount.Text);
    //    ReverseTransaction(reverseAmount);
    //}
}