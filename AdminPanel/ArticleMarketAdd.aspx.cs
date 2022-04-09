using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_ArticleMarketAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void InsertArticleMarket(String articleType, String articleUnit,
                String articleAttribute, Boolean articleBuy, Boolean articleSale, String articleCost, Boolean articleStatus)
    {
        DAL.Economic_InsertArticle(articleType, articleUnit, articleAttribute, articleBuy, articleSale, articleCost, articleStatus);
    }
}