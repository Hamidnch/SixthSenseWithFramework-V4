using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for CustomMembership
/// </summary>
public class CustomMembership
{

    public CustomMembership()
    {

    }
	public CustomMembership(int memberID,String fName, String lastName, String userName, String password, String email,
        String accountName, String accountFamily, String accountNumber, String bankName, bool sex, String birthDay, String phone, String mobile, String address, String picture, 
        String country, String city, String webSite, String yahooID, String comment)
	{
        _memberID       = memberID;
        _fName          = fName;
        _lastName       = lastName;
        _username       = userName;
        _password       = password;
        _email          = email;
        _accountName    = accountName;
        _accountFamily  = accountFamily;
        _accountNumber  = accountNumber;
        _bankName       = bankName;
        _sex            = sex;
        _birthDay       = birthDay;
        _phone          = phone;
        _mobile         = mobile;
        _address        = address;
        _picture        = picture;
        _country        = country;
        _city           = city;
        _webSite        = webSite;
        _yahooID        = yahooID;
        _comment        = comment;

	}
    private int _memberID;

    public int MemberID
    {
        get
        {
            return _memberID;
        }
        set
        {
            _memberID = value;
        }
    }
    private String _fName;

    public String FName
    {
        get
        {
            return _fName;
        }
        set
        {
            _fName = value;
        }
    }
    //private String _firstName;

    //public String FirstName
    //{
    //    get { return _firstName; }
    //    set { value = _firstName;}
    //}
    private String _lastName;

    public String LastName
    {
        get { return _lastName; }
        set { _lastName = value; }
    }
    private String _username;

    public String Username
    {
        get { return _username; }
        set { _username = value; }
    }
    private String _password;

    public String Password
    {
        get { return _password; }
        set { _password = value; }
    }
    private String _email;

    public String Email
    {
        get { return _email; }
        set { _email = value; }
    }
    private String _accountName;

    public String AccountName
    {
        get
        {
            return _accountName;
        }
        set
        {
            _accountName = value;
        }
    }
    private String _accountFamily;

    public String AccountFamily
    {
        get
        {
            return _accountFamily;
        }
        set
        {
            _accountFamily = value;
        }
    }
    private String _accountNumber;

    public String AccountNumber
    {
        get { return _accountNumber; }
        set { _accountNumber = value; }
    }
    private String _bankName;

    public String BankName
    {
        get
        {
            return _bankName;
        }
        set
        {
            _bankName = value;
        }
    }
    private bool _sex;

    public bool Sex
    {
        get { return _sex; }
        set { _sex = value; }
    }
    private String _birthDay;

    public String BirthDay
    {
        get { return _birthDay; }
        set { _birthDay = value; }
    }
    private String _phone;

    public String Phone
    {
        get { return _phone; }
        set { _phone = value; }
    }
    private String _mobile;

    public String Mobile
    {
        get { return _mobile; }
        set { _mobile = value; }
    }
    private String _address;

    public String Address
    {
        get { return _address; }
        set { _address = value; }
    }
    private String _picture;

    public String Picture
    {
        get { return _picture; }
        set { _picture = value; }
    }
    private String _country;

    public String Country
    {
        get { return _country; }
        set { _country = value; }
    }
    private String _city;

    public String City
    {
        get { return _city; }
        set { _city = value; }
    }
    private String _webSite;

    public String WebSite
    {
        get { return _webSite; }
        set { _webSite = value; }
    }
    private String _yahooID;

    public String YahooID
    {
        get { return _yahooID; }
        set { _yahooID = value; }
    }
    private String _comment;

    public String Comment
    {
        get { return _comment; }
        set { _comment = value; }
    }
    private DateTime _registrationDate;

    public DateTime RegistrationDate
    {
        get
        {return _registrationDate;}
        set{_registrationDate = value;}
    }

    private DateTime _lastLoginDate;

    public DateTime LastLoginDate
    {
        get
        {
            return _lastLoginDate;
        }
        set
        {
            _lastLoginDate = value;
        }
    }
    private DateTime _lastPasswordChangedDate;

    public DateTime LastPasswordChangedDate
    {
        get
        {
            return _lastPasswordChangedDate;
        }
        set
        {
            _lastPasswordChangedDate = value;
        }
    }
    private Boolean _isActive;

    public Boolean IsActive
    {
        get
        {
            return _isActive;
        }
        set
        {
            _isActive = value;
        }
    }

    private int _isOnline;

    public int IsOnline
    {
        get
        {
            return _isOnline;
        }
        set
        {
            _isOnline = value;
        }
    }

    public override string ToString()
    {
        return _fName + " " + _lastName;
    }
}