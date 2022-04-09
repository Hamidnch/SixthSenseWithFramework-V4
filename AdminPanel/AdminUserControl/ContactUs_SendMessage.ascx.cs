using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ContactUs_SendMessage : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String script = "CKEDITOR.replace('" + txt_Message.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl'});";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Editor", script, true);
            lblDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true, "H");
            ddl_Receiver.DataSource = DAL.Membership_LoadAllUsers();
            ddl_Receiver.DataTextField = "Member_Email";
            ddl_Receiver.DataValueField = "Member_ID";
            ddl_Receiver.DataBind();
        }
    }
}