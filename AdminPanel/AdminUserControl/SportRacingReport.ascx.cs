using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_SportRacingReport : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    string gvUniqueID = System.String.Empty;
    int gvNewPageIndex = 0;
    int gvEditIndex = -1;
    protected override void OnInit(EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "blockUI", "setBlock();", true);
        base.OnPreRender(e);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Page_LoadComplate(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "unBlock", "$.unblockUI();", true);
    }
    protected void gv_RacingWithInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "blockUI", "setBlock();", true);
        GridView owner = (GridView)sender;
        GridViewRow oGridViewRow = e.Row;

        if (oGridViewRow.DataItem == null)
            return;
        GridView oGridView = (GridView)e.Row.FindControl("gv_RacingForm");
        String RacingInfo_ID = Convert.ToString(owner.DataKeys[e.Row.RowIndex].Value);
        if (oGridView.UniqueID == gvUniqueID)
        {
            oGridView.PageIndex = gvNewPageIndex;
            oGridView.EditIndex = gvEditIndex;
            Page.ClientScript.RegisterStartupScript(GetType(), "Expand1", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + RacingInfo_ID + "','one');</script>");
        }
        oGridView.DataSource = DAL.Sport_GetFormsByRacingInfoID(RacingInfo_ID);
        oGridView.DataBind();
    }
    protected void gv_RacingForm_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView owner = (GridView)sender;
        GridViewRow oGridViewRow = e.Row;

        if (oGridViewRow.DataItem == null)
            return;
        GridView oGridView = (GridView)e.Row.FindControl("gv_Racing");
        String Form_ID = ((Label)e.Row.FindControl("lbl_FormID")).Text;//Convert.ToString(owner.DataKeys[e.Row.RowIndex].Value);
        if (oGridView.UniqueID == gvUniqueID)
        {
            oGridView.PageIndex = gvNewPageIndex;
            oGridView.EditIndex = gvEditIndex;
            Page.ClientScript.RegisterStartupScript(GetType(), "Expand1", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + Form_ID + "','one');</script>");
        }
        oGridView.DataSource = DAL.Sport_LoadAllGamesByFormInfoID(Form_ID);
        oGridView.DataBind();
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "UnBlock", "$.unblockUI();", true);
    }
    protected void gv_RacingWithInfo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            var id = e.CommandArgument.ToString();
            int sumFormsAmount = DAL.Sport_GetSumFormsAmountByRacingInfoID(id);
            
            this.gv_RacingFirstWin.DataSource = DAL.Sport_GetFirstWinForms(id);
            this.gv_RacingFirstWin.DataBind();
            this.gv_RacingSecondWin.DataSource = DAL.Sport_GetSecondWinForms(id);
            this.gv_RacingSecondWin.DataBind();

            double rewardForFirstWin = sumFormsAmount * 0.65;
            double rewardForSecondWin = sumFormsAmount * 0.35;
            int firstCount = gv_RacingFirstWin.Rows.Count;
            int secondtCount = gv_RacingSecondWin.Rows.Count;

            lb_RacingTitle.Text = "برندگان مسابقه : " + id;
            lbl_Sum.Text = "مبلغ کل فرمهای مسابقه: " + sumFormsAmount.ToString();
            lbl_rewardForFirstWin.Text = "جایزه نفرات اول: " + rewardForFirstWin.ToString();
            lbl_rewardForSecondWin.Text = "جایزه نفرات دوم: " + rewardForSecondWin.ToString();
            lbl_perFirstWin.Text = "جایزه هر نفر اول: " +  (Math.Round((double)rewardForFirstWin / firstCount)).ToString();
            lbl_perSecondWin.Text = "جایزه هر نفر دوم: " + (secondtCount == 0? "0": (Math.Round((double)rewardForSecondWin / secondtCount)).ToString());

            //UpdatePanel4.Update();
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "showDialog", " $('#dialog-form').dialog('open');", true);
        }
    }
}