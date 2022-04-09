using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Economic_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        currentModule = "EconomicArticleMarket";
        if (!string.IsNullOrEmpty(currentModule))
            addModule(currentModule);
    }
    public string currentModule
    {
        get
        {
            return (string)ViewState["moduleName"];
        }

        set
        {
            ViewState["moduleName"] = value;
        }
    }
    public void addModule(object moduleName)
    {
        PlaceHolder1.Controls.Clear();
        UserControl uCtrl = (UserControl)Page.LoadControl(string.Format("~/UserControl/{0}.ascx", moduleName));
        uCtrl.ID = new Guid().ToString();
        PlaceHolder1.Controls.Add(uCtrl);
        currentModule = moduleName.ToString();
    }
    protected void btn_Article_Click(object sender, EventArgs e)
    {
        currentModule = "EconomicArticleMarket";
        addModule(currentModule);
    }
    protected void btn_Bongah_Click(object sender, EventArgs e)
    {
        currentModule = "EconomicBongah";
        addModule(currentModule);
    }
}