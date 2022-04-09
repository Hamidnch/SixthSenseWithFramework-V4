using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserAllSendMessages : System.Web.UI.Page
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        // gv_OutputMessageContactUs.DataSource = DAL.LoadAllInputMessageContactUs("پاسخ داده شده");
        String sender_Email = DAL.Membership_GetEmailForUserName(User.Identity.Name);
        gv_UserSendMessages.DataSource = DAL.Messages_GetSendMessagesByMessageType(1, sender_Email);
        gv_UserSendMessages.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
}