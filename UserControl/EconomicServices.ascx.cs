using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class UserControl_EconomicServices : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //PlaceHolder1.Controls.Clear();
        //UserControl uc = (UserControl)Page.LoadControl("~/UserControl/ContactUs.ascx");
        //uc.ID = new Guid().ToString();
        //PlaceHolder1.Controls.Add(uc);
    }
    //protected void Page_PreRender(object sender, EventArgs e)
    //{
    //    ClientScriptManager csm = Page.ClientScript;

    //    csm.RegisterClientScriptInclude("verticalscroll", ResolveClientUrl("~/Scripts/jquery-1.4.4.js"));
    //    csm.RegisterClientScriptInclude("verticalscroll", ResolveClientUrl("~/Scripts/jquery-ui-1.8.6.custom.min.js"));
    //}
}