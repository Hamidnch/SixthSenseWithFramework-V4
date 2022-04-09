using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ArticleMarketManagement : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ReferehsGridView();
    }
    private void ReferehsGridView()
    {
        gv_ArticleMarket.DataSource = DAL.Economic_LoadAllArticleMarket();
        gv_ArticleMarket.DataBind();
    }
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    }
}