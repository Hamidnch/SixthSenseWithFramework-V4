using System;
using System.Web.UI;

public partial class UserControl_UserRegisteration : System.Web.UI.UserControl
{
    public String ImagePath{get{return ResolveUrl("~/Images");}}

    protected void Page_Load(object sender, EventArgs e)
    {
        txtFirstName.Focus();
        //secCode.CacheStrategy = MSCaptcha.CaptchaControl.CacheType.HttpRuntime;
        //txtUserName.Attributes.Add("onblur", "checkMe(this.value);");
        if (Page.IsPostBack)
        {
            txtPassword.Attributes.Add("value", txtPassword.Text);
            txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text);
        }
        if (!IsPostBack){FillYearToList();FillDayToList();SetJavaScripts();}
    }

    private void SetJavaScripts()
    {
        //this.txtFirstName.Attributes.Add("onkeydown", "javascript:FKeyDown();");
        //this.txtFirstName.Attributes.Add("onkeypress", "javascript:FKeyPress();CheckAlpha(this);");
        this.txtFirstName.Style.Add("text-align", "right");
        //this.txtLastName.Attributes.Add("onkeydown", "javascript:FKeyDown();");
        //this.txtLastName.Attributes.Add("onkeypress", "javascript:FKeyPress();CheckAlpha(this);");
        this.txtLastName.Style.Add("text-align", "right");
        //this.txtAddress.Attributes.Add("onkeydown", "javascript:FKeyDown();");
        //this.txtAddress.Attributes.Add("onkeypress", "javascript:FKeyPress();CheckAlpha(this);");
        this.txtAddress.Style.Add("text-align", "right");
        //this.txtAccountName.Attributes.Add("onkeydown", "javascript:FKeyDown();");
        //this.txtAccountName.Attributes.Add("onkeypress", "javascript:FKeyPress();CheckAlpha(this);");
        this.txtAccountName.Style.Add("text-align", "right");
        //this.txtAccountFamily.Attributes.Add("onkeydown", "javascript:FKeyDown();");
        //this.txtAccountFamily.Attributes.Add("onkeypress", "javascript:FKeyPress();CheckAlpha(this);");
        this.txtAccountFamily.Style.Add("text-align", "right");
    }

    private void FillYearToList()
    {
        String myDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "", false);
        int year = int.Parse(PersianClass.getLatinNumberStyle(myDate.Substring(0, 4)));
        ddlYear.Items.Clear();ddlYear.Items.Add("<سال>");
        for (int i = 1300; i <= year; i++){ddlYear.Items.Add(PersianClass.getPersianNumberStyle(i));}
    }

    private void FillDayToList()
    {
        ddlDay.Items.Clear();ddlDay.Items.Add("<روز>");
        for (int i = 1; i <= 31; i++){ddlDay.Items.Add(PersianClass.getPersianNumberStyle(i));}
    }

    private void ClearControlValue()
    {
        txtFirstName.Text = "";txtLastName.Text = "";txtUserName.Text = "";
        txtPassword.Text = "";txtConfirmPassword.Text = "";txtPassword.Attributes.Add("value", "");
        txtConfirmPassword.Attributes.Add("value", ""); txtEmail.Text = "";
        txtConfirmEmail.Text = "";txtAccountName.Text = "";txtAccountFamily.Text = "";
        txtAccountNumber.Text = ""; txtAddress.Text = "";txtPhone.Text = "";
        txtMobile.Text = "";txtSecurityCode.Text = "";ddlBankName.Text = "";
        ddlCity.Text = "";ddlDay.Text = "<روز>";ddlMonth.Text = "<ماه>";ddlYear.Text = "<سال>";
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        if (Page.IsValid)
        {
            if (txtUserName.Text == "")
            {
                lblMessage.Text = "نام کاربری را وارد نمائید";txtUserName.Focus();
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                return;
            }
            if (DAL.Membership_ExistsUserNameOrEmail("SP_Membership_ExistUserName", "@userName", txtUserName.Text))
            {
                lblMessage.Text = "این نام کاربری قبلا استفاده شده است";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                return;
            }
            if (!BLL.IsStrictPassword(txtPassword.Text))
            {
                lblMessage.Text = "طول کلمه عبور حداقل باید 5 کاراکتر باشد";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                txtPassword.Focus();
                return;
            }
            if (DAL.Membership_ExistsUserNameOrEmail("SP_Membership_ExistEmail", "@email", txtEmail.Text))
            {
                lblMessage.Text = "این ایمیل قبلا استفاده شده است";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                return;
            }
            //if (ddlYear.Text == "<سال>" || ddlMonth.Text == "<ماه>" || ddlDay.Text == "<روز>")
            //{
            //    lblMessage.Text = "لطفا تاریخ تولدتان را وارد نمائید";
            //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
            //    return;
            //}
            if (!chk_Low.Checked)
            {
                lblMessage.Text = "برای عضویت می بایست قوانین سایت را بپذیرید";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                return;
            }
            if (txtSecurityCode.Text == String.Empty)
            {
                lblMessage.Text = "کد امنیتی را وارد نکرده اید";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                txtSecurityCode.Focus();
                return;
            }
            secCode.ValidateCaptcha(txtSecurityCode.Text);
            if (!secCode.UserValidated)
            {
                lblMessage.Text = "کد امنیتی نادرست وارد شده است";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                return;
            }
            try
            {
                String birthDay = "";
                if (ddlYear.Text == "<سال>" || ddlMonth.Text == "<ماه>" || ddlDay.Text == "<روز>"){birthDay = "";}
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "blockReg()", true);
                CustomMembership member = new CustomMembership();
                String encriptPassword = BLL.Encrypt(txtPassword.Text);
                String year = ddlYear.Text;
                String month = (ddlMonth.Text.Length == 1) ? month = "0" + ddlMonth.Text : ddlMonth.Text;
                String day = (ddlDay.Text.Length == 1) ? day = "0" + ddlDay.Text : ddlDay.Text;
                birthDay = year + "/" + month + "/" + day;
                bool sex = (ddlSex.SelectedIndex == 1) ? true : false;

                member.FName = txtFirstName.Text;member.LastName = txtLastName.Text;
                member.Username = txtUserName.Text;member.Password = encriptPassword;
                member.Email = txtEmail.Text;member.Sex = sex;
                member.BirthDay = birthDay; member.Phone = txtPhone.Text;
                member.Mobile = txtMobile.Text;member.Address = txtAddress.Text;
                member.Country = ddlCountry.SelectedItem.Text;member.City = ddlCity.SelectedItem.Text;
                member.AccountName = txtAccountName.Text;member.AccountFamily = txtAccountFamily.Text;
                member.AccountNumber = txtAccountNumber.Text;member.BankName = ddlBankName.SelectedItem.Text;
                member.WebSite = "";member.YahooID = "";member.Picture = "";member.RegistrationDate = BLL.GetIranDateTime();
                member.LastLoginDate = BLL.GetIranDateTime(); member.Comment = "ثبت نام اولیه";member.IsActive = false;
                DAL.Membership_InsertRegisteration(member);
                //System.Web.Security.FormsAuthentication.SetAuthCookie(txtUserName.Text, false);
                //System.Web.Security.FormsAuthentication.SignOut();
                if (DAL.Membership_ExistsUserNameOrEmail("SP_Membership_ExistEmail", "@email", txtEmail.Text))
                {
                    String mail = txtEmail.Text;
                    String key = BLL.CreateRandomPasswordUsingGUID(15);
                    if (key == String.Empty){key = BLL.CreateRandomPasswordUsingGUID(12);}
                   
                    DAL.Membership_UpdateKeyForChangePassword(mail, key);//این روال برا تغییر پسورد میباشد که به جهت مناسب بودن برای این قسمت استفاده شده است

                    String bodyMail = "<div style='font-family:tahoma;color:blue;direction:rtl;font-size:10px;'>جهت فعالسازی عضویتتان در سایت حس ششم" +
                         " <a href='http://www.hesesheshom.com/UserActivation.aspx?m=" + mail + "&&k=" + key + "'>اینجا </a>را کلیک نمائید  " + "</div>";
                    String msg = BLL.SendEmail("Hamidnch@hesesheshom.com?", mail, "فعالسازی عضویت در سایت حس ششم", bodyMail, true,
                                  "یک ایمیل جهت فعالسازی عضویت شما برایتان ارسال گردید،لطفا ایمیل خود را چک فرمایید");
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$('span[id$=lbl_Info]').html('" + msg + "');", true);
                }
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "", true);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "modal", "$('#dialog-form').dialog('open');", true);
                //lblMessage.Style.Add("text-align", "center");
                //lblMessage.Style.Add("padding", "20px");
                //lblMessage.Style.Add("font-size", "15px");
                //lblMessage.Text = "عضویت با موفقیت انجام شد" + "جهت رفتن به تنظیمات کاربری " +
                //    "<a style='color:white;text-decoration:underline' href='UserPanel/UserProfileRegister.aspx'>اینجا</a>" +
                //    "  و جهت برگشت به صفحه نخست " +
                //    "<a style='color:white;text-decoration:underline' href='Home.aspx'>اینجا </a>" + "را کلیک نمائید";

                ClearControlValue();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "block", "$.unblockUI();", true);
                lblMessage.Text = "خطای زیر به وقوع پیوست " + "<br/>" + ex.Message;
            }
        }
    }
    //protected void hl_gotoprofile_Click(object sender, EventArgs e)
    //{    
    //    Response.Redirect("~/UserPanel/UserProfileRegister.aspx");
    //}
}