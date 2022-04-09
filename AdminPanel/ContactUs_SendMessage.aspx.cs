using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class AdminPanel_ContactUs_SendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static String Admin_InsertNewMessage(String Message_Subject, String Message_Context, 
         String Message_ReceiverEmail)
    {
        try
        {
            DAL.Messages_InsertNewMessage(0, Message_Subject, Message_Context, "mail@hesesheshom.com", Message_ReceiverEmail, true, "");
            if (Message_ReceiverEmail == "همه")
            {
                DataSet ds = DAL.Membership_LoadAllEmails();
                foreach (DataRow item in ds.Tables[0].Rows)
                {                    
                    BLL.SendEmail("mail@hesesheshom.com",item["Member_Email"].ToString(), Message_Subject, Message_Context, true, "Yes");
                }
            }
            else
            {
                String[] receivers = Message_ReceiverEmail.Split(',');
                foreach (String receiver in receivers)
                {
                    BLL.SendEmail("mail@hesesheshom.com", receiver, Message_Subject, Message_Context, true, "Yes");
                }
            }
            return "پیام مورد نظر ارسال گردید";
        }
        catch (Exception ex)
        {
            BLL.SendEmail("InsertNewMessage", ex);
            return "در ارسال پیام اشکالاتی رخ داد";
        }
    }
}