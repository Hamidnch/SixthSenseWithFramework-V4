using System;
using System.Web.Services;
using System.Collections.Generic;

public partial class AdminPanel_NewsManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptInclude("ui", ResolveUrl(@"..\Scripts\jquery-ui-1.8.6.custom.min.js"));
        Page.ClientScript.RegisterClientScriptInclude("ui", ResolveUrl(@"..\Scripts\jquery-1.4.4.js"));       
    }
    [WebMethod]
    public static void DelNews(List<String> selectedIds)
    {
        try
        {
            foreach (String item in selectedIds)
            {
                DAL.News_DeleteByID(int.Parse(item.Trim()));
            }
        }
        catch{}
    }
    [WebMethod]
    public static NewsInfo GetNewsInfo(String newsID)
    {
        return DAL.GetNewsByID(int.Parse(newsID.Trim()));
    }
    [WebMethod]
    public static void UpdateNewsInfo(String news_ID,String news_Title, String news_Summary, 
                                                String news_Context, Boolean news_Pooling, Boolean news_Status)
    {
        DAL.News_UpdateNews(int.Parse(news_ID), news_Title, news_Summary, news_Context, news_Pooling, news_Status);
    }
}