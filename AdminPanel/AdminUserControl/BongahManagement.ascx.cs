using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_BongahManagement : System.Web.UI.UserControl
{
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    } 
    protected void Page_Load(object sender, EventArgs e)
    {
        RefereshGridView();
    }
    private void RefereshGridView()
    {
        gv_Investing.DataSource = DAL.Economic_LoadAllBongah();
        gv_Investing.DataBind();
    }
    protected void gv_Investing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Investing.PageIndex = e.NewPageIndex;
        gv_Investing.EditIndex = -1;
        gv_Investing.SelectedIndex = -1;
    }
    protected void gv_Investing_PageIndexChanged(object sender, EventArgs e)
    {
        RefereshGridView();
    }
}