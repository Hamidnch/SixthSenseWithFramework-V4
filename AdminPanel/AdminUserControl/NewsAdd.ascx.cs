using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_NewsAdd : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //String script = "CKEDITOR.replace('" + txt_NewsContext.ClientID + "',{toolbar :[ ['Styles', 'Format'], ['Bold', 'Italic','Underline','Strike','-','Subscript','Superscript', '-', 'NumberedList', 'BulletedList', '-', 'Link'],['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker'],['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] ],skin : 'kama',contentsLangDirection : 'rtl'});";
        String script = "CKEDITOR.replace('" + txt_NewsContext.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl'});";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Editor", script, true);
        lblDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true, "H");
        //ClearText();
    }
   // protected void btn_NewsSave_Click(object sender, EventArgs e)
   // {
        //if (Page.IsValid)
        //{
        //    try
        //    {
        //        if (txt_NewsTitle.Text == "")
        //        {
        //            lbl_Msg.Text = "عنوان خبر را وارد نمائید";
        //            txt_NewsTitle.Focus();
        //            return;
        //        }
        //        if (txt_NewsSummary.Text == "")
        //        {
        //            lbl_Msg.Text = "خلاصه خبر را وارد نمائید";
        //            txt_NewsSummary.Focus();
        //            return;
        //        }
        //        if (txt_NewsContext.Text == "")
        //        {
        //            lbl_Msg.Text = "متن خبر را وارد نمائید";
        //            txt_NewsContext.Focus();
        //            return;
        //        }

        //        DAL.News_InsertNews(txt_NewsTitle.Text, txt_NewsSummary.Text, txt_NewsContext.Text, chk_Pooling.Checked, chk_Status.Checked);
        //        ClearText();
        //        lbl_Msg.Text = "خبر جدید با موفقیت ثبت گردید";                 
        //    }
        //    catch(Exception ex)
        //    {
        //        lbl_Msg.Text = ex.Message;
        //    }
        //}
    //}
    private void ClearText()
    {
        txt_NewsTitle.Text = String.Empty;
        txt_NewsSummary.Text = String.Empty;
        txt_NewsContext.Text = String.Empty;
        chk_Pooling.Checked = true;
        chk_Status.Checked = true;
        txt_NewsTitle.Focus();
    }
    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/NewsManagement.aspx");
    }
}