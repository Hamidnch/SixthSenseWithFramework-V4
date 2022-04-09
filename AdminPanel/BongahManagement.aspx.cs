using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_BongahManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void DeleteBongah(List<String> selectedIds)
    {
        try
        {
            foreach (String item in selectedIds)
            {
                DAL.Economic_DeleteBongahByID(item.Trim());
            }
        }
        catch
        {
        }
    }
    //[WebMethod]
    //public static void DeleteBongah(String bongahId)
    //{
    //    DAL.Economic_DeleteBongahByID(bongahId);
    //}
    [WebMethod]
    public static BongahInfo GetBongahInfo(int bongahId)
    {
        return DAL.Economic_GetBongahInfoByID(bongahId);
    }
    [WebMethod]
    public static void UpdateBongahInfo(int bongahId, String bongahType, String bongahLocation, String bongahAttribute,
                    Boolean bongahBuy, Boolean bongahSale, Boolean bongahInvestor, Boolean bongahCapitalist)
    {
        DAL.Economic_UpdateBongahInfo(bongahId, bongahType, bongahLocation, bongahAttribute,
                    bongahBuy, bongahSale, bongahInvestor, bongahCapitalist);
    }
}