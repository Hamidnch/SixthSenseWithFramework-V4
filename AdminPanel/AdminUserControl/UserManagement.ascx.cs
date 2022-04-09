using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminPanel_AdminUserControl_UserManagement : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }
    private void BindData()
    {
        DataView dv = new DataView();
        String sort = "";
        if (ViewState["sortexpression"] != null)
        {
             sort = ViewState["sortexpression"].ToString() + " " + ViewState["sortdirection"].ToString();            
        }
        dv = DAL.Membership_LoadAllUsers(sort);
        gvUsers.DataSource = dv;
        gvUsers.DataBind();
    }
    protected void gvUsers_Sorting(object sender, GridViewSortEventArgs e)
    {
        ViewState["sortexpression"] = e.SortExpression;

        if (ViewState["sortdirection"] == null)
        {
            ViewState["sortdirection"] = "asc";
        }
        else
        {
            if (ViewState["sortdirection"].ToString() == "asc")
            {
                ViewState["sortdirection"] = "desc";
            }
            else
            {
                ViewState["sortdirection"] = "asc";
            }
        }
        BindData();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep( 1000 );
        String sort = "";
        if (ViewState["sortexpression"] != null)
        {
            sort = ViewState["sortexpression"].ToString() + " " + ViewState["sortdirection"].ToString();
        }
        DataView dv = new DataView();
        switch(ddlSearchTypes.SelectedIndex) 
        {
            case 0:
                dv = DAL.Membership_GetUsersByUserName(txtSearchText.Text, sort);
                break;
            case 1:
                dv = DAL.Membership_GetUsersByEmail(txtSearchText.Text, sort);
                break;
        }
        gvUsers.DataSource = dv;
        gvUsers.DataBind();
    }
    protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //string userName = gvUsers.DataKeys[e.RowIndex].Value.ToString();
        Label lbl_MemberID = gvUsers.Rows[e.RowIndex].FindControl("lbl_MemberID") as Label;
        int id = int.Parse(lbl_MemberID.Text);
        DAL.Membership_Delete(id);
        BindData();
    }
    protected void gvUsers_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ImageButton btn = e.Row.Cells[8].Controls[0] as ImageButton;
            btn.OnClientClick = "if (confirm('باحذف یک کاربر کلیه اطلاعات و پست های او پاک می شوند،آیا برای حذف کاربر انتخابی مطمئن هستید؟') == false) return false;";
        }
    }
    protected void txtSearchText_TextChanged(object sender, EventArgs e)
    {
        String sort = "";
        if (ViewState["sortexpression"] != null)
        {
            sort = ViewState["sortexpression"].ToString() + " " + ViewState["sortdirection"].ToString();
        }
        DataView dv = new DataView();
        switch (ddlSearchTypes.SelectedIndex)
        {
            case 0:
                dv = DAL.Membership_GetUsersByUserName(txtSearchText.Text, sort);
                break;
            case 1:
                dv = DAL.Membership_GetUsersByEmail(txtSearchText.Text, sort);
                break;
        }

        gvUsers.DataSource = dv;
        gvUsers.DataBind();
    }

    protected void gvUsers_RowDeleting(object sender, GridViewEditEventArgs e)
    {
        String s = "";
    }
    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName.Equals("Select"))
        {            
            CustomMembership member = new CustomMembership();
            String userName = e.CommandArgument.ToString();
            DAL.Membership_LoadAllAttributes(userName, member);           
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "showDialog", " $('#dialog-form').dialog('open');", true);            
            lbl_UserName.Text = member.Username;
            lbl_FirstName.Text = member.FName;
            lbl_LastName.Text = member.LastName;
            lbl_Email.Text = member.Email;
            lbl_Sex.Text = (member.Sex == false)? "مرد" : "زن";
            lbl_BirthDay.Text = member.BirthDay;
            lbl_Phone.Text = member.Phone;
            lbl_Mobile.Text = member.Mobile;
            lbl_Address.Text = member.Address;
            lbl_Country.Text = member.Country;
            lbl_City.Text = member.City;
            lbl_AccountName.Text = member.AccountName;
            lbl_AccountFamily.Text = member.AccountFamily;
            lbl_AccountNumber.Text = member.AccountNumber;
            lbl_BankName.Text = member.BankName;
            lbl_Yahoo.Text = member.YahooID;
            lbl_WebSite.Text = member.WebSite;
            lbl_RegDate.Text = PersianClass.getPersiaDate(member.RegistrationDate, "S", true);
            lbl_LastLoginDate.Text = PersianClass.getPersiaDate(member.LastLoginDate, "S", true);
            img_User.ImageUrl = (!String.IsNullOrEmpty(member.Picture) && !String.IsNullOrWhiteSpace(member.Picture)) ?
                                "~/UserPanel/UserImgUpload/" + member.Picture : "~/UserPanel/UserImgUpload/NoPhoto.jpg";
            //lbl_LastChangePass.Text = PersianClass.getFarsiDate(member.LastPasswordChangedDate, false, true);
        }
    }
    protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUsers.PageIndex = e.NewPageIndex;

        gvUsers.DataSource = DAL.Membership_LoadAllUsers();
        gvUsers.DataBind();
    }
}