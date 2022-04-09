using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ReportCharitableBox : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    String totalAmount = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { BindData(); }
        totalAmount = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", DAL.Sport_GetCharitableBoxTotalAmount())) + " ریال ";
        lbl_Amount.Text = totalAmount;
        lbl_Time.Text = PersianClass.getPersianNumberStyle(BLL.GetTime());
    }
    private void BindData()
    {
        gv_charitableReport.DataSource = DAL.Sport_LoadReportDocumentsBoxByBoxKind(3);
        gv_charitableReport.DataBind();
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
            gv_charitableReport.DataSource = DAL.Sport_GetReportDocumentsBoxByBoxKindAndDate(boxKind, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
        }
        else
        {
            gv_charitableReport.DataSource = DAL.Sport_LoadReportDocumentsBoxByBoxKind(boxKind);
        }
        gv_charitableReport.DataBind();
    }
    protected void btn_searchReport_Click(object sender, EventArgs e)
    {
        SearchReport(3);
    }
    protected void gv_charitableReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {        
        gv_charitableReport.PageIndex = e.NewPageIndex;
        SearchReport(3);
    }
}