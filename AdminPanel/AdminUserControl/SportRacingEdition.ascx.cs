using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SportRacingEdition : System.Web.UI.UserControl
{
    private void GetActiveRacing()
    {
        ddl_RacingInfoID.Items.Clear();
        ddl_RacingInfoID.DataSource = DAL.Sport_LoadAllRacingForEnterResults();
        ddl_RacingInfoID.DataTextField = "RacingInfo_ID";
        ddl_RacingInfoID.DataValueField = "RacingInfo_ID";
        ddl_RacingInfoID.DataBind();
        ddl_RacingInfoID.Items.Insert(0, new ListItem("انتخاب کنید...", "انتخاب کنید..."));
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetActiveRacing();
        }
    }
    protected void ddl_RacingInfoID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string racingInfoID = ddl_RacingInfoID.SelectedValue;
        if (racingInfoID == "انتخاب کنید...")
        {
            return;
        }
        else
        {
            gv_RacingGames.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(racingInfoID);
            gv_RacingGames.DataBind();
        }
    }
}