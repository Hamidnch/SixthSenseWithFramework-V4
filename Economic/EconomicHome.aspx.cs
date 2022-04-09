using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class EconomicHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserControl Eco_HorizMenu = (UserControl)Page.Master.FindControl("EconomicHorizMenu1");

        HtmlAnchor menuEcoHome = (HtmlAnchor)Eco_HorizMenu.FindControl("ecoHome");
        //HtmlImage imgHome = (HtmlImage)EconomicSlideShow1.FindControl("imgEco_Home");
        menuEcoHome.Attributes.Add("onmouseover", "menuEcoHomeOver()");
        menuEcoHome.Attributes.Add("onmouseout", "menuEcoAllOut()");

        HtmlAnchor menuEcoAnalysis = (HtmlAnchor)Eco_HorizMenu.FindControl("ecoAnalysis");
        //HtmlImage imgEcoAnalysis = (HtmlImage)EconomicSlideShow1.FindControl("imgEco_Analysis");
        menuEcoAnalysis.Attributes.Add("onmouseover", "menuEcoAnalysisOver()");
        menuEcoAnalysis.Attributes.Add("onmouseout", "menuEcoAllOut()");

        HtmlAnchor menuEcoServices = (HtmlAnchor)Eco_HorizMenu.FindControl("ecoServices");
        //HtmlImage imgEcoServices = (HtmlImage)EconomicSlideShow1.FindControl("imgEco_Services");
        menuEcoServices.Attributes.Add("onmouseover", "menuEcoServicesOver()");
        menuEcoServices.Attributes.Add("onmouseout", "menuEcoAllOut()");

        HtmlAnchor menuEcoPartnership = (HtmlAnchor)Eco_HorizMenu.FindControl("ecoPartnership");
        //HtmlImage imgEcoPartnership = (HtmlImage)EconomicSlideShow1.FindControl("imgEco_Partnership");
        menuEcoPartnership.Attributes.Add("onmouseover", "menuEcoPartnershipOver()");
        menuEcoPartnership.Attributes.Add("onmouseout", "menuEcoAllOut()");

        HtmlAnchor menuEcoContactUs = (HtmlAnchor)Eco_HorizMenu.FindControl("ecoContactUs");
        //HtmlImage imgEcoContactUs = (HtmlImage)EconomicSlideShow1.FindControl("imgEco_ContactUs");
        menuEcoContactUs.Attributes.Add("onmouseover", "menuEcoContactUsOver()");
        menuEcoContactUs.Attributes.Add("onmouseout", "menuEcoAllOut()");
    }
}