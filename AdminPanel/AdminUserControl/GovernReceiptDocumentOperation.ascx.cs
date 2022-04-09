using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_GovernReceiptDocumentOperation : System.Web.UI.UserControl
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
        gv_governReceiptDocuments.DataSource = DAL.Sport_LoadAllReceiptDocumentsByBoxKind(2);
        gv_governReceiptDocuments.DataBind();
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        if (pdp_StartDate.Text != "" && pdp_EndDate.Text != "")
        {
            gv_governReceiptDocuments.DataSource = DAL.Sport_GetReceiptDocumentsByBoxKindAndDate(2, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
            gv_governReceiptDocuments.DataBind();
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
    protected void gv_governReceiptDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_governReceiptDocuments.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gv_governReceiptDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem == null)
            return;
        ImageButton img_Show = (ImageButton)e.Row.FindControl("img_Show");
        img_Show.OnClientClick = @"$('#dialog-showReceipt').dialog('open');";
    }
    protected void gv_governReceiptDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        long ReceiptDoc_ID = Convert.ToInt64(e.CommandArgument);

        if (e.CommandName == "receipt_Show")
        {
            lbl_ReceiptDocID.Text = Convert.ToString(ReceiptDoc_ID);

            string regDate = "";
            string comment = "";
            string authorName = "";
            DAL.Sport_GetReceiptDocumentsHeaderInfoByDocID(ReceiptDoc_ID, out regDate, out comment, out authorName);
            show_RegDate.InnerText = PersianClass.getPersiaDate(regDate, "D", false);
            show_Comment.InnerText = comment;
            show_AutorName.InnerText = authorName;

            gv_ShowReceipt.DataSource = DAL.Sport_GetAllDocumentsByReceiptDocIDAndBoxKind(2, ReceiptDoc_ID);
            gv_ShowReceipt.DataBind();
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "unBlock", "$.unblockUI();", true);
        }
    }
}