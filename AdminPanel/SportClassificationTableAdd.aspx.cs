using System;
using System.Web.Services;

public partial class AdminPanel_SportClassificationTableAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){}
    //[WebMethod]
    //public static String InsertClassificationTable(String title, String logo)
    //{
    //    try
    //    {
    //        try
    //        {
    //            if (DAL.Sport_IsDuplicateClassificationTable(title))
    //            {
    //                return "عنوانی با این نام قبلا به ثبت رسیده است";
    //            }
    //            else
    //            {
    //                String res = "";
    //                try
    //                {
    //                    SportClassificationTable classificationTable = new SportClassificationTable();
    //                    classificationTable.ClassificationTableLogo = logo;
    //                    classificationTable.ClassificationTableTitle = title;
    //                    DAL.Sport_InsertClassificationTable(classificationTable);
    //                    res = "عنوان موردنظر ثبت گردید";
    //                }
    //                catch (Exception ex)
    //                {
    //                    res =  "در ثبت عنوان خطا به وقوع پیوست";
    //                }
    //                return res;
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //            BLL.SendEmail("خطا در وب متد - Sport_IsDuplicateClassificationTable", ex);
    //            return "خطا در اجرای عملیات چک برای تکرار";
    //        }
    //    }
    //    catch(Exception ex)
    //    {
    //        return "خطا در اجرای عملیات";
    //        BLL.SendEmail("خط در وب متد - InsertClassificationTable ", ex);
    //    }
    //}
}