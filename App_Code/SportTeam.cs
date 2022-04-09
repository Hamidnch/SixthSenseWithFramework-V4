using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SportTeam
/// </summary>
public class SportTeam
{
	public SportTeam()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int _teamID;

    public int TeamID
    {
        get { return _teamID; }
        set { _teamID = value; }
    }
    private String _teamName;

    public String TeamName
    {
        get { return _teamName; }
        set { _teamName = value; }
    }
    private String _teamAlias;

    public String TeamAlias
    {
        get { return _teamAlias; }
        set { _teamAlias = value; }
    }
    private int _teamCountryID;

    public int TeamCountryID
    {
        get { return _teamCountryID; }
        set { _teamCountryID = value; }
    }
    private String _teamSloganPicture;

    public String TeamSloganPicture
    {
        get { return _teamSloganPicture; }
        set { _teamSloganPicture = value; }
    }
    private String _team_OperatingManagement;

    public String Team_OperatingManagement
    {
        get { return _team_OperatingManagement; }
        set { _team_OperatingManagement = value; }
    }
    private String _team_Mentor;

    public String Team_Mentor
    {
        get { return _team_Mentor; }
        set { _team_Mentor = value; }
    }
    private String _teamDescription;

    public String TeamDescription
    {
        get { return _teamDescription; }
        set { _teamDescription = value; }
    }

}