using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_ContactUs_InputMessage : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        gv_InputMessageContactUs.DataSource = DAL.LoadAllInputMessageContactUs("");//"خوانده نشده"
        gv_InputMessageContactUs.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String script = "$('#close').click(function (){$('#divMessage').hide('slow');});$(document).keyup(function (e){var code = (e.keyCode ? e.keyCode : e.which);if (code === 27) $('#divMessage').hide('slow');});$('#divMessage').draggable({ containment: 'window', scroll: false, handle: '#titlebar' });function showModal(){$('#divMessage').css({ top: '50%', left: '50%', margin: '-' + ($('#divMessage').height() / 2) + 'px 0 0 -' + ($('#divMessage').width() / 2) + 'px' });$('#divMessage').show('slow');}";
            script += "CKEDITOR.replace('" + txt_Reply.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl', height: '50px'});";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Editor", script, true);
            BindData();
        }
    }
    protected void gv_InputMessageContactUs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_InputMessageContactUs.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gv_InputMessageContactUs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem == null)
            return;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //ImageButton img_Show = (ImageButton)e.Row.FindControl("img_Show");
            //img_Show.OnClientClick = @"$('#dialog-form').dialog('open');";
            e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
            e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");            
        }
    }
   // protected void gv_InputMessageContactUs_RowCommand(object sender, GridViewCommandEventArgs e)
  //  {
        //        if (e.CommandName.Equals("Message_Show"))
        //        {
        //            int contact_ID = Convert.ToInt32(e.CommandArgument);
        //            lbl_ContactID.Text = Convert.ToString(contact_ID);
        //            String message, email = "";
        //            DAL.GetContactMessageByContactID(contact_ID, out message, out email);
        //            txt_Message.Text = message;
        //            txt_Email.Text = email;

        //            String script = @"$(document).ready(function (){                    
        //                     $.unblockUI(); showModal(); $('#close').click(function(){$('#divMessage').hide('slow');
        //                     //$('#overlay').css('visibility', 'hidden');
        //                    });
        //                    $(document).keyup(function(e){var code = (e.keyCode ? e.keyCode : e.which);
        //                        if(code === 27)$('#divMessage').hide('slow');
        //                        //$('#overlay').css('visibility', 'hidden');
        //                        });
        //                        $('#divMessage').draggable({ containment: 'window', scroll: false, handle: '#titlebar' });
        //                    function showModal()
        //                    {
        //                        //$('#overlay').css('visibility', 'visible');
        //                        $('#divMessage').css({top:'50%',left:'50%',margin:'-'+($('#divMessage').height() / 2)+'px 0 0 -'+($('#divMessage').width() / 2)+'px'});
        //                        $('#divMessage').show('slow');
        //                    }
        //                    });";
        //            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "MessageShow", script, true);
        //        }
  //  }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //ScriptManager1.RegisterAsyncPostBackControl(this.LinkButton1);
        BindData();
    }
}

//if (editor){editor.destroy(true);}
//CKEDITOR.replace('" + txt_Reply.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl'});" +