using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// کلاسی برای تغذیه RSS
/// </summary>
public class RSSFeedInfo
{
    private String _rssFeedID;

    public String RssFeedID
    {
        get { return _rssFeedID; }
        set { _rssFeedID = value; }
    }
    private String _rssOtherID;
    public String RssOtherID
    {
        get { return _rssOtherID; }
        set { _rssOtherID = value; }
    }
    private String _rssSite;
    public String RssSite
    {
        get { return _rssSite; }
        set { _rssSite = value; }
    }
    private String _rssTitle;
    public String RssTitle
    {
        get { return _rssTitle; }
        set { _rssTitle = value; }
    }
    private String _rssLink;
    public String RssLink
    {
        get { return _rssLink; }
        set { _rssLink = value; }
    }
    private String _rssDescription;
    public String RssDescription
    {
        get { return _rssDescription; }
        set { _rssDescription = value; }
    }
    private String _rssPubDate;
    public String RssPubDate
    {
        get { return _rssPubDate; }
        set { _rssPubDate = value; }
    }
    private String _rssIsHome;
    public String RssIsHome
    {
        get { return _rssIsHome; }
        set { _rssIsHome = value; }
    }
    private String _rssIsEconomic;
    public String RssIsEconomic
    {
        get { return _rssIsEconomic; }
        set { _rssIsEconomic = value; }
    }
    private String _rssIsEducation;
    public String RssIsEducation
    {
        get { return _rssIsEducation; }
        set { _rssIsEducation = value; }
    }
    private String _rssIsRacing;
    public String RssIsRacing
    {
        get { return _rssIsRacing; }
        set { _rssIsRacing = value; }
    }
    private String _rssIsActive;
    public String RssIsActive
    {
        get { return _rssIsActive; }
        set { _rssIsActive = value; }
    }
	public RSSFeedInfo()
	{

	}
}