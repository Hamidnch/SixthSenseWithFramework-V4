using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;

public partial class UserControl_UserJQueryTab : System.Web.UI.UserControl
{
    public String getImagePath
    {
        get
        {
            return ResolveUrl("~/UserPanel/UserImgUpload/");
        }
    }
    public String getUserName
    {
        get
        {
            return Context.User.Identity.Name;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    String userName = Context.User.Identity.Name;
                        FillYearToList();
                        FillDayToList();

                        txtUserName.Text = userName;
                        CustomMembership member = new CustomMembership();
                        DAL.Membership_LoadAllAttributes(txtUserName.Text, member);
                        txtFirstName.Text = member.FName;
                        txtLastName.Text = member.LastName;
                        rblSex.SelectedIndex = (member.Sex) ? 1 : 0;
                        if (member.BirthDay != "")
                        {
                            string year = member.BirthDay.Substring(0, 4);
                            string month = member.BirthDay.Substring(5, 2);
                            string day = member.BirthDay.Substring(8, 2);
                            ddlYear.Text = year;
                            ddlMonth.SelectedIndex = int.Parse(month) - 1;
                            ddlDay.SelectedIndex = int.Parse(day) - 1;
                        }
                        txtPhone.Text = member.Phone;
                        txtMobile.Text = member.Mobile;
                        txtAddress.Text = member.Address;
                        ddlCountry.Text = member.Country;
                        ddlCity.Text = member.City;
                        txtnewEmail.Text = member.Email;
                        txtCurrentEmail.Value = member.Email.Trim();
                        txtdupNewEmail.Text = member.Email.Trim();
                        imgUser.ImageUrl = (member.Picture != null) ? 
                                    "~/UserPanel/UserImgUpload/" + member.Picture : "~/UserPanel/UserImgUpload/NoPhoto.jpg";
                        
                        txtAccountName.Text = member.AccountName;
                        txtAccountFamily.Text = member.AccountFamily;
                        txtAccountNumber.Text = member.AccountNumber;
                        ddlBankName.Text = member.BankName;
                        txtWebSite.Text = member.WebSite;
                        txtYahooID.Text = member.YahooID;
                        txtComment.Text = member.Comment;
                    }
                }
                else
                {
                    Response.Redirect("~/AccessDenied.htm");
                }       
        }
        catch
        {
            return;
        }
    }
    private void FillYearToList()
    {
        String myDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "L", false);
        int year = int.Parse(myDate.Substring(0, 4));
        ddlYear.Items.Clear();
        for (int i = 1300; i <= year; i++)
        {
            ddlYear.Items.Add(i.ToString());
        }
        ddlYear.Text = "1360";
    }
    private void FillDayToList()
    {
        ddlDay.Items.Clear();
        for (int i = 1; i <= 31; i++)
        {
            ddlDay.Items.Add(i.ToString());
        }
    }
    //protected void btnRegister_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        String year  = ddlYear.Text;
    //        String month = (ddlMonth.Text.Length ==1) ?  month = "0" + ddlMonth.Text : ddlMonth.Text;
    //        String day   = (ddlDay.Text.Length == 1) ? day = "0" + ddlDay.Text : ddlDay.Text;
    //        String birthDay =  year+ "/" + month + "/" + day;
    //        bool sex = (rblSex.SelectedIndex==1) ? true: false;

    //        DAL.Membership_InsertPublicAttributes(txtFirstName.Text, txtLastName.Text, sex, birthDay, txtUserName.Text);
    //        lblRegMsg.Text = "مشخصات عمومی با موفقیت ارسال گردید";
    //    }
    //    catch(Exception ex)
    //    {
    //        lblRegMsg.Text = ex.Message;
    //    }        
    //}
    //protected void btnContactInfoRegister_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        DAL.Membership_InsertContactInfo(txtPhone.Text, txtMobile.Text, txtAddress.Text, ddlCountry.SelectedItem.Text, ddlCity.SelectedItem.Text, txtUserName.Text);
    //        lblRegMsg.Text = "اطلاعات تماس با موفقیت ارسال گردید";
    //    }
    //    catch (Exception ex)
    //    {
    //        lblContactInfoMsg.Text = ex.Message;
    //    }

    //}
   // protected void btnEmailPassChange_Click(object sender, EventArgs e)
   // {
   //     try
   //     {
   //         if (DAL.Membership_GetPasswordByUserName(txtUserName.Text) == BLL.Encrypt(txtCurrentPassword.Text))
   //         {
   //             String newPass = BLL.Encrypt(txtnewPassword.Text);
   //             String newEmail = txtnewEmail.Text;
   //             DAL.Membership_InsertNewEmailPassword(newPass, newEmail, txtUserName.Text);
   //             lblRegMsg.Text = "اطلاعات کلمه عبور و ایمیل ارسال گردید";              
   //         }
   //         else
   //         {
   //             lblEmailPassMsg.Text = "کلمه عبور قبلی تان را اشتباه وارد کردید.";
   //         }
   ////         tabpass.Attributes.CssStyle.Add("class", "active");            
   //        }

   //     catch(Exception ex)
   //     {            
   //         tabpass.Attributes.CssStyle.Add("class", "active");
   //         lblEmailPassMsg.Text = "خطا در " + ex.Message;
   //     }
   // }
    //protected void btn_Upload_Click(object sender, EventArgs e)
    //{
    //    if (fuPicture.PostedFile != null)
    //    {
    //        HttpPostedFile myFile = fuPicture.PostedFile;
    //        int len = myFile.ContentLength;
    //        if (len > 0)
    //        {
    //            byte[] data = new byte[len];
    //            myFile.InputStream.Read(data, 0, len);
    //            String imgFileName = Path.GetFileName(myFile.FileName);
    //            FileStream newFile = new FileStream(Server.MapPath("~/UserPanel/UserImgUpload/" + imgFileName),
    //                                                                                            FileMode.Create);
    //            newFile.Write(data, 0, len);
    //            newFile.Close();

    //            imgUser.ImageUrl = "~/UserPanel/UserImgUpload/" + imgFileName;
    //        }
    //    }
    //}
    protected void ProcessUpload(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        if (fuPicture.PostedFile != null)
        {
            HttpPostedFile myFile = fuPicture.PostedFile;
            int len = myFile.ContentLength;
            if (len > 0)
            {
                String oldFileNameJpg = Server.MapPath("~/UserPanel/UserImgUpload/" + Context.User.Identity.Name.ToLower() + ".jpg");
                String oldFileNameBmp = Server.MapPath("~/UserPanel/UserImgUpload/" + Context.User.Identity.Name.ToLower() + ".bmp");
                String oldFileNameGif = Server.MapPath("~/UserPanel/UserImgUpload/" + Context.User.Identity.Name.ToLower() + ".gif");
                String oldFileNameJpeg = Server.MapPath("~/UserPanel/UserImgUpload/"+ Context.User.Identity.Name.ToLower() + ".jpeg");
                if (File.Exists(oldFileNameJpg))
                {
                    File.Delete(oldFileNameJpg);
                }
                if (File.Exists(oldFileNameBmp))
                {
                    File.Delete(oldFileNameBmp);
                }
                if (File.Exists(oldFileNameGif))
                {
                    File.Delete(oldFileNameGif);
                }
                if (File.Exists(oldFileNameJpeg))
                {
                    File.Delete(oldFileNameJpeg);
                }
                byte[] data = new byte[len];
                myFile.InputStream.Read(data, 0, len);
                String imgFileName = Path.GetFileName(myFile.FileName);
                String ext = Path.GetExtension(imgFileName);
                imgFileName = Context.User.Identity.Name + ext;
                imgFileName = imgFileName.ToLower();
                if (BLL.IsValidFileType(imgFileName))
                {
                    FileStream newFile = new FileStream(Server.MapPath("~/UserPanel/UserImgUpload/" + imgFileName), FileMode.Create);
                    newFile.Write(data, 0, len);
                    newFile.Close();
                    DAL.Membership_InsertPictureUser(txtUserName.Text, imgFileName);     //Path.GetFileName(imgUser.ImageUrl)          
                  
                    //String script = "<script type='text/javascript'> alert('hello'); </script>";//img = document.getElementById('<%= imgUser.ClientID %>');";
                    //script += "img.src =" + "~/UserPanel/UserImgUpload/" + imgFileName;
                    //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Script", "script", true);
                   // lblPictureMsg.Text = "تصویر شما بارگذاری گردید";
                    //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "myImage", "alert('hello')", true);
                }
                else
                {
                    lblPictureMsg.Text = "لطفا عکس موردنظرتان با توجه به یکی از فرمتهای Jpg,Jpeg,gif انتخاب شود";
                }
            }
        }
    }
}