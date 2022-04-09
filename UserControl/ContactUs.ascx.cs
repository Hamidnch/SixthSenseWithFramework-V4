using System;

public partial class UserControl_ContactUs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
         
    public string ContactPath
    {
        get
        {
            //string completePath = this.Server.MapPath(this.Request.ApplicationPath).Replace("/", "\\");
            //string applicationPath = this.Request.ApplicationPath.Replace("/", "\\");
            //string rootPath = completePath.Replace(applicationPath, string.Empty);
            return ResolveUrl("~/ContactWithUs.aspx"); 
        }
    }
    //protected void btn_ContactRegister_Click(object sender, EventArgs e)
    //{
        //ContactUs contactNew = new ContactUs();
        //contactNew.ConatactUs_Author = txt_author.Text;
        //contactNew.ConatactUs_UserIP = Context.User.Identity.Name;
        //contactNew.ConatactUs_Email = txt_email.Text;
        //contactNew.ConatactUs_Phone = txt_phone.Text;
        //contactNew.ConatactUs_Message = txt_message.Text;
        //try
        //{
        //    DAL.ContactUs_InsertContact(contactNew);
        //    String strFileText = BLL.ExportTemplate(Server.MapPath("ContactEmail.htm"));
        //    strFileText = strFileText.Replace("#Author#", txt_author.Text);
        //    strFileText = strFileText.Replace("#Msg#", txt_message.Text.Trim());
        //    strFileText = strFileText.Replace("#Email#", txt_email.Text.Trim());
        //    strFileText = strFileText.Replace("#Year#", DateTime.Now.Year.ToString());
        //    String result = BLL.SendEmail("Hamidnch@hesesheshom.com", "Hamidnch2007@Gmail.Com", "پیام جدید", strFileText, true, "پیغام شما به مدیریت سایت فرستاده شد");
        //    String result2 = BLL.SendEmail("Hamidnch@hesesheshom.com", "Farhad-ch.panahy@Yahoo.Com", "پیام جدید", strFileText, true, "پیغام شما به مدیریت سایت فرستاده شد");
        //    String result3 = BLL.SendEmail("Hamidnch@hesesheshom.com", "panahi_fch@yahoo.com", "پیام جدید", strFileText, true, "پیغام شما به مدیریت سایت فرستاده شد");
        //    lbl_Message.Text = result != "" ? result : result3;
        //    txt_author.Text  = String.Empty;
        //    txt_email.Text   = String.Empty;
        //    txt_phone.Text   = String.Empty;
        //    txt_message.Text = String.Empty;
        //}
        //catch (Exception ex)
        //{
        //    lbl_Message.Text = "بروز خطای " + ex.Message;
        //}
    //}
}