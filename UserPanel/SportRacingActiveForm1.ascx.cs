using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_SportRacingActiveForm1 : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    string gvUniqueID = System.String.Empty;
    int gvNewPageIndex = 0;
    int gvEditIndex = -1;
    private void refreshGridView()
    {
        gv_ActiveForms.DataSource = DAL.Sport_GetActiveForms(DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name));
        gv_ActiveForms.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
              //  if (!IsPostBack)
           //     {
                    refreshGridView();
              //  }
            }
        }
        catch (Exception ex){new Exception(ex.Message);}
    }
    protected void gv_ActiveForms_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView owner = (GridView)sender;
        GridViewRow oGridViewRow = e.Row;

        if (oGridViewRow.DataItem == null)
            return;
        GridView oGridView = (GridView)e.Row.FindControl("gv_EditRacing");
        String RacingInfo_ID = Convert.ToString(owner.DataKeys[e.Row.RowIndex].Value);
        String FormInfo = ((Label)e.Row.Cells[2].FindControl("lbl_FormID")).Text;
       // int GameID = e.Row.RowIndex + 1;
        if (oGridView.UniqueID == gvUniqueID)
        {
            oGridView.PageIndex = gvNewPageIndex;
            oGridView.EditIndex = gvEditIndex;
            Page.ClientScript.RegisterStartupScript(GetType(), "Expand", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + RacingInfo_ID + "','one');</script>");
        }
        oGridView.DataSource = DAL.Sport_LoadAllGamesByFormInfoID( FormInfo);
        oGridView.DataBind();
    }
    protected void gv_EditRacing_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView CurrentGridView = (GridView)sender;
        gvUniqueID = CurrentGridView.UniqueID;
        gvEditIndex = e.NewEditIndex;
        CurrentGridView.EditIndex = e.NewEditIndex;
        gv_ActiveForms.DataBind();
    }
}