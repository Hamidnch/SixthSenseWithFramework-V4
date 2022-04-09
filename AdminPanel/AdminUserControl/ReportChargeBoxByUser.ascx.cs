using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ReportChargeBoxByUser : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        gv_ChargeByUserReport.DataSource = DAL.Sport_LoadAllChargeBoxTurnover();
        gv_ChargeByUserReport.DataBind();
    }
    private void BindUser()
    {
        ddl_Users.DataSource = DAL.Membership_LoadAllUsers(); ddl_Users.DataTextField = "Member_UserName"; ddl_Users.DataValueField = "Member_ID"; ddl_Users.DataBind();
        ddl_Users.Items.Insert(0, new ListItem("انتخاب کنید", "-1"));
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            BindUser();
        }
    }
    protected void btn_refreshReport_Click(object sender, EventArgs e)
    {
        ddl_Users.SelectedIndex = -1;
        BindData();
    }
    protected void btn_Return_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/ReportsList.aspx", false);
    }

    private void CombineSearch()
    {
        DateTime st = new DateTime(2000, 01, 01), ed = new DateTime(3000, 01, 01);
        if (pdp_StartDate.Text != "" && pdp_StartDate.SelectedDateTime.HasValue)
        {
            st = pdp_StartDate.SelectedDateTime.Value;
        }
        //else st =new DateTime(2000, 01, 01);
        if (pdp_EndDate.Text != "" && pdp_EndDate.SelectedDateTime.HasValue)
        {
            ed = pdp_EndDate.SelectedDateTime.Value;
        }
        int userID = -1;
        try
        {
            userID = int.Parse(ddl_Users.SelectedValue);
        }
        catch
        {
            userID = -1;
        }
        gv_ChargeByUserReport.DataSource = DAL.Sport_GetReportChargeBoxTurnoverByUserAndDate(userID, st, ed);
        gv_ChargeByUserReport.DataBind();
    }

    //private void SearchReport(int userID)
    //{
    //    if (pdp_StartDate.SelectedDateTime.HasValue && pdp_EndDate.SelectedDateTime.HasValue)
    //    {
    //        gv_ChargeByUserReport.DataSource = DAL.Sport_GetReportChargeBoxTurnoverByUserAndDate(userID, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
    //    }
    //    else
    //    {
    //        gv_ChargeByUserReport.DataSource = DAL.Sport_LoadAllChargeBoxTurnover();
    //    }
    //    gv_ChargeByUserReport.DataBind();
    //}
    protected void btn_searchReport_Click(object sender, EventArgs e)
    {
        CombineSearch();
    }
    protected void gv_ChargeByUserReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_ChargeByUserReport.PageIndex = e.NewPageIndex;
        CombineSearch();
    }
}