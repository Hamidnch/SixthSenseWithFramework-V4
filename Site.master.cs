using System;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
//using System.Web;
//using System.Web.Security;

//using System.Diagnostics;

public partial class MainMaste : System.Web.UI.MasterPage
{
    //public static void login(String txtUserName, String txtPassword, Boolean chkRememberMe)
    //{
    //    if (DAL.Membership_ValidateUser(txtUserName, BLL.Encrypt(txtPassword)))
    //    {
    //        DAL.Site_InsertSiteVisit(BLL.GetIranDateTime(), txtUserName,
    //        HttpContext.Current.Request.UserHostAddress, HttpContext.Current.Request.Url.ToString());
    //        // lblMessage.Visible = false;
    //        String role = DAL.Membership_GetRoleByUserName(txtUserName);
    //        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, txtUserName, DateTime.Now,
    //                        BLL.GetIranDateTime().AddHours(1), false, role);
    //        String encriptTicket = FormsAuthentication.Encrypt(ticket);
    //        HttpCookie cookieLogin = new HttpCookie(FormsAuthentication.FormsCookieName, encriptTicket);
    //        if (chkRememberMe)
    //        {
    //            cookieLogin.Expires = BLL.GetIranDateTime().AddMinutes(30);
    //        }
    //        HttpContext.Current.Response.Cookies.Add(cookieLogin);
    //        FormsAuthentication.SetAuthCookie(txtUserName, chkRememberMe);
    //        HttpContext.Current.Response.Redirect(HttpContext.Current.Request.RawUrl);
    //        //Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUserName.Text, chkRememberMe.Checked));
    //    }
    //    else
    //    {
    //        // lblMessage.Visible = true;
    //        // lblMessage.Text = "نام کاربری یا رمز عبور نامعتبر است";
    //        //txtUserName.Focus();
    //    }
    //}

    public String imageUrl {get{return ResolveUrl("~/Images");}}
    //حذف فاصله‌هاي خالي
    private static readonly Regex REGEX_BETWEEN_TAGS = new Regex(@">\s+<", RegexOptions.Compiled);
    private static readonly Regex REGEX_LINE_BREAKS = new Regex(@"\n\s+", RegexOptions.Compiled);
    protected override void Render(HtmlTextWriter writer)
    {
        using (HtmlTextWriter htmlwriter = new HtmlTextWriter(new System.IO.StringWriter()))
        {
            base.Render(htmlwriter);
            string html = htmlwriter.InnerWriter.ToString();
            html = REGEX_BETWEEN_TAGS.Replace(html, "> <");
            html = REGEX_LINE_BREAKS.Replace(html, string.Empty);
            writer.Write(html.Trim());
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //Literal s = new Literal();
        //s.Text = "<script type='text/javascript' src='https://apis.google.com/js/plusone.js'></script>";
        //Page.Header.Controls.Add(s);
        //topNews = GetTopNewsToMarquee();
        // //do not cache...
        //Response.CacheControl = "no-cache";
        //Response.AddHeader("Pragma", "no-cache");
        //Response.Expires = -1;
        //Response.Cache.SetNoStore();
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);

        HtmlTable loginPanel = (HtmlTable)LoginUserControl1.FindControl("loginPanel");
        HtmlTable welcomePanel = (HtmlTable)LoginUserControl1.FindControl("welcomePanel");
        Label lbl_UserLoggedin = (Label)LoginUserControl1.FindControl("lbl_UserLoggedin");
        Label lblLastLoginDate = (Label)LoginUserControl1.FindControl("lblLastLoginDate");
        HtmlGenericControl menuAdministrator = (HtmlGenericControl)HorizMenu1.FindControl("menuAdministrator");
        menuAdministrator.Visible = false;
        if (Context.User.Identity.IsAuthenticated)
        {
            String role = DAL.Membership_GetRoleByUserNameHelper(Context.User.Identity.Name);
            if (role == "مدیر سایت" || role == "مدیر ارشد")
            {menuAdministrator.Visible = true;}
            else
            {menuAdministrator.Visible = false;}
            loginPanel.Visible = false;
            welcomePanel.Visible = true;
            lbl_UserLoggedin.Text = Context.User.Identity.Name;
            lblLastLoginDate.Text = "   آخرین بازدید شما: " + PersianClass.getPersiaDate(DAL.Membership_GetLastLoginDate(Context.User.Identity.Name), "S", true, "H");
        }
        else
        {
            loginPanel.Visible = true;
            Page.SetFocus(loginPanel.FindControl("txtUserName"));
            welcomePanel.Visible = false;
        }
        lblViewCount.Text = "کل بازدیدها: " + Persia.PersianWord.ToPersianString(DAL.Site_GetReviewCount().ToString());
        lblOnlineUser.Text = " تعداد کاربران آنلاین:  " + Persia.PersianWord.ToPersianString(Application["OnlineUsers"].ToString());
        myDate.Text = "امروز "
            //+ PersianClass.getFarsiDate(BLL.GetIranDateTime(), false, false) 
            + PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true, "H")
           //+ PersianClass.getGregorianDate(1390, 05, 25, 07, 36, 20, Persia.DateType.Persian).ToString()
           // + " ساعت: " + Persia.PersianWord.ToPersianString(BLL.GetTime()) + "  "
            + " - تاریخ میلادی: " + 
               BLL.GetIranDateTime().Date.ToString("yyyy:MMMM:dd");

