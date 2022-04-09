using System;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class UserPanel_UserAvatar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
              //  if (!IsPostBack)
              //  {
                    String userName = Context.User.Identity.Name;

                    txtUserName.Text = userName;
                    CustomMembership member = new CustomMembership();
                    DAL.Membership_LoadAllAttributes(txtUserName.Text, member);
                    imgUser.ImageUrl = (!String.IsNullOrEmpty(member.Picture) && !String.IsNullOrWhiteSpace(member.Picture)) ?
                                "~/UserPanel/UserImgUpload/" + member.Picture : "~/UserPanel/UserImgUpload/NoPhoto.jpg";
              //  }
            }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch (Exception ex){BLL.SendEmail("UserPanel_UserAvatar Page_Load", ex);}
    }

    protected void fuPicture_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
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
                String oldFileNameJpeg = Server.MapPath("~/UserPanel/UserImgUpload/" + Context.User.Identity.Name.ToLower() + ".jpeg");
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
                    DAL.Membership_InsertPictureUser(Context.User.Identity.Name, imgFileName);     //Path.GetFileName(imgUser.ImageUrl)

                    String script = "<script type='text/javascript'>";//img = document.getElementById('<%= imgUser.ClientID %>');";
                    script += "img.src =" + "~/UserPanel/UserImgUpload/" + imgFileName + "</script>";
                    //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Script", "script", true);
                    // lblPictureMsg.Text = "تصویر شما بارگذاری گردید";
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "myImage", script, true);
                }
                else
                {
                    lblPictureMsg.Text = "لطفا عکس موردنظرتان با توجه به یکی از فرمتهای Jpg,Jpeg,gif انتخاب شود";
                }
            }
        }
    }
}