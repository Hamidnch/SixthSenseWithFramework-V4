using System;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_NewsManagement : System.Web.UI.UserControl
{
    //protected string SortExpression
    //{
    //    get
    //    {
    //        return ViewState["SortExpression"] as string;
    //    }
    //    set
    //    {
    //        ViewState["SortExpression"] = value;
    //    }
    //}

    //protected SortDirection SortDirection
    //{
    //    get
    //    {
    //        object o = ViewState["SortDirection"];
    //        if (o == null)
    //            return SortDirection.Ascending;
    //        else
    //            return (SortDirection)o;
    //    }
    //    set
    //    {
    //        ViewState["SortDirection"] = value;
    //    }
    //}
    private void RefreshGridNews()
    {
        GridView_ManagementNews.DataSource = DAL.News_LoadAllNews();
        GridView_ManagementNews.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //String scriptContext = "CKEDITOR.replace('" + txt_NewsContext.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl',height : '150px',});";
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "EditorContext", scriptContext, true);
        if (!IsPostBack)
        {
            RefreshGridNews();
        }
        //Page.ClientScript.RegisterClientScriptInclude("selective", ResolveUrl(@"..\ckeditor/ckeditor.js"));
    }
    protected void GridView_ManagementNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_ManagementNews.PageIndex = e.NewPageIndex;
        GridView_ManagementNews.EditIndex = -1;
        GridView_ManagementNews.SelectedIndex = -1;
    }
    protected void GridView_ManagementNews_PageIndexChanged(object sender, EventArgs e)
    {
        RefreshGridNews();
    }
    protected void btn_DeleteNews_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in GridView_ManagementNews.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    //if(((CheckBox)row.FindControl("CheckBox_Delete")).Checked == true) 
                    CheckBox cbDelete = (CheckBox)row.FindControl("cbDelete");

                    if (cbDelete != null)
                    {
                        if (cbDelete.Checked)
                        {
                            Label lblNewsID = (Label)row.FindControl("lblNewsID");
                            DAL.News_DeleteByID(int.Parse(lblNewsID.Text));
                            RefreshGridNews();
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lbl_Msg.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }
}