using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminPanel_AdminUserControl_RSSReader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true);
    }
    protected void btn_RSSLoad_Click(object sender, EventArgs e)
    {            
        String otherID = BLL.CreateRandomPasswordUsingGUID(10);
        try
        {
            DataTable    dt       = new DataTable();
            RSSOtherInfo rssOther = new RSSOtherInfo();
            RSSFeedInfo rssFeed   = new RSSFeedInfo();
            
            rssOther.RSSOther_ID      = otherID;
            rssOther.RSSOther_Author  = Context.User.Identity.Name;
            rssOther.RSSOther_Subject = txt_RSSSubject.Text;
            rssOther.RSSOther_Link    = txt_RSSPath.Text;
            rssOther.RSSOther_Date = BLL.GetIranDateTime();
            rssOther.RSSOther_Active  = true;
            DAL.RSSOther_Insert(rssOther);
           
            //خواندن عنوان سایت
            dt = BLL.ProcessRss(txt_RSSPath.Text, "rss/channel");
            if (dt.Columns.Contains("title"))
            {
                rssFeed.RssSite = (dt.Rows[0]["title"].ToString() != null) ? dt.Rows[0]["title"].ToString() : "بدون عنوان سایت";
            }
            else
                rssFeed.RssSite = "بدون عنوان سايت";

            //خواندن سایر اطلاعات RSS
            DataTable dtFeed = new DataTable();
            dtFeed = BLL.ProcessRss(txt_RSSPath.Text, "rss/channel/item");

            for (int i = 0; i < dtFeed.Rows.Count; i++)
            {
                rssFeed.RssOtherID     = otherID;                
                if (dtFeed.Columns.Contains("title"))
                    rssFeed.RssTitle = (dtFeed.Rows[i]["title"].ToString() != null) ? dtFeed.Rows[i]["title"].ToString() : String.Empty;
                else
                    rssFeed.RssTitle = "بدون عنوان";
                
                if(dtFeed.Columns.Contains("link"))
                    rssFeed.RssLink        = (dtFeed.Rows[i]["link"].ToString() != null) ? dtFeed.Rows[i]["link"].ToString() : String.Empty;    
                else
                    rssFeed.RssLink = "بدون لینک";
                
                if (dtFeed.Columns.Contains("description"))
                    rssFeed.RssDescription = (dtFeed.Rows[i]["description"].ToString() != null) ? dtFeed.Rows[i]["description"].ToString() : String.Empty;
                else
                    rssFeed.RssDescription = "بدون شرح";
               
                if (dtFeed.Columns.Contains("pubDate"))
                    rssFeed.RssPubDate = (dtFeed.Rows[i]["pubDate"].ToString() != null) && (dtFeed.Rows[i]["pubDate"] != null) ? dtFeed.Rows[i]["pubDate"].ToString() : BLL.GetIranDateTime().ToLongDateString();
                else
                    rssFeed.RssPubDate = BLL.GetIranDateTime().ToLongDateString();

                DAL.RSSFeed_Insert(rssFeed);
            }

            lbl_Message.Text = "RSS مورد نظر ثبت گردید،برای بررسی آن وارد بخش مدیریت RSS شوید.";
        }
        catch (Exception ex)
        {
            DAL.RssOther_DeleteByID(otherID);
            lbl_Message.Text = "توقف کار به دلیل وقوع خطای زیر: " + "<br/>" + ex.Message; 
        }
    }
}