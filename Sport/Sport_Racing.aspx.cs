using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Sport_Sport_Racing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlControl sportMenuAdministrator = (HtmlControl)SportMenu1.FindControl("sportMenu_Administrator");
        sportMenuAdministrator.Visible = false;
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
        }
    }
}