        //foreach (OnlineUserUtility.VisitorInfo item in OnlineUserUtility.VisitorDictionary.Visitors)
        //{
        //    //lblTest.Text += item.UserAgent + ',';
        //}

        //lblOnlineUserCount.Text = "تعداد افراد آنلاین، : " + OnlineActiveUsers.OnlineUsersInstance.OnlineUsers.UsersCount +
        //    "          |عضو: " + OnlineActiveUsers.OnlineUsersInstance.OnlineUsers.RegistredUsersCount +
        //   " | مهمان: " + OnlineActiveUsers.OnlineUsersInstance.OnlineUsers.GuestUsersCount;
        //UserControl HorizMenu = (UserControl)Page.Master.FindControl("HorizMenu1");
        //HtmlGenericControl menuRace = (HtmlGenericControl)HorizMenu.FindControl("menuRace");
        //menuRace.ResolveUrl("~/RacingPage.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["newsId"] != null || Request.QueryString["newsId"].ToString() != null)
            {
                DAL.News_IncreaseViewCount(int.Parse(Request.QueryString["newsId"].ToString()));
            }
        }
        catch(Exception ex)
        {
            BLL.SendEmail("Home Page - Submit for IncreaseViewCount", ex);
        }
    }
}
//protected override void SavePageStateToPersistenceMedium(object state)
//{
//    if (Debugger.IsAttached)
//    {
//        using (MemoryStream stream = new MemoryStream())
//        {
//            LosFormatter formatter = new LosFormatter();
//            formatter.Serialize(stream, state);
//            int size = stream.Capacity / 1024;
//            if (size > 32)
//            {
//                throw new Exception("لطفا به وضعيت ويوو استيت اين صفحه رسيدگي نمائيد");
//            }
//        }
//    }
//    base.SavePageStateToPersistenceMedium(state);
//}
//public string GetTopNewsToMarquee()
//{
//    DataTable dt = DAL.News_GetTopNewsToDataTable();
//    String topNews ="", date, title, summary, path;
//    int id;
//    Boolean pooling;
//    if (dt.Rows.Count > 0)
//    {
//        for (int i = 0; i < dt.Rows.Count; i++)
//        {
//            topNews += "<marquee  onmouseover=\"this.stop()\" onmouseout=\"this.start()\" direction=\"up\" scrolldelay=\"1\" scrollamount=\"1\" style=\"width:99%;height:250px; padding: 0 1% 0 0;\">";
//            id = int.Parse(dt.Rows[i]["News_ID"].ToString());
//            date = dt.Rows[i]["News_Date"].ToString();
//            title = dt.Rows[i]["News_Title"].ToString();
//            summary = dt.Rows[i]["News_summary"].ToString();
//            pooling = Boolean.Parse(dt.Rows[i]["News_Pooling"].ToString());
//            path = "NewsDisplay.aspx?newsId=" + id.ToString();
//            int len = title.Length;
//            if (len >= 31)
//            {
//                title = title.Substring(0, 30) + "...";
//            }
//            else
//            {
//                for (int j = len - 1; j <= 31; j++)
//                {
//                    title = title + ".";
//                }
//            }
//            topNews += (String.Format("<div style=\"direction: rtl\"> " +
//                "<ul>" +
//                "<li style=\"list-style:none; padding:0 5px 0 0;\">" +
//                "<img src=\"Images/legend/newspaper.png\" />  " +
//                "<a href='newsDisplay.aspx?newsId=" + dt.Rows[i]["News_ID"] + "' onclick=\"callServerButtonEvent();\" style=\"text-decoration:none;color:white; text-align:right\">{0}</a>" +
//                "</li>" +
//                "</div>", title));
//            topNews += "</marquee>";
//        }
//    }
//    else
//        topNews += "&nbsp;<p> تاکنون اخبار جدیدی در سایت ثبت نشده است </p>";

//    return topNews;
//}