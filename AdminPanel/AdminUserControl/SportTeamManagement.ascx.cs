using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminPanel_AdminUserControl_SportTeamManagement : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        gv_RacingTeamManagement.DataSource = DAL.Sport_LoadAllTeams();
        gv_RacingTeamManagement.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddl_CountrySearch.DataSource = DAL.LoadAllCountriesHelper();
            ddl_CountrySearch.DataTextField = "Country_Name";
            ddl_CountrySearch.DataValueField = "Country_ID";
            ddl_CountrySearch.DataBind();
            BindData();
        }
    }
    protected void gv_RacingTeamManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RacingTeamManagement.PageIndex = e.NewPageIndex;
        BindData();

    }
    protected void gv_RacingTeamManagement_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gv_RacingTeamManagement.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void gv_RacingTeamManagement_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gv_RacingTeamManagement.EditIndex= -1;
        BindData();
    }
    protected void gv_RacingTeamManagement_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //DataRowView drv = e.Row.DataItem as DataRowView;
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList dp = (DropDownList)e.Row.FindControl("ddl_CountryName");
                dp.DataSource = DAL.LoadAllCountriesHelper();
                dp.DataTextField = "Country_Name";
                dp.DataValueField = "Country_ID";
                dp.DataBind();
            }
        }
    }
    protected void gv_RacingTeamManagement_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int team_ID = int.Parse(gv_RacingTeamManagement.DataKeys[0].Value.ToString());
        Label lbl_teamID = (Label)gv_RacingTeamManagement.Rows[e.RowIndex].FindControl("lbl_teamID");
        TextBox txt_TeamName = (TextBox)gv_RacingTeamManagement.Rows[e.RowIndex].FindControl("txt_TeamName");
        DropDownList ddl_Country_ID = (DropDownList)gv_RacingTeamManagement.Rows[e.RowIndex].FindControl("ddl_CountryName");
        DAL.Sport_UpdateTeam(int.Parse(lbl_teamID.Text), txt_TeamName.Text, int.Parse(ddl_Country_ID.SelectedValue.ToString()));
        gv_RacingTeamManagement.EditIndex = -1;
        BindData();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        int countryID = int.Parse(ddl_CountrySearch.SelectedValue);
        gv_RacingTeamManagement.DataSource = DAL.Sport_GetSearchTeamsByCountryID(countryID);
        gv_RacingTeamManagement.DataBind();
    }
}