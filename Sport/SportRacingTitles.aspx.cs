using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Sport_SportRacingTitles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlControl sportmenu_Home = (HtmlControl)SportMenu1.FindControl("sportmenu_Home");
        HtmlControl sportMenuAdministrator = (HtmlControl)SportMenu1.FindControl("sportMenu_Administrator");
        HtmlControl ul1 = (HtmlControl)SportMenu1.FindControl("ul1");
        HtmlControl sportmenu_HomeSite = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSite");
        HtmlControl sportmenu_HomeSport = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSport");
        HtmlControl sportmenu_RacingResult = (HtmlControl)SportMenu1.FindControl("sportmenu_RacingResult");
        HtmlControl sportmenu_RacingResultli = (HtmlControl)SportMenu1.FindControl("sportmenu_RacingResultli");
        sportMenuAdministrator.Visible = false;
        if (Context.User.Identity.IsAuthenticated)
        {
            sportmenu_Home.Attributes["class"] = "list";
            //sportmenu_Home.Attributes.Add("class", "list");

            ul1.Visible = true;
            sportmenu_HomeSite.Visible = true;
            sportmenu_HomeSport.Visible = true;
            sportmenu_RacingResult.Visible = false;
            sportmenu_RacingResultli.Visible = false;
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