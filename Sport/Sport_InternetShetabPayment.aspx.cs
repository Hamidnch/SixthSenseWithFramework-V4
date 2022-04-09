using System;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web;
using System.Security.Cryptography;

public partial class Sport_Sport_InternetShetabPayment : System.Web.UI.Page
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }

    [WebMethod]
    public static string Result(string controlName)
    {
        return RenderControl(controlName);
    }
    public static string RenderControl(string controlName)
    {
        Page page = new Page();
        UserControl userControl = (UserControl)page.LoadControl(controlName);
        userControl.EnableViewState = false;
        HtmlForm form = new HtmlForm();
        form.Controls.Add(userControl);
        page.Controls.Add(form);
        StringWriter textWriter = new StringWriter();
        HttpContext.Current.Server.Execute(page, textWriter, false);
        return textWriter.ToString();
    }
    [WebMethod]
    public static void InsertPayments(String reservationNumber, String amount, String bankID)
    {
        DAL.Sport_InsertPeyments(reservationNumber, amount, bankID, "", "", "", "", "");
        String emailByUser= DAL.Membership_GetEmailForUserName(HttpContext.Current.User.Identity.Name);
        if ( emailByUser!= null || emailByUser != "")
        {
            BLL.SendEmail("mail@hesesheshom.com", emailByUser, "پرداخت از طریق درگاه سامان", "عملیات پرداخت از طریق درگاه سامان با موفقیت انجام پذیرفت" +
                "<br /><div style='font-family:tahoma;color:blue'><span >کددیجیتالی شما: " + reservationNumber + "</span>" +
                "<br /><span>مبلغ پرداختی شما:" + amount + " ریال</span></div>", true, "Ok");
        }
    }
    [WebMethod]
    public static String CreateReservationNumber()
    {
         String resNumber = BLL.CreateRandomPasswordUsingGUID(20);
         return resNumber;
    }
    //[WebMethod]
    //public static void submitForm()
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
    //    // System.Web.HttpContext.Current.Response.Write("</body>");
    //    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>document.forms[0].method='post';document.forms[0].action='https://Damoon.bankmelli-iran.com/DamoonPrePaymentController';document.forms[0].submit();</SCRIPT>");
    //}
    //private static string HMAC_MD5(string key, string value)
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
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlControl sportmenu_Home = (HtmlControl)SportMenu1.FindControl("sportmenu_Home");
        HtmlControl ul1 = (HtmlControl)SportMenu1.FindControl("ul1");
        HtmlControl sportmenu_HomeSite = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSite");
        HtmlControl sportmenu_HomeSport = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSport");
        HtmlControl sportmenu_ChargeAccount = (HtmlControl)SportMenu1.FindControl("sportmenu_ChargeAccount");
        HtmlControl li_sportmenu_ChargeAccount = (HtmlControl)SportMenu1.FindControl("li_sportmenu_ChargeAccount");
        if (Context.User.Identity.IsAuthenticated)
        {
            sportmenu_Home.Attributes["class"] = "list";
            ul1.Visible = true;
            sportmenu_HomeSite.Visible = true;
            sportmenu_HomeSport.Visible = true;
            sportmenu_ChargeAccount.Visible = false;
            li_sportmenu_ChargeAccount.Visible = false;
        }
       // if (!IsPostBack)
       // {
      //  currentModule = "SportMeliPayment";
    //    addModule(currentModule);
      //  }
    }
    //public string currentModule { get { return (string)ViewState["moduleName"]; } set { ViewState["moduleName"] = value; } }
    //public void addModule(object moduleName)
    //{
    //    PlaceHolder1.Controls.Clear();
    //    UserControl uCtrl = (UserControl)Page.LoadControl(string.Format("~/UserControl/{0}.ascx", moduleName));
    //    uCtrl.ID = new Guid().ToString();
    //    PlaceHolder1.Controls.Add(uCtrl);
    //    currentModule = moduleName.ToString();
    //}
    //protected void rb_BankPort_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (rb_BankPort.SelectedIndex == 0)
    //    {
    //        currentModule = "SportMeliPayment";
    //        addModule(currentModule);
    //    }
    //    else
    //        if (rb_BankPort.SelectedIndex == 2)
    //        {
    //            currentModule = "SportSamanPayment";
    //            addModule(currentModule);
    //        }
    //}
}