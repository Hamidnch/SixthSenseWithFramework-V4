using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class EconomicAnalysisManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void DelAnalysis(List<String> selectedIds)
    {
        try
        {
            foreach (String item in selectedIds)
            {
                DAL.Analysis_DeleteByID(int.Parse(item.Trim()));
            }
        }
        catch
        {
        }
    }
    [WebMethod]
    public static AnalysisInfo GetAnalysisInfo(String analysisID)
    {
        return DAL.GetAnalysisByID(int.Parse(analysisID.Trim()));
    }
    [WebMethod]
    public static void UpdateAnalysisInfo(String analysisID,String analysis_Title,
                String analysis_Context, Boolean analysis_Status)
    {
        DAL.Economic_UpdateAnalysis(int.Parse(analysisID), analysis_Title, analysis_Context, analysis_Status);
    }
}