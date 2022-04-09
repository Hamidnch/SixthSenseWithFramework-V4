using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_SportSelectSettle : System.Web.UI.UserControl
{
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {                
    }
    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Sport/Sport_SelectRacing.aspx");
    }
}