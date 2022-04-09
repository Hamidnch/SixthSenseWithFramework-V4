using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_CharitableReceiptDocumentOperation : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        gv_CharitableReceiptDocuments.DataSource = DAL.Sport_LoadAllReceiptDocumentsByBoxKind(3);
        gv_CharitableReceiptDocuments.DataBind();
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        if (pdp_StartDate.Text != "" && pdp_EndDate.Text != "")
        {
            gv_CharitableReceiptDocuments.DataSource = DAL.Sport_GetReceiptDocumentsByBoxKindAndDate(3, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
            gv_CharitableReceiptDocuments.DataBind();
        }
        else
        {
            BindData();
        }
    }
    protected void btn_Refersh_Click(object sender, EventArgs e)
    {
        BindData();
    }
    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/BoxesOperation.aspx");
    }
    protected void gv_CharitableReceiptDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_CharitableReceiptDocuments.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gv_CharitableReceiptDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem == null)
            return;
        ImageButton img_Show = (ImageButton)e.Row.FindControl("img_Show");
        img_Show.OnClientClick = @"$('#dialog-showReceipt').dialog('open');";
    }
    protected void gv_CharitableReceiptDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        long ReceiptDoc_ID = Convert.ToInt64(e.CommandArgument);

        if (e.CommandName == "receipt_Show")
        {
            lbl_ReceiptDocID.Text = Convert.ToString(ReceiptDoc_ID);

            string regDate = "";
            string comment = "";
            string authorName = "";
            DAL.Sport_GetReceiptDocumentsHeaderInfoByDocID(ReceiptDoc_ID, out regDate, out comment, out authorName);
            show_RegDate.InnerText = PersianClass.getPersiaDate(DateTime.Parse(regDate), "D", false);
            show_Comment.InnerText = comment;
            show_AutorName.InnerText = authorName;

            gv_ShowReceipt.DataSource = DAL.Sport_GetAllDocumentsByReceiptDocIDAndBoxKind(3, ReceiptDoc_ID);
            gv_ShowReceipt.DataBind();
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "unBlock", "$.unblockUI();", true);
        }
    }
}