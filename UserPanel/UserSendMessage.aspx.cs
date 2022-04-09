using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class UserPanel_UserSendMessage : System.Web.UI.Page
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        String script = "CKEDITOR.replace('" + txt_Message.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl'});";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Editor", script, true);
        lblDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true, "H");
        if (!IsPostBack)
        {
            ddl_Receiver.DataSource = DAL.Membership_LoadAllUsers();
            ddl_Receiver.DataTextField = "Member_Email";
            ddl_Receiver.DataValueField = "Member_ID";
            ddl_Receiver.DataBind();
        }
    }
    [WebMethod]
    public static String User_InsertNewMessage(String Message_Subject, String Message_Context,
         String Message_ReceiverEmail)
    {
        try
        {
            //Message_Type = 1  >> UserSend
            String user_Email = DAL.Membership_GetEmailForUserName(HttpContext.Current.User.Identity.Name);
            DAL.Messages_InsertNewMessage(1, Message_Subject, Message_Context, user_Email, Message_ReceiverEmail, true, "ارسال از یک کاربر به کاربران دیگر");
            //if (Message_ReceiverEmail == "همه")
            //{
            //    DataSet ds = DAL.Membership_LoadAllEmails();
            //    foreach (DataRow item in ds.Tables[0].Rows)
            //    {
            //        BLL.SendEmail("mail@hesesheshom.com", item["Member_Email"].ToString(), Message_Subject, Message_Context, true, "Yes");
            //    }
            //}
            //else
            //{
            //    String[] receivers = Message_ReceiverEmail.Split(',');
            //    foreach (String receiver in receivers)
            //    {
            //        BLL.SendEmail("mail@hesesheshom.com", receiver, Message_Subject, Message_Context, true, "Yes");
            //    }
            //}
            return "پیام مورد نظر ارسال گردید";
        }
        catch (Exception ex)
        {
            BLL.SendEmail("User_InsertNewMessage", ex);
            return "در ارسال پیام اشکالاتی رخ داد";
        }
    }
    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserPanel/UserProfileRegister.aspx", false);
    }
}