using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_SportSamanPayment : System.Web.UI.UserControl
{
    public string TotalAmount = string.Empty;
    public string ReservationNumber = string.Empty;
    public string MerchantID = string.Empty;
    public string RedirectURL = string.Empty;

    public string shetabPath
    {
        get
        {                        
            return ResolveUrl("~/Sport/Sport_InternetShetabPayment.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        //this.Response.Filter =
        //new cdsnetFormActionModifier(this.Response.Filter, "https://acquirer.sb24.com/CardServices/controller");
        
        /*
        * =======================<< When you read  info from Session  >>===============================
        GetParametersFromSession();    
        * =======================<<  When you read  info from Request  >>================================= 
        GetParametersFromRequest();         
         */
        // Just as an Example
        //int amount = int.Parse(txt_InternetShetabAmount.Text);
        //TotalAmount = amount.ToString();//txt_InternetShetabAmount.Text;
       // String resNumber = BLL.CreateRandomPasswordUsingGUID(20);
       // ReservationNumber = resNumber;
        MerchantID = "02193207-189071";
        RedirectURL = "http://www.hesesheshom.com/Sport/Sport_GetBack.aspx";
        // registration of information in the DB
        // registerPurchase(...)
    }
    // Get info from Session
    //private void GetParametersFromSession()
    //{
    //    TotalAmount = Session["TotalAmount"].ToString();
    //    ReservationNumber = Session["reservationcode"].ToString();
    //    MerchantID = Session["merchantid"].ToString();
    //    RedirectURL = Session["redirecturl"].ToString();
    //}
    //// Get info from Request
    //private void GetParametersFromRequest()
    //{
    //    TotalAmount = Request["TotalAmount"].ToString();
    //    ReservationNumber = Request["reservationcode"].ToString();
    //    MerchantID = Request["merchantid"].ToString();
    //    RedirectURL = Request["redirecturl"].ToString();
    //}
    //protected void btnSend_Click(object sender, EventArgs e)
    //{
    //    int amount = int.Parse(txt_InternetShetabAmount.Text);
    //    TotalAmount = amount.ToString();//txt_InternetShetabAmount.Text;
    //    ReservationNumber = "25430";
    //    MerchantID = "02193207-189071";
    //    RedirectURL = "http://www.google.com";
    //}
}