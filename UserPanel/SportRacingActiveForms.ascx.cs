using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_SportRacingActiveForms : System.Web.UI.UserControl
{
    private void refreshGridView()
    {
        gv_ActiveForms.DataSource = DAL.Sport_GetActiveForms(DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name));
       // gv_ActiveForms.UseAccessibleHeader = false;
       // gv_ActiveForms.HeaderRow.TableSection = TableRowSection.TableHeader;
        gv_ActiveForms.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
              //  if (!IsPostBack)
              //  {
                    refreshGridView();
            //    }
            }
        }
        catch (Exception ex)
        {
            new Exception(ex.Message);
        }
    }

    //protected void gv_ActiveForms_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    gv_ActiveForms.PageIndex = e.NewPageIndex;
    //    refreshGridView();
    //}

    //protected void gv_ActiveForms_PageIndexChanged(object sender, EventArgs e)
    //{
    //    // refreshGridView();
    //}
    protected void gv_ActiveForms_PreRender(object sender, EventArgs e)
    {
        if (gv_ActiveForms.Rows.Count > 0)
        {
            gv_ActiveForms.UseAccessibleHeader = false;
            gv_ActiveForms.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
    //protected void btn_Search_Click(object sender, EventArgs e)
    //{
    //    int userID = DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name);
    //    String racingInfoID = txt_srchRacingInfo.Text;
    //    String formID = txt_srchFormID.Text;
    //    if (!String.IsNullOrWhiteSpace(racingInfoID) || !String.IsNullOrWhiteSpace(formID))
    //    {
    //        gv_ActiveForms.DataSource = DAL.Sport_GetActiveFormsBySearch(userID, racingInfoID, formID);
    //        gv_ActiveForms.DataBind();
    //    }
    //    Session["moduleName"] = "SportRacingActiveForms";
    //}
}