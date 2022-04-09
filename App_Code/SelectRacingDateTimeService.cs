using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for SelectRacingDateTimeService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class SelectRacingDateTimeService : System.Web.Services.WebService {

    public SelectRacingDateTimeService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    public class CustomDate
    {
        private string year;

        public string Year
        {
            get { return year; }
            set { year = value; }
        }
        private string month;

        public string Month
        {
            get { return month; }
            set { month = value; }
        }
        private string day;

        public string Day
        {
            get { return day; }
            set { day = value; }
        }
        private string hour;

        public string Hour
        {
            get { return hour; }
            set { hour = value; }
        }
        private string minute;

        public string Minute
        {
            get { return minute; }
            set { minute = value; }
        }
        private string second;

        public string Second
        {
            get { return second; }
            set { second = value; }
        }
    }
    [WebMethod]
    public CustomDate GetToday()
    {
        CustomDate today  = new CustomDate();
        today.Year   = string.Format(BLL.GetIranDateTime().Year.ToString(), "{0:yyyy}");
        today.Month  = string.Format(BLL.GetIranDateTime().Month.ToString(), "{0:MM}");
        today.Day    = string.Format(BLL.GetIranDateTime().Day.ToString(), "{0:dd}");
        today.Hour   = string.Format(BLL.GetIranDateTime().Hour.ToString(),"{0:HH}");
        today.Minute = string.Format(BLL.GetIranDateTime().Minute.ToString(), "{0:mm}");
        today.Second = BLL.GetIranDateTime().Second.ToString();
        return today;
    }
    //[WebMethod]
    //public DateTime getDateNow()
    //{
    //    return BLL.GetIranDateTime();
    //}
    [WebMethod]
    public CustomDate GetLastDateByRacingInfoID(string racingInfoID)
    {
        CustomDate lastDate = new CustomDate();
        DateTime respiteDate = DAL.Sport_GetRespiteDateByRacingInfoID(racingInfoID);
        lastDate.Year = respiteDate.Year.ToString();
        lastDate.Month = respiteDate.Month.ToString();
        lastDate.Day = respiteDate.Day.ToString();
        lastDate.Hour = "0";
        lastDate.Minute = "0";
        lastDate.Second = "0";
        return lastDate;
    }
     


    //[WebMethod()]
    //public String GetTodayShortDate()
    //{
    //    return BLL.GetIranDateTime().Date.ToShortDateString();
    //}
    //[WebMethod()]
    //public String GetTodayLongDate()
    //{
    //    return BLL.GetIranDateTime().Date.ToLongDateString();
    //}
    //[WebMethod()]
    //public String GetTodayYear()
    //{
    //    return BLL.GetIranDateTime().Year.ToString();
    //}
    //[WebMethod()]
    //public String GetTodayMonth()
    //{
    //    return BLL.GetIranDateTime().Month.ToString();
    //}
    //[WebMethod()]
    //public String GetTodayDay()
    //{
    //    return BLL.GetIranDateTime().Day.ToString();
    //}
    //[WebMethod()]
    //public String GetTodayHour()
    //{
    //    return BLL.GetIranDateTime().Hour.ToString();
    //}
    //[WebMethod()]
    //public String GetTodayMinute()
    //{
    //    return BLL.GetIranDateTime().Minute.ToString();
    //}
    //[WebMethod()]
    //public String GetTodaySecond()
    //{
    //    return BLL.GetIranDateTime().Second.ToString();
    //}
    ///*************************RespiteDate******************************/
    //[WebMethod()]
    //public String GetRespiteYear(string racingInfoID)
    //{
    //    DateTime respiteDate = DAL.Sport_GetRespiteDateByRacingInfoID(racingInfoID);
    //    return respiteDate.Year.ToString();
    //}
    //[WebMethod()]
    //public String GetRespiteMonth(string racingInfoID)
    //{
    //    DateTime respiteDate = DAL.Sport_GetRespiteDateByRacingInfoID(racingInfoID);
    //    return respiteDate.Month.ToString();
    //}
    //[WebMethod()]
    //public String GetRespiteDay(string racingInfoID)
    //{
    //    DateTime respiteDate = DAL.Sport_GetRespiteDateByRacingInfoID(racingInfoID);
    //    return respiteDate.Day.ToString();
    //}
}
