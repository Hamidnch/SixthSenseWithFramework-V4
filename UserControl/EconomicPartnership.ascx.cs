using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class UserControl_EconomicPartnership : System.Web.UI.UserControl
{
    public String ImagePath
    {
        get
        {
            return ResolveUrl("~/Images");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ////if(currentModule == null || currentModule == "")
        //currentModule = "EconomicBongah";
        ////Page.Title = currentModule;
        //if (!string.IsNullOrEmpty(currentModule))
        //    addModule(currentModule);
    }
    //public string currentModule
    //{
    //    get
    //    {
    //        return (string)ViewState["moduleName"];
    //    }

    //    set
    //    {
    //        ViewState["moduleName"] = value;
    //    }
    //}
    //public void addModule(object moduleName)
    //{
    //    //get the values of the control Id and it’s value
        //string target = this.Request["__EVENTTARGET"];
        //string argument = Request.Params.Get("__EVENTARGUMENT");
        //if (!string.IsNullOrEmpty(target))
        //{
        //    if (target.Equals("btn_Article"))
        //    {
        //        Control uc1 = Page.LoadControl("~/UserControl/EconomicArticleMarket.ascx");
        //        PlaceHolder1.Controls.Add(uc1);
        //    }
        //    else
        //        if (target.Equals("btn_Bongah"))
        //        {
        //            Control uc1 = Page.LoadControl("~/UserControl/EconomicBongah.ascx");
        //            PlaceHolder1.Controls.Add(uc1);
        //        }
        //}

    //    PlaceHolder1.Controls.Clear();
    //    UserControl uCtrl = (UserControl)Page.LoadControl(string.Format("~/UserControl/{0}.ascx", moduleName));
    //    uCtrl.ID = new Guid().ToString();
    //    PlaceHolder1.Controls.Add(uCtrl);
    //    currentModule = moduleName.ToString();
    //}
    //protected void btn_Article_Click(object sender, EventArgs e)
    //{
    //    currentModule = "EconomicArticleMarket";
    //    addModule(currentModule);
    //}
    //protected void btn_Bongah_Click(object sender, EventArgs e)
    //{
    //   currentModule = "EconomicBongah";
    //   addModule(currentModule);
    //}
}