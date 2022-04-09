using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserContactInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
              //  if (!IsPostBack)
              //  {
                    String userName = Context.User.Identity.Name;
                    txtUserName.Text = userName;
                    CustomMembership member = new CustomMembership();
                    DAL.Membership_LoadAllAttributes(txtUserName.Text, member);

                    txtPhone.Text  = PersianClass.getPersianNumberStyle(member.Phone);
                    txtMobile.Text  = PersianClass.getPersianNumberStyle(member.Mobile);
                    txtAddress.Text = member.Address;
                    ddlCountry.Text = member.Country;
                    ddlCity.Text    = member.City;
             //   }
            }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch(Exception ex){BLL.SendEmail("UserPanel_UserContactInfo Page_Load", ex);}
    }
}