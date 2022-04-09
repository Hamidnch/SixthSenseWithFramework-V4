using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanel_UserPublicAttribute : System.Web.UI.UserControl
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Context.User.Identity.IsAuthenticated)
            {
              // if (!IsPostBack)
               // {
                    String userName = Context.User.Identity.Name;
                    FillYearToList();
                    FillDayToList();

                    txtUserName.Text = userName;
                    CustomMembership member = new CustomMembership();
                    DAL.Membership_LoadAllAttributes(txtUserName.Text, member);
                    txtFirstName.Text = member.FName;
                    txtLastName.Text = member.LastName;
                    rblSex.SelectedIndex = (member.Sex) ? 1 : 0;
                    if (member.BirthDay != "")
                    {
                        string year = member.BirthDay.Substring(0, 4);
                        string month = member.BirthDay.Substring(5, 2);
                        string day = member.BirthDay.Substring(8, 2);
                        ddlYear.Text = year;
                        ddlMonth.SelectedIndex = int.Parse(PersianClass.getLatinNumberStyle(month));
                        ddlDay.SelectedIndex   = int.Parse(PersianClass.getLatinNumberStyle(day));
                    }
                }
           // }
            else{Response.Redirect("~/AccessDenied.htm", false);}
        }
        catch (Exception ex){BLL.SendEmail("UserPanel_UserPublicAttribute Page_Load", ex);}
        //Page.ClientScript.RegisterClientScriptInclude("jQuery", "~/Scripts/jquery-1.4.4.js");
    }
    private void FillYearToList()
    {
        String myDate = PersianClass.getPersiaDate(BLL.GetIranDateTime(), "", false);
        int year = int.Parse(PersianClass.getLatinNumberStyle(myDate.Substring(0, 4)));
        ddlYear.Items.Clear();
        ddlYear.Items.Add("<سال>");
        for (int i = 1300; i <= year; i++)
        {
            ddlYear.Items.Add(PersianClass.getPersianNumberStyle(i));
        }
        //ddlYear.Text = "1360";
    }
    private void FillDayToList()
    {
        ddlDay.Items.Clear();
        ddlDay.Items.Add("<روز>");
        for (int i = 1; i <= 31; i++)
        {
            ddlDay.Items.Add(PersianClass.getPersianNumberStyle(i));
        }
    }
}