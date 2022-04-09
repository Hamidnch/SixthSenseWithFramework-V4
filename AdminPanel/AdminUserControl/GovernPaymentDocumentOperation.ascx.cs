using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_GovernPaymentDocumentOperation : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        gv_governPaymentDocuments.DataSource = DAL.Sport_LoadAllPaymentDocumentsByBoxKind(2);
        gv_governPaymentDocuments.DataBind();
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
            gv_governPaymentDocuments.DataSource = DAL.Sport_GetPaymentDocumentsByBoxKindAndDate(2, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
            gv_governPaymentDocuments.DataBind();
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
    protected void gv_governPaymentDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_governPaymentDocuments.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gv_governPaymentDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        long PaymentDoc_ID = Convert.ToInt64(e.CommandArgument);

        if (e.CommandName == "Payment_Show")
        {
            lbl_PaymentDocID.Text = Convert.ToString(PaymentDoc_ID);

            string regDate = "";
            string comment = "";
            string authorName = "";
            DAL.Sport_GetPaymentDocumentsHeaderInfoByDocID(PaymentDoc_ID, out regDate, out comment, out authorName);
            show_RegDate.InnerText = PersianClass.getPersiaDate(regDate, "D", false);
            show_Comment.InnerText = comment;
            show_AutorName.InnerText = authorName;

            gv_ShowPayment.DataSource = DAL.Sport_GetAllDocumentsByPaymentDocIDAndBoxKind(2, PaymentDoc_ID);
            gv_ShowPayment.DataBind();
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "unBlock", "$.unblockUI();", true);
        }
    }
    protected void gv_governPaymentDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem == null)
            return;
        ImageButton img_Show = (ImageButton)e.Row.FindControl("img_Show");
        img_Show.OnClientClick = @"$('#dialog-showPayment').dialog('open');";
    }
}