using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_RSSManagement : System.Web.UI.UserControl
{
    private void RefereshGridView()
    {
        gv_RSS.DataSource = DAL.RSSFeed_LoadAllFeed();
        gv_RSS.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ddlRSSSearch.DataSource = DAL.RSSOther_LoadRssSubjects();
            ddlRSSSearch.DataTextField = "RSSOther_Subject";
            ddlRSSSearch.DataValueField = "RSSOther_ID";
            ddlRSSSearch.DataBind();
            ddlRSSSearch.Items.Add("همه موضوعات");
        }
        catch
        {
            ddlRSSSearch.Items.Add("موردی یافت نشد");
        }
        if (!IsPostBack)
        {
            RefereshGridView();
        }
    }
    protected void gv_RSS_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RSS.PageIndex = e.NewPageIndex;
        gv_RSS.EditIndex = -1;
        gv_RSS.SelectedIndex = -1;
    }
    protected void gv_RSS_PageIndexChanged(object sender, EventArgs e)
    {
        RefereshGridView();
    }
    protected void btn_RssDelete_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    foreach (GridViewRow row in gv_RSS.Rows)
        //    {
        //        if (row.RowType == DataControlRowType.DataRow)
        //        {
        //            //if(((CheckBox)row.FindControl("CheckBox_Delete")).Checked == true) 
        //            CheckBox cbDelete = (CheckBox)row.FindControl("cbDelete");

        //            if (cbDelete != null)
        //            {
        //                if (cbDelete.Checked)
        //                {
        //                    Label lbl_RssID = (Label)row.FindControl("lbl_RssID");
        //                    DAL.RssFeed_DeleteByID(int.Parse(lbl_RssID.Text));
        //                    RefereshGridView();
        //                }
        //            }
        //        }
        //    }
        //}
        //catch (Exception ex)
        //{
        //    lbl_Warning.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        //}
    }
}