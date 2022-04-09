using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_RewardReceiptDocumentOperation : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    public void BindData()
    {
        gv_rewardReceiptDocuments.DataSource = DAL.Sport_LoadAllReceiptDocumentsForUsersRewardByBoxKind(4);
        gv_rewardReceiptDocuments.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        if (pdp_StartDate.Text != "" && pdp_EndDate.Text != "")
        {
            gv_rewardReceiptDocuments.DataSource = DAL.Sport_GetReceiptDocumentsForUsersRewardByBoxKindAndDate(4, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
            gv_rewardReceiptDocuments.DataBind();
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
    protected void gv_rewardReceiptDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_rewardReceiptDocuments.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gv_rewardReceiptDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem == null)
            return;
        ImageButton img_Show = (ImageButton)e.Row.FindControl("img_Show");
        img_Show.OnClientClick = @"$('#dialog-showReceipt').dialog('open');";
    }
    protected void gv_rewardReceiptDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
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

            gv_ShowReceipt.DataSource = DAL.Sport_GetAllDocumentsByReceiptDocIDAndBoxKind(4, ReceiptDoc_ID);
            gv_ShowReceipt.DataBind();
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "unBlock", "$.unblockUI();", true);
        }
    }
}