using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_EconomicBongah : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridViewInvesting.DataSource = DAL.Economic_LoadAllBongah();
        GridViewInvesting.DataBind();
    }
}