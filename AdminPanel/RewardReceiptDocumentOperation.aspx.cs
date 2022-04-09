using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class AdminPanel_RewardReceiptDocumentOperation : System.Web.UI.Page
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
    public static void InsertIntoDocumentsBox(string receiptID, string receiptAmount, string remainAmount, string comment)
    {
        //DocKind = 1 = دریافت
        DAL.Sport_InsertIntoDocumentsBox(4, 1, int.Parse(receiptID), comment, float.Parse(receiptAmount), 0, float.Parse(remainAmount), "دریافت");
    }
    [WebMethod]
    public static long GetMaxRowInReceiptDocuments()
    {
        return DAL.Sport_GetMaxRowInReceiptDocuments();
    }
    [WebMethod]
    public static DocumentInfo GetRewardReceiptInfo(int userID)
    {
        DocumentInfo rewardReceiptInfo = new DocumentInfo();
        rewardReceiptInfo.DocumentID = DAL.Sport_GetMaxRowInReceiptDocuments();
        rewardReceiptInfo.RegisterDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "L", false);
        rewardReceiptInfo.UserName = HttpContext.Current.User.Identity.Name;
        rewardReceiptInfo.CurrentRemainAmountBox = DAL.Sport_GetRewardInventoryByUserID(userID);
        return rewardReceiptInfo;
    }
    [WebMethod]
    public static void AddAmountToRewardBoxByReceiptAndUserID(int userID, string amount)
    {
        DAL.Sport_AddAmountToRewardBoxByReceiptAndUserID(userID, float.Parse(amount));
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