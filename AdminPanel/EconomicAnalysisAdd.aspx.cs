using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_EconomicAnalysisAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static String InsertAnalysis(String analysisTitle, String analysisContext, Boolean analysisStatus)
    {
        try
        {
            DAL.Economic_InsertAnalysis(analysisTitle, analysisContext, analysisStatus);
            return "تحلیل مورد نظر ثبت گردید";
        }
        catch
        {
            return "خطا در ثبت عملیات به وقوع پیوست";
        }
    }
}