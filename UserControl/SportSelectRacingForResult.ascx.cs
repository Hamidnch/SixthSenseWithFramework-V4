using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Utils;

public partial class UserControl_SportSelectRacingForResult : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {        
       // if (Request.QueryString["rd"].ToString() != null)
        QueryString qs = QueryString.FromCurrent(); 
        if(qs != null)
        {
          //  String racingInfo_ID = Request.QueryString["racingInfoID"].ToString();
            QueryString qsdec = Utils.QueryStringEncription.DecryptQueryString(qs);
            int race_ID = int.Parse(qsdec[0]);
     
           // int race_ID = int.Parse(Request.QueryString["rd"].ToString());
            dl_SelectRacingForResult.DataSource = DAL.Sport_GetAllRacingInfoByRaceID(race_ID);
            dl_SelectRacingForResult.DataBind();
            if (!IsPostBack)
            {
                ddl_Racing.DataSource = DAL.LoadAllRaceTitles();
                ddl_Racing.DataTextField = "Race_Title";
                ddl_Racing.DataValueField = "Race_ID";
                ddl_Racing.DataBind();
                ddl_Racing.SelectedValue = race_ID.ToString();
            }
        }
    }
    //protected void btn_Exit_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Sport/SportRacingTitles.aspx");
    //}
    protected void ddl_Racing_SelectedIndexChanged(object sender, EventArgs e)
    { 
        int race_ID = int.Parse(ddl_Racing.SelectedValue);
        dl_SelectRacingForResult.DataSource = DAL.Sport_GetAllRacingInfoByRaceID(race_ID);
        dl_SelectRacingForResult.DataBind();
    }
    protected void dl_SelectRacingForResult_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HtmlGenericControl fld_Goto = (HtmlGenericControl)e.Item.FindControl("fld_Goto");
            Label lbl_RacingInfoID = (Label)e.Item.FindControl("lbl_RacingInfoID");

            QueryString myQueryString = new QueryString();
            myQueryString.Add("racingInfoID", lbl_RacingInfoID.Text);
            string strRedirect = "Sport_RacingResultSelected.aspx";
            QueryString qsEncrypted = Utils.QueryStringEncription.EncryptQueryString(myQueryString);
            strRedirect += qsEncrypted.ToString();
            //Response.Redirect(strRedirect, true);	
           // fld_Goto.Attributes.Add("onclick", "window.location.href='" + strRedirect + "'");;
            fld_Goto.Attributes.Add("onclick", "window.location.href='Sport_RacingResultSelected.aspx" + qsEncrypted + "'");
        }
    }
}