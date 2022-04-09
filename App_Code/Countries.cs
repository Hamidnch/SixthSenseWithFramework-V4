using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Countries
/// </summary>
public class Countries
{
	public Countries()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int _countryID;

    public int CountryID
    {
        get { return _countryID; }
        set { _countryID = value; }
    }
    private String _countryName;

    public String CountryName
    {
        get { return _countryName; }
        set { _countryName = value; }
    }
    public override string ToString()
    {
        return _countryName;
    }
}