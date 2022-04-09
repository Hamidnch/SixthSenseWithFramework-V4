using System;
using System.Web.Services;
using System.Collections.Generic;

public partial class AdminPanel_ContactUs_InputMessage : System.Web.UI.Page
{
    [WebMethod]
    public static ContactUs GetContactMessageInfoByContactID(String contact_ID)
    {
        return DAL.GetContactMessageByContactID(contact_ID.Trim());
    }
    [WebMethod]
    public static void ReplyEmail(String ID, String Email, String Subject, String Reply)
    {
        try
        {
            BLL.SendEmail("mail@hesesheshom.com", Email, Subject, Reply, true, "Yes");
            BLL.SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", Subject, Reply, true, "Yes");
            DAL.ContactUs_UpdateContact(ID, Reply, "پاسخ داده شده", "");
        }
        catch (Exception ex)
        { BLL.SendEmail("خطا در فرایند پاسخ به ایمیل کاربران", ex); }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.ClientScript.RegisterClientScriptInclude("ui", ResolveUrl(@"..\Scripts\jquery-ui-1.8.6.custom.min.js"));
        //Page.ClientScript.RegisterClientScriptInclude("ui", ResolveUrl(@"..\Scripts\jquery-1.4.4.js"));  
    }
}