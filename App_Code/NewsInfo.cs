using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NewsInfo
/// </summary>
public class NewsInfo
{
    public String NewsID{ get; set; }
    public String NewsDate { get; set; }
    public String NewsTitle { get; set; }
    public String NewsSummary { get; set; }
    public String NewsContext { get; set; }
    public String NewsPooling { get; set; }
    public String NewsStatus { get; set; }
    public String NewsViewCount { get; set; }  
    
	public NewsInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}