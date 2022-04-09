using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_SportRacing : System.Web.UI.UserControl
{
    public String ImagePath{get{return ResolveUrl("~/Images");}}
    public String racingInfo_ID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //String script = "<script language='javascript' type='text/javascript'>";
        //script += "$(document).ready(function ()";
        //script += "{";
        //script += "var checkedCount = 0;";
        //script += "$('table[id$=gv_Racing]').find('input:checkbox').change(function ()";
        //script += "{";
        //script += "var tr = $(this).closest('tr');";
        //script += "if (tr.find('input:checkbox:checked').length == 3)";
        //script += "{";
        //script += "alert('You can\'t select more than 2 checkbox per row ');this.checked = false; }});});</script>";
        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", script);

        if (HttpContext.Current.User.Identity.IsAuthenticated && Request.QueryString["racingInfoID"].ToString() != null)
        {
            racingInfo_ID = Request.QueryString["racingInfoID"].ToString();
            int userID = DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
            formCount.InnerText = DAL.Sport_GetUserFormsCountByRacingInfoID(racingInfo_ID, userID).ToString();
            if (DAL.Sport_IsNotExpireRacingDate(racingInfo_ID))
            {                
                String info = DAL.Sport_GetSelectedRacingInfo(racingInfo_ID);
                if (info != "")
                {
                    string[] data = info.Split(';');
                    lbl_RacingInfoID.Text = data[0];
                    lbl_RaceTitle.InnerText = data[1];
                    lbl_RacingDetails.Text = data[2];
                    lbl_RacingStartEndDate.Text = PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(data[3], "L", false) +
                            " الی  " + PersianClass.getPersiaDate(data[4], "L", false));
                    lbl_RacingRespite.Text = PersianClass.getPersiaDate(data[5], "S", false) + " ساعت " + PersianClass.getPersianNumberStyle(data[6]);
                }
                gv_Racing.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(racingInfo_ID);
                gv_Racing.DataBind();
            }
            else{Response.Redirect("~/error.htm");}
        }
        else{Response.Redirect("~/Sport/Sport_SelectRacing.aspx");}
    }

    protected void btn_saveForm_Click(object sender, EventArgs e)
    {
        Application.Lock();
        if (Page.IsValid)
        {
            int isConfirm = int.Parse(inpHide.Value);
            if (isConfirm == 1)
            {
                if (DAL.Sport_IsNotExpireRacingDate(racingInfo_ID))
                {
                    btn_saveForm.Enabled = false;
                    int maxRowForm = DAL.Sport_GetMaxRowInRacingForms();
                    String formID = "form" + maxRowForm + "-" + BLL.CreateRandomPassword(10); //+ "-" + HttpContext.Current.User.Identity.Name;
                    int allCheckedCount = 0;
                    foreach (GridViewRow row in gv_Racing.Rows)
                    {
                        CheckBox chkHost = (CheckBox)row.Cells[2].FindControl("chkHost");
                        CheckBox chkHostGuest = (CheckBox)row.Cells[3].FindControl("chkHostGuest");
                        CheckBox chkGuest = (CheckBox)row.Cells[4].FindControl("chkGuest");

                        if (chkHost.Checked)
                            allCheckedCount++;
                        if (chkHostGuest.Checked)
                            allCheckedCount++;
                        if (chkGuest.Checked)
                            allCheckedCount++;
                    }
                    //ScriptManager.RegisterStartupScript(this.UpdatePanel2, this.GetType(), "Racing_modalNoneEqual", "alert('" + MyHidden.Value + ", " + allCheckedCount * 5000 +  "')", true);
                    if ((allCheckedCount * 5000) == int.Parse(MyHidden.Value))
                    {
                        try
                        {
                            SportRacingForms racingForms = new SportRacingForms();
                            racingForms.Form_ID = formID;
                            racingForms.Form_RacingInfoID = lbl_RacingInfoID.Text;
                            racingForms.Form_CreationDate = BLL.GetIranDateTime();
                            racingForms.Form_UserID = DAL.Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
                            racingForms.Form_Amount = int.Parse(MyHidden.Value);
                            racingForms.Form_ActiveStatus = true;
                            DAL.Sport_InsertRacingForms(racingForms);

                            int checkCount = 0;
                            SportRacingFormInfo racingFormInfo = new SportRacingFormInfo();
                            foreach (GridViewRow row in gv_Racing.Rows)
                            {
                                checkCount = 0;
                                racingFormInfo.FormInfo_FormID = formID;
                                Label lbl_GameID = (Label)row.Cells[0].FindControl("lbl_GameID");
                                Label lbl_HostTeamID = (Label)row.Cells[1].FindControl("lbl_HostTeamID");
                                Label lbl_GuestTeamID = (Label)row.Cells[5].FindControl("lbl_GuestTeamID");
                                CheckBox chkHost = (CheckBox)row.Cells[2].FindControl("chkHost");
                                CheckBox chkHostGuest = (CheckBox)row.Cells[3].FindControl("chkHostGuest");
                                CheckBox chkGuest = (CheckBox)row.Cells[4].FindControl("chkGuest");
                                racingFormInfo.FormInfo_GameID = int.Parse(lbl_GameID.Text);
                                racingFormInfo.FormInfo_HostTeamID = int.Parse(lbl_HostTeamID.Text);
                                racingFormInfo.FormInfo_GuestTeamID = int.Parse(lbl_GuestTeamID.Text);
                                racingFormInfo.FormInfo_IsHostWin = chkHost.Checked;
                                racingFormInfo.FormInfo_IsEqualTeams = chkHostGuest.Checked;
                                racingFormInfo.FormInfo_IsGuestWin = chkGuest.Checked;
                                if (racingFormInfo.FormInfo_IsHostWin)
                                    checkCount++;
                                if (racingFormInfo.FormInfo_IsEqualTeams)
                                    checkCount++;
                                if (racingFormInfo.FormInfo_IsGuestWin)
                                    checkCount++;
                                racingFormInfo.FormInfo_CheckCount = checkCount;
                                racingFormInfo.FormInfo_Prominence = 0;
                                DAL.Sport_InsertRacingFormInfo(racingFormInfo);
                            }
                            //ScriptManager.RegisterClientScriptBlock(UpdatePanel2, this.GetType(), "script", "alert('اطلاعات فرم ثبت گردید.');clearForm()", true);
                            ScriptManager.RegisterStartupScript(this.UpdatePanel2, this.GetType(), "Racing_modal", @"$('#dialog-form').dialog('open');clearForm()", true);
                        }
                        catch
                        {
                            Application.UnLock();
                            DAL.Sport_DeleteFormByID(formID);
                            ScriptManager.RegisterStartupScript(this.UpdatePanel2, this.GetType(), "Racing_modalError", "alert('خطا در اجرای عملیات')", true);
                        }
                    }
                    else
                    {
                        Application.UnLock();
                        ScriptManager.RegisterStartupScript(this.UpdatePanel2, this.GetType(), "Racing_modalNoneEqual", "alert('مقدار مبلغ فرم برحسب تیک های زده شده صحیح نمی باشد')", true);
                    }
                }
                else { Response.Redirect("~/error.htm"); }
            }
            else{return;}
            Application.UnLock();
        }
    }
    protected void btn_Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Sport/Sport_selectRacing.aspx");
    }
}