using System;
using System.Web;
using System.Web.Security;
using System.Collections.Specialized;

public partial class UserControl_LoginUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e){}
    protected void lbLogin_Click(object sender, EventArgs e)
    {
        if (DAL.Membership_ValidateUserHelper(txtUserName.Text, BLL.Encrypt(txtPassword.Text)))
        {
            DAL.Site_InsertSiteVisit(BLL.GetIranDateTime(), txtUserName.Text,
            Context.Request.UserHostAddress, Context.Request.Url.ToString()); 
            // lblMessage.Visible = false;
            String role = DAL.Membership_GetRoleByUserNameHelper(txtUserName.Text);
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, txtUserName.Text, DateTime.Now,
                            BLL.GetIranDateTime().AddHours(1), false, role);
            String encriptTicket = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookieLogin = new HttpCookie(FormsAuthentication.FormsCookieName, encriptTicket);
            if (chkRememberMe.Checked)
            {
                cookieLogin.Expires = BLL.GetIranDateTime().AddMinutes(30);
            }
            Response.Cookies.Add(cookieLogin);
            FormsAuthentication.SetAuthCookie(txtUserName.Text, chkRememberMe.Checked);
            Response.Redirect(Request.RawUrl);
            //Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUserName.Text, chkRememberMe.Checked));
        }
        else
        {
            // lblMessage.Visible = true;
            // lblMessage.Text = "نام کاربری یا رمز عبور نامعتبر است";
            txtUserName.Focus();
        }
    }
    protected void lb_Logout_Click(object sender, EventArgs e)
    {
        loginPanel.Visible = true;
        welcomePanel.Visible = false;
        DAL.Membership_UpdateLastLoginDate(Context.User.Identity.Name);
        //Session.RemoveAll();
        //Session.Clear();
        //Session.Abandon();
        //Response.Cache.SetNoStore();
        //Response.Cache.SetAllowResponseInBrowserHistory(false);
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //System.Web.Security.Roles.DeleteCookie();
        System.Web.HttpContext.Current.User = null;   
        FormsAuthentication.SignOut();
        Response.Redirect("~/Home.aspx");        
       //System.Web.Security.FormsAuthentication.RedirectToLoginPage();

    }

    protected void lbUserProfile_Click(object sender, EventArgs e)
    {
        //String userName = Context.User.Identity.Name;
        //String keyPass = BLL.CreateRandomPasswordUsingGUID(12);
        //if (keyPass == String.Empty)
        //{
        //    keyPass = BLL.CreateRandomPasswordUsingGUID(12);
        //}
        //DAL.Membership_UpdateKeyForProfile(userName, keyPass);
        // Response.Redirect("~/UserPanel/UserProfileRegister.aspx?uid=" + userName + "&&key=" + keyPass);
        Response.Redirect("~/UserPanel/UserProfileRegister.aspx");
    }

    //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    Boolean is_valid  = txtUserName.Text != String.Empty;
    //    txtUserName.BackColor = is_valid ? Color.White : Color.Red;
    //    args.IsValid = is_valid;
    //}
}