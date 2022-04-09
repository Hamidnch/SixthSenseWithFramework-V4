using System;
using System.Web.UI;

public partial class AdminPanel_AdminUserControl_SportClassificationTableAdd : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void BindData()
    {
        gv_ClassificationTable.DataSource = DAL.Sport_LoadAllClassificationTable();
        gv_ClassificationTable.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    private String InsertClassification()
    {
        try
        {
            try
            {
                if (DAL.Sport_IsDuplicateClassificationTable(txt_Title.Text))
                {
                    return "عنوانی با این نام قبلا به ثبت رسیده است";
                }
                else
                {
                    String res = "";
                    try
                    {
                        SportClassificationTable classificationTable = new SportClassificationTable();
                        classificationTable.ClassificationTableLogo = "logo";
                        classificationTable.ClassificationTableTitle = txt_Title.Text;
                        DAL.Sport_InsertClassificationTable(classificationTable);
                        res = "عنوان موردنظر ثبت گردید";
                    }
                    catch (Exception ex)
                    {
                        res = "در ثبت عنوان خطا به وقوع پیوست";
                    }
                    return res;
                }
            }
            catch (Exception ex)
            {
                BLL.SendEmail("خطا در وب متد - Sport_IsDuplicateClassificationTable", ex);
                return "خطا در اجرای عملیات چک برای تکرار";
            }
        }
        catch (Exception ex)
        {
            return "خطا در اجرای عملیات";
            BLL.SendEmail("خط در وب متد - InsertClassificationTable ", ex);
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        //int DiagResult = int.Parse(inpHide.Value);
        //if (DiagResult == 1)
        //{
        //    BindData();

        //}
        lbl_Msg.Text = InsertClassification();
        BindData();
        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "myAlert", "$.unblockUI();", true);
        
    }
    protected void gv_ClassificationTable_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        gv_ClassificationTable.PageIndex = e.NewPageIndex;
        BindData();
    }
}