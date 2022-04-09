using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

public partial class UserControl_SportMeliPayment : System.Web.UI.UserControl
{
    //private void submitForm()
    //{
    //    string loginID = "113140784";
    //    string transactionKey = "4n+UD+mdbfpP+DGS";
    //    string amount = "100";
    //    string description = "Sample Transaction";
    //    //string label = "Submit Payment"; // The is the label on the 'submit' button
    //    //string testMode = "false";
    //    string currency_code = "Rial";
    //    Random random = new Random();
    //    string sequence = (random.Next(0, 1000)).ToString();
    //    string timeStamp = ((int)(DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalSeconds).ToString();
    //    string fingerprint = HMAC_MD5(transactionKey, loginID + "^" + sequence + "^" + timeStamp + "^" + amount + "^" + currency_code);
    //    //System.Web.HttpContext.Current.Response.Write("<form name='newForm' method='post' action='https://Damoon.bankmelli-iran.com/DamoonPrePaymentController'>");
    //    System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_description\" value=\"{0}\">", description));
    //    System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_sequence\" value=\"{0}\">", sequence));
    //    System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_timestamp\" value=\"{0}\">", timeStamp));
    //    System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_fp_hash\" value=\"{0}\">", fingerprint));
    //    System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_login\" value=\"{0}\">", loginID));
    //    System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_amount\" value=\"{0}\">", amount));
    //    System.Web.HttpContext.Current.Response.Write(string.Format("<input type=hidden name=\"x_currency_code\" value=\"{0}\">", currency_code));
    //    //System.Web.HttpContext.Current.Response.Write(string.Format("<asp:Button ID='btnSend' runat='server' Text='پرداخت' CssClass='sport_BtnForm' PostBackUrl='https://Damoon.bankmelli-iran.com/MerchantsIntegrationTestController' />"));
    //    //System.Web.HttpContext.Current.Response.Write("</form>");
    //   // System.Web.HttpContext.Current.Response.Write("</body>");
    //    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>document.forms[0].method='post';document.forms[0].action='https://Damoon.bankmelli-iran.com/DamoonPrePaymentController';document.forms[0].submit();</SCRIPT>");
    //}


    protected void Page_Load(object sender, EventArgs e)
    {
        //submitForm();        
        ////this.Page.Form.Method = "post";
        ////this.Page.Form.Action = "https://Damoon.bankmelli-iran.com/MerchantsIntegrationTestController";
        //// start by setting the static values
        //string loginID = "113140784";
        //string transactionKey = "4n+UD+mdbfpP+DGS";
        //string amount = "100";
        //string description = "Sample Transaction";
        //string label = "Submit Payment"; // The is the label on the 'submit' button
        ////string testMode = "false";
        //string currency_code = "Rial";
        //// If an amount or description were posted to this page, the defaults are overidden
        ////if (Request.Form["amount"] != null)
        ////{   amount = Request.Form["amount"];    }
        ////if (Request.Form["description"] != null)
        ////{   description = Request.Form["description"];  }

        ////// also check to see if the amount or description were sent using the GET method
        ////if (Request.QueryString["amount"] != null)
        ////{   amount = Request.QueryString["amount"];   }
        ////if (Request.QueryString["description"] != null)
        ////{   description = Request.QueryString["description"]; }

        ////string invoice = DateTime.Now.ToString("yyyyMMddhhmmss");

        //Random random = new Random();
        //string sequence = (random.Next(0, 1000)).ToString();

        //string timeStamp = ((int)(DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalSeconds).ToString();

        //string fingerprint = HMAC_MD5(transactionKey, loginID + "^" + sequence + "^" + timeStamp + "^" + amount + "^" + currency_code);
        ////lbl.Text = loginID + "^" + sequence + "^" + timeStamp + "^" + amount + "^" + currency_code;
        ////Print the Amount and Description to the page by placing them in the Spans
        //// amountSpan.InnerHtml = amount;
        ////descriptionSpan.InnerHtml = description;

        ////Update the fields in the actual form 
        //x_login.Value = loginID;
        //x_amount.Value = amount;
        //// x_description.Value = description;
        //// buttonLabel.Value = label;
        //// x_test_request.Value = testMode;
        ////x_invoice_num.Value = invoice;
        //x_fp_sequence.Value = sequence;
        //x_fp_timestamp.Value = timeStamp;
        //x_fp_hash.Value = fingerprint;
        //x_currency_code.Value = currency_code;
        //lbl.Text = x_fp_timestamp.Value;
    }
    // This is a wrapper for the VB.NET's built-in HMACMD5 functionality
    // This function takes the data and key as strings and returns the hash as a hexadecimal value
    //private string HMAC_MD5(string key, string value)
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
    //http://www.hesesheshom.com/Sport/Sport_MelliRedirectUrl.aspx
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    submitForm();          
    //}
}