using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ArticleOrderInfo
/// </summary>
public class ArticleOrderInfo
{
    private int _articleOrder_ID;

    public int ArticleOrder_ID
    {
        get { return _articleOrder_ID; }
        set { _articleOrder_ID = value; }
    }
    private int _articleOrder_ArticleID;

    public int ArticleOrder_ArticleID
    {
        get { return _articleOrder_ArticleID; }
        set { _articleOrder_ArticleID = value; }
    }

    private Boolean _articleOrder_OrderType;

    public Boolean ArticleOrder_OrderType
    {
        get { return _articleOrder_OrderType; }
        set { _articleOrder_OrderType = value; }
    }

    private Int32 _articleOrder_OrderValue;

    public Int32 ArticleOrder_OrderValue
    {
        get { return _articleOrder_OrderValue; }
        set { _articleOrder_OrderValue = value; }
    }

    private Int32 _articleOrder_SuggestCost;

    public Int32 ArticleOrder_SuggestCost
    {
        get { return _articleOrder_SuggestCost; }
        set { _articleOrder_SuggestCost = value; }
    }

    private String _articleOrder_Address;
    public String ArticleOrder_Address
    {
        get { return _articleOrder_Address; }
        set { _articleOrder_Address = value; }
    }
    private String _articleOrder_Phone;
    public String ArticleOrder_Phone
    {
        get { return _articleOrder_Phone; }
        set { _articleOrder_Phone = value; }
    }
    private String _articleOrder_Email;
    public String ArticleOrder_Email
    {
        get { return _articleOrder_Email; }
        set { _articleOrder_Email = value; }
    }
    public ArticleOrderInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}