using System;
using System.Text;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Data;
using System.Xml;
using System.Configuration;
using System.Web;

/// <summary>
/// Summary description for BLL
/// </summary>
public class BLL
{
    public BLL(){}
    //public static void DownloadFolder(string path, HttpResponse res)
    //{
    //    // cleat the response so we don't send any unwanted data to user  
    //    res.Clear();
    //    // set the content type ZIP file  
    //    res.ContentType = "application/zip";
    //    // setting Content-Disposition to attachement causes the save dialog of the   
    //    // browser to be shown. We also can set the name of the zip file in this header  
    //    res.AppendHeader("Content-Disposition", "attachment; filename=Download.zip;");
    //    // it is very important to set BufferOutput to false. Default behavior is to buffer  
    //    // the output before sending it to client and this is not the behavior we want  
    //    res.BufferOutput = false;
    //    // flush the response so user will get the save dialog as soon as possible  
    //    res.Flush();
        
    //    // FastZip is the easies way to zip all the file and folders in the  
    //    // path and stream it through the Response OutputStream  
    //    ICSharpCode.SharpZipLib.Zip.FastZip fz = new ICSharpCode.SharpZipLib.Zip.FastZip();
    //    fz.CreateZip(res.OutputStream, path, true, null, null);
    //}

    public static string Encrypt(string cleanString)
    {
        Byte[] clearBytes = new UnicodeEncoding().GetBytes(cleanString);
        Byte[] hashedBytes = ((HashAlgorithm)CryptoConfig.CreateFromName("MD5")).ComputeHash(clearBytes);
        return BitConverter.ToString(hashedBytes);
    }
    public static DateTime GetIranDateTime()
    {
        TimeZoneInfo timeZoneInfo;
        DateTime currentDate = new DateTime();
        timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Iran Standard Time");
        TimeSpan ts = new TimeSpan();
        ts = TimeSpan.Parse(ConfigurationManager.AppSettings["DefaultTimeZone"]);
        currentDate = TimeZoneInfo.ConvertTime(DateTime.UtcNow.Add(ts).AddMinutes(-4).AddSeconds(-26), timeZoneInfo);
        return currentDate;

        ////Get date and time in Iran Standard Time
        ////dateTime = TimeZoneInfo.ConvertTime(DateTime.UtcNow.AddHours(-3).AddMinutes(-34), timeZoneInfo);
        ////dateTime = TimeZoneInfo.ConvertTime(DateTime.UtcNow.AddHours(-9).AddMinutes(-30), timeZoneInfo);
        //dateTime = DateTime.UtcNow.ToLocalTime().Add(ts);        
        //currentDate = DateTime.UtcNow.Add(ts); 
        //currentDate = DateTime.UtcNow.AddMinutes(-450);
        //string date = pc.GetYear(DateTime.Now).ToString() + "/" + pc.GetMonth(DateTime.Now).ToString().PadLeft(2, '0') + "/" + pc.GetDayOfMonth(DateTime.Now).ToString().PadLeft(2, '0');
        //currentDate = DateTime.UtcNow.AddHours(4).AddMinutes(26).AddSeconds(30);
        //PersianCalendar pc = new PersianCalendar();
        //DateTime newDate = new DateTime(DateTime.Now.ToLocalTime().Year, DateTime.Now.ToLocalTime().Month, DateTime.Now.ToLocalTime().Day,
        //    currentDate.Hour, currentDate.Minute, currentDate.Second);
    }
    public static string GetTime()
    {
        DateTime currentDate = BLL.GetIranDateTime(); 
        string hour = (currentDate.TimeOfDay.Hours.ToString().Length == 1) ?
            '0' + currentDate.TimeOfDay.Hours.ToString() : currentDate.TimeOfDay.Hours.ToString();
        string minute = (currentDate.TimeOfDay.Minutes.ToString().Length == 1) ?
            '0' + currentDate.TimeOfDay.Minutes.ToString() : currentDate.TimeOfDay.Minutes.ToString();
        string second = (currentDate.TimeOfDay.Seconds.ToString().Length == 1) ?
            '0' + currentDate.TimeOfDay.Seconds.ToString() : currentDate.TimeOfDay.Seconds.ToString();
        return hour + ":" + minute; // + ":" + second;
    }
    public static bool IsStrictPassword(String password)
    {Boolean flag = true;if (password.Length <= 4){flag = false;}return flag;}
    public static bool IsValidFileType(string FileName)
    {
        string[] AcceptedFileTypes = new string[] { "jpg", "gif", "jpeg" };
        string ext = FileName.Substring(FileName.LastIndexOf(".") + 1, FileName.Length - FileName.LastIndexOf(".") - 1);
        for (int i = 0; i < AcceptedFileTypes.Length; i++){if (ext == AcceptedFileTypes[i]){return true;}}
        return false;
    }
    public static string CreateRandomPassword(int PasswordLength)
    {
        String _allowedChars = "abcdefghijkmnGHJKLMNOPQRSTUVWXYZ234567opqrstuoM4jBpAw39Qoo3aSGyLiYnFqi5wYSpL2vwxyzABCDEF89";
        Byte[] randomBytes = new Byte[PasswordLength];
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        rng.GetBytes(randomBytes);
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;

        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)randomBytes[i] % allowedCharCount];
        }
        return new string(chars);
    }

    //public static int CreateRandomSalt()
    //{
    //    Byte[] _saltBytes = new Byte[4];
    //    RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
    //    rng.GetBytes(_saltBytes);

    //    return ((((int)_saltBytes[0]) << 24) + (((int)_saltBytes[1]) << 16) +
    //        (((int)_saltBytes[2]) << 8) + ((int)_saltBytes[3]));
    //}   

    public static string CreateRandomPasswordUsingGUID(int length)
    {
        string guid = System.Guid.NewGuid().ToString();
        guid = guid.Replace("-", string.Empty);

        return guid.Substring(0, length);
    }
    public static string GenerateId()
    {
        long i = 1;
        foreach (byte b in Guid.NewGuid().ToByteArray())
        {
            i *= ((int)b + 1);
        }
        return string.Format("{0:x}", i - DateTime.Now.Ticks);
    }
    //public static long GenerateId()
    //{
    //    byte[] buffer = Guid.NewGuid().ToByteArray();
    //    return BitConverter.ToInt64(buffer, 0);
    //}

    public static string GetRandomPassword(int length)
    {
        char[] chars = "$%#@!*abcdefghijklmnopqrstuvwxyz1234567890?;:ABCDEFGHIJKLMNOPQRSTUVWXYZ^&".ToCharArray();
        string password = string.Empty;
        Random random = new Random();
        for (int i = 0; i < length; i++)
        {
            int x = random.Next(1, chars.Length);            //Don't Allow Repetation of Characters           
            if (!password.Contains(chars.GetValue(x).ToString()))
                password += chars.GetValue(x);
            else i--;
        }
        return password;
    }
    public static string HMAC_MD5(string key, string value)
    {
        // The first two lines take the input values and convert them from strings to Byte arrays
        byte[] HMACkey = (new System.Text.ASCIIEncoding()).GetBytes(key);
        byte[] HMACdata = (new System.Text.ASCIIEncoding()).GetBytes(value);
        // create a HMACMD5 object with the key set
        HMACMD5 myhmacMD5 = new HMACMD5(HMACkey);
        //calculate the hash (returns a byte array)
        byte[] HMAChash = myhmacMD5.ComputeHash(HMACdata);
        //loop through the byte array and add append each piece to a string to obtain a hash string
        string fingerprint = "";
        for (int i = 0; i < HMAChash.Length; i++)
        {
            fingerprint += HMAChash[i].ToString("x").PadLeft(2, '0');
        }
        return fingerprint;
    }
    public static String ExportTemplate(String StrPach)
    {
        using (StreamReader reader = File.OpenText(StrPach))
        {
            String StrEx = String.Empty;
            while (reader.Peek() != -1){StrEx += reader.ReadLine();}
            reader.Close();return StrEx;
        }
    }
    public static String SendEmail(String from, String to, String subject, String body, bool isBodyHtml, String msg)
    {
        String result = "";
        try
        {
            MailMessage newMessage = new MailMessage();
            MailAddress address = new MailAddress(HttpUtility.HtmlEncode(from));
            newMessage.From = address;
            newMessage.To.Add(to);
            newMessage.Subject = HttpUtility.HtmlEncode(subject);
            newMessage.Body = body;
            newMessage.Priority = MailPriority.Normal;
            newMessage.IsBodyHtml = isBodyHtml;
            newMessage.BodyEncoding = Encoding.UTF8;
            SmtpClient smtpClient = new SmtpClient("174.36.88.89", 25);
            NetworkCredential credentials = new NetworkCredential("mail@hesesheshom.com", "Agw42hyHr3");
            smtpClient.Credentials = credentials;
            smtpClient.Send(newMessage);
            result = msg;
        }
        catch (Exception ex)
        {
            result = "اما به دلیل خطای مقابل ايميلي براي مديريت ارسال نشد: " + ex.Message.ToString();
        }
        return result;
    }
    public static void SendEmail(string subject, String body)
    {
        SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", subject, body, true, "این خطا به مدیریت گزارش گردید");
    }
    public static void SendEmail(string subject, Exception ex)
    {
        Logger bodyLogger = new Logger();
        SendEmail("mail@hesesheshom.com", "Hamidnch2007@Gmail.Com", "Error in " + subject, bodyLogger.GetErrorString(ex) + "\n" + 
            bodyLogger.GetErrorString(ex.InnerException), true, "این خطا به مدیریت گزارش گردید");
    }
    public static DataTable GetRss(string URL, int tableNumber)
    {
        XmlTextReader reader = new XmlTextReader(URL);
        DataSet ds = new DataSet();
        ds.ReadXml(reader);
        return ds.Tables[tableNumber];
    }
    public static DataTable ConvertXmlNodeListToDataTable(XmlNodeList rssItems)
    {
        DataTable dt = new DataTable();
        int TempColumn = 0;
        foreach (XmlNode node in rssItems.Item(0).ChildNodes)
        {
            TempColumn++;
            DataColumn dc = new DataColumn(node.Name, System.Type.GetType("System.String"));
            if (dt.Columns.Contains(node.Name))
            {
                dt.Columns.Add(dc.ColumnName = dc.ColumnName + TempColumn.ToString());
            }
            else
            {
                dt.Columns.Add(dc);
            }
        }
        int ColumnsCount = dt.Columns.Count;
        for (int i = 0; i < rssItems.Count; i++)
        {
            DataRow dr = dt.NewRow();
            for (int j = 0; j < ColumnsCount; j++)
            {
                dr[j] = rssItems.Item(i).ChildNodes[j].InnerText;
            }
            dt.Rows.Add(dr);
        }
        return dt;
    }

    public static DataTable ProcessRss(String rssUrl, String node)
    {
        //String title, link, description, pubDate = "";
        WebRequest request = WebRequest.Create(rssUrl);
        WebResponse response = request.GetResponse();
        StringBuilder sb = new StringBuilder("");
        Stream rssStream = response.GetResponseStream();
        XmlDocument rssDoc = new XmlDocument();
        
        rssDoc.Load(rssStream);
        XmlNodeList rssItems = rssDoc.SelectNodes(node);        
        DataTable dt = new DataTable();
        dt = ConvertXmlNodeListToDataTable(rssItems);

        //for (int i = 0; i < rssItems.Count; i++)
        //{
        //    XmlNode node;

            
        //    node = rssItems.Item(i).SelectSingleNode("title");            
        //    XmlNodeReader xmlReader = new XmlNodeReader(node[);
        //    dt.ReadXml(xmlReader);
        //    title = (node != null) ? node.InnerText : "";
        //    node = rssItems.Item(i).SelectSingleNode("link");
        //    link = (node != null) ? node.InnerText : "";
        //    node = rssItems.Item(i).SelectSingleNode("description");
        //    description = (node != null) ? node.InnerText : "";
        //    node = rssItems.Item(i).SelectSingleNode("pubDate");
        //    pubDate = (node != null) ? node.InnerText : "";
        //    DataColumn columnTitle = new DataColumn();
        //    columnTitle.ColumnName = title;
        //    columnTitle.Caption = title;
        //    dt.Columns.Add(columnTitle);
        //    DataColumn columnLink = new DataColumn();
        //    columnLink.ColumnName = link;
        //    columnLink.Caption = link;
        //    dt.Columns.Add(columnLink);
        //    DataRow row = dt.NewRow();
            
        //}
        return dt;
    }

    //public static String Money_Clear3Digit(string number)
    //{
    //    int i = 0;
    //    string num = number;
    //    foreach (char c in num)
    //    {
    //        if (c == ',')
    //        {
    //            num = num.Remove(i, 1);
    //            i--;
    //        }
    //        i++;
    //    }
    //    return num;
    //}

    ///// <summary>  
    ///// تبديل يك يوزر كنترل به معادل اچ تي ام ال آن  
    ///// </summary>  
    ///// <param name="path">مسير يوزر كنترل</param>  
    ///// <param name="properties">ليست خواص به همراه مقادير مورد نظر</param>  
    ///// <returns></returns>  
    ///// <exception cref="NotImplementedException"><c>NotImplementedException</c>.</exception>  
    //public static string RenderUserControl(string path,
    //      List<KeyValuePair<string, object>> properties)
    //{
    //    Page pageHolder = new Page();

    //    UserControl viewControl =
    //       (UserControl)pageHolder.LoadControl(path);

    //    Type viewControlType = viewControl.GetType();

    //    foreach (var pair in properties)
    //    {
    //        PropertyInfo property =
    //           viewControlType.GetProperty(pair.Key);

    //        if (property != null)
    //        {
    //            property.SetValue(viewControl, pair.Value, null);
    //        }
    //        else
    //        {
    //            throw new NotImplementedException(string.Format(
    //               "UserControl: {0} does not have a public {1} property.",
    //               path, pair.Key));
    //        }
    //    }
    //    pageHolder.Controls.Add(viewControl);
    //    StringWriter output = new StringWriter();
    //    HttpContext.Current.Server.Execute(pageHolder, output, false);
    //    return output.ToString();
    //}
}