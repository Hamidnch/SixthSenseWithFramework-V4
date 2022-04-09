using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_SportUserPayment : System.Web.UI.UserControl
{
    public String ImagePath { get { return ResolveUrl("~/Images"); } }
    public int ActiveUserID{ get{return DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name);}}
    //private void refreshGridView()
    //{
    //    gv_UserPayments.DataSource = DAL.Sport_GetUserPayments(DAL.Membership_GetUserIDByUserName(Context.User.Identity.Name));
    //    gv_UserPayments.DataBind();
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
        //    if (Context.User.Identity.IsAuthenticated)
        //    {
        //        refreshGridView();
        //    }
        //}
        //catch (Exception ex)
        //{
        //    new Exception(ex.Message);
        //}
    }
    //protected void gv_gv_UserPayments_PreRender(object sender, EventArgs e)
    //{
    //    if (gv_UserPayments.Rows.Count > 0)
    //    {
    //        gv_UserPayments.UseAccessibleHeader = false;
    //        gv_UserPayments.HeaderRow.TableSection = TableRowSection.TableHeader;
    //    }
    //}
}