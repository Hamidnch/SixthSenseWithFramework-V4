using System;

/// <summary>
/// Summary description for SportRacingFormInfo
/// </summary>
public class SportRacingFormInfo
{
    public SportRacingFormInfo()
    {
    }

    private int _formInfo_HostTeamID;

    public int FormInfo_HostTeamID
    {
        get { return _formInfo_HostTeamID; }
        set { _formInfo_HostTeamID = value; }
    }

    private String _formInfo_FormID;

    public String FormInfo_FormID
    {
        get { return _formInfo_FormID; }
        set { _formInfo_FormID = value; }
    }

    private int _formInfo_GameID;

    public int FormInfo_GameID
    {
        get { return _formInfo_GameID; }
        set { _formInfo_GameID = value; }
    }

    private int _formInfo_GuestTeamID;

    public int FormInfo_GuestTeamID
    {
        get { return _formInfo_GuestTeamID; }
        set { _formInfo_GuestTeamID = value; }
    }

    private Boolean _formInfo_IsHostWin;

    public Boolean FormInfo_IsHostWin
    {
        get { return _formInfo_IsHostWin; }
        set { _formInfo_IsHostWin = value; }
    }

    private Boolean _formInfo_IsEqualTeams;

    public Boolean FormInfo_IsEqualTeams
    {
        get { return _formInfo_IsEqualTeams; }
        set { _formInfo_IsEqualTeams = value; }
    }

    private Boolean _formInfo_IsGuestWin;

    public Boolean FormInfo_IsGuestWin
    {
        get { return _formInfo_IsGuestWin; }
        set { _formInfo_IsGuestWin = value; }
    }

    private int _formInfo_CheckCount;

    public int FormInfo_CheckCount
    {
        get { return _formInfo_CheckCount; }
        set { _formInfo_CheckCount = value; }
    }

    private int _formInfo_Prominence;

    public int FormInfo_Prominence
    {
        get { return _formInfo_Prominence; }
        set { _formInfo_Prominence = value; }
    }
}