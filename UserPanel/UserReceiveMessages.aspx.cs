using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserReceiveMessages : System.Web.UI.Page
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        // gv_OutputMessageContactUs.DataSource = DAL.LoadAllInputMessageContactUs("پاسخ داده شده");
        String receive_Email = DAL.Membership_GetEmailForUserName(User.Identity.Name);
        gv_UserReceiveMessages.DataSource = DAL.Messages_GetReceiveMessagesByMessageType(1, receive_Email);
        gv_UserReceiveMessages.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
}