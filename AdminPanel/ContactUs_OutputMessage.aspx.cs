using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class AdminPanel_ContactUs_OutputMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [WebMethod]
    public static MessageInfo MessageInfoByMessageID(String messageID)
    {
        return DAL.GetMessageInfoByMessageID(Int32.Parse(messageID));
    }
}