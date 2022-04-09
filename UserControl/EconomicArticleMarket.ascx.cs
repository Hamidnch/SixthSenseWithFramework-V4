using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_EconomicArticleMarket : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            GridViewArticle.DataSource = DAL.Economic_LoadAllArticleMarket();
            GridViewArticle.DataBind();
        }
        catch
        {
            throw new Exception("Error");
        }
    }
}