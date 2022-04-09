using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_BoxesInventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) { }

    public class Box
    {
        private string today;
        public string Today{get { return today; }set { today = value; }}
        private string settleAmount;
        public string SettleAmount{get { return settleAmount; }set { settleAmount = value; }}
        private string takeAmount;
        public string TakeAmount{get { return takeAmount; }set { takeAmount = value; }}
        private string remainAmount;
        public string RemainAmount{get { return remainAmount; }set { remainAmount = value; }}
    }
    private static string GetToday()
    {
        return PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true, "H");
    }
    [WebMethod]
    public static Box getSiteBoxData()
    {
        Box box = new Box();
        float sumAmountReceiptDocumets = DAL.Sport_GetSumAmountReceiptDocumentsByBoxKind(1);
        box.Today = GetToday();
        box.SettleAmount = Convert.ToDouble(DAL.Sport_GetSumSettleAmountToSiteBox() + sumAmountReceiptDocumets).ToString();
        box.TakeAmount = DAL.Sport_GetSumAmountPaymentDocumentsByBoxKind(1).ToString();
        box.RemainAmount = Convert.ToDouble(DAL.Sport_GetSiteBoxTotalAmount()).ToString();
        return box;
    }
    [WebMethod]
    public static Box getGovernmentBoxData()
    {
        Box box = new Box();
        float sumAmountReceiptDocumets = DAL.Sport_GetSumAmountReceiptDocumentsByBoxKind(2);
        box.Today = GetToday();
        box.SettleAmount = Convert.ToDouble(DAL.Sport_GetSumSettleAmountToGovernmentBox() + sumAmountReceiptDocumets).ToString();
        box.TakeAmount = DAL.Sport_GetSumAmountPaymentDocumentsByBoxKind(2).ToString();
        box.RemainAmount = Convert.ToDouble(DAL.Sport_GetGovernmentBoxTotalAmount()).ToString();
        return box;
    }
    [WebMethod]
    public static Box getCharitableBoxData()
    {
        Box box = new Box();
        float sumAmountReceiptDocumets = DAL.Sport_GetSumAmountReceiptDocumentsByBoxKind(3);
        box.Today = GetToday();
        box.SettleAmount = Convert.ToDouble(DAL.Sport_GetSumSettleAmountToCharitableBox() + sumAmountReceiptDocumets).ToString();
        box.TakeAmount = DAL.Sport_GetSumAmountPaymentDocumentsByBoxKind(3).ToString();
        box.RemainAmount = Convert.ToDouble(DAL.Sport_GetCharitableBoxTotalAmount()).ToString();
        return box;
    }
    [WebMethod]
    public static Box getRewardBoxData()
    {
        Box box = new Box();
        float sumAmountReceiptDocumets = DAL.Sport_GetSumAmountReceiptDocumentsByBoxKind(4);
        box.Today = GetToday();
        box.SettleAmount = Convert.ToDouble(DAL.Sport_GetSumSettleAmountToRewardBox() + sumAmountReceiptDocumets).ToString();
        box.TakeAmount = DAL.Sport_GetSumAmountPaymentDocumentsByBoxKind(4).ToString();
        box.RemainAmount = Convert.ToDouble(DAL.Sport_GetRewardBoxTotalAmount()).ToString();
        return box;
    }
    [WebMethod]
    public static Box getUsersChargeBoxData()
    {
        Box box = new Box();
        box.Today = GetToday();
        box.SettleAmount = "0";
        box.TakeAmount = "0";
        box.RemainAmount = Convert.ToDouble(DAL.Sport_GetUsersChargeBoxTotalAmount()).ToString();
        return box;
    }
}