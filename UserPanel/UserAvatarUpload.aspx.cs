using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;

public partial class UserPanel_UserAvatarUpload : System.Web.UI.Page
{
    public String GetUserName { get { return User.Identity.Name; } }
    public String Root { get { return ResolveUrl("~/"); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                String userName = Context.User.Identity.Name;
                CustomMembership member = new CustomMembership();
                DAL.Membership_LoadAllAttributes(userName, member);
                imgUser.ImageUrl = (!String.IsNullOrEmpty(member.Picture) && !String.IsNullOrWhiteSpace(member.Picture)) ?
                           "~/UserPanel/UserImgUpload/" + member.Picture : "~/UserPanel/UserImgUpload/NoPhoto.jpg";
            }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch (Exception ex){BLL.SendEmail("UserPanel_UserAvatarUpload Page_Load", ex);}
    }
}