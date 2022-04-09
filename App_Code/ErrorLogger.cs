
namespace Utilities
{
    public sealed class ErrorLogger
    {
        private ErrorLogger() { }
        /// <summary>
        /// Sends mail about the lastly occured error to the admin
        /// </summary>
        public static void ReportLastError()
        {
            System.Web.HttpContext ctx = System.Web.HttpContext.Current;
            System.Exception ex = System.Web.HttpContext.Current.Server.GetLastError();
            string logTextHeader = FormatLogText(ex.GetBaseException().Message);

            string errorInfo =
               "\nOffending URL: " + ctx.Request.Url.ToString() + "\nRequest.RawUrl:" + ctx.Request.RawUrl + 
               "\nRequest." + ctx.Request.QueryString.ToString() + 
               "\nSource: " + ex.Source +
               "\nMessage: " + ex.Message +
               "\nStack trace: " + ex.StackTrace;
            string logTextBody = ex.ToString() + "\nMessage: " + ex.Message + 
                //"\n Base Exception InnerException.Message: " + ex.GetBaseException().InnerException.Message +
                "\n Base Exception Source:" + ex.GetBaseException().Source + "\n";
            logTextBody += "\n\n**************************************************\n" + errorInfo;
            //string RedirectUrlString = "~/Error.aspx?InnerErr=" +
            //    ex.ToString() + "&Err=" + ex.Message.ToString()
            //+"&Url=" + ctx.Request.RawUrl;
            System.Web.HttpContext.Current.Server.ClearError();
                
            BLL.SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", "خطای لاگ: " + logTextHeader, logTextBody, false, "این خطا به مدیریت گزارش گردید");

            //return RedirectUrlString;
        }
        /// <summary>
        /// Formates the error message
        /// </summary>
        /// <param name="logText">logged error message</param>
        /// <returns>formatted error message</returns>
        static string FormatLogText(string logText)
        {
            return "سایت Hesesheshom " + " در تاریخ: '" + 
                PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", true, "H") + 
                "' برابر با تاریخ میلادی : '" + 
                BLL.GetIranDateTime() + "' با این خطا مواجه گردید" + "\n" + logText;
        }
    }
}