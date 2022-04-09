using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_SportHorizMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        menuRace.ServerClick += new EventHandler(menuRace_ServerClick);
        menuEconomic.ServerClick += new EventHandler(menuEconomic_ServerClick);
    }

    void menuEconomic_ServerClick(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script type='text/javascript'>alert('این بخش از سایت هنوز آماده نمی باشد')</script>"); 
    }

    void menuRace_ServerClick(object sender, EventArgs e)
    {
        //menuRace.CausesValidation = false;
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            if (DAL.Sport_IsLowAccept(DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name)))
            {
                Response.Redirect("~/Sport/Sport_SelectRacing.aspx");
            }
            else
            {
                Response.Redirect("~/Sport/Sport_Lows.aspx");
            }
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script2", "<script type='text/javascript'>alert('شما عضو نیستید')</script>");
        }
    }
}