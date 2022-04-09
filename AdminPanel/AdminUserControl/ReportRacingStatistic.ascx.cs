using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ReportRacingStatistic : System.Web.UI.UserControl
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
        }
    }    
    protected void ddl_AllRacing_SelectedIndexChanged(object sender, EventArgs e)
    {
        string racingInfoID = ddl_AllRacing.SelectedValue;
        lbl_RaceTitle.Text = DAL.Sport_GetRaceTitleByRacingInfoID(racingInfoID);
        int formsCount = DAL.Sport_GetCountActiveFormsByRacingInfoID(racingInfoID);
        lbl_RacingActiveFormsCount.Text = PersianClass.getPersianNumberStyle(formsCount.ToString()) + " عدد";

        string lastDate = DAL.Sport_GetLastGameDateByRacingInfoID(racingInfoID);
        lbl_RacingLastDate.Text = PersianClass.getPersiaDate(lastDate, "D", false) + "     معادل با تاریخ میلادی:   " + DateTime.Parse(lastDate).ToShortDateString();

        int FormAmount, FirstCount, SecondCount;
        float FirstReward, SecondReward;
        DAL.Sport_GetRacingStatisticByRacingInfoID(racingInfoID, out FormAmount, out FirstCount, out FirstReward,
            out SecondCount, out SecondReward);
        lbl_ActiveFormsAmount.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", FormAmount)) + " ریال ";
        lbl_FirstCount.Text = PersianClass.getPersianNumberStyle(FirstCount.ToString()) + " نفر ";
        lbl_RewardForEachFirst.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",Math.Round(FirstReward / FirstCount))) + " ریال ";
        lbl_RewardFirstSum.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",FirstReward)) + " ریال ";

        lbl_RacingAllFormCount.Text = PersianClass.getPersianNumberStyle(string.Format("{0}", DAL.Sport_GetAllFormsCountByRacingInfoID(racingInfoID))) + " عدد ";

        lbl_SecondCount.Text = PersianClass.getPersianNumberStyle(SecondCount.ToString()) + " نفر ";
        lbl_RewardForEachSecond.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",Math.Round(SecondReward / SecondCount))) + " ریال ";
        lbl_RewardSecondSum.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",SecondReward)) + " ریال ";

        lbl_RacingRewardTotalAmount.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",(FirstReward + SecondReward))) + " ریال ";

        float siteReward, governReward, charitableReward;
        DAL.Sport_GetRewardQuotaByRacingInfoID(racingInfoID, out siteReward, out governReward, out charitableReward);
        lbl_RewardSite.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", siteReward)) + " ریال ";
        lbl_RewardGovernment.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",governReward)) + " ریال ";
        lbl_RewardCharitable.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",charitableReward)) + " ریال ";
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/ReportsList.aspx");
    }
}