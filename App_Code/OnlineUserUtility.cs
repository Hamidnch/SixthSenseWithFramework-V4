using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OnlineUserUtility
/// </summary>
namespace OnlineUserUtility
{
    public class VisitorInfo
    {
        private string _sessionId;
        public string SessionId
        {
            get
            {
                return _sessionId;
            }
            set
            {
                _sessionId = value;
            }
        }
        private string _ipAddress;
        public string IpAddress
        {
            get
            {
                return _ipAddress;
            }
            set
            {
                _ipAddress = value;
            }
        }
        private string _urlReferrer;
        public string UrlReferrer
        {
            get
            {
                return _urlReferrer;
            }
            set
            {
                _urlReferrer = value;
            }
        }
        private string _enterUrl;
        public string EnterUrl
        {
            get
            {
                return _enterUrl;
            }
            set
            {
                _enterUrl = value;
            }
        }
        private string _userAgent;
        public string UserAgent
        {
            get
            {
                return _userAgent;
            }
            set
            {
                _userAgent = value;
            }
        }
        private DateTime _sessionStarted;
        public DateTime SessionStarted
        {
            get
            {
                return _sessionStarted;
            }
            set
            {
                _sessionStarted = value;
            }
        }

        public VisitorInfo(HttpContext context)
        {
            if ((context != null) && (context.Request != null) && (context.Session != null))
            {
                this._sessionId = context.Session.SessionID;
                _sessionStarted = BLL.GetIranDateTime();
                _userAgent = string.IsNullOrEmpty(context.Request.UserAgent) ? "" : context.Request.UserAgent;
                _ipAddress = context.Request.UserHostAddress;
                if (context.Request.UrlReferrer != null)
                {
                    _urlReferrer = string.IsNullOrEmpty(context.Request.UrlReferrer.OriginalString) ? "" : context.Request.UrlReferrer.OriginalString;
                }
                _enterUrl = string.IsNullOrEmpty(context.Request.Url.OriginalString) ? "" : context.Request.Url.OriginalString;
            }
        }
    }
    public class VisitorDictionary
    {
        public static Dictionary<string, VisitorInfo> Visitors = new Dictionary<string, VisitorInfo>();
    }
}