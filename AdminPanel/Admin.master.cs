using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                uName.Style.Add("color", "Lime");
                uName.InnerText = Context.User.Identity.Name + " عزیز";
                String roleName = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
                if (roleName != "مدیر سایت" && roleName != "مدیر ارشد")
                {
                    Response.Redirect("~/AccessDenied.htm");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Error.aspx?Err='" + ex.Message + "&&InnerErr=" + ex.InnerException.Message);
        }
    }
}
