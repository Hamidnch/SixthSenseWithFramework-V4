using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page//OnlineUserClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session.Add("User", User.Identity.Name);
        //DataTable dt = (DataTable)Cache["UserOnlineList"];
        //Title = dt.Rows.Count.ToString();
        //Check_Session();   
        UserControl HorizMenu = (UserControl)Page.Master.FindControl("HorizMenu1");

        HtmlGenericControl menuHome = (HtmlGenericControl)HorizMenu.FindControl("menuHome");
        //HtmlImage imgHome = (HtmlImage)SlideShowPicture1.FindControl("imgHome");
        menuHome.Attributes.Add("onmouseover", "menuHomeOver()");
        menuHome.Attributes.Add("onmouseout", "menuAllOut()");

        HtmlGenericControl menuRace = (HtmlGenericControl)HorizMenu.FindControl("menuRace");
        //HtmlImage imgRace = (HtmlImage)SlideShowPicture1.FindControl("imgRace");
        menuRace.Attributes.Add("onmouseover", "menuRaceOver()");
        menuRace.Attributes.Add("onmouseout", "menuAllOut()");

        HtmlGenericControl menuEconomic = (HtmlGenericControl)HorizMenu.FindControl("menuEconomic");
        //HtmlImage imgEconomic = (HtmlImage)SlideShowPicture1.FindControl("imgEconomic");
        menuEconomic.Attributes.Add("onmouseover", "menuEconomicOver()");
        menuEconomic.Attributes.Add("onmouseout", "menuAllOut()");

        HtmlGenericControl menuEducate = (HtmlGenericControl)HorizMenu.FindControl("menuEducate");
        //HtmlImage imgEducate = (HtmlImage)SlideShowPicture1.FindControl("imgEducate");
        menuEducate.Attributes.Add("onmouseover", "menuEducateOver()");
        menuEducate.Attributes.Add("onmouseout", "menuAllOut()");

        HtmlGenericControl menuContactUs = (HtmlGenericControl)HorizMenu.FindControl("menuContactUs");
        //HtmlImage imgContactUs = (HtmlImage)SlideShowPicture1.FindControl("imgContactUs");
        menuContactUs.Attributes.Add("onmouseover", "menuContactUsOver()");
        menuContactUs.Attributes.Add("onmouseout", "menuAllOut()");
    }
}