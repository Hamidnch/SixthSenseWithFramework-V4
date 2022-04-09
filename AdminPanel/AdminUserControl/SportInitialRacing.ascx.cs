using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_SportInitialRacing : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }

    private void BindData()
    {
        gv_InitialRacing.DataSource = DAL.Sport_LoadAllInitialRacing();
        gv_InitialRacing.DataBind();
    }
    //private void SetCountries()
    //{
    //    ddl_RacingCountry.DataSource = DAL.LoadAllCountries();
    //    ddl_RacingCountry.DataValueField = "Country_ID";
    //    ddl_RacingCountry.DataTextField = "Country_Name";
    //    ddl_RacingCountry.DataBind();
    //}
    //private void SetRacingTitles()
    //{
    //    ddl_RacingTitle.DataSource = DAL.LoadAllRaceTitles();
    //    ddl_RacingTitle.DataValueField = "Race_ID";
    //    ddl_RacingTitle.DataTextField = "Race_Title";
    //    ddl_RacingTitle.DataBind();
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            //SetCountries();
           // SetRacingTitles();
        }
    }
    protected void gv_InitialRacing_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_InitialRacing.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gv_InitialRacing_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("InitialRacing_Show"))
        {
            String RacingInfo_ID = Convert.ToString(e.CommandArgument);
            racingInfoID.InnerText = RacingInfo_ID;            
            //ddl_RacingTitle.SelectedItem.Text = DAL.Sport_GetRaceTitleByRacingInfoID(RacingInfo_ID);
            txt_RacingCountry.Text = DAL.Sport_GetCountryIDByRacingInfoID(RacingInfo_ID).ToString();
            lbl_Country_ID.Text = DAL.Sport_GetCountryIDByRacingInfoID(RacingInfo_ID).ToString();
            String info = DAL.Sport_GetSelectedRacingInfo(RacingInfo_ID);
            if (info != "")
            {
                string[] data = info.Split(';');
                //lbl_RacingInfoID.Text = data[0];
                txt_RacingTitle.Text = data[1];
                txt_RacingDetails.Text = data[2];
                txt_StartRespiteDate.Text = PersianClass.getPersiaDate(DateTime.Parse(data[3]), "D", false);
                txt_RacingStartDate.Text = PersianClass.getPersiaDate(DateTime.Parse(data[3]), "D", false);
                txt_RacingEndDate.Text = PersianClass.getPersiaDate(DateTime.Parse(data[4]), "D", false);
                txt_StartRespiteDate.Text = PersianClass.getPersiaDate(DateTime.Parse(data[5]), "D", false);
                txt_EndRespiteDate.Text = PersianClass.getPersiaDate(DateTime.Parse(data[6]), "D", false);
                txt_StartRespiteTime.Text = data[8];
                txt_EndRespiteTime.Text = data[6];
            }
            gv_RacingGames.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(RacingInfo_ID);
            gv_RacingGames.DataBind();
            const String script = @"$(document).ready(function (){
                     $.unblockUI(); showModal();  $('#close').click(function(){$('#div_RacingDetailsmShow').hide('slow');})
                    $(document).keyup(function(e){var code = (e.keyCode ? e.keyCode : e.which);
                        if(code === 27)$('#div_RacingDetailsmShow').hide('slow');});
                    $('#div_RacingDetailsmShow').draggable({ containment: 'window', scroll: false, handle: '#titlebar' });
                    function showModal()
                    {
                        $('#div_RacingDetailsmShow').css({top:'50%',left:'50%',margin:'-'+($('#div_RacingDetailsmShow').height() / 2)+'px 0 0 -'+($('#div_RacingDetailsmShow').width() / 2)+'px'});
                        $('#div_RacingDetailsmShow').show('slow');
                    }
                    });";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "racingDetailsmShow", script, true);
        }
    }
    protected void gv_RacingGames_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RacingGames.PageIndex = e.NewPageIndex;
        gv_RacingGames.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(racingInfoID.InnerText);
        gv_RacingGames.DataBind();
    }
    protected void gv_RacingGames_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList dp = (DropDownList)e.Row.FindControl("ddl_HostTeam");
                dp.DataSource = DAL.Sport_GetTeamsByCountryID(int.Parse(lbl_Country_ID.Text));
                dp.DataTextField = "Team_Name";
                dp.DataValueField = "Team_ID";
                dp.DataBind();

                DropDownList dp2 = (DropDownList)e.Row.FindControl("ddl_GuestTeam");
                dp2.DataSource = DAL.Sport_GetTeamsByCountryID(int.Parse(lbl_Country_ID.Text));
                dp2.DataTextField = "Team_Name";
                dp2.DataValueField = "Team_ID";
                dp2.DataBind();
            }
        }
    }
    protected void gv_RacingGames_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gv_RacingGames.EditIndex = e.NewEditIndex;
        gv_RacingGames.DataSource =  DAL.Sport_LoadAllGamesByRacingInfoID(racingInfoID.InnerText);
        gv_RacingGames.DataBind();
    }
    protected void gv_RacingGames_CancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gv_RacingGames.EditIndex = -1;
        gv_RacingGames.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(racingInfoID.InnerText);
        gv_RacingGames.DataBind();
    }
    protected void gv_RacingGames_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String racinginfo_ID = gv_RacingGames.DataKeys[0].Value.ToString();
        Label lbl_GameID = (Label)gv_RacingGames.Rows[e.RowIndex].FindControl("lbl_GameID");
        DropDownList ddl_HostTeam = (DropDownList)gv_RacingGames.Rows[e.RowIndex].FindControl("ddl_HostTeam");
        DropDownList ddl_GuestTeam = (DropDownList)gv_RacingGames.Rows[e.RowIndex].FindControl("ddl_GuestTeam");
        PersianDatePickup.PersianDatePickup pdp_RacingGameDate = (PersianDatePickup.PersianDatePickup)gv_RacingGames.Rows[e.RowIndex].FindControl("pdp_RacingGameDate");
        TextBox txt_Racing_GameTime = (TextBox)gv_RacingGames.Rows[e.RowIndex].FindControl("txt_Racing_GameTime");
        TextBox txt_Racing_GameLocation = (TextBox)gv_RacingGames.Rows[e.RowIndex].FindControl("txt_Racing_GameLocation");
        DAL.Sport_UpdateRacingByGameIDAndRacingInfoID(racinginfo_ID, int.Parse(lbl_GameID.Text),
            int.Parse(ddl_HostTeam.SelectedValue), int.Parse(ddl_GuestTeam.SelectedValue),
            pdp_RacingGameDate.SelectedDateTime.Value, txt_Racing_GameTime.Text, txt_Racing_GameLocation.Text);
        gv_RacingGames.EditIndex = -1;
        gv_RacingGames.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(racingInfoID.InnerText);
        gv_RacingGames.DataBind();
    }

}