using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ReportRewardBoxByUser : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    String totalAmount = "";
    private void BindData()
    {
        gv_RewardByUserReport.DataSource = DAL.Sport_LoadReportDocumentsBoxByBoxKind(4);
        gv_RewardByUserReport.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { BindData(); ddl_Users.DataSource = DAL.Membership_LoadAllUsers(); ddl_Users.DataTextField = "Member_UserName"; ddl_Users.DataValueField = "Member_ID"; ddl_Users.DataBind(); }
        totalAmount = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", DAL.Sport_GetRewardBoxTotalAmount())) + " ریال ";
        //lbl_Amount.Text = totalAmount;
        //lbl_Time.Text = PersianClass.getPersianNumberStyle(BLL.GetTime());
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/ReportsList.aspx");
    }
    protected void btn_refreshReport_Click(object sender, EventArgs e)
    {
        BindData();
    }
    private void SearchReport(int boxKind)
    {
        if (pdp_StartDate.SelectedDateTime.HasValue && pdp_EndDate.SelectedDateTime.HasValue)
        {
            gv_RewardByUserReport.DataSource = DAL.Sport_GetReportDocumentsBoxByBoxKindAndDate(boxKind, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
        }
        else
        {
            gv_RewardByUserReport.DataSource = DAL.Sport_LoadReportDocumentsBoxByBoxKind(boxKind);
        }
        gv_RewardByUserReport.DataBind();
    }
    protected void btn_searchReport_Click(object sender, EventArgs e)
    {
        SearchReport(4);
        //lbl_Amount.Text = totalAmount;
        //lbl_Time.Text = PersianClass.getPersianNumberStyle(BLL.GetTime());
    }

    protected void gv_RewardByUserReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RewardByUserReport.PageIndex = e.NewPageIndex;
        SearchReport(4);
    }
}