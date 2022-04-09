using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_NewsDisplay : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["newsId"].ToString() != null)
        {
            NewsInfo news = new NewsInfo();
            int newsID = int.Parse(Request.QueryString["newsId"].ToString());
            //DAL.News_IncreaseViewCount(newsID);
            news = DAL.GetNewsByID(newsID);
            lbl_NewsDate.Text = PersianClass.getPersiaDate(DateTime.Parse(news.NewsDate), "S", true);
            lbl_NewsTitle.Text = news.NewsTitle;
            //lbl_NewsSummary.Text = news.NewsSummary;
            lbl_NewsContext.Text = news.NewsContext;
            chk_NewsPooling.Checked = Boolean.Parse(news.NewsPooling);
            lbl_NewsViewCount.Text = news.NewsViewCount;
        }
        else
        {
            lbl_NewsContext.Text = "خطا در فراخوانی خبر";
        }
    }
}