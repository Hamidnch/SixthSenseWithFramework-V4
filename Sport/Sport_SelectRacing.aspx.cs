using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Sport_Sport_SelectRacing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlControl sportmenu_Home = (HtmlControl)SportMenu1.FindControl("sportmenu_Home");
        HtmlControl sportMenuAdministrator = (HtmlControl)SportMenu1.FindControl("sportMenu_Administrator");
        HtmlControl ul1 = (HtmlControl)SportMenu1.FindControl("ul1");
        HtmlControl sportmenu_HomeSite = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSite");
        HtmlControl sportmenu_HomeSport = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSport");
        HtmlControl sportmenu_Racing = (HtmlControl)SportMenu1.FindControl("sportmenu_Racing");
        HtmlControl sportmenu_RacingResult2 = (HtmlControl)SportMenu1.FindControl("sportmenu_RacingResult2");
        
        sportMenuAdministrator.Visible = false;
        if (Context.User.Identity.IsAuthenticated)
        {
            sportmenu_Home.Attributes["class"] = "list";
            //sportmenu_Home.Attributes.Add("class", "list");

            ul1.Visible = true;
            sportmenu_HomeSite.Visible = true;
            sportmenu_HomeSport.Visible = true;
            sportmenu_Racing.Visible = false;
           // sportmenu_menuRace2.Visible = true;
            sportmenu_RacingResult2.Visible = true;
            String role = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
            if (role == "مدیر سایت" || role == "مدیر ارشد")
            {
                sportMenuAdministrator.Visible = true;
            }
            else
            {
                sportMenuAdministrator.Visible = false;
            }
        }
    }
}