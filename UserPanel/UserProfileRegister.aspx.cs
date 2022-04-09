using System;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class UserProfileRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static void InsertSettleDemandReward(float settleDemandAmount)
    {
        try
        {
            int userID = DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
            //ثبت درخواست کاربر برای واریز جایزه اش و کسر آن مبلغ از صندوق جایزه وی
            DAL.Sport_InsertSettleDemandReward(userID, BLL.GetIranDateTime(), settleDemandAmount, "درخواست واریز");
        }
        catch (Exception ex)
        {
            BLL.SendEmail("InsertSettleDemandReward", ex);
        }
    }
    [WebMethod]
    public static void IncreaseChargeBoxWithReward(float oldRewardInventory, float RewardAmountForCharge)
    {
        try
        {
            int userID = DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
            DAL.Sport_InsertTransferRewardToChargeBox(userID, oldRewardInventory, RewardAmountForCharge, "انتقال از صندوق جایزه به صندوق شارژ");
            DAL.Sport_AddPaymentAmountToChargeBox(Convert.ToInt32(RewardAmountForCharge), userID);
            Int32 userChargeBoxAmount = DAL.Sport_GetChargeInventoryByUserID(userID);
            float remain = userChargeBoxAmount;
            DAL.Sport_InsertIntoUserChargeBoxTurnover(userID, "واریز از طریق کسر جایزه کاربر", RewardAmountForCharge, 0, remain, "");
        }
        catch (Exception ex)
        {
            BLL.SendEmail("IncreaseChargeBoxWithReward", ex);
        }
    }       
    [WebMethod]
    public static CustomMembership getAccountInfo()
    {
        CustomMembership member = new CustomMembership();
        string userName = HttpContext.Current.User.Identity.Name;
        DAL.Membership_LoadAllAttributes(userName, member);
        return member;
    }
    [WebMethod]
    public static string Result(string controlName)
    {
        return RenderControl(controlName);
    }

    public static string RenderControl(string controlName)
    {
        Page page = new Page();
        UserControl userControl = (UserControl)page.LoadControl(controlName);
        userControl.EnableViewState = false;
        HtmlForm form = new HtmlForm();
        form.Controls.Add(userControl);
        page.Controls.Add(form);
        StringWriter textWriter = new StringWriter();
        HttpContext.Current.Server.Execute(page, textWriter, false);
        return textWriter.ToString();
    }

    [WebMethod]
    public static String InsertPublicAttribute(String firstName, String lastName, Boolean sex, String birthDay, string userName)
    {
        try
        {
            if (HttpContext.Current.User.Identity.Name != "")
            {
                DAL.Membership_InsertPublicAttributes(firstName, lastName, sex, PersianClass.getPersianNumberStyle(birthDay), userName);
                return "اطلاعات عمومی شما ثبت گردید";
            }
            else
            {
                return "هویت شما معلوم نیست،دوباره لوگین فرمائید";
            }
        }
        catch (Exception ex)
        {
            return "خطای مقابل یه وقوع پیوست:" + ex.Message;
        }
    }

    [WebMethod]
    public static String InsertContactInfo(String phone, String mobile, String address,
        String country, String city, String userName)
    {
        try
        {
            if (HttpContext.Current.User.Identity.Name != "")
            {
                DAL.Membership_InsertContactInfo(phone, mobile, address, country, city, userName);
                return "اطلاعات تماس شما به ثبت رسید";
            }
            else
            {
                return "هویت شما معلوم نیست،دوباره لوگین فرمائید";
            }
        }
        catch (Exception ex)
        {
            return "خطای مقابل یه وقوع پیوست:" + ex.Message;
        }
    }

    [WebMethod]
    public static String InsertEmailPassInfo(String currentPassword, String currentEmail, String newPass,
                                                                            String newEmail, String userName)
    {
        try
        {
            if (HttpContext.Current.User.Identity.Name != "")
            {
                if (DAL.Membership_ExistsUserNameOrEmail("SP_Membership_ExistEmail", "@email", newEmail) &&
                    (newEmail.Trim() != currentEmail.Trim()))
                {
                    return "این ایمیل قبلا توسط شخص دیگری استفاده شده است";
                }
                else
                {
                    if (DAL.Membership_GetPasswordByUserName(userName) == BLL.Encrypt(currentPassword))
                    {
                        newPass = BLL.Encrypt(newPass);
                        DAL.Membership_InsertNewEmailPassword(newPass, newEmail, userName);
                        return "عملیات با موفقیت به پایان رسید";
                    }
                    return "شما پسورد قبلیتان را اشتباه وارد کرده اید";
                }
            }
            else
            {
                return "هویت شما معلوم نیست،دوباره لوگین فرمائید";
            }
        }
        catch (Exception ex)
        {
            return "خطای مقابل به وقوع پیوست" + ex.Message;
        }
    }

    [WebMethod]
    public static String InsertAccountInfo(String accountName, String accountFamily,
                String accountNumber, String bankName, String webSite, String yahooID, String comment, String userName)
    {
        try
        {
            if (HttpContext.Current.User.Identity.Name != "")
            {
                DAL.Membership_InsertAccountInfo(accountName, accountFamily,
                        accountNumber, bankName, webSite, yahooID, comment, userName);
                return "اطلاعات حساب شما ثبت گردید";
            }
            else
            {
                return "هویت شما معلوم نیست،دوباره لوگین فرمائید";
            }
        }
        catch (Exception ex)
        {
            return "خطای مقابل به وقوع پیوست" + ex.Message;
        }
    }
    [WebMethod]
    public static void InsertVariance(String varianceType, String varianceAmount, String varianceDate, String varianceDescription)
    {
        DAL.Sport_InsertVariance(int.Parse(varianceType), float.Parse(varianceAmount), PersianClass.getGregorianDate(varianceDate), varianceDescription);
    }
}