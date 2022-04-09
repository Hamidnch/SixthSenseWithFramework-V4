using System;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class Sport_Sport_SelectSettle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){}
    [WebMethod]
    public static string Result(string controlName)
    {return RenderControl(controlName);}
    public static string RenderControl(string controlName)
    {
        Page page = new Page();
        UserControl userControl = (UserControl)page.LoadControl(controlName);
        userControl.EnableViewState = false;
        HtmlForm form = new HtmlForm();
        form.Controls.Add(userControl);
        page.Controls.Add(form);
        StringWriter textWriter = new StringWriter();
        HttpContext.Current.Server.Execute(page, textWriter, false);
        return textWriter.ToString();
    }
}