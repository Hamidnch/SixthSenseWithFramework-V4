using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_AdminUserControl_EconomicAnalysisManagement : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        String scriptTitle = "CKEDITOR.replace('" + txt_AnalysisTitle.ClientID +
      @"',{skin : 'kama',contentsLangDirection : 'rtl',height : '60px',toolbar :[ ['Styles','Format'],
            ['Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','NumberedList',
            'BulletedList','Outdent','Indent','-','Link','Unlink','Anchor'],
            ['Cut','Copy','Paste','PasteText','PasteFromWord','-'],['Undo','Redo'],
            ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
            ['Image','HorizontalRule','Smiley'],
            ['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Code'] ]});";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "EditorTitle", scriptTitle, true);

        String scriptContext = "CKEDITOR.replace('" + txt_AnalysisContext.ClientID + "',{skin : 'kama',contentsLangDirection : 'rtl',height : '150px',});";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "EditorContext", scriptContext, true);

        //Page.ClientScript.RegisterClientScriptInclude("selective", ResolveUrl(@"..\ckeditor/ckeditor.js"));        
        RefereshGridView();
    }
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    }
    private void RefereshGridView()
    {
        GridView_AnalysisManagement.DataSource = DAL.Economic_LoadAllAnalysis(true);
        GridView_AnalysisManagement.DataBind();
    }
}