using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Security.Cryptography;

public partial class Sport_Sport_SaderatBeforePayment : System.Web.UI.Page
{
    [WebMethod]
    public static void InsertPaymentReadySaderat(String reservationNumber, String amount, String bankID,
                String sequence, String timeStamp, String hashCode, String description, String currencyCode)
    {
        DAL.Sport_InsertPeyments(reservationNumber, amount, bankID, sequence, timeStamp, hashCode, description, currencyCode);
    }
    private void submitForm()
    {
        if (txt_amount.Value == "0" || txt_amount.Value == string.Empty)
        {
            lblError.Visible = true;
            lblError.Text = "لطفا مبلغ واریزی را وارد نمائید";
            txt_amount.Focus();
            return;
        }
        string reservationNumber = BLL.CreateRandomPasswordUsingGUID(25);
        string bankID = "2";
        string loginID = "739959200018";
        string transactionKey = "mUjXxqIRyA5vl8CL";
        string amount = txt_amount.Value;
        string description = "حس ششم";
        string currency_code = "Rial";
        Random random = new Random();
        string sequence = GetSequence().ToString();
        string timeStamp = GetTimeStamp().ToString();
        string fingerprint = BLL.HMAC_MD5(transactionKey, loginID + "^" + sequence + "^" + timeStamp + "^" + amount + "^" + currency_code);
        try
        {
            lblError.Visible = false;
            InsertPaymentReadySaderat(reservationNumber, amount, bankID, sequence, timeStamp, fingerprint, description, currency_code);
            System.Web.HttpContext.Current.Response.Write("<form name='newForm' method='post' action='https://Damoon.bsi.ir/DamoonPrePaymentController'>");
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_description\" value=\"{0}\">", description));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_sequence\" value=\"{0}\">", sequence));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_timestamp\" value=\"{0}\">", timeStamp));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_hash\" value=\"{0}\">", fingerprint));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_login\" value=\"{0}\">", loginID));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_amount\" value=\"{0}\">", txt_amount.Value));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_currency_code\" value=\"{0}\">", currency_code));
            System.Web.HttpContext.Current.Response.Write("</form>");
            System.Web.HttpContext.Current.Response.Write("</body>");
            HttpContext.Current.Response.Write("<script type='text/javascript'>document.forms[0].submit();</SCRIPT>");
        }
        catch (Exception ex)
        {
            lblError.Visible = true;
            lblError.Text = "وقوع خطای " + ex.Message;
        }
    }
    //string HMAC_MD5(string key, string value)
    //{
    //    // The first two lines take the input values and convert them from strings to Byte arrays
    //    byte[] HMACkey = (new System.Text.ASCIIEncoding()).GetBytes(key);
    //    byte[] HMACdata = (new System.Text.ASCIIEncoding()).GetBytes(value);
    //    // create a HMACMD5 object with the key set
    //    HMACMD5 myhmacMD5 = new HMACMD5(HMACkey);
    //    //calculate the hash (returns a byte array)
    //    byte[] HMAChash = myhmacMD5.ComputeHash(HMACdata);
    //    //loop through the byte array and add append each piece to a string to obtain a hash string
    //    string fingerprint = "";
    //    for (int i = 0; i < HMAChash.Length; i++)
    //    {
    //        fingerprint += HMAChash[i].ToString("x").PadLeft(2, '0');
    //    }
    //    return fingerprint;
    //}
    private int GetSequence()
    {
        Random rnd = new Random();
        return rnd.Next();
    }
    private int GetTimeStamp()
    {
        DateTime dt = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Local);//from 1970/1/1 00:00:00 to now
        DateTime dtNow = DateTime.Now;
        TimeSpan result = dtNow.Subtract(dt);
        int seconds = Convert.ToInt32(result.TotalSeconds);
        return seconds;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        String roleName = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
        if (!(Context.User.Identity.IsAuthenticated) || (roleName != "مدیر سایت") && (roleName != "مدیر ارشد"))
        {Response.Redirect("~/Home.aspx", false);}
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
     //   if (Context.User.Identity.IsAuthenticated)
       // {
            submitForm();
        //}
    }
}