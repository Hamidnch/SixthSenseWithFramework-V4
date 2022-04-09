using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SportLowAccept
/// </summary>
public class SportLowAccept
{
    public SportLowAccept()
    { }
    private int _lowAccept_ID;
    public int LowAccept_ID
    {
        get { return _lowAccept_ID; }
        set { _lowAccept_ID = value; }
    }

    private int _lowaccept_UserID;
    public int Lowaccept_UserID
    {
        get { return _lowaccept_UserID; }
        set { _lowaccept_UserID = value; }
    }
    
    private DateTime _lowAccept_Date;
    public DateTime LowAccept_Date
    {
        get { return _lowAccept_Date; }
        set { _lowAccept_Date = value; }
    }
    
    private Boolean _lowAccept_IsOk;
    public Boolean LowAccept_IsOk
    {
        get { return _lowAccept_IsOk; }
        set { _lowAccept_IsOk = value; }
    }
}