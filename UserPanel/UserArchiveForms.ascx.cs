using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserArchiveForms : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    public int ActiveUserID { get { return DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name); } }
    protected void Page_Load(object sender, EventArgs e){}
}