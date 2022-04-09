using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_UserTrafficManagement : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {BindData();}

    private void BindData()
    {
        gv_UserTraffic.DataSource = DAL.Site_GetUsersTraffic();
        gv_UserTraffic.DataBind();
    }

    protected void gv_UserTraffic_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_UserTraffic.PageIndex = e.NewPageIndex;
        BindData();
    }
}