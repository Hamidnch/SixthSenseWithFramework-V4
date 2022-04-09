using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_SportRacingInsertResult : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ddl_RaceTitle.DataSource = DAL.LoadAllRaceTitles();
        //ddl_RaceTitle.DataValueField = "Race_ID";
        //ddl_RaceTitle.DataTextField = "Race_Title";
        //ddl_RaceTitle.DataBind();
        //ddl_Country.DataSource = DAL.LoadAllCountries();
        //ddl_Country.DataValueField = "Country_ID";
        //ddl_Country.DataTextField = "Country_Name";
        //ddl_Country.DataBind();

        gv_RacingResult.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID("ir1-c5151adf358");
        gv_RacingResult.DataBind();
    }
}