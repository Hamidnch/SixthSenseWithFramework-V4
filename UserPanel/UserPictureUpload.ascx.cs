using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserPictureUpload : System.Web.UI.UserControl
{
    public String Root { get { return ResolveUrl("~/"); } }
    protected void Page_Load(object sender, EventArgs e){}
    //protected override void Render(System.Web.UI.HtmlTextWriter writer)
    //{
    //    base.Render(writer);

    //    if (Page.FindControl("myUploader") != null)
    //        this.Page.ClientScript.RegisterForEventValidation(FindControl("myUploader").ID);
    //}

}