using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_BongahAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void InsertBongah(String bongahType, String bongahLocation, String bongahAttribute,
                    Boolean bongahBuy, Boolean bongahSale, Boolean bongahInvestor, Boolean bongahCapitalist)
    {
        DAL.Economic_InsertBongah(bongahType, bongahLocation, bongahAttribute,
               bongahBuy, bongahSale, bongahInvestor, bongahCapitalist);
    }
}