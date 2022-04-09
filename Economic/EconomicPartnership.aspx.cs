using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class Economic_EconomicPartnership : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static string Result(string controlName)
    {
        return RenderControl(controlName);
    }

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
    [WebMethod]
    public static String RegisterArticleOrder(int articleID, Boolean orderType,
            Int32 orderValue, Int32 suggestCost, String address, String phone, String email)
    {
        try
        {
            DAL.Economic_RegisterArticleOrder(articleID, orderType,
            orderValue, suggestCost, address, phone, email);
            return "ثبت سفارش با موفقیت انجام پذیرفت";
        }
        catch
        {
            return "بروز خطا";
        }
    }
    [WebMethod]
    public static String GetArticleType(int articleID)
    {
        ArticleInfo articleInfo = new ArticleInfo();
        articleInfo = DAL.Economic_GetArticleInfoByID(articleID);
        return articleInfo.Article_Type;
    }
}