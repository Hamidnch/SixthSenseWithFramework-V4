using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Education : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Context.User.Identity.IsAuthenticated && DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name.ToLower()) == "مدیر سایت"))
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}
