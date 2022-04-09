using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Utils;

public partial class UserControl_SportClassificationTable : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //  if (!Page.IsPostBack)
      //  {
            dl_ClassificationTable.DataSource = DAL.Sport_LoadAllClassificationTable();
            dl_ClassificationTable.DataBind();
      //  }
    }
    protected void dl_ClassificationTable_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //  HtmlGenericControl fld_RacingTitle = (HtmlGenericControl)e.Item.FindControl("fld_ClassificationTable");
            //  Label lbl_RaceID = (Label)e.Item.FindControl("lbl_ClassificationTable_ID");
            // QueryString myQueryString = new QueryString();
            // myQueryString.Add("rd", lbl_RaceID.Text);
            //  QueryString qsEncrypted = Utils.QueryStringEncription.EncryptQueryString(myQueryString);
            // fld_RacingTitle.Attributes.Add("onclick", "window.location.href='Sport_SelectRacingForResult.aspx" + qsEncrypted + "'");
        }
    }
}