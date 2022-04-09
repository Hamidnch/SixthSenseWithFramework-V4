using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_SportTeamAdd : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        ddl_TeamCountry.Items.Clear();
        ddl_TeamCountry.DataSource = DAL.LoadAllCountriesHelper();
        ddl_TeamCountry.DataValueField = "Country_ID";
        ddl_TeamCountry.DataTextField = "Country_Name";
        ddl_TeamCountry.DataBind();
        ddl_TeamCountry.Items.Insert(0, new ListItem("انتخاب کنید...", "-1"));
        txt_TeamName.Focus();
    }
}