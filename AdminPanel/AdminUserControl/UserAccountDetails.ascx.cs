using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminPanel_AdminUserControl_UserAccountDetails : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
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
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();        
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
    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_MemberID = (Label)e.Row.FindControl("lbl_MemberID");
            int userID = int.Parse(lbl_MemberID.Text);
            GridView gvUserAccountDetails = (GridView)e.Row.FindControl("gvUserAccountDetails");
            gvUserAccountDetails.DataSource = DAL.Sport_GetAcountDetailsByUserID(userID);
            gvUserAccountDetails.DataBind();
        }
        //if (e.Row.RowType == DataControlRowType.Header)
        //{
        //    foreach (TableCell cell in e.Row.Cells)
        //    {
        //        LinkButton lbSorting = (LinkButton)cell.Controls[0] as LinkButton;
        //        Image sortImage = new Image();
        //        if (lbSorting.Text == gvUsers.SortExpression)
        //        {
        //            if (gvUsers.SortDirection == SortDirection.Ascending)
        //            {
        //                sortImage.ImageUrl = "~/AdminPanel/AdminImages/Main/up.png";                    }                       
        //            else
        //            {
        //                sortImage.ImageUrl = "~/AdminPanel/AdminImages/Main/down.png";
        //            }
        //            cell.Controls.Add(sortImage);
        //        }
        //    }
        //} 
    }
    protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUsers.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        String sort = "";
        if (ViewState["sortexpression"] != null)
        {
            sort = ViewState["sortexpression"].ToString() + " " + ViewState["sortdirection"].ToString();
        }
        DataView dv = new DataView();
        dv = DAL.Membership_GetUsersByUserName(txtUserName.Text, sort);
        gvUsers.DataSource = dv;
        gvUsers.DataBind();
    }
}