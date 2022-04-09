using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Web.Services;
using System.Web.UI.HtmlControls;

public partial class Sport_Sport_MelliBeforePayment : System.Web.UI.Page
{
    [WebMethod]
    public static void InsertPaymentsMelli(String reservationNumber, String amount, String bankID,
                String sequence, String timeStamp, String hashCode, String description, String currencyCode)
    {
        DAL.Sport_InsertPeyments(reservationNumber, amount, bankID, sequence, timeStamp, hashCode, description, currencyCode);
    }
    //private void CreateSignature()
    //{
    //    //this.Page.Form.Method = "post";
    //    //this.Page.Form.Action = "https://Damoon.bankmelli-iran.com/MerchantsIntegrationTestController";
    //    // start by setting the static values
    //    string loginID = "113140784";
    //    string transactionKey = "4n+UD+mdbfpP+DGS";
    //    string amount = "1350";
    //    string description = "Sample Transaction";
    //    string label = "Submit Payment"; // The is the label on the 'submit' button
    //    //string testMode = "false";
    //    string currency_code = "Rial";
    //    // If an amount or description were posted to this page, the defaults are overidden
    //    //if (Request.Form["amount"] != null)
    //    //{   amount = Request.Form["amount"];    }
    //    //if (Request.Form["description"] != null)
    //    //{   description = Request.Form["description"];  }

    //    //// also check to see if the amount or description were sent using the GET method
    //    //if (Request.QueryString["amount"] != null)
    //    //{   amount = Request.QueryString["amount"];   }
    //    //if (Request.QueryString["description"] != null)
    //    //{   description = Request.QueryString["description"]; }

    //    //string invoice = DateTime.Now.ToString("yyyyMMddhhmmss");

    //    Random random = new Random();
    //    string sequence = (random.Next(0, int.MaxValue)).ToString();

    //    string timeStamp = ((int)(DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalSeconds).ToString();

    //    string fingerprint = HMAC_MD5(transactionKey, loginID + "^" + sequence + "^" + timeStamp + "^" + amount + "^" + currency_code);
    //    //lbl.Text = loginID + "^" + sequence + "^" + timeStamp + "^" + amount + "^" + currency_code;
    //    //Print the Amount and Description to the page by placing them in the Spans
    //    // amountSpan.InnerHtml = amount;
    //    //descriptionSpan.InnerHtml = description;

