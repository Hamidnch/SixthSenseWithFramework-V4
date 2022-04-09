using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class UserControl_EconomicAnalysis : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gv_EconomicAnalysisTitle.DataSource = DAL.Economic_LoadAllAnalysis(false);
        gv_EconomicAnalysisTitle.DataBind();
        gv_EconomicAnalysisContext.DataSource =  DAL.Economic_LoadAllAnalysis(false);
        gv_EconomicAnalysisContext.DataBind();
    }
}