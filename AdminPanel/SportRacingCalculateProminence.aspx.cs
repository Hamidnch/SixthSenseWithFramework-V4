using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_SportRacingCalculateProminence : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            String role = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
            if (role != "مدیر ارشد")
            {
                Response.Redirect("~/AdminPanel/AccessSeniorAdmin.aspx");
            }
        }
    }
}