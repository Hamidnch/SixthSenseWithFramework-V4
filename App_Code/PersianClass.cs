using System;
//using Farhani.PersianDate;
using System.Globalization;

public class PersianClass
{
    public static String getPersiaDate(DateTime date, String dateType, Boolean HasTime, String timeType = "R")
    {
        if (date == null || String.IsNullOrWhiteSpace(date.ToString())) return "---";
        Persia.SolarDate solarDate = Persia.Calendar.ConvertToPersian(date);
        if (HasTime)
        {return solarDate.ToString(dateType + "," + timeType);}
        else
        {return solarDate.ToString(dateType);}
    }
    public static String getPersiaDate(String date, String dateType, Boolean HasTime, String timeType = "R")
    {
        if (date == null || String.IsNullOrWhiteSpace(date.ToString())) return "---";
        Persia.SolarDate solarDate = Persia.Calendar.ConvertToPersian(DateTime.Parse(date));
        if (HasTime)
        { return solarDate.ToString(dateType + "," + timeType); }
        else
        { return solarDate.ToString(dateType); }
    }
    public static DateTime getGregorianDate(int year, int month, int day, int hour, int minute, int second, Persia.DateType dateType)
    {
        return Persia.Calendar.ConvertToGregorian(year, month, day, hour, minute, second, dateType);
    }
    public static DateTime getGregorianDate(String date)
    {
        int year = int.Parse(date.Substring(0, 4));
        int month = int.Parse(date.Substring(5,2));
        int day = int.Parse(date.Substring(8, 2));        
        return Persia.Calendar.ConvertToGregorian(year, month, day, Persia.DateType.Persian);
    }
    public static DateTime getGregorianDate(Persia.SolarDate solarDate)
    {
        return Persia.Calendar.ConvertToGregorian(solarDate);
    }
    public static String getPersianNumberStyle(object value)
    {
        return Persia.PersianWord.ToPersianString(value);
    }
    public static String getLatinNumberStyle(String value)
    {
        return Persia.PersianWord.ConvertToLatinNumber(value);
    }
    
    //private static PerDate perDate;
    //public static String getFarsiDate(DateTime date, Boolean shortDate, Boolean withTime)
    //{
    //    if (date == null || String.IsNullOrWhiteSpace(date.ToString())) return "---";
    //    String time = date.Hour + ":" + date.Minute + ":" + date.Second;
    //    String result = "";
    //    if (shortDate == true)
    //    {
    //        PerDate Farsi = new PerDate();
    //        Farsi.DisplyFormat = "YY;/;mm;/;dd";
    //        result = Farsi.FullDate(Farsi.GetPersianDate(date));
    //        if (withTime)
    //        {
    //            result += " ساعت: " + time;
    //        }
    //    }
    //    else
    //    {
    //        PerDate Farsi = new PerDate();
    //        Farsi.DisplyFormat = "dn;dd;MM;سال;yy";
    //        result = Farsi.GetPersianDate(date);
    //        if (withTime)
    //        {
    //            result += " ساعت: " + time;
    //        }
    //    }
    //    return result;
    //}
    //public static String getFarsiDate(Object date, Boolean shortDate, Boolean withTime)
    //{
    //    String result = "";
    //    if (date == null || String.IsNullOrWhiteSpace(date.ToString())) return "---";
    //    DateTime _date = DateTime.Parse(date.ToString());
    //    String time = _date.Hour + ":" + _date.Minute + ":" + _date.Second;
    //    if (shortDate == true)
    //    {
    //        PerDate Farsi = new PerDate();
    //        Farsi.DisplyFormat = "YY;/;mm;/;dd";
    //        result = Farsi.FullDate(Farsi.GetPersianDate(_date));
    //        if (withTime)
    //        {
    //            result += " ساعت: " + time;
    //        }
    //    }
    //    else
    //    {
    //        PerDate Farsi = new PerDate();
    //        Farsi.DisplyFormat = "dn;dd;MM;سال;YY";
    //        result = Farsi.GetPersianDate(_date);
    //        if (withTime)
    //        {
    //            result += " ساعت: " + time;
    //        }
    //    }
    //    return result;
    //}

    //private static String[] splitDate(String date)
    //{
    //    String[] strTemp = new String[3];
    //    strTemp = date.Split(perDate.SeparatorChar);
    //    if ((strTemp == null) || (strTemp[0].Length == 0 || strTemp[0] == null) || (strTemp[2].Length == 0 || strTemp[2] == null) || (strTemp[2].Length == 0 || strTemp[2] == null))
    //        throw new InvalidDateException("تاریخ وارد شده معتبر نیست");
    //    return strTemp;
    //}
    //private static DateTime _toGregorian(String date, Calendar Cal)
    //{
    //    string[] strTemp = new string[3];
    //    if (!perDate.IsFullDate(date))
    //        date = perDate.FullDate(date);
    //    if (!perDate.IsValidDate(date))
    //        throw new InvalidDateException("تاریخ وارد شده معتبر نیست");
    //    strTemp = splitDate(date);
    //    return Cal.ToDateTime(int.Parse(strTemp[0], CultureInfo.InvariantCulture), int.Parse(strTemp[1], CultureInfo.InvariantCulture), int.Parse(strTemp[2], CultureInfo.InvariantCulture), 0, 0, 0, 0);
    //}

    ///// <summary>
    ///// تابعی برای تبدیل تاریخ شمسی به میلادی
    ///// </summary>
    ///// <param name="date">تاریخ شمسی</param>
    ///// <returns>رشته ای شامل تاریخ میلادی</returns>
    //public static DateTime ToGregorian(String date)
    //{
    //    perDate = new PerDate();
    //    DateTime miladi = _toGregorian(date, new PersianCalendar());
    //    return miladi;
    //    //return miladi.Year.ToString(CultureInfo.InvariantCulture) + perDate.SeparatorChar + miladi.Month.ToString(CultureInfo.InvariantCulture) + perDate.SeparatorChar + miladi.Day.ToString(CultureInfo.InvariantCulture);
    //}
}