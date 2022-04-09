using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminPanel_AdminUserControl_SportRacingManagement : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    string gvUniqueID = System.String.Empty;
    int gvNewPageIndex = 0;
    int gvEditIndex = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        //lbl_Today.Text = String.Format("{0:yyyy/MM/dd}", BLL.GetIranDateTime().Date);
        lbl_Today.Text = BLL.GetIranDateTime().ToString();
        lbl_Today.Visible = false;
        //SqlDataSource1.SelectCommand = "SP_Sport_LoadAllRacingByDateTime";
        //SqlDataSource1.SelectParameters.Add("currentDate",TypeCode.DateTime, BLL.GetIranDateTime().ToString());
        //SqlDataSource1.DataBind();
        //Page.ClientScript.RegisterStartupScript(GetType(), "Expand", "<SCRIPT LANGUAGE='javascript'>setBlock();</script>");
    }
    //protected void RowDataBound(object sender, GridViewRowEventArgs args)
    //{
    //    GridView gridView = (GridView)sender;

    //    if (gridView.SortExpression.Length > 0)
    //    {
    //        int cellIndex = -1;
    //        foreach (DataControlField field in gridView.Columns)
    //        {
    //            if (field.SortExpression == gridView.SortExpression)
    //            {
    //                cellIndex = gridView.Columns.IndexOf(field);
    //                break;
    //            }
    //        }

    //        if (cellIndex > -1)
    //        {
    //            if (args.Row.RowType == DataControlRowType.Header)
    //            {
    //                //  this is a header row,
    //                //  set the sort style
    //                args.Row.Cells[cellIndex].CssClass +=
    //                    (gridView.SortDirection == SortDirection.Ascending
    //                    ? " sortasc" : " sortdesc");
    //            }
    //        }
    //    }
    ////}
    protected void gv_RacingWithInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView owner = (GridView)sender;
        GridViewRow oGridViewRow = e.Row;
      
        if (owner.SortExpression.Length > 0)
        {
            int cellIndex = -1;
            foreach (DataControlField field in owner.Columns)
            {
                if (field.SortExpression == owner.SortExpression)
                {
                    cellIndex = owner.Columns.IndexOf(field);
                    break;
                }
            }

            if (cellIndex > -1)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    //  this is a header row,
                    //  set the sort style
                    e.Row.Cells[cellIndex].CssClass +=
                        (owner.SortDirection == SortDirection.Ascending
                        ? " sortasc" : " sortdesc");
                }
            }
        }

        if (oGridViewRow.DataItem == null)
            return;
        GridView oGridView = (GridView)e.Row.FindControl("gv_RacingResult");
        String RacingInfo_ID = Convert.ToString(owner.DataKeys[e.Row.RowIndex].Value);
        if (oGridView.UniqueID == gvUniqueID)
        {
            oGridView.PageIndex = gvNewPageIndex;
            oGridView.EditIndex = gvEditIndex;
            Page.ClientScript.RegisterStartupScript(GetType(), "Expand1", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + RacingInfo_ID + "','one');</script>");
        }
        oGridView.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(RacingInfo_ID);
        oGridView.DataBind();
        //Page.ClientScript.RegisterStartupScript(GetType(), "unBlock", "<SCRIPT LANGUAGE='javascript'> $.unblockUI();</script>");
    }
    //protected void gv_RacingResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    GridView CurrentGridView = (GridView)sender;
    //    gvUniqueID = CurrentGridView.UniqueID;
    //    gvNewPageIndex = e.NewPageIndex;
    //    gv_RacingWithInfo.DataBind();
    //}
    protected void gv_RacingResult_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView CurrentGridView = (GridView)sender;
        gvUniqueID = CurrentGridView.UniqueID;
        gvEditIndex = e.NewEditIndex;
        CurrentGridView.EditIndex = e.NewEditIndex;        
        gv_RacingWithInfo.DataBind();
    }
    protected void gv_RacingResult_CancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView CurrentGridView = (GridView)sender;
        gvUniqueID = CurrentGridView.UniqueID;
        gvEditIndex = -1;
        gv_RacingWithInfo.DataBind();
    }
    protected void gv_RacingResult_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridView CurrentGridView = (GridView)sender;
        gvUniqueID = CurrentGridView.UniqueID;

        String RacingInfo_ID = Convert.ToString(CurrentGridView.DataKeys[0].Value);
        //String racingInfoID = ((Label)CurrentGridView.Rows[e.RowIndex].FindControl("lbl_RacingInfoID")).Text;
        int gameID = int.Parse(((Label)CurrentGridView.Rows[e.RowIndex].FindControl("lbl_GameID")).Text);
        //decimal gameResult = decimal.Parse(((Label)CurrentGridView.Rows[e.RowIndex].FindControl("ddl_GameResult")).SelectedValue);
        String hostTeam = Convert.ToString(((Label)CurrentGridView.Rows[e.RowIndex].FindControl("lbl_HostTeam")).Text); 
        String guestTeam = Convert.ToString(((Label)CurrentGridView.Rows[e.RowIndex].FindControl("lbl_GuestTeam")).Text); 
        String gameStatus = Convert.ToString(((Label)CurrentGridView.Rows[e.RowIndex].FindControl("lbl_GameStatus")).Text);
        int hostGoal = int.Parse(((TextBox)CurrentGridView.Rows[e.RowIndex].FindControl("txt_HostResult")).Text);
        int guestGoal = int.Parse(((TextBox)CurrentGridView.Rows[e.RowIndex].FindControl("txt_guestResult")).Text);
        //if ((((TextBox)CurrentGridView.Rows[e.RowIndex].FindControl("txt_HostResult")).Text == "" ||
        //                ((TextBox)CurrentGridView.Rows[e.RowIndex].FindControl("txt_guestResult")).Text == ""))
        //{
        //    String alert = "لطفا نتیجه میزبان و میهمان را وارد نمائید";
        //    Page.ClientScript.RegisterClientScriptBlock(GetType(), "Message", "<script LANGUAGE='javascript'>alert('" + alert + "');</script>");
            
        //}
        int gameResult = -1;
        if (hostGoal == guestGoal)
        {
            gameResult = 1;
            gameStatus = "مساوی";
        }
        if (hostGoal > guestGoal)
        {
            gameResult = 0;
            gameStatus = "برد " + hostTeam;
        }
        if (guestGoal > hostGoal)
        {
            gameResult = 2;
            gameStatus = "برد " + guestTeam;
        }
        if (hostGoal <= -1 || guestGoal <= -1)
        {
            gameResult = -1;
            gameStatus = "نامشخص";
        }
        if (hostGoal == -5 && guestGoal == -5)
        {
            gameResult = -5;
            gameStatus = "حذف بازی";
        }
        try
        {
            DAL.Sport_InsertRacingGamesResult(RacingInfo_ID, gameID, gameResult, hostGoal, guestGoal, gameStatus);
            gvEditIndex = -1;
            gv_RacingWithInfo.DataBind();
            //محل ثبت نتیجه بازیهای فرم و ثبت امتیاز بصورت موقت در جدول موقت
            DataSet ds = DAL.Sport_GetFormsByRacingInfoID(RacingInfo_ID);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                DAL.Sport_CalculateFormsProminence(RacingInfo_ID, row["FormInfo_FormID"].ToString(), gameID);
            }            
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Message", "<script LANGUAGE='javascript'>alert(' بروزرسانی با موفقیت انجام شد ');</script>");
        }
        catch (System.Exception ex)
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Message2", "<script LANGUAGE='javascript'>alert(' " + ex.Message + " ');</script>");
        }
    }
}