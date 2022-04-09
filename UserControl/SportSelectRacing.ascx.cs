using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_SportSelectRacing : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //lbl_DateNow.Text = String.Format("{0:yyyy/MM/dd}", BLL.GetIranDateTime().Date);
        //lb_TimeNow.Text = BLL.GetTime();
        if (!IsPostBack)
        {
            dl_ActiveRacing.DataSource = DAL.Sport_GetActiveRacing();
            dl_ActiveRacing.DataBind();
            lbl_today.Text = BLL.GetIranDateTime().ToString();
        }
        //lbl_today.Text = DAL.Sport_GetRespiteDateByRacingInfoID("ir124-550995802").ToString();

        //string hour = (BLL.GetIranDateTime().TimeOfDay.Hours.ToString().Length == 1) ?
        //    '0' + BLL.GetIranDateTime().TimeOfDay.Hours.ToString() : BLL.GetIranDateTime().TimeOfDay.Hours.ToString();
        //string minute = (BLL.GetIranDateTime().TimeOfDay.Minutes.ToString().Length == 1) ?
        //    '0' + BLL.GetIranDateTime().TimeOfDay.Minutes.ToString() : BLL.GetIranDateTime().TimeOfDay.Minutes.ToString();
        //string second = (BLL.GetIranDateTime().TimeOfDay.Seconds.ToString().Length == 1) ?
        //    '0' + BLL.GetIranDateTime().TimeOfDay.Seconds.ToString() : BLL.GetIranDateTime().TimeOfDay.Seconds.ToString();

        //lbl.Text = hour + ":" + minute + ":" + second;
        //for (int i = 0; i < dl_ActiveRacing.Items.Count; i++)
        //{
        //    Label Lbl = (Label)dl_ActiveRacing.Items[i].FindControl("Label4");
        //    Lbl.Text = BLL.GetIranDateTime().AddMinutes(5).ToString();
        //}        
    }
    //protected void btn_Exit_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Sport/Sport_Home.aspx");
    //}
    protected void dl_ActiveRacing_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //Label Label4 = (Label)e.Item.FindControl("Label4");
        //DateTime myDate = DateTime.Parse(Label4.Text);
        //Label lbl_LastYear = (Label)e.Item.FindControl("lbl_LastYear");
        //Label lbl_LastMonth = (Label)e.Item.FindControl("lbl_LastMonth");
        //Label lbl_LastDay = (Label)e.Item.FindControl("lbl_LastDay");
        ////Label lbl_LastHour = (Label)e.Item.FindControl("lbl_LastHour");
        ////Label lbl_LastMinute = (Label)e.Item.FindControl("lbl_LastMinute");
        ////Label lbl_LastSecond = (Label)e.Item.FindControl("lbl_LastSecond");        
        //lbl_LastYear.Text = myDate.Year.ToString();
        //lbl_LastMonth.Text = myDate.Month.ToString();
        //lbl_LastDay.Text = myDate.Day.ToString();
    }
}