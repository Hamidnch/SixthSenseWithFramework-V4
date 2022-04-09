using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_SportRacingFormEdit : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            if (Request.QueryString["formID"] != null)
            {
                String FormID = Request.QueryString["formID"].ToString();
                if (DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name.ToLower()) == DAL.Sport_GetOwnerForm(FormID))
                {
                    if (!Page.IsPostBack)
                    {
                        String info = DAL.Sport_GetSelectedFormInfo(FormID);
                        if (info != "")
                        {
                            string[] data = info.Split(';');
                            lbl_RacingInfoID.Text = data[0];
                            lbl_RaceTitle.Text = data[1];
                            lbl_RacingDetails.Text = data[2];
                            lbl_RacingStartEndDate.Text = PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(data[3], "L", false) +
                                    " الی  " + PersianClass.getPersiaDate(data[4], "L", false));
                            lbl_RacingRespite.Text = PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(data[5], "S", false) +
                                                                                            " ساعت  " + data[6]);
                            MyHidden.Value = data[8];
                            chk_FormActiveStatus.Checked = bool.Parse(data[9]);
                            lbl_TotalCount.Text = MyHidden.Value;

                            gv_Racing.DataSource = DAL.Sport_LoadAllGamesByFormInfoID(FormID);
                            gv_Racing.DataBind();
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/error.htm", false);
                }
            }
            else
            {
                Response.Redirect("~/NotFind.htm", false);
            }
        }
        else
        {
            Response.Redirect("~/error.htm", false);
        }
    }
    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            if (Request.QueryString["formID"] != null)
            {
                String FormID = Request.QueryString["formID"].ToString();
                if (DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name.ToLower()) == DAL.Sport_GetOwnerForm(FormID))
                {
                    Session["moduleName"] = "UserActiveForms";
                    Response.Redirect("~/UserPanel/UserProfileRegister.aspx", false);
                }
            }
        }
    }
    protected void btn_saveForm_Click(object sender, EventArgs e)
    {
        Application.Lock();
        if (Page.IsValid)
        {
            btn_saveForm.Enabled = false;
            if (Context.User.Identity.IsAuthenticated)
            {
                String formID = Request.QueryString["formID"] == null ? "" : Request.QueryString["formID"].ToString();
                String racingInfoID = lbl_RacingInfoID.Text;
                int UserID = DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name);
                int formAmount = int.Parse(MyHidden.Value);
                if (!String.IsNullOrWhiteSpace(formID))
                {
                    try
                    {
                        int allCount = 0;
                        int count = 0;
                        foreach (GridViewRow row in gv_Racing.Rows)
                        {
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                allCount += count;
                                count = 0;
                                Label lbl_GameID = (Label)row.Cells[0].FindControl("lbl_GameID");
                                Label lbl_HostTeamID = (Label)row.Cells[1].FindControl("lbl_HostTeamID");
                                Label lbl_GuestTeamID = (Label)row.Cells[5].FindControl("lbl_GuestTeamID");
                                CheckBox chkHost = (CheckBox)row.Cells[2].FindControl("chkHost");
                                CheckBox chkHostGuest = (CheckBox)row.Cells[3].FindControl("chkHostGuest");
                                CheckBox chkGuest = (CheckBox)row.Cells[4].FindControl("chkGuest");
                                int gameID = int.Parse(lbl_GameID.Text);
                                int hostTeamID = int.Parse(lbl_HostTeamID.Text);
                                int guestTeamID = int.Parse(lbl_GuestTeamID.Text);
                                Boolean isHostWin = chkHost.Checked;
                                Boolean isEqualTeams = chkHostGuest.Checked;
                                Boolean isGuestWin = chkGuest.Checked;
                                if (isHostWin)
                                    count++;
                                if (isEqualTeams)
                                    count++;
                                if (isGuestWin)
                                    count++;
                                int checkCount = count;
                                DAL.Sport_UpdateRacingFormInfo(formID, gameID, hostTeamID, guestTeamID, isHostWin, isEqualTeams, isGuestWin, checkCount);
                                // ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "script", "alert('اطلاعات فرم ثبت گردید.');clearForm()", true);
                            }
                        }
                        allCount *= 5000;
                        String formStatus = (chk_FormActiveStatus.Checked) ? "فعالسازی مجدد" : "غیرفعال توسط کاربر";
                        DAL.Sport_UpdateRacingFormAmount(formID, racingInfoID, UserID, formAmount, formStatus);
                        lbl_TotalCount.Text = formAmount.ToString();
                        btn_saveForm.Enabled = true;
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "script2", "alert('اطلاعات فرم ثبت گردید.');", true);
                        btn_Exit_Click(sender, e);
                    }

                    catch (Exception ex)
                    {
                        Application.UnLock();
                        BLL.SendEmail("خطا در قسمت ویرایش فرمهای کاربران", ex);
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "Racing_modal", "alert('وقوع خطای: " + ex.Message + "')", true);
                    }
                }
            }
            else { return; }
            Application.UnLock();
        }
    }
}