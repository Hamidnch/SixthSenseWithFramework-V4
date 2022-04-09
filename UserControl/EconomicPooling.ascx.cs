using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_EconomicPooling : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_InsertPooling_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                DAL.Economic_InsertPooling(txt_PoolingName.Text, txt_poolingComment.Text);
                txt_PoolingName.Text = String.Empty;
                txt_poolingComment.Text = String.Empty;
                lbl_Msg.Visible = true;
                lbl_Msg.Text = "نظر شما ثبت گردید.";
                btn_InsertPooling.Enabled = false;
            }
            catch
            {
                lbl_Msg.Visible = true;
                lbl_Msg.Text = "خطا در ثبت نظر شما به وقوع پیوست";
            }
        }        
    }
    protected void txt_PoolingName_TextChanged(object sender, EventArgs e)
    {            
        lbl_Msg.Text = "";
        if (txt_PoolingName.Text != "" && txt_poolingComment.Text != "")
        {
            btn_InsertPooling.Enabled = true;

        }
        else
        {
            btn_InsertPooling.Enabled = false;
        }
    }
}