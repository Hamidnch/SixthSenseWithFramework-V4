using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserInventoryStatus : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                String userName = Context.User.Identity.Name;

                lbl_UserName.Text = userName;
                CustomMembership member = new CustomMembership();
                DAL.Membership_LoadAllAttributes(lbl_UserName.Text, member);
                lbl_UserAttr.Text = member.FName + " " + member.LastName;
                lbl_Today.Text = "امروز " + PersianClass.getPersiaDate(BLL.GetIranDateTime(), "S", true, "H");
                lbl_ChargeBoxInventory.Text = PersianClass.getPersianNumberStyle(DAL.Sport_GetChargeInventoryByUserID(DAL.Membership_GetUserIDByUserName(userName)).ToString("n0")) + " ریال";
                lbl_RewardBoxInventory.Text = PersianClass.getPersianNumberStyle(DAL.Sport_GetRewardInventoryByUserID(DAL.Membership_GetUserIDByUserName(userName)).ToString("n0")) + " ریال";

                string chargeBoxInfo = DAL.Sport_GetLastPaymentInChargeBox(DAL.Membership_GetUserIDByUserName(userName));
                string transferInfo = DAL.Sport_GetLastTransferRewardToChargeBoxByUserID(DAL.Membership_GetUserIDByUserName(userName));

                if ((chargeBoxInfo != "" || chargeBoxInfo != null) || (transferInfo != "" || transferInfo != null))
                {
                    string[] chargeData = chargeBoxInfo.Split(';');
                    string[] transferData = transferInfo.Split(';');
                    if (transferData[0] != "" && transferData[0] != null && transferData[1] != "" && transferData[1]!= null)
                    {
                        if (DateTime.Parse(chargeData[0].ToString()) > DateTime.Parse(transferData[0].ToString()))
                        {
                            lbl_LastChargeDate.Text = PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(chargeData[0], "S", true, "H"));
                            lbl_LastChargeAmount.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", float.Parse(chargeData[1])));
                        }
                        else
                        {
                            lbl_LastChargeDate.Text = PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(transferData[0], "S", true, "H"));
                            lbl_LastChargeAmount.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", float.Parse(transferData[1])));
                        }
                    }
                    else
                    {
                        lbl_LastChargeDate.Text = PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(chargeData[0], "S", true, "H"));
                        lbl_LastChargeAmount.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", float.Parse(chargeData[1])));
                    }
                }
            }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch (Exception ex) { BLL.SendEmail("UserPanel_UserInventoryStatus", ex); }
    }
}