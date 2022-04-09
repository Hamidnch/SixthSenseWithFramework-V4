﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_GovernReceiptDocumentOperation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void InsertReceiptDocument(string receiptID, string boxKind, string currentAmount, string rowNumber, string receiptDate,
                                        string receiptDesc, string docNumber, string receiptAmount, string comment, string selectUserID)
    {
        DAL.Sport_InsertReceiptDocument(long.Parse(receiptID), int.Parse(boxKind), float.Parse(currentAmount), int.Parse(rowNumber),
            PersianClass.getGregorianDate(receiptDate), receiptDesc, docNumber, float.Parse(receiptAmount), comment, int.Parse(selectUserID));
    }
    [WebMethod]
    public static void InsertIntoDocumentsBox(string receiptID, string receiptAmount,string remainAmount, string comment)
    {
        //DocKind = 1 = دریافت
        DAL.Sport_InsertIntoDocumentsBox(2, 1, int.Parse(receiptID), comment, float.Parse(receiptAmount),0 , float.Parse(remainAmount), "دریافت");
    }
    [WebMethod]
    public static long GetMaxRowInReceiptDocuments()
    {
        return DAL.Sport_GetMaxRowInReceiptDocuments();
    }
    [WebMethod]
    public static DocumentInfo GetGovernReceiptInfo()
    {
        DocumentInfo governReceiptInfo = new DocumentInfo();
        governReceiptInfo.DocumentID = DAL.Sport_GetMaxRowInReceiptDocuments();
        governReceiptInfo.RegisterDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "L", false);
        governReceiptInfo.UserName = HttpContext.Current.User.Identity.Name;
        governReceiptInfo.CurrentRemainAmountBox = DAL.Sport_GetGovernmentBoxTotalAmount();
        return governReceiptInfo;
    }
    [WebMethod]
    public static void AddAmountToGovernBoxByReceipt(string amount)
    {
        DAL.Sport_AddAmountToGovernBoxByReceipt(float.Parse(amount));
    } 
}