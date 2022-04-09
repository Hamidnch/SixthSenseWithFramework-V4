using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["mail"].ToString() != null)
            {
                String email = Request.QueryString["mail"].ToString();
                String keyPass = Request.QueryString["key"].ToString();
                if (DAL.Membership_GetKeyOfChangePassword(email) == keyPass)
                {
                    // DAL.Membership_SetLock(email);
                    // if (DAL.Membership_GetLock(email) == 1)
                    // {
                    String newPassword = BLL.CreateRandomPasswordUsingGUID(10);
                    String hashPassword = BLL.Encrypt(newPassword);
                    DAL.Membership_ChangePassword(email, hashPassword);

                    String subjectMail = "پسورد جدید در سایت حس ششم";
                    String bodyMail = "پسورد جدید شما = " + "<br><h2>[" +  newPassword + "]</h2>";
                    lblResult.Text = BLL.SendEmail("Hamidnch@hesesheshom.com", email, subjectMail, bodyMail, true, "پسورد جدید به ایمیل شما ارسال گردید");
                    DAL.Membership_UpdateKeyForChangePassword(email, "nothing");
                    DAL.Membership_UpdateChangePasswordDate(email);
                    //   } 
                }
                else
                {
                    lblResult.Text = "دسترسی غیرمجاز به این صفحه" + "<br>" + "جهت ریست کردن پسورد خود از قسمت 'رمز عبور را فراموش کرده ای؟' اقدام فرمائید";
                }
                // }
                //  else
                //   {
                //   lblResult.Text = "خطا در اجرای عملیات";
                // }

                //else
                //{
                //    lblResult.Text = "خطا در اجرای عملیات";
                //}
            }
        }
        catch (Exception ex)
        {
            lblResult.Text = "خطای زیر به وقوع پیوست" + "<br>" + ex.Message;
        }
    }
}