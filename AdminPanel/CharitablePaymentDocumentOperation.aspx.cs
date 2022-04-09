using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_CharitablePaymentDocumentOperation : System.Web.UI.Page
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
    public static void InsertIntoDocumentsBox(string paymentID, string paymentAmount, string remainAmount, string comment)
    {
        //DocKind = 2 = پرداخت
        DAL.Sport_InsertIntoDocumentsBox(3, 2, int.Parse(paymentID), comment, 0, float.Parse(paymentAmount), float.Parse(remainAmount), "پرداخت");
    }
    [WebMethod]
    public static long GetMaxRowInPaymentDocuments()
    {
        return DAL.Sport_GetMaxRowInPaymentDocuments();
    }
    [WebMethod]
    public static DocumentInfo GetCharitablePaymentInfo()
    {
        DocumentInfo charitablePaymentInfo = new DocumentInfo();
        charitablePaymentInfo.DocumentID = DAL.Sport_GetMaxRowInPaymentDocuments();
        charitablePaymentInfo.RegisterDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "L", false);
        charitablePaymentInfo.UserName = HttpContext.Current.User.Identity.Name;
        charitablePaymentInfo.CurrentRemainAmountBox = DAL.Sport_GetCharitableBoxTotalAmount();
        return charitablePaymentInfo;
    }
    [WebMethod]
    public static void ReduceAmountFromCharitableBoxByPayment(string amount)
    {
        DAL.Sport_ReduceAmountFromCharitableBox(float.Parse(amount));
    }
}