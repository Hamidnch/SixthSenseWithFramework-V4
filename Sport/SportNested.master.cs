using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Sport_SportNested : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserControl LoginUserControl1 = (UserControl)Page.Master.FindControl("ctl00$ctl00$LoginUserControl1");
        HtmlTable loginPanel = (HtmlTable)LoginUserControl1.FindControl("loginPanel");
        HtmlTable welcomePanel = (HtmlTable)LoginUserControl1.FindControl("welcomePanel");
        Label lbl_UserLoggedin = (Label)LoginUserControl1.FindControl("lbl_UserLoggedin");
        Label lblLastLoginDate = (Label)LoginUserControl1.FindControl("lblLastLoginDate");
        HtmlControl sportMenuAdministrator = (HtmlControl)SportMenu1.FindControl("sportMenu_Administrator");
        //HtmlAnchor sportmenu_menuRace = (HtmlAnchor)SportMenu1.FindControl("sportmenu_menuRace");
        //sportmenu_menuRace.ServerClick += new EventHandler(sportmenu_menuRace_ServerClick);
        //sportMenuAdministrator.Visible = false;
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

    //void sportmenu_menuRace_ServerClick(object sender, EventArgs e)
    //{
    //    //menuRace.CausesValidation = false;
    //    if (HttpContext.Current.User.Identity.IsAuthenticated)
    //    {
    //        if (DAL.Sport_IsLowAccept(DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name)))
    //        {
    //            Response.Redirect("~/Sport/Sport_SelectRacing.aspx");
    //        }
    //        else
    //        {
    //            Response.Redirect("~/Sport/Sport_Lows.aspx");
    //        }
    //    }
    //    else
    //    {
    //        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script2", "<script type='text/javascript'>alert('شما عضو نیستید')</script>");
    //    } 
    //}
    public String imageUrl
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    }
}
