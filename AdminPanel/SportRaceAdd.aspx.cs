using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_SportRaceAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static String InsertRace(String raceName)
    {
        try
        {
            if (DAL.Sport_IsDuplicateRace(raceName))
            {
                return "خطا: عنوان مسابقه ' " + raceName + " ' قبلا تعریف شده است";
            }
            DAL.Sport_InsertRace(raceName);
            return "عنوان مسابقه جدید با موفقیت ثبت گردید";
        }
        catch
        {
            return "خطا در اجرای عملیات";
        }
    }
}