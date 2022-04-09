using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Security;

public partial class Economic : System.Web.UI.MasterPage
{
    public String imageUrl{get{return ResolveUrl("~/Images");}}
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlTable loginPanel = (HtmlTable)LoginUserControl1.FindControl("loginPanel");
        HtmlTable welcomePanel = (HtmlTable)LoginUserControl1.FindControl("welcomePanel");
        Label lbl_UserLoggedin = (Label)LoginUserControl1.FindControl("lbl_UserLoggedin");
        Label lblLastLoginDate = (Label)LoginUserControl1.FindControl("lblLastLoginDate");
        HtmlAnchor ecoAdministrator = (HtmlAnchor)EconomicHorizMenu1.FindControl("ecoAdministrator");
        ecoAdministrator.Visible = false;
        String roleName = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
        if (!(Context.User.Identity.IsAuthenticated) || (roleName != "مدیر سایت") && (roleName != "مدیر ارشد"))
        {
            Response.Redirect("~/Home.aspx");
        }
        if (Context.User.Identity.IsAuthenticated)
        {
            String role = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
            if (role == "مدیر سایت" || role == "مدیر ارشد")
            {
                ecoAdministrator.Visible = true;
            }
            else
            {
                ecoAdministrator.Visible = false;
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
        //lblViewCount.Text = "کل بازدیدها: " + DAL.Site_GetReviewCount().ToString();
        //lblOnlineUser.Text = " تعداد کاربران آنلاین:  " + Application["OnlineUsers"].ToString();
        //myDate.Text = "امروز " + PersianClass.getFarsiDate(DateTime.Now, false, false);
    }
}
