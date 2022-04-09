using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_ArticleMarketManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void UpdateArticleInfo(int articleId, String articleType, String articleUnit,
                    String articleAttribute, Boolean articleBuy, Boolean articleSale, String articleCost, Boolean articleStatus)
    {
        DAL.Economic_UpdateArticleInfo(articleId, articleType, articleUnit, articleAttribute,
                    articleBuy, articleSale, articleCost, articleStatus);
    }
    //[WebMethod]
    //public static void DeleteArticleByID(int articleId)
    //{
    //    DAL.Economic_DeleteArticleByID(articleId);
    //}
    [WebMethod]
    public static void DeleteArticleByID(List<String> selectedIds)
    {
        try
        {
            foreach (String item in selectedIds)
            {
                DAL.Economic_DeleteArticleByID(int.Parse(item.Trim()));
            }
        }
        catch
        {
        }
    }
    [WebMethod]
    public static ArticleInfo GetArticleInfo(int articleId)
    {
        return DAL.Economic_GetArticleInfoByID(articleId);
    }
}