using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_EconomicAnalysisAdd : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
              //String script = "CKEDITOR.replace('" + txt_NewsContext.ClientID + "',{toolbar :[ ['Styles', 'Format'], ['Bold', 'Italic','Underline','Strike','-','Subscript','Superscript', '-', 'NumberedList', 'BulletedList', '-', 'Link'],['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker'],['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] ]});";
              String scriptTitle = "CKEDITOR.replace('" + txt_AnalysisTitle.ClientID + 
            @"',{skin : 'kama',contentsLangDirection : 'rtl',height : '100px',toolbar :[ 
            ['Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','NumberedList',
            'BulletedList','Outdent','Indent','-','Link','Unlink','Anchor'],
            ['Cut','Copy','Paste','PasteText','PasteFromWord','-'],['Undo','Redo'],
            ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
            ['Image','HorizontalRule','Smiley'],['Font','FontSize','Format'],['TextColor','BGColor'],['Code'] ]});";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "EditorTitle", scriptTitle, true);

        String scriptContext = "CKEDITOR.replace('" + txt_AnalysisContext.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl'});";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "EditorContext", scriptContext, true);

        lblDate.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true);
    }
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    }
}