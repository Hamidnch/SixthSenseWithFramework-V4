using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class ContactWithUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {}
    [WebMethod]
    public static String InsertContact(String title, String author, String email, String phone, String message)
    {
        String result = "";
        try
        {
            DAL.ContactUs_InsertContact(title, author, email, phone, message);
            
            result += "خبر موردنظر ثبت گردید.";

            String strFileText = BLL.ExportTemplate(HttpContext.Current.Server.MapPath("~/ContactEmail.htm"));
            strFileText = strFileText.Replace("#Title#", title);
            strFileText = strFileText.Replace("#Author#", author);
            strFileText = strFileText.Replace("#Msg#", message.Trim());
            strFileText = strFileText.Replace("#Email#", email.Trim());
            strFileText = strFileText.Replace("#Year#", BLL.GetIranDateTime().Year.ToString());
            result += "----" + BLL.SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", "پیام جدید", strFileText, true, "پیغام شما به مدیریت سایت فرستاده شد");
            //String result2 = BLL.SendEmail("mail@hesesheshom.com", "Farhad-ch.panahy@Yahoo.Com", "پیام جدید", strFileText, true, "پیغام شما به مدیریت سایت فرستاده شد");
            //String result3 = BLL.SendEmail("mail@hesesheshom.com", "panahi_fch@yahoo.com", "پیام جدید", strFileText, true, "پیغام شما به مدیریت سایت فرستاده شد");               
            String result4 = BLL.SendEmail("mail@hesesheshom.com", "panahi.fch@gmail.com", "پیام جدید", strFileText, true, "پیغام شما به مدیریت سایت فرستاده شد");
            //return result != "" ? result : result3;
        }
        catch(Exception ex)
        {
            result += "خطا در انجام عملیات";
            BLL.SendEmail("InsertContact", ex);
        }
        return result;
    }
}