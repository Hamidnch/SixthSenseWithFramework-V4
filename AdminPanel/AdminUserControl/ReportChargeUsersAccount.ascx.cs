using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MultiDropDownLib;

public partial class AdminPanel_AdminUserControl_ReportChargeUsersAccount : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    private void SetUsers(MultiDropDown ddl)
    {
        ddl.DataSource = DAL.Membership_LoadAllUsers();
        ddl.DataTextField = "Member_UserName";
        ddl.DataValueField = "Member_ID";
        ddl.DataBind();
    }
    private void SetBanks(MultiDropDown ddl)
    {
        ddl.DataSource = DAL.Sport_LoadAllBanks();
        ddl.DataTextField = "Bank_Name";
        ddl.DataValueField = "Bank_ID";
        ddl.DataBind();
    }
    private void LoadAllApprovedPaymentToBanks()
    {
        gv_ChargeUsersAccount.DataSource = DAL.Sport_LoadAllApprovedPaymentsToBanks();
        gv_ChargeUsersAccount.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SetUsers(mddl_Users);
            SetBanks(mddl_Banks);
            LoadAllApprovedPaymentToBanks();
        }
    }
    private void CombineSearch()
    {
        DateTime st = new DateTime(2000, 01, 01), ed = new DateTime(3000, 01, 01);
        if (pdp_StartDate.Text != "" && pdp_StartDate.SelectedDateTime.HasValue)
        {
            st = pdp_StartDate.SelectedDateTime.Value;
        }
        //else st =new DateTime(2000, 01, 01);
        if (pdp_EndDate.Text != "" && pdp_EndDate.SelectedDateTime.HasValue)
        {
            ed = pdp_EndDate.SelectedDateTime.Value;
        }
        string bankItems = "";
        string userItems = "";
        userItems = mddl_Users.SelectedValues;
        if (userItems == "" || userItems == "()" || userItems == "-1")
        {
            userItems = "";
        }
        bankItems = mddl_Banks.SelectedValues;
        if (bankItems == "" || bankItems == "()" || bankItems == "-1")
        {
            bankItems = "";
        }
        //Label1.Text = st.ToString() + "      ,      " + ed.ToString();
        gv_ChargeUsersAccount.DataSource = DAL.Sport_GetUsersActiveChargeReport(st, ed, bankItems, userItems);
        gv_ChargeUsersAccount.DataBind();

        //else ed = new DateTime(3000, 01, 01);

//        int edBankID = int.Parse(ddl_EndBank.SelectedValue.ToString());
//        int stUserID = int.Parse(ddl_StartUser.SelectedValue.ToString());
//        int edUserID = int.Parse(ddl_EndUser.SelectedValue.ToString());
       ////gv_ChargeUsersAccount.DataSource = DAL.Sport_GetApprovedPaymentsToBanksBySearch( st.Value, ed.Value, stBankID, edBankID, stUserID, edUserID);
////        (st == null) ? new DateTime(2000, 01, 01) : st.Value, 
////(ed == null) ? new DateTime(3000, 01, 01) : ed.Value, 
//        gv_ChargeUsersAccount.DataBind();
        //foreach (ListItem item in lst_Banks.Items)
        //{
        //    if (item.Selected)
        //    {
        //        if (bankItems.Length > 0)
        //        {
        //            bankItems += ","; // Add a comma if data already exists
        //        }
        //        bankItems += item.Value;
        //    }
        //}
        //foreach (ListItem item in lstUsers.Items)
        //{
        //    if (item.Selected)
        //    {
        //        if (userItems.Length > 0)
        //        {
        //            userItems += ","; // Add a comma if data already exists
        //        }
        //        userItems +=item.Value;
        //    }
        //}
        //if (bankItems.Contains("-1"))
        //{
        //    bankItems = "";
        //}
        //if (userItems.Contains("-1"))
        //{
        //    userItems = "";
        //}
    }
    protected void btn_Search_Click(object sender, EventArgs e)
    {
        CombineSearch();
    }

    protected void gv_ChargeUsersAccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_ChargeUsersAccount.PageIndex = e.NewPageIndex;
        CombineSearch();
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminPanel/ReportsList.aspx");
    }
    protected void btn_Refersh_Click(object sender, EventArgs e)
    {
        LoadAllApprovedPaymentToBanks();
    }
}