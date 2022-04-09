using System;
using System.Web.Services;
using MSCaptcha;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class UserRegisteration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {      
    }
    [WebMethod]
    public static bool IsUserAvailable(string username)
    {
        return !DAL.Membership_ExistsUserNameOrEmail("SP_Membership_ExistUserName", "@userName", username);
    }

    [WebMethod]
    public static bool IsEmailAvailable(string email)
    {
        bool correct = false;
        if (Regex.IsMatch(email.Trim(),
            @"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$"))
        {
            correct = true;
        }
        return (!DAL.Membership_ExistsUserNameOrEmail("SP_Membership_ExistEmail", "@email", email) && correct);
    }
}