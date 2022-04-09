using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserEmailPass : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
             //   if (!IsPostBack)
            //    {
                    String userName = Context.User.Identity.Name;
                    txtUserName.Text = userName;
                    CustomMembership member = new CustomMembership();
                    DAL.Membership_LoadAllAttributes(txtUserName.Text, member);
                    txtnewEmail.Text = member.Email;
                    txtCurrentEmail.Value = member.Email.Trim();
                    txtdupNewEmail.Text = member.Email.Trim();
            //    }
            }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch (Exception ex){BLL.SendEmail("UserPanel_UserEmailPass Page_Load", ex);}
    }
}