using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserActivation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["m"].ToString() != "" && Request.QueryString["k"].ToString() != "")
            {
                String email = Request.QueryString["m"].ToString();
                String key = Request.QueryString["k"].ToString();
                try
                {
                    if (DAL.Membership_GetKeyOfChangePassword(email) == key)
                    {
                        DAL.Membership_RegisterationActive(email);
                        DAL.Membership_UpdateKeyForChangePassword(email, " ");
                        lblResult.Text = "عضویت شما در سایت حس ششم فعال گردید.";
                        String subjectMail = "سایت حس ششم";
                        String bodyMail = "<br><h2>عضویت شما با موفقیت فعال گردید.ازاین پس میتوانید در سایت فعالیت داشته باشید</h2>";
                        lblResult.Text = BLL.SendEmail("Hamidnch@hesesheshom.com", email, subjectMail, bodyMail, true, "فعالسازی عضویت با موفقیت انجام گردید");
                    }
                }
                catch (Exception ex)
                {
                    lblResult.Text = "خطای زیر به وقوع پیوست" + "<br>" + ex.Message;
                    BLL.SendEmail("خطا در فعالسازی عضویت کاربر - بخش داخلی بلوک", ex);
                }
            }
        }
        catch (Exception ex)
        {
            lblResult.Text = "خطای زیر به وقوع پیوست" + "<br>" + ex.Message;
            BLL.SendEmail("خطا در فعالسازی عضویت کاربر", ex);
        }
    }
}