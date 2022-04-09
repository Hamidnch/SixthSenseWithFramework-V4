using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Sport_Sport_SettleIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlControl sportmenu_Home = (HtmlControl)SportMenu1.FindControl("sportmenu_Home");
        HtmlControl ul1 = (HtmlControl)SportMenu1.FindControl("ul1");
        HtmlControl sportmenu_HomeSite = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSite");
        HtmlControl sportmenu_HomeSport = (HtmlControl)SportMenu1.FindControl("sportmenu_HomeSport");
        HtmlControl sportmenu_ChargeAccount = (HtmlControl)SportMenu1.FindControl("sportmenu_ChargeAccount");
        HtmlControl li_sportmenu_ChargeAccount = (HtmlControl)SportMenu1.FindControl("li_sportmenu_ChargeAccount");
        if (Context.User.Identity.IsAuthenticated)
        {
            sportmenu_Home.Attributes["class"] = "list";
            ul1.Visible = true;
            sportmenu_HomeSite.Visible = true;
            sportmenu_HomeSport.Visible = true;
            sportmenu_ChargeAccount.Visible = false;
            li_sportmenu_ChargeAccount.Visible = false;
        }
    }
}