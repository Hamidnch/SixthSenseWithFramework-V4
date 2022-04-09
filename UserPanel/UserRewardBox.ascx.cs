using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserRewardBox : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    public int ActiveUserID {get{return DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name);}}
    public bool IsUserAuthenticated {get{return Context.User.Identity.IsAuthenticated;}}
    //protected override void OnPreRender(EventArgs e)
    //{
    //    ScriptManager s = new ScriptManager();
    //    s.EnablePageMethods = true;
    //    s.Services.Add(new ServiceReference("~/UserPanelService.asmx"));
    //    s.Scripts.Add(new ScriptReference("~/Scripts/PreviewScripts/PreviewScript.js"));
    //    s.Scripts.Add(new ScriptReference("~/Scripts/PreviewScripts/PreviewDragDrop.js"));
    //    s.Scripts.Add(new ScriptReference("~/Scripts/PreviewScripts/PreviewGlitz.js"));

    //    base.OnPreRender(e);
    //}
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
                lbl_RewardBoxInventory.Text = PersianClass.getPersianNumberStyle(DAL.Sport_GetRewardInventoryByUserID(DAL.Membership_GetUserIDByUserName(userName)).ToString("n0")) + " ریال";
                hdn_RewardBoxInventory.Value = DAL.Sport_GetRewardInventoryByUserID(DAL.Membership_GetUserIDByUserName(userName)).ToString();
               
                string info = DAL.Sport_GetLastPaymentInRewardBox(DAL.Membership_GetUserIDByUserName(userName));
                if (info != "" || info != null)
                {
                    string[] data = info.Split(';');
                    lbl_LastRewardDate.Text = PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(data[0], "S", true, "H"));
                    lbl_LastRewardAmount.Text = PersianClass.getPersianNumberStyle(string.Format("{0:n0}", float.Parse(data[1]))) + " ریال";
                    if (lbl_RewardBoxInventory.Text == "۰ ریال" || lbl_RewardBoxInventory.Text == "............ ریال")
                    {
                        btn_RewardsDetails.Disabled = true;
                        btn_SettleDemand.Disabled = true;
                        btn_ChargeWithRewards.Disabled = true;
                    }
                } 
            }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch(Exception ex){BLL.SendEmail("UserPanel_UserRewardBox", ex);}
    }
   
    //public static void InsertSettleDemandReward(float settleDemandAmount)
    //{
    //    int userID = DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
    //    //ثبت درخواست کاربر برای واریز جایزه اش و کسر آن مبلغ از صندوق جایزه وی
    //    DAL.Sport_InsertSettleDemandReward(userID, BLL.GetIranDateTime(), settleDemandAmount, "درخواست واریز");
    //}
    //protected void btn_SettleDemandRewardRegister_Click(object sender, EventArgs e)
    //{
    //    InsertSettleDemandReward(float.Parse(txt_DemandYourAmount.Value));
    //}
}