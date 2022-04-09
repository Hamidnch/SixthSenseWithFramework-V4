using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_SportLows : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DAL.Sport_IsLowAccept(DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name)))
        {
            chk_SportLows.Visible = false;
            btn_acceptLows.Visible = false;
            chkSpan.Visible = false;
        }
        else
        {
            chk_SportLows.Visible = true;
            btn_acceptLows.Visible = true;
            chkSpan.Visible = true;
        }
        btn_acceptLows.ServerClick += new EventHandler(btn_acceptLows_ServerClick);
    }

    void btn_acceptLows_ServerClick(object sender, EventArgs e)
    {        
        SportLowAccept lowAccept = new SportLowAccept();
        lowAccept.Lowaccept_UserID = DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        lowAccept.LowAccept_IsOk = true;
        DAL.Sport_InsertLowAccept(lowAccept);
        //Page.Title = lowAccept.Lowaccept_UserID.ToString();
        Response.Redirect("~/Sport/Sport_SelectRacing.aspx");
    }
}