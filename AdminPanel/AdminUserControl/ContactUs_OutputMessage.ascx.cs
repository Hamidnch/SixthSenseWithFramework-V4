using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ContactUs_OutputMessage : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
       // gv_OutputMessageContactUs.DataSource = DAL.LoadAllInputMessageContactUs("پاسخ داده شده");
        gv_OutputMessage.DataSource = DAL.Messages_GetSendMessagesByMessageType(0);
        gv_OutputMessage.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String script = "$('#close').click(function (){$('#divMessage').hide('slow');});$(document).keyup(function (e){var code = (e.keyCode ? e.keyCode : e.which);if (code === 27) $('#divMessage').hide('slow');});$('#divMessage').draggable({ containment: 'window', scroll: false, handle: '#titlebar' });function showModal(){$('#divMessage').css({ top: '50%', left: '50%', margin: '-' + ($('#divMessage').height() / 2) + 'px 0 0 -' + ($('#divMessage').width() / 2) + 'px' });$('#divMessage').show('slow');}";
            script += "CKEDITOR.replace('" + txt_Message_Context.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl', height: '80px'});";
            //script += "$('CKEDITOR.instances.ctl00_ContentPlaceHolder1_ContactUs_OutputMessage1_txt_Reply').CKEDITOR({readOnly: true});";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Editor", script, true);
            BindData();
        }
    }
    protected void gv_OutputMessageContactUs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_OutputMessage.PageIndex = e.NewPageIndex;
        BindData();
    }
   // protected void gv_OutputMessageContactUs_RowDataBound(object sender, GridViewRowEventArgs e)
  //  {
   //     if (e.Row.DataItem == null)
   //         return;
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    //ImageButton img_Show = (ImageButton)e.Row.FindControl("img_Show");
        //    //img_Show.OnClientClick = @"$('#dialog-form').dialog('open');";
        //    e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
        //    e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");
        //}
  //  }
}