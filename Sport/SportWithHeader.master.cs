using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Sport_SportWithHeader : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserControl LoginUserControl1 = (UserControl)Page.Master.FindControl("ctl00$ctl00$LoginUserControl1");
        HtmlTable loginPanel = (HtmlTable)LoginUserControl1.FindControl("loginPanel");
        HtmlTable welcomePanel = (HtmlTable)LoginUserControl1.FindControl("welcomePanel");
        Label lbl_UserLoggedin = (Label)LoginUserControl1.FindControl("lbl_UserLoggedin");
        Label lblLastLoginDate = (Label)LoginUserControl1.FindControl("lblLastLoginDate");
        HtmlControl sportMenuAdministrator = (HtmlControl)SportMenu1.FindControl("sportMenu_Administrator");
        HtmlControl sportmenu_Home = (HtmlControl)SportMenu1.FindControl("sportmenu_Home");
        HtmlControl ul1 = (HtmlControl)SportMenu1.FindControl("ul1");
        HtmlControl sportmenu_HomeSite = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSite");
        HtmlControl sportmenu_HomeSport = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSport");
        sportMenuAdministrator.Visible = false;
        String roleName = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
        if (!(Context.User.Identity.IsAuthenticated) || (roleName != "مدیر سایت") && (roleName != "مدیر ارشد"))
        {
            Response.Redirect("~/Home.aspx");
        }

        if (Context.User.Identity.IsAuthenticated)
        {
            sportmenu_Home.Attributes["class"] = "list";
            ul1.Visible = true;
            sportmenu_HomeSite.Visible = true;
            sportmenu_HomeSport.Visible = true;
            String role = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
            if (role == "مدیر سایت" || role == "مدیر ارشد")
            {
                sportMenuAdministrator.Visible = true;
            }
            else
            {
                sportMenuAdministrator.Visible = false;
            }        
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
