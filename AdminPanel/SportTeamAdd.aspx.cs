using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;

public partial class AdminPanel_SportTeamAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static String InsertTeam(String teamName, String countryID, String sloganPicture)
    {
        try
        {
            //String imgFileName = Path.GetFileName(sloganPicture); 
            //String ext = Path.GetExtension(imgFileName);
            //imgFileName = teamName + ext;
            //if (BLL.IsValidFileType(imgFileName))
            //{
            //    if (File.Exists("~/AdminPanel/AdminImages/SportTeamUpload/" + imgFileName))
            //    {
            //        File.Delete("~/AdminPanel/AdminImages/SportTeamUpload/" + imgFileName);
            //    }
            //    FileStream newFile = new FileStream(HttpContext.Current.Server.MapPath("~/AdminPanel/AdminImages/SportTeamUpload/" + imgFileName), FileMode.Create);
            //    newFile.Write(data, 0, len);
            //    newFile.Close();
            //    DAL.Membership_InsertPictureUser(txtUserName.Text, imgFileName);     //Path.GetFileName(imgUser.ImageUrl)          
            //    imgUser.ImageUrl = "~/UserPanel/UserImgUpload/" + imgFileName;
            //    // lblPictureMsg.Text = "تصویر شما بارگذاری گردید";
            //}
            //else
            //{
            //    lblPictureMsg.Text = "لطفا عکس موردنظرتان با توجه به یکی از فرمتهای Jpg,Jpeg,gif انتخاب شود";
            //}
            //if (countryID == "-1")
            //{
            //    return "لطفا کشور مربوطه را تعیین نمائید";
            //}
            if (DAL.Sport_IsDuplicateTeam(teamName))
            {
                return "تیمی با این نام قبلا به ثبت رسیده است";
            }
            DAL.Sport_InsertTeam(teamName, int.Parse(countryID), sloganPicture);
            return "تیم موردنظر ثبت گردید";
        }
        catch
        {
            return "خطا در اجرای عملیات";
        }
    }
}