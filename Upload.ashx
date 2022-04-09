<%@ WebHandler Language="C#" Class="Upload" %>
using System;
using System.Web;
using System.IO;
public class Upload : IHttpHandler
{
    private void DeletePicture(String pictureName)
    {
        String fileName = HttpContext.Current.Server.MapPath("~/UserPanel/UserImgUpload/" + pictureName);
        if (File.Exists(fileName)) { File.Delete(fileName); }
    }
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Expires = 0;
        context.Response.Cache.SetCacheability(HttpCacheability.NoCache);        
        // context.Response.Expires = -1;
        try
        {
            HttpPostedFile postedFile = context.Request.Files["Filedata"];
            string savepath,tempPath = "";
            tempPath = context.Request["folder"];
            String currentUser = context.Request["currentUser"];
            //If you prefer to use web.config for folder path, uncomment below line:
            //tempPath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"];
            savepath = context.Server.MapPath(tempPath);
            string filename = postedFile.FileName;
            //String userName = context.User.Identity.Name.ToLower();
            if (!Directory.Exists(savepath)) Directory.CreateDirectory(savepath);
            String pictureName = DAL.Membership_GetPictureNameByUserName(currentUser);
            DeletePicture(pictureName);
            //DeleteOldImage(".jpg", userName);DeleteOldImage(".bmp", userName);DeleteOldImage(".gif", userName);DeleteOldImage(".png", userName);DeleteOldImage(".jpeg", userName);          
            //postedFile.SaveAs(savepath + @"\" + filename);
            String ext = Path.GetExtension(filename);
            String randomValue = BLL.CreateRandomPasswordUsingGUID(6);
            String myFile = currentUser + "_" + randomValue + ext;
            postedFile.SaveAs(savepath + @"\" + myFile);
            DAL.Membership_InsertPictureUser(currentUser, myFile);            
            context.Response.Write(tempPath + "/" + myFile);                
            context.Response.StatusCode = 200;
        }
        catch (Exception ex)
        {
            context.Response.Write("وقوع خطای مقابل: " + ex.Message);
            BLL.SendEmail("Upload.ashx", ex);
        }
    }
    public bool IsReusable{get{return false;}}
}