using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class AdminPanel_RewardPaymentDocumentOperation : System.Web.UI.Page
{
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
        DAL.Sport_InsertIntoDocumentsBox(4, 2, int.Parse(paymentID), comment, 0, float.Parse(paymentAmount), float.Parse(remainAmount), "پرداخت");
    }
    [WebMethod]
    public static long GetMaxRowInReceiptDocuments()
    {
        return DAL.Sport_GetMaxRowInReceiptDocuments();
    }
    [WebMethod]
    public static DocumentInfo GetRewardPaymentInfo(int userID)
    {
        DocumentInfo rewardPaymentInfo = new DocumentInfo();
        rewardPaymentInfo.DocumentID = DAL.Sport_GetMaxRowInPaymentDocuments();
        rewardPaymentInfo.RegisterDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "L", false);
        rewardPaymentInfo.UserName = HttpContext.Current.User.Identity.Name;
        rewardPaymentInfo.CurrentRemainAmountBox = DAL.Sport_GetRewardInventoryByUserID(userID);
        return rewardPaymentInfo;
    }
    [WebMethod]
    public static void ReduceAmountFromRewardBoxByPaymentAndUserID(int userID, string amount)
    {
        DAL.Sport_ReduceAmountFromRewardBoxByReceiptAndUserID(userID, float.Parse(amount));
    }
    [WebMethod]
    public static List<CustomMembership> LoadAllUsers()
    {
        List<CustomMembership> users = new List<CustomMembership>();
        DataSet ds = DAL.Membership_LoadAllUsers();
        foreach (DataRow item in ds.Tables[0].Rows)
        {
            CustomMembership user = new CustomMembership();
            user.MemberID = int.Parse(item["Member_ID"].ToString());
            user.Username = item["Member_UserName"].ToString();
            users.Add(user);
        }
        return users.ToList();
    }
    [WebMethod]
    public static CustomMembership GetUserAttributes(string userName)
    {
        CustomMembership member = DAL.Membership_LoadAllAttributes(userName);
        return member;
    }
}