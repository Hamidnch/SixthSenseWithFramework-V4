using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Diagnostics;
public partial class UserControl_ForgetPassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //List<KeyValuePair<string, object>> lst = new List<KeyValuePair<string, object>>  
        //  {  
        //      new KeyValuePair<string, object>("Name", "علي"),  
        //      new KeyValuePair<string, object>("Number", 10),  
        //      new KeyValuePair<string, object>("Desc", "منابع مورد نياز")  
        //  };
        //string content = BLL.RenderUserControl("EmailTemplate.ascx", lst);
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (!DAL.Membership_ExistsUserNameOrEmail("SP_Membership_ExistEmail", "@email", txtEmail.Text))
        {
            lblResult.Text = "کاربری با این ایمیل در سایت وجود ندارد";
            return;
        }
        String email = txtEmail.Text;
        String keyPass = BLL.CreateRandomPasswordUsingGUID(12);
        if (keyPass == String.Empty)
        {
            keyPass = BLL.CreateRandomPasswordUsingGUID(12);
        }
        DAL.Membership_UpdateKeyForChangePassword(email, keyPass);
        String subjectMail = "بازیابی پسورد در سایت حس ششم";
        String bodyMail = "جهت ریست شدن پسورد قبلی و ایجاد یک پسورد جدید " +
         "<a href='www.Hesesheshom.Com/ResetPassword.aspx?mail=" + email  +  "&&key=" + keyPass + "'>اینجا </a>را کلیک نمائید  ";
        lblResult.Text = BLL.SendEmail("Hamidnch@hesesheshom.com", txtEmail.Text, subjectMail, bodyMail, true, "عملیات با موفقیت به پایان رسید،لطفاایمیل خود را چک نمائید");
    }
}