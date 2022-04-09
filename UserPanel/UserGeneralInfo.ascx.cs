using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserGeneralInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
              //  if (!IsPostBack)
             //   {
                    String userName = Context.User.Identity.Name;
                    txtUserName.Text = userName;
                    CustomMembership member = new CustomMembership();
                    DAL.Membership_LoadAllAttributes(txtUserName.Text, member);
                    txtAccountName.Text = member.AccountName;
                    txtAccountFamily.Text = member.AccountFamily;
                    txtAccountNumber.Text = PersianClass.getPersianNumberStyle(member.AccountNumber);
                    ddlBankName.Text = member.BankName;
                    txtWebSite.Text = member.WebSite;
                    txtYahooID.Text = member.YahooID;
                    txtComment.Text = member.Comment;
              //  }
            }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch (Exception ex){BLL.SendEmail("UserPanel_UserGeneralInfo Page_Load", ex);}
    }
}