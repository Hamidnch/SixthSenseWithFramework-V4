using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminPanel_AdminUserControl_SportRacingCalculateProminence : System.Web.UI.UserControl
{
    public String ImagePath{get{return ResolveUrl("~/Images");}}
    public String racing_InfoID = "";    
    private void GetActiveRacing()
    {
        ddl_RacingInfoID.Items.Clear();
        ddl_RacingInfoID.DataSource = DAL.Sport_LoadAllRacingForFinalVerificationByDate();
        ddl_RacingInfoID.DataTextField = "RacingInfo_ID";ddl_RacingInfoID.DataValueField = "RacingInfo_ID";
        ddl_RacingInfoID.DataBind();ddl_RacingInfoID.Items.Insert(0, new ListItem("انتخاب کنید...", "انتخاب کنید..."));
    }
    protected void Page_Load(object sender, EventArgs e)
    {if (!IsPostBack){GetActiveRacing();}}
    protected void btn_Calculate_Click(object sender, EventArgs e)
    {      
        String tracer = "";
        if (Context.User.Identity.IsAuthenticated)
        {
            lbl_Note.Visible = false;
            //string racingInfoID = ddl_RacingInfoID.SelectedValue;
            tracer += "start,";
            racing_InfoID = ddl_RacingInfoID.SelectedValue;
            tracer += "1.getSelectedValue,";
            if (racing_InfoID == "انتخاب کنید...")
            {
                ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.GetType(), "notSelect", "alert('شناسه مسابقه موردنظر را انتخاب نمائید');", true);
                ddl_RacingInfoID.Focus();
                tracer += "2.don't Selected from dropdown,";
                return;
            }
            String description = DAL.Sport_GetRacingDescription(racing_InfoID);
            tracer += "3.Sport_IsNotEnteredRacingGamesResults,";           
            if (DAL.Sport_IsNotEnteredRacingGamesResults(racing_InfoID))
            {
                ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.GetType(), "notEnteredResult", "alert('نتایج بازیهای این مسابقه بطور کامل وارد نشده است');", true);
                tracer += "4.Not Enter Result,";
                return;
            }
            else
                if (DAL.Sport_GetFormsCountForFinalVerificationByRacingInfoID(racing_InfoID) < 1)
                {
                    ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.GetType(), "lessFormsCount", "alert('هیچ فرمی برای این مسابقه پر نشده است');", true);
                    tracer += "5. forms not found,";
                    return;
                }
            else
            if (description != "محاسبه شده")
            {
                ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.GetType(), "notCalculate", "alert('مسابقه موردنظر هنوز بطور اتوماتیک محاسبه نگردیده تا مبلغی بابت فرمهایش از صندوق کاربر کسر گردد');", true);               
                ddl_RacingInfoID.Focus();
                tracer += "6.NotCalculateRacing,";
                return;
            }
            else
            {
                try
                {
                    //لود تمامی فرمهای مسابقه که وضعیت واریز در صندوق دارند
                    DataSet ds_FormSettledAmount = DAL.Sport_GetAllFormsSettledAmount(racing_InfoID);
                    tracer += "7. formSettleAmount,";
                    for (int i = 0; i < ds_FormSettledAmount.Tables[0].Rows.Count; i++)
                    {                        
                        String formIDSelected = ds_FormSettledAmount.Tables[0].Rows[i]["Form_ID"].ToString();
                        tracer += "8.formIDSelected for " + i.ToString() + " time,";
                        //لود تمام بازیهای مربوط به فرم جاری
                        DataSet ds_FormGames = DAL.Sport_GetFormGamesInProminencesTempByRacingInfoID(racing_InfoID, formIDSelected);
                        tracer += "9.formGames for " + i.ToString() + " time,";
                        //ثبت امتیاز نهائی بازیهای فرم
                        for (int j = 0; j < ds_FormGames.Tables[0].Rows.Count; j++)
                        {
                            DAL.Sport_UpdateUltimateProminences(formIDSelected, int.Parse(ds_FormGames.Tables[0].Rows[j]["Promin_GameID"].ToString()), int.Parse(ds_FormGames.Tables[0].Rows[j]["Form_Prominence"].ToString()));
                            tracer += "10.UpdateUltimateProminence in row '" + j + "' - for " + i.ToString() + " time,";
                        }
                        DAL.Sport_UpdateMinusProminencesToZero(formIDSelected);
                    }

                    ////لود تمام فرمهای مسابقه به ترتیب آخرین زمان ویرایش
                    //DataSet ds_FormPromin = DAL.Sport_GetFormsInProminencesTempByRacingInfoID(racingInfoID);//"ir106-548e75bc9"
                    ////حلقه فرمهای فعال
                    //for (int i = 0; i < ds_FormPromin.Tables[0].Rows.Count; i++)
                    //{
                    //    string formID = ds_FormPromin.Tables[0].Rows[i]["Promin_FormID"].ToString();
                    //    string description = DAL.Sport_GetFormDescription(formID);
                    //    if (description != "واريز در صندوق" && description != "دريافت جايزه")
                    //    {
                    //        //چک برای فعال بودن فرم
                    //        int userID = DAL.Sport_GetOwnerForm(formID);
                    //        int userChargeInventoryAmount = DAL.Sport_GetChargeInventoryByUserID(userID);
                    //        int formAmount = int.Parse(ds_FormPromin.Tables[0].Rows[i]["Promin_FormAmount"].ToString());
                    //        DataSet ds_FormGames = DAL.Sport_GetFormGamesInProminencesTempByRacingInfoID(racingInfoID, formID);
                    //        if (userChargeInventoryAmount >= formAmount)
                    //        {
                    //            //ثبت امتیاز نهائی بازیهای فرم
                    //            for (int j = 0; j < ds_FormGames.Tables[0].Rows.Count; j++)
                    //            {
                    //                DAL.Sport_UpdateUltimateProminences(ds_FormGames.Tables[0].Rows[j]["Promin_FormID"].ToString(), int.Parse(ds_FormGames.Tables[0].Rows[j]["Promin_GameID"].ToString()), int.Parse(ds_FormGames.Tables[0].Rows[j]["Form_Prominence"].ToString()));
                    //            }

                    //            DAL.(BLL.GetIranDateTime(), userID, formAmount, racingInfoID, formID, "");
                    //            //کسر از صندوق
                    //            //اصلاح توضیح فرم به واریز در صندوق
                    //        }
                    //        else
                    //        {
                    //            DAL.Sport_UpdateFormDescription(formID); //کمبود موجودی
                    //        }
                    //    }
                    //}
                    fld_wins.Visible = true;
                    fld_racingInfo.Visible = true;
                    int sumFormsAmount = DAL.Sport_GetSumFormsAmountByRacingInfoID(racing_InfoID);//جمع مبلغ فرمهای یک مسابقه که به ازای آنها از صندوق کاربر کسر شده
                    tracer += "11.sumFormAmount,";
                    // ds_Forms = DAL.DAL.Sport_GetFormsInfoForUltimateByRacingInfoID(racing_InfoID, true);
                    gv_RacingForms.DataSource = DAL.Sport_GetFormsInfoForUltimateByRacingInfoID(racing_InfoID, true);
                    gv_RacingForms.DataBind();
                    tracer += "12.RacingForms Bind,";
                    this.gv_RacingFirstWin.DataSource = DAL.Sport_GetFirstWinForms(racing_InfoID);
                    this.gv_RacingFirstWin.DataBind();
                    tracer += "13.RacingFirstWin Bind,";
                    this.gv_RacingSecondWin.DataSource = DAL.Sport_GetSecondWinForms(racing_InfoID);
                    this.gv_RacingSecondWin.DataBind();
                    tracer += "14.RacingSecondWin Bind,";
                    RewardPercent rewardPercent = new RewardPercent();
                    float rewardForFirstWin = sumFormsAmount * rewardPercent.RewardForFirstWin;//نفرات اول
                    float rewardForSecondWin = sumFormsAmount * rewardPercent.RewardForSecondWin;//نفرات دوم
                    float rewardForGovernment = sumFormsAmount * rewardPercent.RewardForGovernment;//دولت
                    float rewardForCharitable = sumFormsAmount * rewardPercent.RewardForCharitable;//موسسه خیریه
                    float rewardForSite = sumFormsAmount * rewardPercent.RewardForSite;//سایت

                    int firstCount = gv_RacingFirstWin.Rows.Count;
                    int secondCount = gv_RacingSecondWin.Rows.Count;
                    tracer += "15.Begin Quota,";
                    lb_RacingTitle.Text = "برندگان مسابقه : " + racing_InfoID;
                    lbl_Sum.Text = "مبلغ کل فرمهای مسابقه: " + sumFormsAmount.ToString();
                    lbl_rewardForFirstWin.Text = "جایزه نفرات اول: " + PersianClass.getPersianNumberStyle(string.Format("{0:n0}", rewardForFirstWin)) + " ریال ";
                    lbl_rewardForSecondWin.Text = "جایزه نفرات دوم: " + PersianClass.getPersianNumberStyle(string.Format("{0:n0}", rewardForSecondWin)) + " ریال ";
                    lbl_perFirstWin.Text = "جایزه هر نفر اول: " + (firstCount == 0 ? "0" : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", (Math.Round((float)rewardForFirstWin / firstCount))))) + " ریال ";
                    lbl_perSecondWin.Text = "جایزه هر نفر دوم: " + (secondCount == 0 ? "0" : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", (Math.Round((float)rewardForSecondWin / secondCount))))) + " ریال ";
                    lbl_rewardForGovernment.Text = "سهمیه دولتی : " + PersianClass.getPersianNumberStyle(string.Format("{0:n0}", rewardForGovernment)) + " ریال ";
                    lbl_rewardForCharitable.Text = "سهمیه موسسه خیریه : " + PersianClass.getPersianNumberStyle(string.Format("{0:n0}", rewardForCharitable)) + " ریال ";
                    lbl_rewardForSite.Text = "حق سایت : " + PersianClass.getPersianNumberStyle(string.Format("{0:n0}", rewardForSite)) + " ریال ";
                    tracer += "16.End Quota,";
                    //DocKind = 0 = سند برای واریزی از طریق مسابقه
                    DAL.Sport_AddAmountToSiteBox(racing_InfoID, rewardForSite); //افزودن مبلغ به صندوق سایت
                    tracer += "17.AddAmountToSiteBox,";
                    DAL.Sport_AddAmountToGovernmentBox(racing_InfoID, rewardForGovernment); //افزودن مبلغ به صندوق دولت
                    tracer += "18.AddAmountToGovernmentBox,";
                    DAL.Sport_AddAmountToCharitableBox(racing_InfoID, rewardForCharitable); //افزودن مبلغ به صندوق عام المنفعه
                    tracer += "19.AddAmountToCharitableBox,";
                    DAL.Sport_InsertRewardQuota(racing_InfoID, rewardForCharitable, rewardForGovernment, rewardForSite, "ثبت اولیه سهمیه");
                    tracer += "20.InsertRewardQuota,";

                    float siteTotalAmount = (float)DAL.Sport_GetSiteBoxTotalAmount();
                    tracer += "21.GetSiteTotalAmount,";
                    float governTotalAmount = (float)DAL.Sport_GetGovernmentBoxTotalAmount();
                    tracer += "22.GetGovernTotalAmount,";
                    float charitableTotalAmount = (float)DAL.Sport_GetCharitableBoxTotalAmount();
                    tracer += "23.GetCharitableTotalAmount,";

                    DAL.Sport_InsertIntoDocumentsBox(1, 0, 0, "مسابقه شماره " + racing_InfoID, rewardForSite, 0, siteTotalAmount, "واریز از طریق مسابقه");
                    tracer += "24.InsertIntoDocumentBox Site,";
                    DAL.Sport_InsertIntoDocumentsBox(2, 0, 0, "مسابقه شماره " + racing_InfoID, rewardForGovernment, 0, governTotalAmount, "واریز از طریق مسابقه");
                    tracer += "25.InsertIntoDocumentBox Govern,";
                    DAL.Sport_InsertIntoDocumentsBox(3, 0, 0, "مسابقه شماره " + racing_InfoID, rewardForCharitable, 0, charitableTotalAmount, "واریز از طریق مسابقه");
                    tracer += "26.InsertIntoDocumentBox Charitble,";
                    DAL.Sport_InsertRacingWinsStatistic(racing_InfoID, firstCount, secondCount, rewardForFirstWin, rewardForSecondWin, sumFormsAmount, BLL.GetIranDateTime(), "");
                    tracer += "27.InsertRacingWinsStatistics,";
                    DAL.Sport_DeleteRacingWinsStatusByRacingInfoID(racing_InfoID);
                    tracer += "28.DeleteRacingWinStatus,";
                    if (gv_RacingFirstWin.Rows.Count > 0)
                    {
                        //جایزه برای هر نفر اول
                        double rewardForEachFirstWin = (firstCount == 0 ? 0 : Math.Round(rewardForFirstWin / firstCount));
                        foreach (GridViewRow row in gv_RacingFirstWin.Rows)
                        {
                            Label lbl_UserName1 = (Label)gv_RacingFirstWin.Rows[row.RowIndex].Cells[2].FindControl("lbl_FirstUserName");
                            tracer += "29.FirstUserName,";
                            int userID = DAL.Membership_GetUserIDByUserName(lbl_UserName1.Text);
                            Label lbl_FirstFormID = (Label)gv_RacingFirstWin.Rows[row.RowIndex].Cells[1].FindControl("lbl_FirstFormID");
                            string formID = lbl_FirstFormID.Text;
                            tracer += "30.FirstFormID,";

                            Label lbl_FirstFormProminence = (Label)gv_RacingFirstWin.Rows[row.RowIndex].Cells[3].FindControl("lbl_FirstFormProminence");
                            int formProminence = int.Parse(lbl_FirstFormProminence.Text);
                            tracer += "31.FirstFormProminence,";
                            DAL.Sport_InsertRacingWinsStatus(userID, racing_InfoID, formID, formProminence, (float)rewardForEachFirstWin, "نفر اول");
                            tracer += "32.InsertRacingWinStatus First,";
                            //افزودن مبلغ به صندوق جایزه
                            if (DAL.Sport_GetRewardIncreaseDescription(formID) != "ثبت در صندوق جایزه")
                            {
                                tracer += "33.Before AddRewardAmountToRewardBox First,";
                                //تبت دریافت جایزه
                                DAL.Sport_AddRewardAmountToRewardBox(BLL.GetIranDateTime(), userID, (float)rewardForEachFirstWin, formID);
                                tracer += "34.After AddRewardAmountToRewardBox First,";
                            }
                            //بروزرسانی جدول اطلاعات جایزه
                            DAL.Sport_InsertRewardIncrease(BLL.GetIranDateTime(), userID, (float)rewardForEachFirstWin, racing_InfoID, formID, "ثبت در صندوق جایزه");
                            tracer += "35.After InsertRewardIncrease First,";
                        }
                    }

                    if (gv_RacingSecondWin.Rows.Count > 0)
                    {
                        //جایزه برای هر نفر دوم
                        double rewardForEachSecondWin = (secondCount == 0 ? 0 : Math.Round(rewardForSecondWin / secondCount));
                        foreach (GridViewRow row in gv_RacingSecondWin.Rows)
                        {
                            Label lbl_UserName2 = (Label)gv_RacingSecondWin.Rows[row.RowIndex].Cells[2].FindControl("lbl_SecondUserName");
                            int userID = DAL.Membership_GetUserIDByUserName(lbl_UserName2.Text);
                            tracer += "36.SecondUserName,";
                            Label lbl_SecondFormID = (Label)gv_RacingSecondWin.Rows[row.RowIndex].Cells[1].FindControl("lbl_SecondFormID");
                            string formID = lbl_SecondFormID.Text;
                            tracer += "37.SecondFormID,";
                            Label lbl_SecondFormProminence = (Label)gv_RacingSecondWin.Rows[row.RowIndex].Cells[3].FindControl("lbl_SecondFormProminence");
                            int formProminence = int.Parse(lbl_SecondFormProminence.Text);
                            tracer += "38.SecondFormProminence,";
                            DAL.Sport_InsertRacingWinsStatus(userID, racing_InfoID, formID, formProminence, (float)rewardForEachSecondWin, "نفر دوم");
                            tracer += "39.InsertRacingWinStatus Second,";
                            //افزودن مبلغ به صندوق جایزه
                            if (DAL.Sport_GetRewardIncreaseDescription(formID) != "ثبت در صندوق جایزه")
                            {
                                tracer += "40.Before AddRewardAmountToRewardBox Second,";
                                //تبت دریافت جایزه
                                DAL.Sport_AddRewardAmountToRewardBox(BLL.GetIranDateTime(), userID, (float)rewardForEachSecondWin, formID);
                                tracer += "41.After AddRewardAmountToRewardBox Second,";
                            }
                            //بروزرسانی جدول اطلاعات جایزه                                    
                            DAL.Sport_InsertRewardIncrease(BLL.GetIranDateTime(), userID, (float)rewardForEachSecondWin, racing_InfoID, formID, "ثبت در صندوق جایزه");
                            tracer += "42.After InsertRewardIncrease Second,";
                        }
                    }
                    float rewardTotalAmount = (float)DAL.Sport_GetRewardBoxTotalAmount();
                    tracer += "43.rewardTotalAmount,";
                    DAL.Sport_InsertIntoDocumentsBox(4, 0, 0, "مسابقه شماره " + racing_InfoID, (rewardForFirstWin + rewardForSecondWin), 0, rewardTotalAmount, "واریز از طریق مسابقه");
                    tracer += "44.Sport_InsertIntoDocumentsBox,";
                    //تغییر وضعیت مسابقه به غیرفعال
                    DAL.Sport_DisableRacingByRacingInfoID(racing_InfoID);
                    tracer += "45.Sport_DisableRacingByRacingInfoID,";
                    //غیرفعال کردن فرمهای مربوط به این مسابقه
                    DAL.Sport_DisableFormsByRacingInfoID(racing_InfoID);
                    tracer += "46.Sport_DisableFormsByRacingInfoID,";
                    GetActiveRacing();
                    fld_RacingResult.Visible = false;
                    btn_Calculate.Enabled = false;
                    tracer += "47.End Of Racing Calculate,";
                    BLL.SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", "موفقیت در محاسبه مسابقه" , "محاسبه موفقیت آمیز : " + racing_InfoID + "\n" + PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H") + "\n" + tracer, true, "Ok");
                }
                catch(Exception ex)
                {
                    BLL.SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", "مشکل در محاسبه مسابقه: " + racing_InfoID, ex.Message + "\n" + PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H") + "\n" + tracer , true, "Ok");
                    Utilities.ErrorLogger.ReportLastError();
                    ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.GetType(), "ErrorCalculateRacing", "alert('خطای سیستمی رخ داده لطفا به مدیر سیستم اطلاع دهید');", true);
                    return;
                }
            }
        }
    }
    protected void ddl_RacingInfoID_SelectedIndexChanged(object sender, EventArgs e)
    {
        btn_Calculate.Enabled = true;
        string racingInfoID = ddl_RacingInfoID.SelectedValue;        
        if (racingInfoID == "انتخاب کنید...")
        {
            lbl_Note.Visible = false;
            fld_RacingResult.Visible = false;
            ddl_RacingInfoID.Focus();
            return;
        }
        else
        {
            lbl_Note.Visible = true;
            lbl_RaceTitle.Text = DAL.Sport_GetRaceTitleByRacingInfoID(racingInfoID);
            gv_RacingForms.DataSource     = null;
            gv_RacingFirstWin.DataSource  = null;
            gv_RacingSecondWin.DataSource = null;
            gv_RacingResult.DataSource    = null;

            fld_wins.Visible         = false;
            fld_racingInfo.Visible   = false;
            fld_RacingResult.Visible = true;

            gv_RacingResult.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(racingInfoID);
            gv_RacingResult.DataBind();
        }
    }

    protected void gv_RacingResult_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gv_RacingResult.EditIndex = e.NewEditIndex;
        gv_RacingResult.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(ddl_RacingInfoID.SelectedValue);
        gv_RacingResult.DataBind();
    }
    protected void gv_RacingResult_CancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gv_RacingResult.EditIndex = -1;
        gv_RacingResult.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(ddl_RacingInfoID.SelectedValue);
        gv_RacingResult.DataBind();
    }
    protected void gv_RacingResult_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        String RacingInfo_ID = Convert.ToString(gv_RacingResult.DataKeys[0].Value);
        //String racingInfoID = ((Label)CurrentGridView.Rows[e.RowIndex].FindControl("lbl_RacingInfoID")).Text;
        int gameID = int.Parse(((Label)gv_RacingResult.Rows[e.RowIndex].FindControl("lbl_GameID")).Text);
        //decimal gameResult = decimal.Parse(((Label)CurrentGridView.Rows[e.RowIndex].FindControl("ddl_GameResult")).SelectedValue);
        String hostTeam = Convert.ToString(((Label)gv_RacingResult.Rows[e.RowIndex].FindControl("lbl_HostTeam")).Text);
        String guestTeam = Convert.ToString(((Label)gv_RacingResult.Rows[e.RowIndex].FindControl("lbl_GuestTeam")).Text);
        String gameStatus = Convert.ToString(((Label)gv_RacingResult.Rows[e.RowIndex].FindControl("lbl_GameStatus")).Text);
        int hostGoal = int.Parse(((TextBox)gv_RacingResult.Rows[e.RowIndex].FindControl("txt_HostResult")).Text);
        int guestGoal = int.Parse(((TextBox)gv_RacingResult.Rows[e.RowIndex].FindControl("txt_guestResult")).Text);
        //if ((((TextBox)CurrentGridView.Rows[e.RowIndex].FindControl("txt_HostResult")).Text == "" ||
        //                ((TextBox)CurrentGridView.Rows[e.RowIndex].FindControl("txt_guestResult")).Text == ""))
        //{
        //    String alert = "لطفا نتیجه میزبان و میهمان را وارد نمائید";
        //    Page.ClientScript.RegisterClientScriptBlock(GetType(), "Message", "<script LANGUAGE='javascript'>alert('" + alert + "');</script>");

        //}
        int gameResult = -1;
        if (hostGoal == guestGoal)
        {
            gameResult = 1;
            gameStatus = "مساوی";
        }
        if (hostGoal > guestGoal)
        {
            gameResult = 0;
            gameStatus = "برد " + hostTeam;
        }
        if (guestGoal > hostGoal)
        {
            gameResult = 2;
            gameStatus = "برد " + guestTeam;
        }
        if ( hostGoal <= -1 || guestGoal <= -1 )
        {
            gameResult = -1;
            gameStatus = "نامشخص";
        }
        if (hostGoal == -5 && guestGoal == -5)
        {
            gameResult = -5;
            gameStatus = "حذف بازی";
        }
        try
        {
            DAL.Sport_InsertRacingGamesResult(RacingInfo_ID, gameID, gameResult, hostGoal, guestGoal, gameStatus);
            //  gv_RacingWithInfo.DataBind();
            //محل ثبت نتیجه بازیهای فرم و ثبت امتیاز بصورت موقت در جدول موقت
            DataSet ds = DAL.Sport_GetFormsByRacingInfoID(RacingInfo_ID);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                DAL.Sport_CalculateFormsProminence(RacingInfo_ID, row["FormInfo_FormID"].ToString(), gameID);
            }
            //Page.ClientScript.RegisterClientScriptBlock(GetType(), "Message", "<script LANGUAGE='javascript'>alert(' بروزرسانی با موفقیت انجام شد ');</script>");
        }
        catch (System.Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this.UpdatePanel2, this.GetType(), "UpdateResult", "alert(' بروز خطا " + ex.Message  + "');", true);
        }
        gv_RacingResult.EditIndex = -1;
        gv_RacingResult.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(ddl_RacingInfoID.SelectedValue);
        gv_RacingResult.DataBind();
    }
    protected void gv_RacingForms_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RacingForms.PageIndex = e.NewPageIndex;
        gv_RacingForms.DataSource = DAL.Sport_GetFormsInfoForUltimateByRacingInfoID(racing_InfoID, false);
        gv_RacingForms.DataBind();
    }
    protected void gv_RacingFirstWin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RacingFirstWin.PageIndex = e.NewPageIndex;
        gv_RacingFirstWin.DataSource = DAL.Sport_GetFirstWinForms(racing_InfoID);
        gv_RacingFirstWin.DataBind();  
    }
    protected void gv_RacingSecondWin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RacingSecondWin.PageIndex = e.NewPageIndex;
        gv_RacingSecondWin.DataSource = DAL.Sport_GetSecondWinForms(racing_InfoID);
        gv_RacingSecondWin.DataBind();  
    }
}