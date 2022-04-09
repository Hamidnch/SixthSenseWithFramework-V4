using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Specialized;
using System.Collections;
using System.Text;
using System.Globalization;
namespace Utils
{   
    public class QueryString : NameValueCollection
    {
        private string document;
        public string Document
        {get{return document;}}
        public QueryString(){}
        public QueryString(NameValueCollection clone): base(clone){}
        public static QueryString FromCurrent()
        {
            return FromUrl(HttpContext.Current.Request.Url.AbsoluteUri);
        }
        public static QueryString FromUrl(string url)
        {
            // added per Richard's comment
            url = HttpUtility.UrlDecode(url);
            string[] parts = url.Split("?".ToCharArray());
            QueryString qs = new QueryString();
            qs.document = parts[0];
            if (parts.Length == 1)
                return qs;
            string[] keys = parts[1].Split("&".ToCharArray());
            foreach (string key in keys)
            {
                string[] part = key.Split("=".ToCharArray());
                if (part.Length == 1)
                    qs.Add(part[0], "");
                qs.Add(part[0], part[1]);
            }
            return qs;
        }
        public void ClearAllExcept(string except)
        {
            ClearAllExcept(new string[] { except });
        }
        public void ClearAllExcept(string[] except)
        {
            ArrayList toRemove = new ArrayList();
            foreach (string s in this.AllKeys)
            {
                foreach (string e in except)
                {
                    if (s.ToLower() == e.ToLower())
                        if (!toRemove.Contains(s))
                            toRemove.Add(s);
                }
            }
            foreach (string s in toRemove)
                this.Remove(s);
        }
        public override void Add(string name, string value)
        {
            if (this[name] != null)
                this[name] = value;
            else
                base.Add(name, value);
        }
        public override string ToString()
        {
            return ToString(false);
        }
        public string ToString(bool includeUrl)
        {
            string[] parts = new string[this.Count];
            string[] keys = this.AllKeys;
            for (int i = 0; i < keys.Length; i++)
                parts[i] = keys[i] + "=" + this[keys[i]];
            string url = String.Join("&", parts);
            url = HttpUtility.UrlEncode(url);
            if ((url != null || url != String.Empty) && !url.StartsWith("?"))
                url = "?" + url;
            if (includeUrl)
                url = this.document + url;

            return url;
        }
    }
    /// <summary>
    /// Ecerypt QueryString
    /// </summary>
    public class QueryStringEncription
    {
        public QueryStringEncription(){}
        public static QueryString EncryptQueryString(QueryString queryString)
        {
            QueryString newQueryString = new QueryString();
            string nm = String.Empty;
            string val = String.Empty;
            foreach (string name in queryString)
            {
                nm = name;
                val = queryString[name];
                newQueryString.Add(QueryStringEncription.Hex(nm), QueryStringEncription.Hex(val));
            }
            return newQueryString;
        }
        public static QueryString DecryptQueryString(QueryString queryString)
        {
            QueryString newQueryString = new QueryString();
            string nm;
            string val;
            foreach (string name in queryString)
            {
                nm = QueryStringEncription.DeHex(name);
                val = QueryStringEncription.DeHex(queryString[name]);
                newQueryString.Add(nm, val);
            }
            return newQueryString;
        }
        public static string DeHex(string hexstring)
        {
            string ret = String.Empty;
            StringBuilder sb = new StringBuilder(hexstring.Length / 2);
            for (int i = 0; i <= hexstring.Length - 1; i = i + 2)
            {
                sb.Append((char)int.Parse(hexstring.Substring(i, 2), NumberStyles.HexNumber));
            }
            return sb.ToString();
        }
        public static string Hex(string sData)
        {
            string temp = String.Empty; ;
            string newdata = String.Empty;
            StringBuilder sb = new StringBuilder(sData.Length * 2);
            for (int i = 0; i < sData.Length; i++)
            {
                if ((sData.Length - (i + 1)) > 0)
                {
                    temp = sData.Substring(i, 2);
                    if (temp == @"\n") newdata += "0A";
                    else if (temp == @"\b") newdata += "20";
                    else if (temp == @"\r") newdata += "0D";
                    else if (temp == @"\c") newdata += "2C";
                    else if (temp == @"\\") newdata += "5C";
                    else if (temp == @"\0") newdata += "00";
                    else if (temp == @"\t") newdata += "07";
                    else
                    {
                        sb.Append(String.Format("{0:X2}", (int)(sData.ToCharArray())[i]));
                        i--;
                    }
                }
                else
                {
                    sb.Append(String.Format("{0:X2}", (int)(sData.ToCharArray())[i]));
                }
                i++;
            }
            return sb.ToString();
        }
    }
}