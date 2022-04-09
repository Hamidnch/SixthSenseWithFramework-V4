using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SportRacingForms
/// </summary>
public class SportRacingForms
{
    public SportRacingForms()
    { }
    private String _form_ID;
    public String Form_ID
    {
        get { return _form_ID; }
        set { _form_ID = value; }
    }

    private String _form_RacingInfoID;
    public String Form_RacingInfoID
    {
        get { return _form_RacingInfoID; }
        set { _form_RacingInfoID = value; }
    }
    
    private DateTime _form_CreationDate;
    public DateTime Form_CreationDate
    {
        get { return _form_CreationDate; }
        set { _form_CreationDate = value; }
    }
    
    private int _form_UserID;
    public int Form_UserID
    {
        get { return _form_UserID; }
        set { _form_UserID = value; }
    }    

    private int _form_Amount;
    public int Form_Amount
    {
        get { return _form_Amount; }
        set { _form_Amount = value; }
    }

    private bool _form_ActiveStatus;
    public bool Form_ActiveStatus
    {
        get { return _form_ActiveStatus; }
        set { _form_ActiveStatus = value; }
    }
}