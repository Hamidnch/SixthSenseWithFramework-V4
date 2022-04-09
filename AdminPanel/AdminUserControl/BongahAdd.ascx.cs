using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_BongahAdd : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true);
        }
        catch
        {
            lblDate.Text = "";
        }
    }
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    } 
    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/BongahManagement.aspx");
    }
}