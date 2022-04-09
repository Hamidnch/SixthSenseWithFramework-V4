using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ArticleMarketAdd : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true);
    }
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    }  
}