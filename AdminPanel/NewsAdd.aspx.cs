using System;
using System.Web.Services;

public partial class AdminPanel_NewsAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void InsertNews(String newsTitle, String newsSummary, String newsContext, Boolean newsPooling, Boolean newsStatus )
    {
        DAL.News_InsertNews(newsTitle, newsSummary, newsContext, newsPooling, newsStatus);
    }
}