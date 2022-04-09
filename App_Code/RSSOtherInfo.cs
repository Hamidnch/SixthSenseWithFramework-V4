using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RSSOtherInfo
/// </summary>
public class RSSOtherInfo
{
    private String _rSSOther_ID;

    public String RSSOther_ID
    {
        get { return _rSSOther_ID; }
        set { _rSSOther_ID = value; }
    }
    private String _rSSOther_Author;

    public String RSSOther_Author
    {
        get { return _rSSOther_Author; }
        set { _rSSOther_Author = value; }
    }
    private String _rSSOther_Subject;

    public String RSSOther_Subject
    {
        get { return _rSSOther_Subject; }
        set { _rSSOther_Subject = value; }
    }
    private String _rSSOther_Link;

    public String RSSOther_Link
    {
        get { return _rSSOther_Link; }
        set { _rSSOther_Link = value; }
    }
    private DateTime _rSSOther_Date;

    public DateTime RSSOther_Date
    {
        get { return _rSSOther_Date; }
        set { _rSSOther_Date = value; }
    }
    private Boolean _rSSOther_Active;

    public Boolean RSSOther_Active
    {
        get { return _rSSOther_Active; }
        set { _rSSOther_Active = value; }
    }

	public RSSOtherInfo()
	{

	}
}