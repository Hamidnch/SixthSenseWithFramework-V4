using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SportPayments
/// </summary>
public class SportPayments
{    
	public SportPayments()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string _reservationNumber;
    private decimal _amount;
    private int     _userID;
    private string _userIP;
    private int     _bankID;
    private DateTime _settleDate;
    private string  _referenceNumber;
    private string _transactionState;
    private string _sequence;
    private string _timeStamp;
    private string _hashCode;
    private string _description;
    private DateTime _verificationDate;
    private string _hashCodeDecript;    
    private string _currency_Code;
    private string _response_Code;
    private string _response_SubCode;
    private string _response_ReasonCode;
    private string _response_ReasonText;
	

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
    public string ReferenceNumber
    {
      get { return _referenceNumber; }
      set { _referenceNumber = value; }
    }
    public string TransactionState
    {
      get { return _transactionState; }
      set { _transactionState = value; }
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
    public DateTime VerificationDate
    {
        get { return _verificationDate; }
        set { _verificationDate = value; }
    }
    public string HashCodeDecript
    {
        get { return _hashCodeDecript; }
        set { _hashCodeDecript = value; }
    }
    public string Currency_Code
    {
        get { return _currency_Code; }
        set { _currency_Code = value; }
    }
    public string Response_Code
    {
        get { return _response_Code; }
        set { _response_Code = value; }
    }
    public string Response_SubCode
    {
        get { return _response_SubCode; }
        set { _response_SubCode = value; }
    }
    public string Response_ReasonCode
    {
        get { return _response_ReasonCode; }
        set { _response_ReasonCode = value; }
    }
    public string Response_ReasonText
    {
        get { return _response_ReasonText; }
        set { _response_ReasonText = value; }
    }	
}