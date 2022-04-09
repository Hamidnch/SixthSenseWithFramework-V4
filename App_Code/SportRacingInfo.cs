using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
/// <summary>
/// Summary description for SportRacingInfo
/// </summary>
public class SportRacingInfo
{
	public SportRacingInfo(){}
    
    private String _racingInfo_ID;    
    public String RacingInfo_ID
    {
        get { return _racingInfo_ID; }
        set { _racingInfo_ID = value; }
    }    

    private int _racingInfo_RaceID;
    public int RacingInfo_RaceID
    {
        get { return _racingInfo_RaceID; }
        set { _racingInfo_RaceID = value; }
    }

    private String _racingInfo_Details;
    public String RacingInfo_Details
    {
        get { return _racingInfo_Details; }
        set { _racingInfo_Details = value; }
    }

    private int _racingInfo_CountryID;
    public int RacingInfo_CountryID
    {
        get { return _racingInfo_CountryID; }
        set { _racingInfo_CountryID = value; }
    }

    private DateTime _racingInfo_StartDate;
    public DateTime RacingInfo_StartDate
    {
        get { return _racingInfo_StartDate; }
        set { _racingInfo_StartDate = value; }
    }

    private DateTime _racingInfo_EndDate;
    public DateTime RacingInfo_EndDate
    {
        get { return _racingInfo_EndDate; }
        set { _racingInfo_EndDate = value; }
    }


    private DateTime _racingInfo_StartRespiteDate;
    public DateTime RacingInfo_StartRespiteDate
    {
        get { return _racingInfo_StartRespiteDate; }
        set { _racingInfo_StartRespiteDate = value; }
    }

    private DateTime _racingInfo_EndRespiteDate;
    public DateTime RacingInfo_EndRespiteDate
    {
        get { return _racingInfo_EndRespiteDate; }
        set { _racingInfo_EndRespiteDate = value; }
    }

    private String _racingInfo_StartRespiteTime;
    public String RacingInfo_StartRespiteTime
    {
        get { return _racingInfo_StartRespiteTime; }
        set { _racingInfo_StartRespiteTime = value; }
    }

    private String _racingInfo_EndRespiteTime;
    public String RacingInfo_EndRespiteTime
    {
        get { return _racingInfo_EndRespiteTime; }
        set { _racingInfo_EndRespiteTime = value; }
    }

    private String _racingInfo_Author;
    public String RacingInfo_Author
    {
        get { return _racingInfo_Author; }
        set { _racingInfo_Author = value; }
    }

    private DateTime _racingInfo_CreationDate;
    public DateTime RacingInfo_CreationDate
    {
        get { return _racingInfo_CreationDate; }
        set { _racingInfo_CreationDate = value; }
    }

    private DateTime _racingInfo_LastUpdate;
    public DateTime RacingInfo_LastUpdate
    {
        get { return _racingInfo_LastUpdate; }
        set { _racingInfo_LastUpdate = value; }
    }

    private string _racingInfo_Status;
    public String RacingInfo_Status
    {
        get { return _racingInfo_Status; }
        set { _racingInfo_Status = value; }
    }

    private Boolean _racingInfo_Active;

    public Boolean RacingInfo_Active
    {
        get { return _racingInfo_Active; }
        set { _racingInfo_Active = value; }
    }
    private string _racingInfo_Description;

    public string RacingInfo_Description
    {
        get { return _racingInfo_Description; }
        set { _racingInfo_Description = value; }
    }
}