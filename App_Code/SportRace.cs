/// <summary>
/// Summary description for SportRace
/// </summary>
using System;
public class SportRace
{
	public SportRace(){}

    private int race_ID;
    public int Race_ID
    {
        get { return race_ID; }
        set { race_ID = value; }
    }

    private String _race_Title;
    public String Race_Title
    {
        get { return _race_Title; }
        set { _race_Title = value; }
    }

    private DateTime _race_CreationDate;
    public DateTime Race_CreationDate
    {
        get { return _race_CreationDate; }
        set { _race_CreationDate = value; }
    }

    private String _race_Author;
    public String Race_Author
    {
        get { return _race_Author; }
        set { _race_Author = value; }
    }
}