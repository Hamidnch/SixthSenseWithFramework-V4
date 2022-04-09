using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_ReportRacingActiveInventoryAmount : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void GetActiveRacing(DropDownList ddl)
    {
        ddl.Items.Clear();
        ddl.DataSource = DAL.Sport_LoadAllRacingForReport();
        ddl.DataValueField = "RacingInfo_ID";
        ddl.DataTextField = "RacingInfo_ID";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("انتخاب کنید...", "-1"));
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetActiveRacing(ddl_AllRacing);
            lbl_RacingDate.Text = PersianClass.getPersiaDate(DateTime.Now, "S", true);
            gv_RacingActiveInventoryAmount.Visible = false;
        }
    }
    protected void ddl_AllRacing_SelectedIndexChanged(object sender, EventArgs e)
    {
        string racingInfoID = ddl_AllRacing.SelectedValue;
        lbl_RaceTitle.Text = DAL.Sport_GetRaceTitleByRacingInfoID(racingInfoID);

        lbl_RacingFormsAmount.Text = string.Format("{0:n0}", DAL.Sport_GetSumFormsAmountByRacingInfoID(racingInfoID));
        
        lbl_RacingDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true);

        gv_RacingActiveInventoryAmount.Visible = false;        
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/ReportsList.aspx");
    }
    protected void gv_RacingActiveInventoryAmount_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RacingActiveInventoryAmount.PageIndex = e.NewPageIndex;
        string racingInfoID = ddl_AllRacing.SelectedValue;        
        gv_RacingActiveInventoryAmount.DataSource = DAL.Sport_GetFormsByRacingInfoIDForReport(racingInfoID);
        gv_RacingActiveInventoryAmount.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string racingInfoID = ddl_AllRacing.SelectedValue;
        gv_RacingActiveInventoryAmount.DataSource = DAL.Sport_GetFormsByRacingInfoIDForReport(racingInfoID);
        gv_RacingActiveInventoryAmount.DataBind();
        gv_RacingActiveInventoryAmount.Visible = true;
    }
}