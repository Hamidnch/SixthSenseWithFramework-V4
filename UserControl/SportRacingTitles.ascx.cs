using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Utils;

public partial class UserControl_SportRacingTitles : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        dl_SportRacingTitles.DataSource = DAL.LoadAllRaceTitles();
        dl_SportRacingTitles.DataBind();
    }
    //protected void btn_Exit_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Sport/Sport_Home.aspx");
    //}
    protected void dl_SportRacingTitles_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HtmlGenericControl fld_RacingTitle = (HtmlGenericControl)e.Item.FindControl("fld_RacingTitle");
            Label lbl_RaceID = (Label)e.Item.FindControl("lbl_RaceID");
            QueryString myQueryString = new QueryString();
            myQueryString.Add("rd", lbl_RaceID.Text);
            QueryString qsEncrypted = Utils.QueryStringEncription.EncryptQueryString(myQueryString);
            fld_RacingTitle.Attributes.Add("onclick", "window.location.href='Sport_SelectRacingForResult.aspx" + qsEncrypted + "'");
        }
    }
}