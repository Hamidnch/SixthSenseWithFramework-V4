using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_SportVariance : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData(int UserID)
    {
        gv_SportVariance.DataSource = DAL.Sport_LoadVarianceByUser(UserID);
        gv_SportVariance.DataBind();
    }
    private void BindUser()
    {
        ddl_UserSearch.DataSource = DAL.Membership_LoadAllUsers();
        ddl_UserSearch.DataTextField = "Member_UserName";
        ddl_UserSearch.DataValueField = "Member_ID";
        ddl_UserSearch.DataBind();
        ddl_UserSearch.Items.Insert(0, new ListItem("همه موارد", "-1"));        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUser();
            BindData(-1);
        }
    }
    protected void gv_SportVariance_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_SportVariance.PageIndex = e.NewPageIndex;
        int userID = int.Parse(ddl_UserSearch.SelectedValue);
        BindData(userID);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        int userID = int.Parse(ddl_UserSearch.SelectedValue);
        BindData(userID);
    }
}