    //    //Update the fields in the actual form 
    //    x_login.Value = loginID;
    //    x_amount.Value = amount;
    //    // x_description.Value = description;
    //    // buttonLabel.Value = label;
    //    // x_test_request.Value = testMode;
    //    //x_invoice_num.Value = invoice;
    //    x_fp_sequence.Value = sequence;
    //    x_fp_timestamp.Value = timeStamp;
    //    x_fp_hash.Value = fingerprint;
    //    x_currency_code.Value = currency_code;
    //    lbl.Text = amount;
    //}
    //string getNumber(string number)
    //{
    //    int i = 0;
    //    string sm = number;
    //    foreach (char c in sm)
    //    {
    //        if (c == ',')
    //        {
    //            sm = sm.Remove(i, 1);
    //            i--;
    //        }
    //        i++;
    //    }
    //    return sm;
    //}
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
        string bankID = "1";
        string loginID = "113140784";
        string transactionKey = "4n+UD+mdbfpP+DGS";
        string amount = txt_amount.Value;
        string description = "حس ششم";
        //string label = "Submit Payment"; // The is the label on the 'submit' button
        //string testMode = "false";
        string currency_code = "Rial";
        //string seq = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() +
        //    DateTime.Now.DayOfYear.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() +
        //    DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
        Random random = new Random();
        string sequence = GetSequence().ToString(); //(random.Next(0, 1000)).ToString();
        string timeStamp = ((int)(DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalSeconds).ToString();
        string fingerprint = BLL.HMAC_MD5(transactionKey, loginID + "^" + sequence + "^" + timeStamp + "^" + amount + "^" + currency_code);
        try
        {
            lblError.Visible = false;
            InsertPaymentsMelli(reservationNumber, amount, bankID, sequence, timeStamp, fingerprint, description, currency_code);
            System.Web.HttpContext.Current.Response.Write("<form name='newForm' method='post' action='https://Damoon.bankmelli-iran.com/DamoonPrePaymentController'>");
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_description\" value=\"{0}\">", description));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_sequence\" value=\"{0}\">", sequence));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_timestamp\" value=\"{0}\">", timeStamp));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_hash\" value=\"{0}\">", fingerprint));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_login\" value=\"{0}\">", loginID));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_amount\" value=\"{0}\">", txt_amount.Value));
            System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_currency_code\" value=\"{0}\">", currency_code));
            //System.Web.HttpContext.Current.Response.Write("<asp:Button ID='btnSend' runat='server' Text='پرداخت' CssClass='sport_BtnForm' onClientClick='setAndSaveMelli()' />");        
            System.Web.HttpContext.Current.Response.Write("</form>");
            System.Web.HttpContext.Current.Response.Write("</body>");
            HttpContext.Current.Response.Write("<script type='text/javascript'>document.forms[0].submit();</SCRIPT>");
        }
        catch (Exception ex)
        {
            lblError.Visible = true;
            lblError.Text = "وقوع خطای " + ex.Message;
        }

        //"<script src='../Scripts/jquery-1.4.4.js' type='text/javascript'></script>" +
        //"<script type='text/javascript'>$(document).ready(function (){$('#<%= btnSend.ClientID %>').click(function (){alert('Hello');});});</script>");
        //"<script type='text/javascript'>function setAndSaveMelli(){$.ajax({type: 'POST',async: false,cache: false," +
        //"url: 'Sport_MelliBeforePayment.aspx/InsertPaymentReadyMelli'," +
        //"data: { reservationNumber: '" + sequence + "',amount: '" + amount + "',bankID: '" + bankID + "',timeStamp: '"
        //            + timeStamp + "',hashCode: '" + fingerprint + "',description: '" + description + "'}" +
        //",contentType: 'application/json; charset=utf-8'" +
        //",dataType: 'text'" +
        //",success: function (){alert('Ok');}" +
        //",error: function (fail) {alert('خطا به وقوع پیوست');}" +
        //"});" +
        //"}" +
        //"setAndSaveMelli();" +

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //UserControl LoginUserControl1 = (UserControl)Page.Master.FindControl("ctl00$ctl00$LoginUserControl1");
        //HtmlTable loginPanel = (HtmlTable)LoginUserControl1.FindControl("loginPanel");
        //HtmlTable welcomePanel = (HtmlTable)LoginUserControl1.FindControl("welcomePanel");
        //Label lbl_UserLoggedin = (Label)LoginUserControl1.FindControl("lbl_UserLoggedin");
        //Label lblLastLoginDate = (Label)LoginUserControl1.FindControl("lblLastLoginDate");
        String roleName = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
        if (!(Context.User.Identity.IsAuthenticated) || (roleName != "مدیر سایت") && (roleName != "مدیر ارشد"))
        {
            Response.Redirect("~/Home.aspx", false);
        }
        //String script = "$('input:text[id$=txt_amount]').focus();$('input:text[id$=txt_amount]').select();";
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtHighlight", script, true);
       // txt_amount.Focus();
        //if (Context.User.Identity.IsAuthenticated)
        //{
        //    loginPanel.Visible = false;
        //    welcomePanel.Visible = true;
        //    lbl_UserLoggedin.Text = Context.User.Identity.Name;
        //    lblLastLoginDate.Text = "   آخرین بازدید شما: " + PersianClass.getFarsiDate(DAL.Membership_GetLastLoginDate(Context.User.Identity.Name), false, true);
        //}

        //else
        //{
        //    loginPanel.Visible = true;
        //    Page.SetFocus(loginPanel.FindControl("txtUserName"));
        //    welcomePanel.Visible = false;
        //}
    }
    private int GetSequence()
    {
        Random rnd = new Random();
        return rnd.Next();
    }
    // This is a wrapper for the VB.NET's built-in HMACMD5 functionality
    // This function takes the data and key as strings and returns the hash as a hexadecimal value
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
    protected void btnSend_Click(object sender, EventArgs e)
    {
        submitForm();       
    }
}