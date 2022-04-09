using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using System.Diagnostics;

/// <summary>
/// سايت خطاهاي كردن لاگ براي كلاسي
/// </summary>
public class Logger
{
    public Logger()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private Exception LastError = null;
    public bool isParsed = false;
    private bool compactFormat = false;
    private bool retrieveSourceLines = true;
    private string rawUrl = String.Empty;
    private string errorMessage = String.Empty;
    private string StackTrace = String.Empty;
    private string sourceCode = String.Empty;
    private string fileName = String.Empty;
    private string fullUrl = String.Empty;
    private string IPAddress = String.Empty;
    private string referer = String.Empty;
    private string browser = String.Empty;
    private string login = String.Empty;
    private string postBuffer = String.Empty;
    private string RawHttp = String.Empty;
    private int contentSize = 0;
    private int Line = 0;

    public string GetErrorString(Exception lastErrorInner)
    {
        this.LastError = lastErrorInner;
        Parse();
        StringBuilder sb = new StringBuilder(1024);
        sb.AppendFormat("<p><b>Parsed:</b> {0}</p>", this.isParsed);
        sb.AppendFormat("<p><b>RawUrl:</b> {0}</p>", this.rawUrl);
        sb.AppendFormat("<p><b>ErrorMessage:</b> {0}</p>", this.errorMessage);
        sb.AppendFormat("<p><b>StackTrace:</b> {0}</p>", this.StackTrace);
        sb.AppendFormat("<p><b>SourceCode:</b> {0}</p>", this.sourceCode);
        sb.AppendFormat("<p><b>SourceLine:</b> {0}</p>", this.Line.ToString());
        sb.AppendFormat("<p><b>FullUrl:</b> {0}</p>", this.fullUrl);
        sb.AppendFormat("<p><b>IPAddress:</b> {0}</p>", this.IPAddress);
        sb.AppendFormat("<p><b>Referer:</b> {0}</p>", this.referer);
        sb.AppendFormat("<p><b>Browser:</b> {0}</p>", this.browser);
        sb.AppendFormat("<p><b>Login:</b> {0}</p>", this.login);
        sb.AppendFormat("<p><b>PostBuffer:</b> {0}</p>", this.postBuffer.Replace("&", "<br>"));
        sb.AppendFormat("<p><b>ContentSize:</b> {0}</p>", this.contentSize.ToString());
        return sb.ToString();
    }

    public bool Parse()
    {
        HttpRequest Request = HttpContext.Current.Request;
        this.rawUrl = Request.RawUrl;
        this.fullUrl = string.Format("http://{0}{1}", Request.ServerVariables["SERVER_NAME"], Request.RawUrl);
        this.IPAddress = Request.UserHostAddress;
        if (Request.UrlReferrer != null)
            this.referer = Request.UrlReferrer.ToString();
        this.browser = Request.UserAgent;
        if (Request.TotalBytes > 0 && Request.TotalBytes < 6144)
        {
            this.postBuffer = Encoding.GetEncoding(1252).GetString(Request.BinaryRead(Request.TotalBytes));
            this.contentSize = Request.TotalBytes;
        }
        else if (Request.TotalBytes > 20000) // strip the result
        {
            this.postBuffer = Encoding.GetEncoding(1252).GetString(Request.BinaryRead(20000)) + "...";
            this.contentSize = Request.TotalBytes;
        }
        if (this.LastError == null)
            return false;
        this.isParsed = true;
        if (LastError is FileNotFoundException)
            this.errorMessage = "File not found: " + LastError.Message;
        else
            this.errorMessage = LastError.Message;
        if (this.compactFormat)
            return true;
        this.StackTrace = LastError.StackTrace;
        if (this.retrieveSourceLines)
        {
            StringBuilder sb = new StringBuilder(1024);
            StackTrace st = new StackTrace(LastError, true);
            StackFrame sf = st.GetFrame(0);
            if (sf != null)
            {
                this.fileName = sf.GetFileName();
                this.Line = sf.GetFileLineNumber();
                if (retrieveSourceLines && this.fileName != null && File.Exists(this.fileName))
                {
                    int lineNumber = sf.GetFileLineNumber();
                    if (lineNumber > 0)
                    {
                        StreamReader sr = new StreamReader(this.fileName);

                        int x = 0;
                        for (x = 0; x < lineNumber - 4; x++)
                            sr.ReadLine();
                        sb.Append("--- Code ---\r\n");
                        sb.AppendFormat("File: {0}\r\n", fileName);
                        sb.AppendFormat("Method: {0}\r\n\r\n", LastError.TargetSite);
                        sb.AppendFormat("Line {0}: {1}\r\n", x + 1, sr.ReadLine());
                        sb.AppendFormat("Line {0}: {1}\r\n", x + 2, sr.ReadLine());
                        sb.AppendFormat("Line {0}: {1}\r\n", x + 3, sr.ReadLine());
                        sb.AppendFormat("Line {0}: {1}\r\n", x + 4, sr.ReadLine());
                        sb.AppendFormat("Line {0}: {1}\r\n", x + 5, sr.ReadLine());
                        sb.AppendFormat("Line {0}: {1}\r\n", x + 6, sr.ReadLine());
                        sb.AppendFormat("Line {0}: {1}\r\n", x + 7, sr.ReadLine());
                        sr.Close();
                    }
                }
            }
            this.sourceCode = "<pre>" + sb.ToString() + "</pre>";
        }

        if (Request.IsAuthenticated)
            this.login = HttpContext.Current.User.Identity.Name;
        else
            this.login = "Anonymous";
        return true;
    }
}
