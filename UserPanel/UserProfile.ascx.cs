using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserProfile : System.Web.UI.UserControl
{    
    public String ImagePath{ get{return ResolveUrl("~/Images");}}
    public string currentModule{get{return (string)ViewState["moduleName"];}set{ ViewState["moduleName"] = value;}}
    public void addModule(object moduleName)
    {
        PlaceHolder_Result.Controls.Clear();
        UserControl uCtrl = (UserControl)Page.LoadControl(string.Format("~/UserPanel/{0}.ascx", moduleName));
        uCtrl.ID = new Guid().ToString();
        PlaceHolder_Result.Controls.Add(uCtrl);
        currentModule = moduleName.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["moduleName"] != null)
        {
            currentModule = Session["moduleName"].ToString();
            addModule(currentModule);
            Session.Remove("moduleName");
        }
        else
            if (Request.QueryString["moduleName"] != null)
            {
                currentModule = Request.QueryString["moduleName"];
                addModule(currentModule);
            }
            else
            {
                currentModule = "UserPublicAttribute";
                if (!string.IsNullOrEmpty(currentModule))
                    addModule(currentModule);
            }
        btn_ActiveForms.ServerClick += new EventHandler(btn_ActiveForms_ServerClick);
        btn_ArchiveForms.ServerClick += new EventHandler(btn_ArchiveForms_ServerClick);
        btn_PublicAttr.ServerClick += new EventHandler(btn_PublicAttr_ServerClick);
        btn_GeneralInfo.ServerClick += new EventHandler(btn_GeneralInfo_ServerClick);
        btn_EmailPass.ServerClick += new EventHandler(btn_EmailPass_ServerClick);
        //btn_Avatar.ServerClick += new EventHandler(btn_Avatar_ServerClick);
        btn_ContactInfo.ServerClick += new EventHandler(btn_ContactInfo_ServerClick);
       // btn_UserPayments.ServerClick += new EventHandler(btn_UserPayments_ServerClick);
        btn_UserInventoryStatus.ServerClick += new EventHandler(btn_UserInventoryStatus_ServerClick);
        btn_UserRewardBox.ServerClick += new EventHandler(btn_UserRewardBox_ServerClick);
        btn_UserPayments.ServerClick += new EventHandler(btn_UserPayments_ServerClick);
        btn_Variance.ServerClick += new EventHandler(btn_Variance_ServerClick);
        //btn_UserSendMessage.ServerClick += new EventHandler(btn_UserSendMessage_ServerClick);
    }

    //void btn_UserSendMessage_ServerClick(object sender, EventArgs e)
    //{
    //    currentModule = "UserSendMessage";
    //    addModule(currentModule);
    //}

    void btn_UserPayments_ServerClick(object sender, EventArgs e)
    {
        currentModule = "SportUserPayment";
        addModule(currentModule);
    }

    void btn_Variance_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserVariance";
        addModule(currentModule);            
    }

    void btn_UserRewardBox_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserRewardBox";
        addModule(currentModule);         
    }

    void btn_UserInventoryStatus_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserInventoryStatus";
        addModule(currentModule);            
    }

    //void btn_UserPayments_ServerClick(object sender, EventArgs e)
    //{
    //    currentModule = "SportUserPayment";
    //    addModule(currentModule);      
    //}

    void btn_ContactInfo_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserContactInfo";
        addModule(currentModule);        
    }

    //void btn_Avatar_ServerClick(object sender, EventArgs e)
    //{
    //    currentModule = "UserPictureUpload";
    //    addModule(currentModule);
    //}

    void btn_EmailPass_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserEmailPass";
        addModule(currentModule); 
    }

    void btn_GeneralInfo_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserGeneralInfo";
        addModule(currentModule);         
    }

    void btn_PublicAttr_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserPublicAttribute";
        addModule(currentModule);     
    }
    private void btn_ActiveForms_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserActiveForms";
        addModule(currentModule);
    }
    void btn_ArchiveForms_ServerClick(object sender, EventArgs e)
    {
        currentModule = "UserArchiveForms";
        addModule(currentModule);
    }
}