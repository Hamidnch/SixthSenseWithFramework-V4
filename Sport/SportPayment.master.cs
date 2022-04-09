using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Sport_SportPayment : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserControl LoginUserControl1 = (UserControl)Page.Master.FindControl("ctl00$ctl00$LoginUserControl1");
        HtmlTable loginPanel = (HtmlTable)LoginUserControl1.FindControl("loginPanel");
        HtmlTable welcomePanel = (HtmlTable)LoginUserControl1.FindControl("welcomePanel");
        Label lbl_UserLoggedin = (Label)LoginUserControl1.FindControl("lbl_UserLoggedin");
        Label lblLastLoginDate = (Label)LoginUserControl1.FindControl("lblLastLoginDate");
        String roleName = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
        if (!(Context.User.Identity.IsAuthenticated) || (roleName != "مدیر سایت") && (roleName != "مدیر ارشد"))
        {
            Response.Redirect("~/Home.aspx");
        }

        if (Context.User.Identity.IsAuthenticated)
        {
            loginPanel.Visible = false;
            welcomePanel.Visible = true;
            lbl_UserLoggedin.Text = Context.User.Identity.Name;
            lblLastLoginDate.Text = "   آخرین بازدید شما: " + PersianClass.getPersiaDate(DAL.Membership_GetLastLoginDate(Context.User.Identity.Name), "S", true, "H");
        }

        else
        {
            loginPanel.Visible = true;
            Page.SetFocus(loginPanel.FindControl("txtUserName"));
            welcomePanel.Visible = false;
        }
    }
}
