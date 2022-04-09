using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BongahInfo
/// </summary>
public class BongahInfo
{
    private int _bongahID;

    public int BongahID
    {
        get { return _bongahID; }
        set { _bongahID = value; }
    }
    private String _bongah_Type;

    public String Bongah_Type
    {
        get { return _bongah_Type; }
        set { _bongah_Type = value; }
    }
    private String _bongah_Location;

    public String Bongah_Location
    {
        get { return _bongah_Location; }
        set { _bongah_Location = value; }
    }
    private String _bongah_Attribute;

    public String Bongah_Attribute
    {
        get { return _bongah_Attribute; }
        set { _bongah_Attribute = value; }
    }
    private Boolean _bongah_buy;

    public Boolean Bongah_buy
    {
        get { return _bongah_buy; }
        set { _bongah_buy = value; }
    }
    private Boolean _bongah_sale;

    public Boolean Bongah_sale
    {
        get { return _bongah_sale; }
        set { _bongah_sale = value; }
    }
    private Boolean _bongah_investor;

    public Boolean Bongah_investor
    {
        get { return _bongah_investor; }
        set { _bongah_investor = value; }
    }
    private Boolean _bongah_capitalist;

    public Boolean Bongah_capitalist
    {
        get { return _bongah_capitalist; }
        set { _bongah_capitalist = value; }
    }
    public BongahInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}