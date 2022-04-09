using System;

/// <summary>
/// Summary description for SportRacing
/// </summary>
public class SportRacing
{
    public SportRacing() { }

    private String _racing_ID;

    public String Racing_ID
    {
        get { return _racing_ID; }
        set { _racing_ID = value; }
    }

    private String _racing_RacingInfoID;

    public String Racing_RacingInfoID
    {
        get { return _racing_RacingInfoID; }
        set { _racing_RacingInfoID = value; }
    }

    private int _racing_GameID;

    public int Racing_GameID
    {
        get { return _racing_GameID; }
        set { _racing_GameID = value; }
    }

    private int _racing_HostTeamID;

    public int Racing_HostTeamID
    {
        get { return _racing_HostTeamID; }
        set { _racing_HostTeamID = value; }
    }

    private int _racing_GuestTeamID;

    public int Racing_GuestTeamID
    {
        get { return _racing_GuestTeamID; }
        set { _racing_GuestTeamID = value; }
    }

    private DateTime _racing_GameDate;

    public DateTime Racing_GameDate
    {
        get { return _racing_GameDate; }
        set { _racing_GameDate = value; }
    }

    private String _racing_GameTime;

    public String Racing_GameTime
    {
        get { return _racing_GameTime; }
        set { _racing_GameTime = value; }
    }

    private String _racing_GameLocation;

    public String Racing_GameLocation
    {
        get { return _racing_GameLocation; }
        set { _racing_GameLocation = value; }
    }

    private decimal _racing_GameResult;

    public decimal Racing_GameResult
    {
        get { return _racing_GameResult; }
        set { _racing_GameResult = value; }
    }
    private int _racing_GameHostGoal;

    public int Racing_GameHostGoal
    {
        get { return _racing_GameHostGoal; }
        set { _racing_GameHostGoal = value; }
    }
    private int _racing_GameGuestGoal;

    public int Racing_GameGuestGoal
    {
        get { return _racing_GameGuestGoal; }
        set { _racing_GameGuestGoal = value; }
    }
}