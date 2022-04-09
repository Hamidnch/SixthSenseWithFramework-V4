using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SportPaymentReady
/// </summary>
public class SportPaymentReady
{
	public SportPaymentReady()
	{
	}
    private string _reservationNumber;
    private decimal _amount;
    private int     _userID;
    private string _userIP;
    private int     _bankID;
    private DateTime _settleDate;
    private string _sequence;
    private string _timeStamp;
    private string _hashCode;
    private string _description;

    public string ReservationNumber
    {
        get { return _reservationNumber; }
        set { _reservationNumber = value; }
    }
    public decimal Amount
    {
        get { return _amount; }
        set { _amount = value; }
    }    
    public int UserID
    {
        get { return _userID; }
        set { _userID = value; }
    }
    public string UserIP
    {
        get { return _userIP; }
        set { _userIP = value; }
    }
    public int BankID
    {
        get { return _bankID; }
        set { _bankID = value; }
    }
    public DateTime SettleDate
    {
        get { return _settleDate; }
        set { _settleDate = value; }
    }
    public string Sequence
    {
        get { return _sequence; }
        set { _sequence = value; }
    }
    public string TimeStamp
    {
        get { return _timeStamp; }
        set { _timeStamp = value; }
    }
    public string HashCode
    {
        get { return _hashCode; }
        set { _hashCode = value; }
    }
    public string Description
    {
        get { return _description; }
        set { _description = value; }
    }
}