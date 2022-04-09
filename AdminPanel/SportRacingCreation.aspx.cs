using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

public partial class AdminPanel_SportRacingCreation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static List<SportTeam> GetTeamsByCountryID(String countryID)
    {
        List<SportTeam> teamList = new List<SportTeam>();
        DataSet ds = DAL.Sport_GetTeamsByCountryID(int.Parse(countryID.Trim()));
        foreach (DataRow item in ds.Tables[0].Rows)
        {
            SportTeam team = new SportTeam();
            team.TeamID = int.Parse(item["Team_ID"].ToString());
            team.TeamName = item["Team_Name"].ToString();
            team.TeamSloganPicture = item["Team_SloganPicture"].ToString();
            team.TeamAlias = item["Team_Alias"].ToString();
            team.TeamCountryID = int.Parse(item["Team_CountryID"].ToString());
            team.Team_Mentor = item["Team_Mentor"].ToString();
            team.Team_OperatingManagement = item["Team_OperatingManagement"].ToString();
            team.TeamDescription = item["Team_Descrition"].ToString();
            teamList.Add(team);
        }
        return teamList.ToList();
        // System.Web.Script.Serialization.JavaScriptSerializer jSearializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        // return jSearializer.Serialize(lig);
    }  
}