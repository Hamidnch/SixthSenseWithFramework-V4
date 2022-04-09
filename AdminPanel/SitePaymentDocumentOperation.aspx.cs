using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_SitePaymentDocumentOperation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e){}
    [WebMethod]
    public static void InsertPaymentDocument(string paymentID, string boxKind, string currentAmount, string rowNumber, string paymentDate,
                                        string paymentDesc, string docNumber, string paymentAmount, string comment, string selectUserID)
    {
        DAL.Sport_InsertPaymentDocument(long.Parse(paymentID), int.Parse(boxKind), float.Parse(currentAmount), int.Parse(rowNumber),
           PersianClass.getGregorianDate(paymentDate), paymentDesc, docNumber, float.Parse(paymentAmount), comment, int.Parse(selectUserID));
    }
    [WebMethod]
    public static void InsertIntoDocumentsBox(string paymentID, string paymentAmount,string remainAmount, string comment)
    {
        //DocKind = 2 = پرداخت
        DAL.Sport_InsertIntoDocumentsBox(1, 2, int.Parse(paymentID), comment, 0, float.Parse(paymentAmount), float.Parse(remainAmount), "پرداخت");
    }
    [WebMethod]
    public static long GetMaxRowInPaymentDocuments()
    {
        return DAL.Sport_GetMaxRowInPaymentDocuments();
    }
    [WebMethod]
    public static DocumentInfo GetSitePaymentInfo()
    {
        DocumentInfo sitePaymentInfo = new DocumentInfo();
        sitePaymentInfo.DocumentID = DAL.Sport_GetMaxRowInPaymentDocuments();
        sitePaymentInfo.RegisterDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "L", false);
        sitePaymentInfo.UserName = HttpContext.Current.User.Identity.Name;
        sitePaymentInfo.CurrentRemainAmountBox = DAL.Sport_GetSiteBoxTotalAmount();
        return sitePaymentInfo;
    }
    [WebMethod]
    public static void ReduceAmountFromSiteBoxByPayment(string amount)
    {
        DAL.Sport_ReduceAmountFromSiteBox(float.Parse(amount));
    }
}