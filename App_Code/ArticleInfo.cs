using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ArticleInfo
/// </summary>
public class ArticleInfo
{
    private int _article_ID;
    public int Article_ID
    {
        get { return _article_ID; }
        set { _article_ID = value; }
    }
    private String _article_Type;
    public String Article_Type
    {
        get { return _article_Type; }
        set { _article_Type = value; }
    }
    private String _article_Unit;
    public String Article_Unit
    {
        get { return _article_Unit; }
        set { _article_Unit = value; }
    }
    private String _article_Attribute;
    public String Article_Attribute
    {
        get { return _article_Attribute; }
        set { _article_Attribute = value; }
    }
    private Boolean _article_Buy;
    public Boolean Article_Buy
    {
        get { return _article_Buy; }
        set { _article_Buy = value; }
    }
    private Boolean _article_Sale;
    public Boolean Article_Sale
    {
        get { return _article_Sale; }
        set { _article_Sale = value; }
    }
    private String _article_Cost;
    public String Article_Cost
    {
        get { return _article_Cost; }
        set { _article_Cost = value; }
    }
    private Boolean _article_Status;
    public Boolean Article_Status
    {
        get { return _article_Status; }
        set { _article_Status = value; }
    }
	public ArticleInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}