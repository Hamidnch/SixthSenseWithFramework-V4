using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class AdminPanel_RSSManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.ClientScript.RegisterClientScriptInclude("ui", ResolveUrl(@"..\Scripts\jquery-ui-1.8.6.custom.min.js"));
        //Page.ClientScript.RegisterClientScriptInclude("ui", ResolveUrl(@"..\Scripts\jquery-1.4.4.js")); 
    }
    [WebMethod]
    public static RSSFeedInfo GetRssFeedInfo(String rssFeedID)
    {
        return DAL.GetRssFeedByID(int.Parse(rssFeedID.Trim()));
    }
    [WebMethod]
    public static void UpdateRss(String feedID, String feedTitle, String feedDesc,
                Boolean feedIsHome, Boolean feedIsEconomic, Boolean feedIsEducation,
                Boolean feedIsRacing, Boolean feedIsActive)
    {
        DAL.RssFeed_UpdateFeed(int.Parse(feedID), feedTitle, feedDesc, feedIsHome,
            feedIsEconomic, feedIsEducation, feedIsRacing, feedIsActive);

    }
    [WebMethod]
    public static void DelRss(List<String> selectedIds)
    {
        try
        {
            foreach (String item in selectedIds)
            {
                DAL.RssFeed_DeleteByID(int.Parse(item.Trim()));
            }
        }
        catch { }
    }
    [WebMethod]
    public static void LoadRssFeedBySubject(String subject)
    {
        DataView dv = DAL.RSSFeed_LoadFeedBySubject(subject);
        RSSFeedInfo FeedInfo = new RSSFeedInfo();
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {

        }
    }
}