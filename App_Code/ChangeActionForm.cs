using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text.RegularExpressions;

public class cdsnetFormActionModifier : Stream
{
    private Stream _sink;
    private long _position;
    string _url;
    public cdsnetFormActionModifier(Stream sink, string url)
    {
        _sink = sink;
        _url = "$1" + url + "$3";
    }

    public override bool CanRead
    {
        get { return true; }
    }

    public override bool CanSeek
    {
        get { return true; }
    }

    public override bool CanWrite
    {
        get { return true; }
    }

    public override long Length
    {
        get { return 0; }
    }

    public override long Position
    {
        get { return _position; }
        set { _position = value; }
    }

    public override long Seek(long offset, System.IO.SeekOrigin direction)
    {
        return _sink.Seek(offset, direction);
    }

    public override void SetLength(long length)
    {
        _sink.SetLength(length);
    }

    public override void Close()
    {
        _sink.Close();
    }

    public override void Flush()
    {
        _sink.Flush();
    }

    public override int Read(byte[] buffer, int offset, int count)
    {
        return _sink.Read(buffer, offset, count);
    }

    public override void Write(byte[] buffer, int offset, int count)
    {
        string s = System.Text.UTF8Encoding.UTF8.GetString(buffer, offset, count);
        Regex reg = new Regex("(<form.*action=\")([^\"]*)" +
                              "(\"[^>]*>)", RegexOptions.IgnoreCase);
        Match m = reg.Match(s);
        if (m.Success)
        {
            string form = reg.Replace(m.Value, _url);
            int iform = m.Index;
            int lform = m.Length;
            s = s.Substring(0, iform) + form + s.Substring(iform + lform);
        }
        byte[] yaz = System.Text.UTF8Encoding.UTF8.GetBytes(s);
        _sink.Write(yaz, 0, yaz.Length);
    }
}