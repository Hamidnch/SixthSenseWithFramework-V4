using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_SiteReceiptDocumentOperation : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        gv_siteReceiptDocuments.DataSource = DAL.Sport_LoadAllReceiptDocumentsByBoxKind(1);
        gv_siteReceiptDocuments.DataBind();
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
            gv_siteReceiptDocuments.DataSource = DAL.Sport_GetReceiptDocumentsByBoxKindAndDate(1, pdp_StartDate.SelectedDateTime.Value, pdp_EndDate.SelectedDateTime.Value);
            gv_siteReceiptDocuments.DataBind();
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
    protected void gv_siteReceiptDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_siteReceiptDocuments.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gv_siteReceiptDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem == null)
           return;
        ImageButton img_Show = (ImageButton)e.Row.FindControl("img_Show");
        img_Show.OnClientClick = @"$('#dialog-showReceipt').dialog('open');";

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "show", "$('#dialog-showReceipt').dialog('open');", true);
    }
    protected void gv_siteReceiptDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
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

            gv_ShowReceipt.DataSource = DAL.Sport_GetAllDocumentsByReceiptDocIDAndBoxKind(1, ReceiptDoc_ID);
            gv_ShowReceipt.DataBind();
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "unBlock", "$.unblockUI();", true);
        }
        //switch (e.CommandName)
        //{
        //    case "receipt_Show":

        //        break;
        //}
    }
    //protected void PrintAllPages(object sender, EventArgs e)
    //{

    //    GridView1.AllowPaging = false;

    //    GridView1.DataBind();

    //    StringWriter sw = new StringWriter();

    //    HtmlTextWriter hw = new HtmlTextWriter(sw);

    //    GridView1.RenderControl(hw);

    //    string gridHTML = sw.ToString().Replace("\"", "'")

    //        .Replace(System.Environment.NewLine, "");

    //    StringBuilder sb = new StringBuilder();

    //    sb.Append("<script type = 'text/javascript'>");

    //    sb.Append("window.onload = new function(){");

    //    sb.Append("var printWin = window.open('', '', 'left=0");

    //    sb.Append(",top=0,width=1000,height=600,status=0');");

    //    sb.Append("printWin.document.write(\"");

    //    sb.Append(gridHTML);

    //    sb.Append("\");");

    //    sb.Append("printWin.document.close();");

    //    sb.Append("printWin.focus();");

    //    sb.Append("printWin.print();");

    //    sb.Append("printWin.close();};");

    //    sb.Append("</script>");

    //    ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());

    //    GridView1.AllowPaging = true;

    //    GridView1.DataBind();

    //}
    //protected void PrintCurrentPage(object sender, EventArgs e)
    //{

    //    GridView1.PagerSettings.Visible = false;

    //    GridView1.DataBind();

    //    StringWriter sw = new StringWriter();

    //    HtmlTextWriter hw = new HtmlTextWriter(sw);

    //    GridView1.RenderControl(hw);

    //    string gridHTML = sw.ToString().Replace("\"", "'")

    //        .Replace(System.Environment.NewLine, "");

    //    StringBuilder sb = new StringBuilder();

    //    sb.Append("<script type = 'text/javascript'>");

    //    sb.Append("window.onload = new function(){");

    //    sb.Append("var printWin = window.open('', '', 'left=0");

    //    sb.Append(",top=0,width=1000,height=600,status=0');");

    //    sb.Append("printWin.document.write(\"");

    //    sb.Append(gridHTML);

    //    sb.Append("\");");

    //    sb.Append("printWin.document.close();");

    //    sb.Append("printWin.focus();");

    //    sb.Append("printWin.print();");

    //    sb.Append("printWin.close();};");

    //    sb.Append("</script>");

    //    ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());

    //    GridView1.PagerSettings.Visible = true;

    //    GridView1.DataBind();
    //}


}