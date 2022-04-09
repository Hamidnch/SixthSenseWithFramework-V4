using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class AdminPanel_AdminUserControl_SportRacingCreation : System.Web.UI.UserControl
{
    public String ImagePath {get{return ResolveUrl("~/Images");}}
    int rowIndex;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // SetInitialRow();
            ddl_RacingTitle.DataSource = DAL.LoadAllRaceTitles();
            ddl_RacingTitle.DataTextField = "Race_Title";
            ddl_RacingTitle.DataValueField = "Race_ID";
            ddl_RacingTitle.DataBind();
            ddl_RacingCountry.DataSource = DAL.LoadAllCountriesHelper();
            ddl_RacingCountry.DataValueField = "Country_ID";
            ddl_RacingCountry.DataTextField = "Country_Name";
            ddl_RacingCountry.DataBind();
            Session["myTable"] = null;
            rowIndex = 0;
        }
    }
    private void ClearContentControls()
    {
        ddl_RacingTitle.Enabled = true;
        ddl_RacingTitle.DataSource = DAL.LoadAllRaceTitles();
        ddl_RacingTitle.DataTextField = "Race_Title";
        ddl_RacingTitle.DataValueField = "Race_ID";
        ddl_RacingTitle.DataBind();
        ddl_RacingTitle.SelectedIndex = 0;

        ddl_RacingCountry.Enabled = true;
        ddl_RacingCountry.DataSource = DAL.LoadAllCountriesHelper();
        ddl_RacingCountry.DataValueField = "Country_ID";
        ddl_RacingCountry.DataTextField = "Country_Name";
        ddl_RacingCountry.DataBind();
        ddl_RacingCountry.SelectedIndex = 0;

        Session["myTable"] = null;
        DataTable dt = (DataTable)Session["myTable"];
        gv_RacingGames.DataSource = dt;
        gv_RacingGames.DataBind();

        txt_RacingDetails.Text = string.Empty;
        txt_StartRespiteTime.Text = string.Empty;
        txt_EndRespiteTime.Text = string.Empty;
        pdp_RacingStartDate.PersianDateString = string.Empty;
        pdp_RacingEndDate.PersianDateString = string.Empty;
        pdp_StartRespiteDate.PersianDateString = string.Empty;
        pdp_EndRespiteDate.PersianDateString = string.Empty;
    }
    private Boolean DateValidation()
    {
        DateTime currentDate = BLL.GetIranDateTime();
        if (pdp_RacingStartDate.SelectedDateTime.Value.Date < currentDate.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessStartOfCurrDate", "$.unblockUI();alert('تاریخ شروع مسابقه باید از تاریخ جاری بزرگتر باشد')", true);
            return false;
        }else
        if (pdp_RacingEndDate.SelectedDateTime.Value.Date < currentDate.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessEndOfCurrDate", "$.unblockUI();alert('تاریخ پایان مسابقه باید از تاریخ جاری بزرگتر باشد')", true);            
            return false;
        }else
        if ((pdp_StartRespiteDate.SelectedDateTime.Value.Date < currentDate.Date) || pdp_EndRespiteDate.SelectedDateTime.Value.Date < currentDate.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessStartOfCurrDate", "$.unblockUI();alert('مهلت شروع مسابقه باید بزرگتر یا مساوی تاریخ جاری و مهلت پایان بایداز تاریخ جاری بزرگتر باشد')", true);
            return false;
        }else
        if (pdp_RacingStartDate.SelectedDateTime.Value.Date > pdp_RacingEndDate.SelectedDateTime.Value.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessStartOfEndDate", "$.unblockUI();alert('تاریخ پایان مسابقه باید از تاریخ شروع آن بزرگتر باشد')", true);
            return false;
        }else
        if (pdp_StartRespiteDate.SelectedDateTime.Value.Date > pdp_EndRespiteDate.SelectedDateTime.Value.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessStartOfEndRespite", "$.unblockUI();alert('مهلت پایان پیش بینی باید از مهلت شروع بزرگتر باشد')", true);
            return false;
        }else
        if (pdp_StartRespiteDate.SelectedDateTime.Value.Date >= pdp_RacingStartDate.SelectedDateTime.Value.Date || pdp_EndRespiteDate.SelectedDateTime.Value.Date >= pdp_RacingStartDate.SelectedDateTime.Value.Date
            || pdp_EndRespiteDate.SelectedDateTime.Value.Date >= pdp_RacingStartDate.SelectedDateTime.Value.Date || pdp_EndRespiteDate.SelectedDateTime.Value.Date >= pdp_RacingEndDate.SelectedDateTime.Value.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessRespiteOfDate", "$.unblockUI();alert('مهلت شروع و پایان پیش بینی بایستی از تاریخ شروع و پایان مسابقه کوچکتر باشد')", true);
            return false;
        }else
        if (pdp_GameDateSelect.SelectedDateTime.Value.Date < pdp_RacingStartDate.SelectedDateTime.Value.Date || pdp_GameDateSelect.SelectedDateTime.Value.Date > pdp_RacingEndDate.SelectedDateTime.Value.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "GameDateBetweenDate", "$.unblockUI();alert('تاریخ انجام یک بازی باید بین تاریخ شروع و پایان یا مساوی آنها تعیین  گردد')", true);
            return false;
        }else
        if (pdp_GameDateSelect.SelectedDateTime.Value.Date < pdp_StartRespiteDate.SelectedDateTime.Value.Date || pdp_GameDateSelect.SelectedDateTime.Value.Date < pdp_EndRespiteDate.SelectedDateTime.Value.Date)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "GameDateGreaterThanOfRespiteDate", "$.unblockUI();alert('تاریخ انجام یک بازی بایستی بزرگتر از تاریخ مهلت تعیین شده برای پیش بینی باشد')", true);
            return false;
        }
        return true;
    }
    protected void btn_AddNewGame_Click(object sender, EventArgs e)
    {
        //if (pdp_RacingStartDate.SelectedDateTime > pdp_RacingEndDate.SelectedDateTime)
        //{
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessEndDate", "$.unblockUI();alert('تاریخ پایان باید از تاریخ شروع بزرگتر باشد')", true);
        //    return;
        //}
        //if (pdp_StartRespiteDate.SelectedDateTime < pdp_RacingStartDate.SelectedDateTime)
        //{
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "lessRespiteDate", "$.unblockUI();alert('تاریخ مهلت مسابقه باید بزرگتر از تاریخ شروع مسابقه تعیین گردد')", true);
        //    return;
        //}
        //if (pdp_StartRespiteDate.SelectedDateTime > pdp_RacingEndDate.SelectedDateTime)
        //{
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "grRespiteDate", "$.unblockUI();alert('تاریخ مهلت مسابقه باید کوچکتر از تاریخ پایان مسابقه تعیین گردد')", true);
        //    return;
        //}
        //if (pdp_GameDateSelect.SelectedDateTime < pdp_RacingStartDate.SelectedDateTime || pdp_GameDateSelect.SelectedDateTime > pdp_RacingEndDate.SelectedDateTime)
        //{
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "GameDate", "$.unblockUI();alert('تاریخ انجام یک بازی می بایست در محدوده تاریخ شروع و پایان یک مسابقه تعیین گردد')", true);
        //    return;
        //}
        if (DateValidation())
        {
            if (Page.IsValid)
            {
                pnl_RacingInfo.Enabled = false;
                ddl_RacingTitle.Enabled = false;
                ddl_RacingCountry.Enabled = false;
            }
            else
            {
                pnl_RacingInfo.Enabled = true;
                ddl_RacingTitle.Enabled = true;
                ddl_RacingCountry.Enabled = true;
            }
            if (hdn_EqualTeam.Value == "نامساوی")
            {
                //if (DAL.Sport_IsEqualTeamCreation(hostTeamId, guestTeamId) || DAL.Sport_IsEqualTeamCreation(guestTeamId, hostTeamId))
                //{
                //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "EqualTeamCreation", "$.unblockUI();alert('یک بازی با این دو تیم در این مسابقه تعریف شده و تکرار مجاز نیست')", true);
                //   // ddl_HostSelect.Focus();
                //    return;
                //}
                try
                {
                    if (Session["myTable"] != null)
                    {
                        dt = (DataTable)Session["myTable"];
                        rowIndex = dt.Rows.Count;
                    }
                    else
                    {
                        dt = new DataTable();
                        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
                        dt.Columns.Add(new DataColumn("HostTeam", typeof(string)));
                        dt.Columns.Add(new DataColumn("GuestTeam", typeof(string)));
                        dt.Columns.Add(new DataColumn("GameDate", typeof(string)));
                        dt.Columns.Add(new DataColumn("GameDate2", typeof(DateTime)));
                        dt.Columns.Add(new DataColumn("GameTime", typeof(string)));
                        dt.Columns.Add(new DataColumn("GameLocation", typeof(string)));
                        Session["myTable"] = dt;
                        rowIndex = 0;
                    }
                    int hostTeamId = DAL.Sport_GetTeamIDByTeamName(hdn_HostSelect.Value);
                    int guestTeamId = DAL.Sport_GetTeamIDByTeamName(hdn_GuestSelect.Value);
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        int hostTeamId2 = DAL.Sport_GetTeamIDByTeamName(dt.Rows[i]["HostTeam"].ToString());
                        int guestTeamId2 = DAL.Sport_GetTeamIDByTeamName(dt.Rows[i]["GuestTeam"].ToString());
                        if ((hostTeamId == hostTeamId2) && (guestTeamId == guestTeamId2) || (hostTeamId == guestTeamId2) && (guestTeamId == hostTeamId2))
                        {
                            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "EqualTeamCreation", "$.unblockUI();alert('یک بازی با این دو تیم در این مسابقه تعریف شده و تکرار مجاز نیست')", true);
                            ddl_HostSelect.Focus();
                            return;
                        }
                    }
                    rowIndex++;
                    DataRow dr = null;
                    dr = dt.NewRow();
                    dr["RowNumber"] = rowIndex;
                    dr["HostTeam"] = hdn_HostSelect.Value;
                    dr["GuestTeam"] = hdn_GuestSelect.Value;
                    dr["GameDate"] = pdp_GameDateSelect.PersianDateString;
                    dr["GameDate2"] = pdp_GameDateSelect.SelectedDateTime.Value;
                    dr["GameTime"] = txt_GameTimeSelect.Text;
                    dr["GameLocation"] = txt_GameLocationSelect.Text;

                    dt.Rows.Add(dr);
                    Session["myTable"] = dt;

                    gv_RacingGames.DataSource = (DataTable)Session["myTable"];
                    gv_RacingGames.DataBind();
                    btn_SaveRacingGames.Visible = true;
                }
                catch
                {
                    btn_SaveRacingGames.Visible = false;
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "error", "$.unblockUI();alert('خطا در اجرای عملیات')", true);
                }
                finally
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "EqualTeamError", "$.unblockUI();alert('تیم میهمان و میزبان یکسان انتخاب شده اند')", true);
            }
        }
    }

    private String CreateRacingInfo(int countryID)
    {
        String symbol = DAL.Sport_GetSymbolByCountryID(countryID);
        int maxRow = DAL.Sport_GetMaxRowInRacingInfo();
        return symbol + maxRow + "-" + BLL.CreateRandomPasswordUsingGUID(12);
    }

    private String SaveRacingInfo(int raceID, String details,int countryID, DateTime startDate, DateTime endDate,
                    DateTime startRespiteDate, DateTime endRespiteDate, String startRespiteTime, String endRespiteTime,
                    Boolean racingActive, String racingDescription)
    {
        String racingInfo_ID = CreateRacingInfo(countryID);
        SportRacingInfo racingInfo = new SportRacingInfo();
        racingInfo.RacingInfo_ID = racingInfo_ID;
        racingInfo.RacingInfo_RaceID = raceID;
        racingInfo.RacingInfo_Details = details;
        racingInfo.RacingInfo_CountryID = countryID;
        racingInfo.RacingInfo_StartDate = startDate;
        racingInfo.RacingInfo_EndDate = endDate;
        racingInfo.RacingInfo_StartRespiteDate = startRespiteDate;
        racingInfo.RacingInfo_EndRespiteDate = endRespiteDate;
        racingInfo.RacingInfo_StartRespiteTime = startRespiteTime;
        racingInfo.RacingInfo_EndRespiteTime = endRespiteTime;
        racingInfo.RacingInfo_CreationDate = BLL.GetIranDateTime();
        racingInfo.RacingInfo_LastUpdate = BLL.GetIranDateTime();
        racingInfo.RacingInfo_Status = (ddl_RacingStatus.SelectedIndex == 0) ? "فعال" : "غیرفعال";
        racingInfo.RacingInfo_Active = racingActive;
        racingInfo.RacingInfo_Description = racingDescription;
        DAL.Sport_InsertRacingInfo(racingInfo);

        return racingInfo.RacingInfo_ID;
    }
    protected void btn_SaveRacingGames_Click(object sender, EventArgs e)
    {
        //lbl_Msg.Text = "";
        int DiagResult = int.Parse(inpHide.Value);
        if (DiagResult == 1)
        {
            if (DateValidation())
            {
                DataTable dt = (DataTable)Session["myTable"];
                if (dt == null || dt.Rows.Count <= 0)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "LessTeam", "$.unblockUI();alert('شما حداقل می بایست یک بازی وارد نمائید')", true);
                    return;
                }
                try
                {
                    Boolean racingActive = (ddl_RacingStatus.SelectedIndex == 0) ? true : false;
                    String racingInfo_ID = SaveRacingInfo(int.Parse(ddl_RacingTitle.SelectedValue), txt_RacingDetails.Text,
                            int.Parse(ddl_RacingCountry.SelectedValue), pdp_RacingStartDate.SelectedDateTime.Value,
                             pdp_RacingEndDate.SelectedDateTime.Value, pdp_StartRespiteDate.SelectedDateTime.Value,
                             pdp_EndRespiteDate.SelectedDateTime.Value, txt_StartRespiteTime.Text,
                             txt_EndRespiteTime.Text, racingActive, "ایجاد مسابقه");
                    SportRacing racing = new SportRacing();
                    int GameID = 0;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        GameID++;
                        racing.Racing_GameID = GameID;
                        racing.Racing_RacingInfoID = racingInfo_ID;
                        racing.Racing_HostTeamID = DAL.Sport_GetTeamIDByTeamName(dt.Rows[i]["HostTeam"].ToString());
                        racing.Racing_GuestTeamID = DAL.Sport_GetTeamIDByTeamName(dt.Rows[i]["GuestTeam"].ToString());
                        racing.Racing_GameDate = DateTime.Parse(dt.Rows[i]["GameDate2"].ToString());
                        racing.Racing_GameTime = dt.Rows[i]["GameTime"].ToString();
                        racing.Racing_GameLocation = dt.Rows[i]["GameLocation"].ToString();
                        racing.Racing_GameResult = -1;
                        racing.Racing_GameHostGoal = 0;
                        racing.Racing_GameGuestGoal = 0;
                        DAL.Sport_InsertRacing(racing);
                    }
                    hdn_RacingInfoID.Value = racingInfo_ID;
                    hdn_RaceTitle.Value = ddl_RacingTitle.SelectedItem.Text;
                    lbl_Date.InnerText = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H");
                   // lbl_Time.InnerText = BLL.GetTime();
                    String script = @"$.unblockUI();$('#dialog:ui-dialog').dialog('destroy');
                    $('#dialog-form').dialog({
                        autoOpen: false, resizable: false, height: 'auto', width: 420, direction: 'rtl',
                        show: 'slide', hide: 'clip', stack: true, position: 'center', title: 'تبریک', modal: true
                    }); $('.submit').click(function () { $('#dialog-form').dialog('close'); });
                    $('span[id$=lbl_RacingInfo_ID]').html($('input:hidden[id$=hdn_RacingInfoID]').val());
                    $('span[id$=lbl_RaceTitle]').html($('input:hidden[id$=hdn_RaceTitle]').val());
                     $.unblockUI(); $('#dialog-form').dialog('open');";
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "msgOk", script, true);
                    ClearContentControls();
                    btn_SaveRacingGames.Visible = false;
                    pnl_RacingInfo.Enabled = true;
                    ddl_RacingTitle.Enabled = true;
                    ddl_RacingCountry.Enabled = true;
                    pdp_GameDateSelect.PersianDateString = string.Empty;
                    txt_GameTimeSelect.Text = string.Empty;
                    txt_GameLocationSelect.Text = string.Empty;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "msgError", "$.unblockUI();alert('عملیات به دلیل خطای زیر متوقف گردید: " + ex.Message + "')", true);
                    //lbl_Msg.Text = "عملیات به دلیل خطای زیر متوقف گردید: " + ex.Message;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                return;
            }
        }
    }
    protected void btn_NewRacing_Click(object sender, EventArgs e)
    {
        pnl_RacingInfo.Enabled = true;
        ddl_RacingTitle.Enabled = true;
        ddl_RacingCountry.Enabled = true;
        txt_RacingDetails.Text = string.Empty;
        pdp_RacingStartDate.PersianDateString = string.Empty;
        pdp_RacingEndDate.PersianDateString = string.Empty;
        pdp_StartRespiteDate.PersianDateString = string.Empty;
        pdp_EndRespiteDate.PersianDateString = string.Empty;
        txt_StartRespiteTime.Text = string.Empty;
        txt_EndRespiteTime.Text = string.Empty;
        pdp_GameDateSelect.PersianDateString = string.Empty;
        txt_GameTimeSelect.Text = string.Empty;
        txt_GameLocationSelect.Text = string.Empty;
        ClearContentControls();
    }

    protected void lb_DelRow_Click(object sender, EventArgs e)
    {
       // lbl_Msg.Text = "";
        LinkButton lb = (LinkButton)sender;
        GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
        int rowID = gvRow.RowIndex;
        if (Session["myTable"] != null)
        {
            DataTable dt = (DataTable)Session["myTable"];
            if (dt.Rows.Count > 0)
            {
                if (gvRow.RowIndex <= dt.Rows.Count)
                {
                    //Remove the Selected Row data
                    dt.Rows.Remove(dt.Rows[rowID]);
                }
            }
            //Store the current data in ViewState for future reference
            Session["myTable"] = dt;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["RowNumber"] = i + 1;
            }
            //Re bind the GridView for the updated data
            gv_RacingGames.DataSource = dt;
            gv_RacingGames.DataBind();
            if(gv_RacingGames.Rows.Count < 1)
            {
                btn_SaveRacingGames.Visible = false;
            }
        }
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
    }
}