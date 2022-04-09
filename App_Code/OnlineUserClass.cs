//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Data;
//using System.Web.Caching;

///// <summary>
///// Summary description for OnlineUserClass
///// </summary>
//public class OnlineUserClass : System.Web.UI.Page
//{
//    public int minut = 5;
    
//    private void Page_Load(object sender, System.EventArgs e)
//    {
//        if (Cache["UserOnlineList"] == null)
//        {
//            this.loadCaching();
//        }
//        else
//        {
//            if (Session["User"] != null)
//            {
//                Check_Session();
//            }
//        }
//    }
//    public OnlineUserClass()
//    {
//        //
//        // TODO: Add constructor logic here
//        //
//    }

//    #region Web Form Designer generated code
//    override protected void OnInit(EventArgs e)
//    {
//        InitializeComponent();
//        base.OnInit(e);
//    }
//    private void InitializeComponent()
//    {
//        this.Load += new System.EventHandler(this.Page_Load);
//    }
//    #endregion

//    public void loadCaching()
//    {
//        DataTable dt=new DataTable("UsersOnline");
//        DataColumn dcA=new DataColumn("UserIp",typeof(String));
//        DataColumn dcB=new DataColumn("UserId",typeof(String));
//        DataColumn dcC=new DataColumn("UserLastVisit",typeof(System.DateTime));
//        dt.Columns.Add(dcA);
//        dt.Columns.Add(dcB);
//        dt.Columns.Add(dcC);
//        System.Web.Caching.CacheItemRemovedCallback CloseUser;
//        CloseUser=new CacheItemRemovedCallback(Pages_CloseUser);
//        Cache.Add("UserOnlineList",dt,null,DateTime.Now.AddMinutes(2)
//        ,System.Web.Caching.Cache.NoSlidingExpiration
//        ,CacheItemPriority.Default,CloseUser);
//    }
//    private void Pages_CloseUser(string key, object Value, CacheItemRemovedReason reason)
//    {
//        if (Value.GetType() is System.Data.DataTable && key == "UserOnlineList")
//        {
//            DataTable dt = (DataTable)Value;
//            for (int i = 0; i != dt.Rows.Count; i++)
//            {
//                if (((DateTime)dt.Rows[i]["UserLastVisit"]).Minute - minut <
//                DateTime.Now.Minute - minut)
//                {
//                    dt.Rows.RemoveAt(i);
//                }// end if
//            }//end for
//            System.Web.Caching.CacheItemRemovedCallback CloseUser;
//            CloseUser = new CacheItemRemovedCallback(Pages_CloseUser);
//            Cache.Add("UserOnlineList", dt, null, DateTime.Now.AddMinutes(2)
//            , System.Web.Caching.Cache.NoSlidingExpiration
//            , CacheItemPriority.Default, CloseUser);
//        }
//    }
//    public void Check_Session()
//    {
//        String dd = Session["User"].ToString();
//        DataTable dt = (DataTable)Cache["UserOnlineList"];
//        string filter = "UserIp='" + Request.UserHostAddress + "'";
//        int cc = dt.Select(filter).Length;
//        filter = "UserId='" + dd + "'";
//        int vv = dt.Select(filter).Length;
//        if (vv == 0 && cc == 0)
//        {
//            DataRow dr = dt.NewRow();
//            dr["UserIp"] = Request.UserHostAddress;
//            dr["UserId"] = dd;
//            dr["UserLastVisit"] = DateTime.Now;
//            dt.Rows.Add(dr);
//        }
//        else
//        {
//            for (int i = 0; i != dt.Rows.Count; i++)
//            {
//                if (dt.Rows[i]["UserId"].ToString() == dd &&
//                dt.Rows[i]["UserIp"].ToString() == Request.UserHostAddress)
//                {
//                    dt.Rows[i]["UserLastVisit"] = DateTime.Now;
//                }// end if
//            }// end for
//        }
//    }
//}