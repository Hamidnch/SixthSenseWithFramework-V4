using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MultiDropDownLib;

public partial class AdminPanel_AdminUserControl_SportRacingCurrentForms : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void GetActiveRacing()
    {
        ddl_RacingInfoID.Items.Clear();
        ddl_RacingInfoID.DataSource = DAL.Sport_GetActiveRacing();
        ddl_RacingInfoID.DataTextField = "RacingInfo_ID";
        ddl_RacingInfoID.DataValueField = "RacingInfo_ID";
        ddl_RacingInfoID.DataBind();
        ddl_RacingInfoID.Items.Insert(0, new ListItem("انتخاب کنید...", "-1"));
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetUsers(ddl_Users);
            GetActiveRacing();
            SearchForms();
        }
    }
    private void SetUsers(MultiDropDown ddl)
    {
        ddl.DataSource = DAL.Membership_LoadAllUsers();
        ddl.DataTextField = "Member_UserName";
        ddl.DataValueField = "Member_ID";
        ddl.DataBind();
    }
    private void SearchForms()
    {
        string userItems = "";
        string infoId = "";
        userItems = ddl_Users.SelectedValues;
        if (userItems == "" || userItems == "()" || userItems == "-1" || userItems == null)
        {
            userItems = "";
        }
        if (ddl_RacingInfoID.SelectedValue == "انتخاب کنید..." || ddl_RacingInfoID.SelectedValue == "-1")
        {
            infoId = "";
        }
        else
        {
            infoId = ddl_RacingInfoID.SelectedValue;
        }
        gv_RacingCurrentForms.DataSource = DAL.Sport_LoadAllCurrentForms(infoId, userItems);
        gv_RacingCurrentForms.DataBind();
    }
    protected void gv_RacingCurrentForms_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_RacingCurrentForms.PageIndex = e.NewPageIndex;
        SearchForms();
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        SearchForms();
    }
    protected void btn_Referesh_Click(object sender, EventArgs e)
    {
        ddl_RacingInfoID.SelectedIndex = -1;
        SearchForms();
    }
    protected void gv_RacingCurrentForms_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("form_Show"))
        {
            String Form_ID = Convert.ToString(e.CommandArgument);
            formID.InnerText = Form_ID;
            gv_Racing.DataSource = DAL.Sport_LoadAllGamesByFormInfoID(Form_ID);
            gv_Racing.DataBind();
            String script = @"$(document).ready(function (){
                     $.unblockUI(); showModal();  $('#close').click(function(){$('#divFormShow').hide('slow');})
                    $(document).keyup(function(e){var code = (e.keyCode ? e.keyCode : e.which);
                        if(code === 27)$('#divFormShow').hide('slow');});
                    $('#divFormShow').draggable();
                    function showModal()
                    {
                        $('#divFormShow').css({top:'50%',left:'50%',margin:'-'+($('#divFormShow').height() / 2)+'px 0 0 -'+($('#divFormShow').width() / 2)+'px'});
                        $('#divFormShow').show('slow');
                    }
                    });";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "FormShow", script, true);
        }
    }
}