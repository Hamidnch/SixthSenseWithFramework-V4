using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_GovernPaymentDocumentOperation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
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
        DAL.Sport_InsertIntoDocumentsBox(2, 2, int.Parse(paymentID), comment, 0, float.Parse(paymentAmount), float.Parse(remainAmount), "پرداخت");
    }
    [WebMethod]
    public static long GetMaxRowInPaymentDocuments()
    {
        return DAL.Sport_GetMaxRowInPaymentDocuments();
    }
    [WebMethod]
    public static DocumentInfo GetGovernPaymentInfo()
    {
        DocumentInfo governPaymentInfo = new DocumentInfo();
        governPaymentInfo.DocumentID = DAL.Sport_GetMaxRowInPaymentDocuments();
        governPaymentInfo.RegisterDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "L", false);
        governPaymentInfo.UserName = HttpContext.Current.User.Identity.Name;
        governPaymentInfo.CurrentRemainAmountBox = DAL.Sport_GetGovernmentBoxTotalAmount();
        return governPaymentInfo;
    }
    [WebMethod]
    public static void ReduceAmountFromGovernmentBoxByPayment(string amount)
    {
        DAL.Sport_ReduceAmountFromGovernmentBox(float.Parse(amount));
    }
}