<%@ Application Language="C#" %>
<%@ Import Namespace="System.Security.Principal" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="OnlineUserUtility" %>
<%@ Import Namespace="System.Diagnostics" %>
<script runat="server">
    protected void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        HttpCookie cookieLogin = Context.Request.Cookies[FormsAuthentication.FormsCookieName.ToString()];
        if (cookieLogin != null)
        {
            FormsAuthenticationTicket ticket;
            ticket = FormsAuthentication.Decrypt(cookieLogin.Value);
            FormsIdentity identity = new FormsIdentity(ticket);
            GenericPrincipal principal = new GenericPrincipal(identity, ticket.UserData.Split(new char[] { ',' }));
            Context.User = principal;
        }
    }
    //protected void Application_BeginRequest(Object sender, EventArgs e)
    //{

    //    HttpContext incoming = HttpContext.Current;
    //    string oldpath = incoming.Request.Path.ToLower();
    //    string pageid; // page id requested

    //    // Regular expressions to grab the page id from the pageX.aspx
    //    Regex regex = new Regex(@"page(\d+).aspx", RegexOptions.IgnoreCase
    //    | RegexOptions.IgnorePatternWhitespace);
    //    MatchCollection matches = regex.Matches(oldpath);

    //    if (matches.Count > 0)
    //    {
    //        // Extract the page id and send it to Process.aspx
    //        pageid = matches[0].Groups[1].ToString();
    //        incoming.RewritePath("Process.aspx?pageid=" + pageid);
    //    }
    //    else
    //    {
    //        // Display path if it doesn’t containt pageX.aspx
    //        incoming.RewritePath(oldpath);
    //    }
    //}
    protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
    {
        HttpContext ctx = HttpContext.Current;
        if (ctx.Request.IsAuthenticated)
        {
            Page p = ctx.Handler as Page;
            // Make sure this is a page.
            if (p != null){p.ViewStateUserKey = ctx.User.Identity.Name;}
        }
    }
    private void CalculateRacings_CallBack(WebTaskEventArgs e)
    {
        Application.Lock();
        String startTime = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H");
        DateTime st = BLL.GetIranDateTime();
        String racingCalculated;
        try
        {
            e.CanContinue = true;
            racingCalculated = DAL.CalculateAllRacings();
            if (racingCalculated.Trim() != "" && racingCalculated != null)
            {
                String info = "<h1 style='color:Red;font-family:Tahoma;text-align:center'>سایت حس ششم</h1>\n" +
                "<div style='color:Blue;'> Start Time: " + startTime + "</div>\n" + 
                "<div style='color:Black;font-family:Tahoma'>" + " این ایمیل برای اطلاع رسانی از محاسبه اتوماتیک کسر کردن مبلغ بابت فرمهای فعال در یک مسابقه خاص می باشد که مهلت پیش بینی آن به اتمام رسیده است" +
                " این عمل در حال حاضر هر یک دقیقه یکبار انجام می پذیرد بدین معنی که شما تقریبا هر دقیقه یک ایمیل حاوی آخرین تغییرات را دریافت خواهید کرد" +
                "</div>\n" +
                "<p><b style='color:blue;font-family:Tahoma'>فرمهای فعال یک مسابقه به ترتیب آخرین تاریخ ویرایش مرتب شده و سپس به ازای هرکدام از آنها اگر کاربر موجودی داشته باشد از صندوق وی کسر خواهد شد در غیر اینصورت فرم حق شرکت در مسابقه را نخواهد داشت.</b></p>" +
                "\n<p style='color:blue;font-family:Tahoma'>توجه داشته باشید که به محض اتمام مهلت پیش بینی یک مسابقه این عمل انجام میگردد و مرحله بعد انجام تایید نهایی است که توسط مدیر سیستم انجام می پذیرد تا امتیازها تعیین و درنهایت برندگان مشخص گردند.</p><hr />";
                info += "\n" + "<h2 style='color:blue;font-family:Tahoma'>" + racingCalculated + "</h2>";
                String endTime = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H");
                //DateTime ed = BLL.GetIranDateTime();
                //TimeSpan diff = ed.Subtract(st);
                //DateTime dt = new DateTime().Add(diff);               
                //String DiffrenceTime = PersianClass.getPersiaDate(dt, "H", true, "D");
                info += "<div style='color:Blue;'> End Time: " + endTime + "</div>\n";
                //info += "<div style='color:Blue;'> Diff Time: " + DiffrenceTime + "</div>\n";
                BLL.SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", "Calculate Racing Success", info + "\n" + PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H"), true, "Ok");
                //BLL.SendEmail("mail@hesesheshom.com", "panahi_fch@yahoo.com", "پیام جدید", info, true, "پیغام شما به مدیریت سایت فرستاده شد");
                BLL.SendEmail("mail@hesesheshom.com", "panahi.fch@gmail.com", "پیام جدید", info, true, "پیغام شما به مدیریت سایت فرستاده شد");
            }
        }
        catch (Exception ex)
        {
            BLL.SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", "Calculate Racing in Global.asax", ex.Message + "\n" + PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H"), true, "Ok");
            //Utilities.ErrorLogger.ReportLastError();
        }
        finally
        {
            Application.UnLock();
        }
    }
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Application["OnlineUsers"] = 0;
        WebTaskScheduler.Lock();
        try
        {
            WebTaskScheduler.Add("CalculateRacing", CalculateRacings_CallBack, new TimeSpan(0, 0, 30));
        }
        finally
        {
            WebTaskScheduler.Unlock();
        }   
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
    }
    //internal string Error_dump()
    //{
    //    StackTrace st = new StackTrace(Server.GetLastError().InnerException, true);
    //    StringBuilder sb = new StringBuilder();
    //    sb.AppendFormat(" Stack trace for current level: {0}", st.ToString());
    //    int count = 0;
    //    while (count < st.FrameCount)
    //    {
    //        StackFrame sf = st.GetFrame(count);
    //        sb.AppendFormat("<b>File:</b> {0}<br>", sf.GetFileName());
    //        sb.AppendFormat("<b>Method:</b> {0}<br>", sf.GetMethod().Name);
    //        sb.AppendFormat("<b>Line Number:</b> {0}<br>", sf.GetFileLineNumber());
    //        sb.AppendFormat("<b>Column Number:</b> {0}<br>", sf.GetFileColumnNumber());
    //        count++;
    //    }
    //    return sb.ToString();
    //} 
    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs
        string mailBody = "<span style=\"font-family:tahoma;font-size=10px;color:Blue\"><p><b>Server:</b> " + this.Server.MachineName + "</p>";
        try
        {
            Logger newLog = new Logger();
            string message = newLog.GetErrorString(Server.GetLastError().InnerException);
            //if (!newLog.isParsed) NeedReedirect = false;
            mailBody += message + "</span>";
        }
        catch (Exception ex)
        {//Error_dump()
            mailBody += "<p><b>Error in Error Handler:</b> " + ex.Message + "</p>"; ;
        }
        finally
        {
            BLL.SendEmail( "خطاگیری از طریق Logger:\n", mailBody);
        }
        
        //Other Error Logger
        Utilities.ErrorLogger.ReportLastError();
        
        //Response.Redirect(Utilities.ErrorLogger.ReportLastError());        
        // Code that runs when an unhandled error occurs
        //Exception ex = Server.GetLastError();
        //Application["TheException"] = ex; //store the error for later
        //Server.ClearError(); //clear the error so we can continue onwards
        //Response.Redirect("~/myErrorPage.aspx"); //direct user to error page
        //protected void Page_Load(object sender, EventArgs e)
        //    {

        //        // ... do stuff ...
        //        //we caught an exception in our Global.asax, do stuff with it.
        //        Exception caughtException = (Exception)Application["TheException"];
        //        //... do stuff ...
        //    }

    }

    void Session_Start(object sender, EventArgs e) 
    {     
        //Session.Timeout = 5;
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
        Session["start"] = BLL.GetIranDateTime();
        HttpContext currentContext = HttpContext.Current;
        if (currentContext != null)
        {
            if (!VisitorDictionary.Visitors.ContainsKey(currentContext.Session.SessionID))
            {
                VisitorInfo currentVisitor = new VisitorInfo(currentContext);
                VisitorDictionary.Visitors.Add(currentVisitor.SessionId, currentVisitor);
            }
        }        
        DAL.Site_Increase_ViewCount();         
        Application.UnLock();   
        // Code that runs when a new session is started
        //Session.Add("OnlineUsersCount", onlineUsersCount);
        //DAL.Site_InsertSiteVisit(BLL.GetIranDateTime(), Context.User.Identity.Name, 
        //    Context.Request.UserHostAddress, Context.Request.Url.PathAndQuery);        
    }

    void Session_End(object sender, EventArgs e) 
    {        
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;      
        if (this.Session != null)
        {
            VisitorDictionary.Visitors.Remove(this.Session.SessionID);       
        }
        if (Context != null && Context.User.Identity != null &&  Context.User.Identity.Name != null && Context.User.Identity.Name != "" )
        {
            DAL.Membership_UpdateLastLoginDate(Context.User.Identity.Name);
        }
        Application.UnLock();    
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        //OnlineActiveUsers.OnlineUsersInstance.OnlineUsers.UpdateForUserLeave();
    }       
</script>
