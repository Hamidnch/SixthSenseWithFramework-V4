using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

public partial class Sport_Sport_SaderatRedirectUrl : System.Web.UI.Page
{
    string x_trans_id = string.Empty;
    string x_response_code = string.Empty;
    string x_response_subcode = string.Empty;
    string x_response_reason_code = string.Empty;
    string x_response_reason_text = string.Empty;
    string x_login = string.Empty;
    string x_fp_sequence = string.Empty;
    string x_fp_timestamp = string.Empty;
    string x_amount = string.Empty;
    string x_currency_code = string.Empty;
    string x_fp_hash = string.Empty;
    string signature = "";
    string result = "";
    string status = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            try
            {
                x_trans_id = Request["x_trans_id"].ToString();  //شماره رسيد الکترونيکي 
                x_response_code = Request["x_response_code"].ToString();//1 = Approved, 2 = Declined, 3 = Error === نتيجه تراکنش مالي مشتري           
                x_response_subcode = Request["x_response_subcode"].ToString();//کد جزيي پاسخ
                x_response_reason_code = Request["x_response_reason_code"].ToString(); //کد علت پاسخ
                x_response_reason_text = Request["x_response_reason_text"].ToString(); //توضيح علت پاسخ
                x_login = Request["x_login"].ToString(); //شناسه پذیرنده
                x_fp_sequence = Request["x_fp_sequence"].ToString(); //کد خرید یا شماره تراکنش
                x_fp_timestamp = Request["x_fp_timestamp"].ToString();//زمان امضا
                x_amount = Request["x_amount"].ToString(); //مبلغ خرید
                x_currency_code = Request["x_currency_code"].ToString(); //واحد پول
                x_fp_hash = Request["x_fp_hash"].ToString(); //امضا
                result = x_trans_id + "^" + x_response_code + "^" + x_response_subcode + "^" + x_response_reason_code + "^" +
                    x_response_reason_text + "^" + x_login + "^" + x_fp_sequence + "^" + x_fp_timestamp + "^" + x_amount + "^" + x_currency_code;
                signature = BLL.HMAC_MD5("mUjXxqIRyA5vl8CL", result);
                if (signature.ToUpper() == x_fp_hash.ToUpper())
                {
                    lbl_Date.Text = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "D", false);
                    lbl_Time.Text = BLL.GetTime();
                    trans_Id.Text = x_trans_id;
                    if (x_response_code == "1")
                    {
                        try
                        {
                            if (DAL.Sport_GetPaymentStatus(x_trans_id, x_fp_sequence, x_fp_timestamp) != "واریز")
                            {
                                try
                                {
                                    int userID = DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name);
                                    DAL.Sport_AddPaymentAmountToChargeBox(int.Parse(x_amount), userID);
                                    Int32 userChargeBoxAmountRemain = DAL.Sport_GetChargeInventoryByUserID(userID);
                                    float remain = userChargeBoxAmountRemain;
                                    DAL.Sport_InsertIntoUserChargeBoxTurnover(userID, "واریز از طریق بانک صادرات", float.Parse(x_amount), 0, remain, "");
                                }
                                catch (Exception ex)
                                {
                                    BLL.SendEmail("AddPaymentAmountToChargeBox - بانك صادرات", ex);
                                }
                            }
                            status = "واریز";
                            response_code.Text = "Approved";
                            lbl_Success.Text = "کاربر گرامی " + Context.User.Identity.Name + " عملیات پرداخت با موفقیت انجام شد و حساب کاربری شما مبلغ " +
                                x_amount + " ریال شارژ گردید.";
                            x_fp_sequence = x_fp_sequence == null ? "" : x_fp_sequence;
                            x_fp_timestamp = x_fp_timestamp == null ? "" : x_fp_timestamp;
                        }
                        catch (Exception ex)
                        {
                            lbl_Success.Text = "خطا در ثبت اطلاعات ارسالي از بانك صادرات";
                            BLL.SendEmail("GetPaymentStatus - بانك صادرات", ex);
                        }
                    }
                    else if (x_response_code == "2")
                    {
                        response_code.Text = "Declined";
                        status = "اطلاعات نادرست";
                    }
                    else if (x_response_code == "3")
                    {
                        response_code.Text = "Error 3";
                        status = "خطا";
                    }
                    else if (x_response_code == "4")
                    {
                        response_code.Text = "Ambiguous";
                        status = "مبهم";
                    }
                    response_subcode.Text = x_response_subcode;
                    response_reason_code.Text = x_response_reason_code;
                    response_reason_text.Text = x_response_reason_text;
                    login.Text = x_login;
                    fp_sequence.Text = x_fp_sequence;
                    fp_timestamp.Text = x_fp_timestamp;
                    amount.Text = string.Format("{0:n0}", x_amount);
                    currency_code.Text = x_currency_code;
                    fp_hash.Text = x_fp_hash;
                    try
                    {
                        DAL.Sport_UpdatePeymentsMelli("2", x_trans_id, response_code.Text, x_fp_sequence, x_fp_timestamp, x_fp_hash,
                                    x_response_code, x_response_subcode, x_response_reason_code, x_response_reason_text, status);
                        lbl_reservationNumber.Text = DAL.Sport_GetReservationByReferenceInPayments(x_trans_id);
                        String emailByUser = DAL.Membership_GetEmailForUserName(User.Identity.Name);
                        if (emailByUser != null || emailByUser != "")
                        {
                            BLL.SendEmail("mail@hesesheshom.com", emailByUser, "پرداخت از طریق درگاه صادرات", "عملیات پرداخت از طریق درگاه صادرات با موفقیت انجام پذیرفت" +
                                "<br /><div style='font-family:tahoma;color:blue;line-height:30px'><span>کددیجیتالی شما: " + lbl_reservationNumber.Text + "</span>" +
                                "<br /><span>مبلغ پرداختی شما:" + amount.Text + " ریال</span>" +
                                "<br /><span>کدپیگیری شما: " + trans_Id.Text + "</span></div>", true, "Ok");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "وقوع خطای " + ex.Message;
                        BLL.SendEmail("خطا در هنگام بروز رسانی پرداخت کاربر در دیتابیس - بانک صادرات", ex);
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "امضا نادرست می باشد";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "خطا در اجرای عملیات" + "<br />" + ex.Message;
                //+ "<br />" + "Signature = " + signature + "<br />" + "fp_hash = " + x_fp_hash;
                BLL.SendEmail("خطا در اجرای عملیات بانک صادرات", ex);
            }
        }
    }
}