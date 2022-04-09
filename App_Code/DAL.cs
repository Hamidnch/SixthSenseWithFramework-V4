using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using BlackBeltCoder;

/// <summary>
/// Database Access Layer for hesesheshom Site
/// </summary>
public class DAL
{
    public DAL(){ }

    private static SqlConnection conn = null;
    private static SqlCommand cmd = null;
    private static SqlDataReader dr = null;
    private static SqlDataAdapter adaptor = null;
    private static DataSet ds = null;
    private static DataView dv = null;

    public enum SP_TopRss
    {
        SP_RSSFeed_GetRSSForHome,
        SP_RSSFeed_GetRSSForEconomic,
        SP_RSSFeed_GetRSSForRacing,
        SP_RSSFeed_GetRSSForEducation
    }
    private static String GetConnectionString()
    {
        try{return ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString();}
        catch (Exception ex)
        {
            BLL.SendEmail("Error in GetConnectionString", "ارتباط با بانک اطلاعاتی ممکن نمی باشد .با مدیر سایت تماس حاصل بفرمائید" + "Message:" + ex.Message + "\n Source:" + ex.Source);
            throw new ApplicationException("ارتباط با بانک اطلاعاتی ممکن نمی باشد .با مدیر سایت تماس حاصل بفرمائید" + ex);
        }
    }
    private static void OpenConnection(SqlConnection conn)
    {
        if ((conn != null) && (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Connecting || conn.State == ConnectionState.Fetching || conn.State == ConnectionState.Executing || conn.State == ConnectionState.Broken)) { conn.Open(); }
    }
    private static void CloseConnection(SqlConnection conn)
    {
        if ((conn != null) && (conn.State == ConnectionState.Open || conn.State == ConnectionState.Connecting || conn.State == ConnectionState.Fetching || conn.State == ConnectionState.Executing || conn.State == ConnectionState.Broken)) { conn.Close(); conn.Dispose(); }
    }
    public static DataSet LoadAllCountriesHelper()
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_LoadAllCountries");
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("LoadAllCountries", ex); }
        return ds;
    }
    public static bool Membership_ValidateUserHelper(String userName, String password)
    {
        bool flag = false;
        try
        {

            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                int i = (int)db.ExecScalarProc("SP_Membership_Login", "@userName", userName, "@password", password);
                if (i > 0) { flag = true; }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex){BLL.SendEmail("Membership_ValidateUser", ex); }
        return flag;
    }
    public static String Membership_GetRoleByUserNameHelper(String userName)
    {
        String roleName = "";
        using (AdoHelper db = new AdoHelper(GetConnectionString()))
        {
            dr = db.ExecDataReaderProc("SP_Membership_GetRoleByUserName", "@userName", userName);
            if (dr.HasRows) { dr.Read(); roleName = dr["Role_Name"].ToString(); }
        }
        return roleName;
    }
    public static void Membership_InsertRegisteration(CustomMembership membership)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_InsertRegisteration", "@fName", membership.FName, "@lastName", membership.LastName,
                    "@userName", membership.Username, "@password", membership.Password, "@email", membership.Email, "@accountName", membership.AccountName,
                    "@accountFamily", membership.AccountFamily, "@accountNumber", membership.AccountNumber, "@bankName", membership.BankName,
                    "@sex", membership.Sex, "@birthDay", membership.BirthDay, "@phone", membership.Phone, "@mobile", membership.Mobile,
                    "@address", membership.Address, "@picture", membership.Picture, "@country", membership.Country, "@city", membership.City,
                    "@webSite", membership.WebSite, "@yahooID", membership.YahooID, "@registrationDate", membership.RegistrationDate,
                    "@lastLoginDate", membership.LastLoginDate, "@comment", membership.Comment, "@isActive", membership.IsActive);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_InsertRegisteration With Class", ex); }
    }
    public static void Membership_InsertRegisteration(String fName, String lName, String uName, String pass, String email,
   String accountName, String accountFamily, String accountNumber, String bankName, String sex, String birthDay,
   String phone, String mobile, String address, String picture, String country, String city, String webSite, String yahooID, String comment)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_InsertRegisteration", "@fName", fName, "@lastName", lName,
                    "@userName", uName, "@password", pass, "@email", email, "@accountName", accountName,
                    "@accountFamily", accountFamily, "@accountNumber", accountNumber, "@bankName", bankName,
                    "@sex", sex, "@birthDay", birthDay, "@phone", phone, "@mobile", mobile,
                    "@address", address, "@picture", picture, "@country", country, "@city", city,
                    "@webSite", webSite, "@yahooID", yahooID, "@comment", comment);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Membership_InsertRegisteration Without Class", ex); }
    }
    public static void Membership_RegisterationActive(String email)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_RegisterationActive", "@email", email);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_RegisterationActive", ex); }
    }
    public static int Membership_RegisterQuick(String userName, String password, String email)
    {
        int memberID = -1;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                memberID = (int)db.ExecNonQueryProc("SP_Membership_Quick", "@userName", userName, "@password", password,
                    "@email", email, "@isActive", false, "@registrationDate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_RegisterQuick", ex); }
        return memberID;
    }
    public static void Membership_InsertPublicAttributes(String fName, String lastName, bool sex, String birthDay, String userName)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_InsertPublicAttributes", "@fName", fName, "@lastName", lastName,
                    "@userName", userName, "@sex", sex, "@birthDay", birthDay);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_InsertPublicAttributes", ex); }
    }
    public static void Membership_InsertPictureUser(String userName,String picName)
    {
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                db.ExecNonQueryProc("SP_Membership_InsertPictureUser","@userName",userName,"@picture",picName);
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("Membership_InsertPictureUser",ex); }
    }
    public static String Membership_GetPictureNameByUserName(String userName)
    {
        String picName = "";
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                dr = db.ExecDataReaderProc("SP_Membership_GetPictureNameByUserName","@userName",userName);
                if ( dr.HasRows ) { dr.Read(); picName = dr["Member_Picture"].ToString(); }
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("Membership_GetPictureNameByUserName",ex); }
        return picName;
    }
    public static void Membership_InsertContactInfo(String phone,String mobile,String address,String country,String city,String userName)
    {
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                db.ExecNonQueryProc("SP_Membership_InsertContactInfo","@phone",phone,"@mobile",mobile,"@userName",userName,"@address",address,"@country",country,"@city",city);
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("Membership_InsertContactInfo",ex); }
    }

    public static void Membership_InsertAccountInfo(String accountName,String accountFamily,
             String accountNumber,String bankName,String webSite,String yahooID,String comment,String userName)
    {
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                db.ExecNonQueryProc("SP_Membership_InsertAccountInfo","@userName",userName,"@accountName",accountName,"@accountFamily",accountFamily,
                  "@accountNumber",accountNumber,"@bankName",bankName,"@webSite",webSite,"@yahooID",yahooID,"@comment",comment);
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("Membership_InsertAccountInfo",ex); }
    }
    public static DataSet Sport_GetAcountDetailsByUserID(int userID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetAcountDetailsByUserID", "@UserID", userID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetAcountDetailsByUserID", ex); }
        return ds;
    }
    public static void Membership_LoadAllAttributes(String userName, CustomMembership member)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_LoadAllAttributes", "@userName", userName);
                if (dr.Read())
                {
                    member.Username = dr["Member_UserName"].ToString();
                    member.FName = dr["Member_FirstName"].ToString();
                    member.LastName = dr["Member_LastName"].ToString();
                    member.Email = dr["Member_Email"].ToString();
                    member.Sex = bool.Parse(dr["Member_Sex"].ToString());
                    member.BirthDay = dr["Member_BirthDay"].ToString();
                    member.Phone = dr["Member_Phone"].ToString();
                    member.Mobile = dr["Member_Mobile"].ToString();
                    member.Address = dr["Member_Address"].ToString();
                    member.Picture = dr["Member_Picture"].ToString();
                    member.Country = dr["Member_Country"].ToString();
                    member.City = dr["Member_City"].ToString();
                    member.WebSite = dr["Member_WebSite"].ToString();
                    member.YahooID = dr["Member_YahooID"].ToString();
                    member.AccountName = dr["Member_AccountName"].ToString();
                    member.AccountFamily = dr["Member_AccountFamily"].ToString();
                    member.AccountNumber = dr["Member_AccountNumber"].ToString();
                    member.BankName = dr["Member_BankName"].ToString();
                    member.RegistrationDate = DateTime.Parse(dr["Member_RegistrationDate"].ToString());
                    member.LastLoginDate = DateTime.Parse(dr["Member_LastLoginDate"].ToString());
                    //member.LastPasswordChangedDate = DateTime.Parse(dr["Member_LastPasswordChangedDate"].ToString());
                    //member.IsActive = int.Parse(dr["Member_IsActive"].ToString());
                    //member.IsOnline = int.Parse(dr["Member_IsOnline"].ToString());
                    member.Comment = dr["Member_Comment"].ToString();
                }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_LoadAllAttributes With Class", ex); }
    }
    public static CustomMembership Membership_LoadAllAttributes(String userName)
    {
        CustomMembership member = new CustomMembership();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_LoadAllAttributes", "@userName", userName);
                while (dr.Read())
                {
                    member.Username = dr["Member_UserName"].ToString();
                    member.FName = dr["Member_FirstName"].ToString();
                    member.LastName = dr["Member_LastName"].ToString();
                    member.Email = dr["Member_Email"].ToString();
                    member.Sex = bool.Parse(dr["Member_Sex"].ToString());
                    member.BirthDay = dr["Member_BirthDay"].ToString();
                    member.Phone = dr["Member_Phone"].ToString();
                    member.Mobile = dr["Member_Mobile"].ToString();
                    member.Address = dr["Member_Address"].ToString();
                    member.Picture = dr["Member_Picture"].ToString();
                    member.Country = dr["Member_Country"].ToString();
                    member.City = dr["Member_City"].ToString();
                    member.WebSite = dr["Member_WebSite"].ToString();
                    member.YahooID = dr["Member_YahooID"].ToString();
                    member.AccountName = dr["Member_AccountName"].ToString();
                    member.AccountFamily = dr["Member_AccountFamily"].ToString();
                    member.AccountNumber = dr["Member_AccountNumber"].ToString();
                    member.BankName = dr["Member_BankName"].ToString();
                    member.RegistrationDate = DateTime.Parse(dr["Member_RegistrationDate"].ToString());
                    member.LastLoginDate = DateTime.Parse(dr["Member_LastLoginDate"].ToString());
                    //member.LastPasswordChangedDate = DateTime.Parse(dr["Member_LastPasswordChangedDate"].ToString());
                    //member.IsActive = int.Parse(dr["Member_IsActive"].ToString());
                    //member.IsOnline = int.Parse(dr["Member_IsOnline"].ToString());
                    member.Comment = dr["Member_Comment"].ToString();
                }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_LoadAllAttributes Without Class", ex); }
        return member;
    }
    public static DataView Membership_LoadAllUsers(String sort)
    {
        ds = new DataSet();
        dv = new DataView();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Membership_LoadAllUsers");
                dv = ds.Tables[0].DefaultView;
                dv.Sort = sort;
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_LoadAllUsers", ex); }
        return dv;
    }
    public static DataSet Membership_LoadAllUsers()
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Membership_LoadAllUsers");
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_LoadAllUsers", ex); }
        return ds;
    }
    public static DataSet Membership_LoadAllEmails()
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Membership_LoadAllEmails");
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_LoadAllEmails", ex); }
        return ds;
    }
    public static int Membership_GetUserIDByUserName(String userName)
    {
        int userID = -1;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_GetUserIDByUserName", "@userName", userName);
                if (dr.HasRows) { dr.Read(); userID = int.Parse(dr["Member_ID"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetUserIDByUserName", ex); }
        return userID;
    }
    public static String Membership_GetUserNameByUserID(String userID)
    {
        String userName = "";
        try 
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_GetUserNameByUserID", "@userID", userID);
                if (dr.HasRows) { dr.Read(); userName = dr["Member_UserName"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetUserNameByUserID", ex); }
        return userName;
    }
    public static DataView Membership_GetUsersByUserName(String userName, String sort)
    {
        ds = new DataSet();
        dv = new DataView();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Membership_GetUsersByUserName", "@userName", userName);
                dv = ds.Tables[0].DefaultView;
                dv.Sort = sort;
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetUsersByUserName", ex); }
        return dv;
    }
    public static DataView Membership_GetUsersByEmail(String email, String sort)
    {
        ds = new DataSet();
        dv = new DataView();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                {
                    ds = db.ExecDataSetProc("SP_Membership_GetUsersByEmail", "@email", email);
                    dv = ds.Tables[0].DefaultView;
                    dv.Sort = sort;
                }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetUsersByEmail", ex); }
        return dv;
    }
    public static String Membership_GetEmailForUserName(String userName)
    {
        string email = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_GetEmailForUserName", "@userName", userName);
                if (dr.HasRows) { dr.Read(); email = dr["email"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("GetEmailForUserName", ex); }
        return email;
    }
    public static String Membership_GetPasswordByUserName(String userName)
    {
        string pass = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_GetPasswordByUserName", "@userName", userName);
                if (dr.HasRows) { dr.Read(); pass = dr["Member_Password"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetPasswordByUserName", ex); }
        return pass;
    }
    public static void Membership_ChangePassword(String email, String newPassword)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_ChangePassword", "@email", email, "@password", newPassword);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_ChangePassword", ex); }
    }
    public static void Membership_SetLock(String email)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_SetLock", "@email", email);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_SetLock", ex); }
    }
    public static int Membership_GetLock(String email)
    {
        int key = -1;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                 key = (int)db.ExecNonQueryProc("SP_Membership_GetLockValue","@email", email);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetLock", ex); }
        return key;
    }
    public static void Membership_ResetLock(String email)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_ResetLockValue", "@email", email);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_ResetLock", ex); }
    }
    public static void Membership_UpdateKeyForChangePassword(String email, String keyPass)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_UpdateKeyForChangePassword", "@email", email, "@keyPass", keyPass);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_UpdateKeyForChangePassword", ex); }
    }
    public static String Membership_GetKeyOfChangePassword(String email)
    {
        String keyPass = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_GetKeyOfChangePassword", "@email", email);
                if (dr.HasRows) { dr.Read(); keyPass = dr["Member_KeyChangePassword"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetKeyOfChangePassword", ex); }
        return keyPass;
    }
    /*********************/
    //     public static void Membership_UpdateKeyForProfile(String userName, String keyPass)
    //{
    //    conn = new SqlConnection(GetConnectionString());
    //    cmd = new SqlCommand("SP_Membership_UpdateKeyForProfile", conn);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@userName", userName);
    //    cmd.Parameters.AddWithValue("@keyPass", keyPass);
    //    if (conn.State == ConnectionState.Closed)
    //    {
    //        OpenConnection(conn);
    //    }
    //    cmd.ExecuteNonQuery();
    //    if (conn.State == ConnectionState.Open)
    //    {
    //        conn.Close();
    //    }
    //}
    //public static String Membership_GetKeyOfProfile(String userName)
    //{
    //    String keyPass;
    //    conn = new SqlConnection(GetConnectionString());
    //    cmd = new SqlCommand("SP_Membership_GetKeyOfProfile", conn);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@userName", userName);
    //    if (conn.State == ConnectionState.Closed)
    //    {
    //        OpenConnection(conn);
    //    }
    //    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
    //    dr.Read();
    //    keyPass = dr["Member_KeyForProfile"].ToString();
    //    if (conn.State == ConnectionState.Open)
    //    {
    //        conn.Close();
    //    }
    //    return keyPass;
    //}
    /***************************/
    public static void Membership_UpdateChangePasswordDate(String email)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_UpdateChangePasswordDate", "@email", email, "@LastPasswordChangedDate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_UpdateChangePasswordDate", ex); }
    }
    public static DateTime Membership_GetLastLoginDate(String userName)
    {
        DateTime lastLoginDate = BLL.GetIranDateTime();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Membership_GetLastLoginDate", "@userName", userName);
                if (dr.HasRows) { dr.Read(); lastLoginDate = DateTime.Parse(dr["Member_LastLoginDate"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_GetLastLoginDate", ex); }
        return lastLoginDate;
    }
    public static void Membership_UpdateLastLoginDate(String userName)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_UpdateLastLoginDate", "@userName", userName, "@lastLoginDate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex){ BLL.SendEmail("Membership_UpdateLastLoginDate", ex); }
    }
    public static void Membership_InsertNewEmailPassword(String newPassword, String newEmail, String userName)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_InsertNewEmailPassword", "@userName", userName, "@password", newPassword, "@email", newEmail);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_InsertNewEmailPassword", ex); }
    }
    //public static String Membership_GetRoleByUserName(String userName)
    //{
    //    string roleName = "";
    //    using (conn = new SqlConnection(GetConnectionString()))
    //    {
    //        try
    //        {
    //            cmd = new SqlCommand("SP_Membership_GetRoleByUserName", conn);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("@userName", userName);
    //            OpenConnection(conn);
    //            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
    //            if (dr.HasRows) { dr.Read(); roleName = dr["Role_Name"].ToString(); }
    //        }
    //        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Membership_GetRoleByUserName", ex); }
    //       // //finally{CloseConnection(conn);}
    //    }
    //    return roleName;
    //}

    //public static String checkUserName(String userName)
    //{
    //    conn = new SqlConnection(GetConnectionString());
    //    cmd = new SqlCommand("SP_Membership_ExistUserName", conn);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@userName", userName);
    //    OpenConnection(conn);
    //    try
    //    {
    //        int exists = (int)cmd.ExecuteScalar();

    //        if (exists == 1)

    //            return "exists";

    //        else

    //            return "notexists";
    //    }

    //    catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch
    //    {
    //        throw;
    //    }
    //}
    public static bool Membership_ExistsUserNameOrEmail(String procedureName, String paramName, String objectName)
    {
        Boolean flag = false;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc(procedureName, paramName, objectName);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { flag = false; BLL.SendEmail("Membership_ExistsUserNameOrEmail", ex); }
        return flag;
    }
    public static void Membership_Delete(CustomMembership membership)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Membership_Delete", "@memberID", membership.MemberID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Membership_Delete With Class", ex); }
    }
    public static void Membership_Delete(int memberID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Membership_Delete", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramUserId = new SqlParameter("@memberID", SqlDbType.Int);
                paramUserId.Value = memberID;
                cmd.Parameters.Add(paramUserId);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Membership_Delete Without Class", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    /************************************************/
    public static void Site_Increase_ViewCount()
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Increase_ReviewCount");
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Site_Increase_ViewCount", ex); }
    }
    public static long Site_GetReviewCount()
    {
        long count = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_GetReviewCount");
                if (dr.HasRows){dr.Read(); count = long.Parse(dr["ViewCount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Site_GetReviewCount", ex); }
        return count;
    }
    public static void Site_InsertSiteVisit(DateTime date, String userName, String userIP, String pageURL)
    {
        System.Web.HttpBrowserCapabilities browser = HttpContext.Current.Request.Browser;
        string myBrowser = "Browser Capabilities" + ","
            + "Type = " + browser.Type + ","
            + "Name = " + browser.Browser + ","
            + "Version = " + browser.Version + ","
            + "Major Version = " + browser.MajorVersion + ","
            + "Minor Version = " + browser.MinorVersion + ","
            + "Platform = " + browser.Platform + ","
            //+ "Is Beta = " + browser.Beta + ","
            //+ "Is Crawler = " + browser.Crawler + ","
            //+ "Is AOL = " + browser.AOL + ","
            //+ "Is Win16 = " + browser.Win16 + ","
            //+ "Is Win32 = " + browser.Win32 + ","
            //+ "Supports Frames = " + browser.Frames + ","
            //+ "Supports Tables = " + browser.Tables + ","
            //+ "Supports Cookies = " + browser.Cookies + ","
            //+ "Supports VBScript = " + browser.VBScript + ","
            //+ "Supports JavaScript = " + browser.EcmaScriptVersion.ToString() + ","
            //+ "Supports Java Applets = " + browser.JavaApplets + ","
            //+ "Supports ActiveX Controls = " + browser.ActiveXControls  + ","
            + "Supports JavaScript Version = " + browser["JavaScriptVersion"];
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_InsertSiteVisit", "@date", date, "@userName", userName, "@userIP", userIP,
                    "@pageURL", pageURL, "@browserType", myBrowser);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Site_InsertSiteVisit", ex); }
    }
    public static DataSet Site_GetUsersTraffic()
    {
        ds = new DataSet(); 
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Membership_GetUsersTraffic");
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Site_GetUsersTraffic", ex); }
        return ds;
    }
    /**********************News**************************/
    public static void News_InsertNews(String news_Title, String news_Summary, String news_Context, Boolean news_Pooling, Boolean news_Status)
    {
        DateTime news_Date = BLL.GetIranDateTime();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_News_InsertNews", "@date", news_Date, "@title", news_Title, "@summary", news_Summary,
                    "@context", news_Context, "@pooling", news_Pooling, "@status", news_Status);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("News_InsertNews", ex); }
    }
    public static void News_UpdateNews(int news_ID,String news_Title,String news_Summary,String news_Context,Boolean news_Pooling,Boolean news_Status)
    {
        DateTime news_LastModifiedDate = BLL.GetIranDateTime();
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                db.ExecNonQueryProc("SP_News_UpdateNewsByID","@newsID",news_ID,"@lastModified",news_LastModifiedDate,"@title",news_Title,
                    "@summary",news_Summary,"@context",news_Context,"@pooling",news_Pooling,"@status",news_Status);
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("News_UpdateNews",ex); }
    }

    public static DataSet News_LoadAllNews()
    {
        ds = new DataSet();
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                ds = db.ExecDataSetProc("SP_News_LoadAllNews");
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("News_LoadAllNews",ex); }
        return ds;
    }
    public static NewsInfo GetNewsByID(int newsID)
    {
        NewsInfo news = new NewsInfo();
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                dr = db.ExecDataReaderProc("SP_News_GetNewsByID","@NewsID",newsID);
                if ( dr.HasRows )
                {
                    while ( dr.Read() )
                    {
                        news.NewsID = dr["News_ID"].ToString();
                        news.NewsDate = dr["News_Date"].ToString();
                        news.NewsTitle = dr["News_Title"].ToString();
                        news.NewsSummary = dr["News_Summary"].ToString();
                        news.NewsContext = dr["News_Context"].ToString();
                        news.NewsPooling = dr["News_Pooling"].ToString();
                        news.NewsStatus = dr["News_Status"].ToString();
                        news.NewsViewCount = dr["News_ViewCount"].ToString();
                    }
                }
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("GetNewsByID",ex); }
        return news;
    }
    public static void GetNewsByID(int newsID,out String newsDate,out String newsTitle,out String newsSummary,
                    out String newsContext,out String newsPooling,out String newsViewCount)
    {
        newsDate = ""; newsTitle = ""; newsSummary = ""; newsContext = ""; newsPooling = ""; newsViewCount = "";
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                dr = db.ExecDataReaderProc("SP_News_GetNewsByID","@NewsID",newsID);
                if ( dr.HasRows )
                {
                    dr.Read();
                    newsDate = dr["News_Date"].ToString();
                    newsTitle = dr["News_Title"].ToString();
                    newsSummary = dr["News_Summary"].ToString();
                    newsContext = dr["News_Context"].ToString();
                    newsPooling = dr["News_Pooling"].ToString();
                    newsViewCount = dr["News_ViewCount"].ToString();
                }
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("GetNewsByID Out",ex); }
    }

    public static void News_IncreaseViewCount(int newsID)
    {
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                db.ExecNonQueryProc("SP_News_IncreaseViewCount","@NewsID",newsID);
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("News_IncreaseViewCount",ex); }
    }
    public static void News_DeleteByID(int newsID)
    {
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                db.ExecNonQueryProc("SP_News_DeleteByID","@NewsID",SqlDbType.Int);
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("News_DeleteByID",ex); }
    }
    //public static DataTable News_GetTopNewsToDataTable()
    //{
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    conn = new SqlConnection(GetConnectionString());
    //    adaptor = new SqlDataAdapter("SP_News_GetTopNews", conn);
    //    adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
    //    if (conn.State == ConnectionState.Closed)
    //    {
    //        OpenConnection(conn);
    //    }
    //    adaptor.Fill(ds);

    //    if (conn.State == ConnectionState.Open)
    //    {
    //        conn.Close();
    //    }
    //    dt = ds.Tables[0];
    //    return dt;

    //}
    public static String News_GetTopNews()
    {
        String marquee = "", date, title, summary, path;
        int id; Boolean pooling; marquee = "";
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                dr = db.ExecDataReaderProc("SP_News_GetTopNews");
                marquee = "<marquee  onmouseover=\"this.stop()\" onmouseout=\"this.start()\" direction=\"up\" scrolldelay=\"1\" scrollamount=\"1\" style=\"width:99%;height:250px; padding: 0 1% 0 0;\">";
                if ( dr.HasRows )
                {
                    while ( dr.Read() )
                    {
                        id = int.Parse(dr["News_ID"].ToString());
                        date = dr["News_Date"].ToString();
                        title = dr["News_Title"].ToString();
                        summary = dr["News_summary"].ToString();
                        pooling = Boolean.Parse(dr["News_Pooling"].ToString());
                        path = "NewsDisplay.aspx?newsId=" + id.ToString();
                        int len = title.Length;
                        if ( len >= 31 ) { title = title.Substring(0,30) + "..."; }
                        else { for ( int i = len - 1; i <= 31; i++ ) { title = title + "."; } }
                        marquee += String.Format("<div style=\"direction: rtl\"> " +
                            "<ul>" + "<li style=\"list-style:none; padding:0 5px 0 0;\">" +
                            "<img src=\"Images/legend/newspaper.png\" />  " +
                            "<a style=\"text-decoration:none;color:white; text-align:right\" onclick=\"callServerButtonEvent();\" href=\"{0}\">{1}</a>" +
                            "</li>" + "</div>",path,title);
                    }
                }
                else
                    marquee += "&nbsp;<p> تاکنون اخبار جدیدی در سایت ثبت نشده است </p>";
                marquee += "</marquee>";
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("News_GetTopNews",ex); }
        return marquee;
    }

    /**********************ContactUs**************************/
    //public static void ContactUs_InsertContact(ContactUs contactNew)
    //{
    //    using (conn = new SqlConnection(GetConnectionString()))
    //    {
    //        try
    //        {
    //            cmd = new SqlCommand("SP_ContactUs_Insert", conn);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue( "@title", contactNew.ContactUs_Title );
    //            cmd.Parameters.AddWithValue("@author", contactNew.ConatactUs_Author);
    //            cmd.Parameters.AddWithValue("@ip", contactNew.ConatactUs_UserIP);
    //            cmd.Parameters.AddWithValue("@email", contactNew.ContactUs_Email);
    //            cmd.Parameters.AddWithValue("@phone", contactNew.ConatactUs_Phone);
    //            cmd.Parameters.AddWithValue( "@message", contactNew.ContactUs_Message );
    //            cmd.Parameters.AddWithValue( "@date", BLL.GetIranDateTime() );
    //            OpenConnection(conn);
    //            cmd.ExecuteNonQuery();
    //        }
    //        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("ContactUs_InsertContact With Class", ex); }
    //        //finally { CloseConnection(conn); }
    //    }
    //}
    public static void ContactUs_InsertContact(String title, String author, String email,
                String phone, String message)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                HttpRequest request = HttpContext.Current.Request;
                //String ip = request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
                //if (ip == string.Empty)
                //{
                //    ip = request.ServerVariables["REMOTE_ADDR"].ToString();
                //}
                cmd = new SqlCommand("SP_ContactUs_Insert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@author", author);
                cmd.Parameters.AddWithValue("@ip", request.UserHostAddress);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@message", message);
                cmd.Parameters.AddWithValue( "@date", BLL.GetIranDateTime() );
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("ContactUs_InsertContact", ex); }
            //finally { CloseConnection(conn); }
        }
    }
        public static void ContactUs_UpdateContact(String contactID,String reply, String status, String description )
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_ContactUs_Update", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@contactID", contactID);
                cmd.Parameters.AddWithValue("@reply", reply);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@desc", description);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("ContactUs_InsertContact", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    
    public static DataSet LoadAllInputMessageContactUs(String status)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {            
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_LoadAllInputMessageContactUs", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@status", status);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("LoadAllInputMessageContactUs", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    //public static String GetContactMessageByContactID(String contactID)
    //{
    //    String message = ""; String email = "";
    //    using (conn = new SqlConnection(GetConnectionString()))
    //    {
    //        try
    //        {
    //            cmd = new SqlCommand("SP_GetContactMessageByContactID", conn);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("@Contact_ID", contactID);
    //            OpenConnection(conn);
    //            using (dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
    //            {
    //                if (dr.HasRows) { dr.Read(); message = dr["Contact_Message"].ToString(); email = dr["Contact_Email"].ToString(); }
    //            }
    //        }
    //        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
    //        catch (Exception ex) { BLL.SendEmail("LoadAllInputMessageContactUs", ex); }
    //        //finally { CloseConnection(conn); }
    //    }
    //    return message;
    //}
    public static ContactUs GetContactMessageByContactID(String contactID)
    {
        ContactUs contactUs = new ContactUs();
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_GetContactMessageByContactID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Contact_ID", contactID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    dr.Read();
                    contactUs.ContactUs_ID = dr["Contact_ID"].ToString();
                    contactUs.ContactUs_Date = dr["Contact_Date"].ToString();
                    contactUs.ContactUs_Message = dr["Contact_Message"].ToString();
                    contactUs.ContactUs_Email = dr["Contact_Email"].ToString();
                    contactUs.ConatactUs_Author = dr["Contact_Author"].ToString();
                    contactUs.ConatactUs_Phone = dr["Contact_Phone"].ToString();
                    contactUs.ConatactUs_UserIP = dr["Contact_UserIP"].ToString();
                    contactUs.ContactUs_Title = dr["Contact_Title"].ToString();
                    contactUs.ContactUs_Reply = dr["Contact_Reply"].ToString();
                    contactUs.ContactUs_Status = dr["Contact_Status"].ToString();
                    contactUs.ContactUs_Description = dr["Contact_Description"].ToString();
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("LoadAllInputMessageContactUs", ex); }
            //finally { CloseConnection(conn); }
        }
        return contactUs;
    }
    public static void Messages_InsertNewMessage(int Message_Type, String Message_Subject, String Message_Context,
         String Message_SenderEmail, String Message_ReceiverEmail, Boolean Message_Status, String Message_Description)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                HttpRequest request = HttpContext.Current.Request;
                //String ip = request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
                //if (ip == string.Empty)
                //{
                //    ip = request.ServerVariables["REMOTE_ADDR"].ToString();
                //}
                cmd = new SqlCommand("SP_Messages_InsertNewMessage", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Message_Type", Message_Type);
                cmd.Parameters.AddWithValue("@Message_Subject", Message_Subject);
                cmd.Parameters.AddWithValue("@Message_Context", Message_Context);
                cmd.Parameters.AddWithValue("@Message_CreationDate", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@Message_SenderEmail", Message_SenderEmail);
                cmd.Parameters.AddWithValue("@Message_ReceiverEmail", Message_ReceiverEmail);
                cmd.Parameters.AddWithValue("@Message_Status", Message_Status);
                cmd.Parameters.AddWithValue("@Message_Description", Message_Description);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Messages_InsertNewMessage", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DataSet Messages_GetReceiveMessagesByMessageType(int MessageType, String receiver_Email = "")
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Messages_GetReceiveMessagesByMessageType", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@Message_Type", MessageType);
                adaptor.SelectCommand.Parameters.AddWithValue("@Receiver_Email", receiver_Email);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Messages_GetReceiveMessagesByMessageType", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Messages_GetSendMessagesByMessageType(int MessageType, String sender_Email = "")
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Messages_GetSendMessagesByMessageType", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@Message_Type", MessageType);
                adaptor.SelectCommand.Parameters.AddWithValue("@Sender_Email", sender_Email);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Messages_GetSendMessagesByMessageType", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static MessageInfo GetMessageInfoByMessageID(Int32 MessageID)
    {
        MessageInfo message = new MessageInfo();
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_GetMessageInfoByMessageID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Message_ID", MessageID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        message.Message_ID = dr["Message_ID"].ToString();
                        message.Message_Type = dr["Message_Type"].ToString();
                        message.Message_Subject = dr["Message_Subject"].ToString();
                        message.Message_Context = dr["Message_Context"].ToString();
                        message.Message_CreationDate = dr["Message_CreationDate"].ToString();
                        message.Message_SenderEmail = dr["Message_SenderEmail"].ToString();
                        message.Message_ReceiverEmail = dr["Message_ReceiverEmail"].ToString();
                        message.Message_Status = dr["Message_Status"].ToString();
                        message.Message_Description = dr["Message_Description"].ToString();
                    }
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Economic_GetArticleInfoByID", ex); }
            //finally { CloseConnection(conn); }
        }
        return message;
    }
    /**********************Economic**************************/

    public static void Economic_InsertPooling(String name, String comment)
    {
        using(conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_InsertPooling", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@comment", comment);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_InsertPooling", ex); }
            //finally { CloseConnection(conn); }
            }
    }

    public static DataSet Economic_LoadAllAnalysis(Boolean flag)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {            
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Economic_LoadAllAnalysis", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@flag", flag);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_LoadAllAnalysis", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }

    public static AnalysisInfo GetAnalysisByID(int analysisID)
    {
        AnalysisInfo analysis = new AnalysisInfo();
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_GetAnalysisByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@analysisID", analysisID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        analysis.AnalysisID = int.Parse(dr["EconomicAnalysis_ID"].ToString());
                        analysis.AnalysisDate = DateTime.Parse(dr["EconomicAnalysis_Date"].ToString());
                        analysis.AnalysisTitle = dr["EconomicAnalysis_Title"].ToString();
                        analysis.AnalysisContext = dr["EconomicAnalysis_Context"].ToString();
                        analysis.AnalysisAuthor = dr["EconomicAnalysis_Author"].ToString();
                        analysis.AnalysisStatus = Boolean.Parse(dr["EconomicAnalysis_Status"].ToString());
                    }
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("GetAnalysisByID", ex); }
            //finally { CloseConnection(conn); }
        }
        return analysis;
    }

    public static void Economic_InsertAnalysis(String analysisTitle, String analysisContext, Boolean analysisStatus)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_InsertAnalysis", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@analysis_Date", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@analysis_Title", analysisTitle);
                cmd.Parameters.AddWithValue("@analysis_Context", analysisContext);
                cmd.Parameters.AddWithValue("@analysis_Author", HttpContext.Current.User.Identity.Name);
                cmd.Parameters.AddWithValue("@analysis_Status", analysisStatus);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_InsertAnalysis", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void Economic_UpdateAnalysis(int analysisID, String analysis_Title,
                String analysis_Context, Boolean analysis_Status)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_UpdateAnalysisByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@analysis_Date", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@analysisID", analysisID);
                cmd.Parameters.AddWithValue("@analysis_Title", analysis_Title);
                cmd.Parameters.AddWithValue("@analysis_Context", analysis_Context);
                cmd.Parameters.AddWithValue("@analysis_Author", HttpContext.Current.User.Identity.Name);
                cmd.Parameters.AddWithValue("@analysis_Status", analysis_Status);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_UpdateAnalysis", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static DataSet Economic_LoadAllBongah()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {            
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Economic_LoadAllBongah", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_LoadAllBongah", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }

    public static void Analysis_DeleteByID(int analysisID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Analysis_DeleteByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramId = new SqlParameter("@AnalysisID", SqlDbType.Int);
                paramId.Value = analysisID;
                cmd.Parameters.Add(paramId);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Analysis_DeleteByID", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void Economic_InsertBongah(String bongahType, String bongahLocation, String bongahAttribute,
                    Boolean bongahBuy, Boolean bongahSale, Boolean bongahInvestor, Boolean bongahCapitalist)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_InsertBongah", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Bongah_Type", bongahType);
                cmd.Parameters.AddWithValue("@Bongah_Location", bongahLocation);
                cmd.Parameters.AddWithValue("@Bongah_Attribute", bongahAttribute);
                cmd.Parameters.AddWithValue("@Bongah_Buy", bongahBuy);
                cmd.Parameters.AddWithValue("@Bongah_Sale", bongahSale);
                cmd.Parameters.AddWithValue("@Bongah_Investor", bongahInvestor);
                cmd.Parameters.AddWithValue("@Bongah_Capitalist", bongahCapitalist);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_InsertBongah", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void Economic_UpdateBongahInfo(int bongahId, String bongahType, String bongahLocation, String bongahAttribute,
                    Boolean bongahBuy, Boolean bongahSale, Boolean bongahInvestor, Boolean bongahCapitalist)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_UpdateBongahByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Bongah_ID", bongahId);
                cmd.Parameters.AddWithValue("@Bongah_Type", bongahType);
                cmd.Parameters.AddWithValue("@Bongah_Location", bongahLocation);
                cmd.Parameters.AddWithValue("@Bongah_Attribute", bongahAttribute);
                cmd.Parameters.AddWithValue("@Bongah_Buy", bongahBuy);
                cmd.Parameters.AddWithValue("@Bongah_Sale", bongahSale);
                cmd.Parameters.AddWithValue("@Bongah_Investor", bongahInvestor);
                cmd.Parameters.AddWithValue("@Bongah_Capitalist", bongahCapitalist);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_UpdateBongahInfo", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void Economic_DeleteBongahByID(String bongahId)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_DeleteBongahByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramBongahId = new SqlParameter("@bongahId", SqlDbType.NVarChar);
                paramBongahId.Value = bongahId;
                cmd.Parameters.Add(paramBongahId);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_DeleteBongahByID", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static BongahInfo Economic_GetBongahInfoByID(int bongahID)
    {
        BongahInfo bongah = new BongahInfo();
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_GetBongahByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@bongahID", bongahID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        bongah.BongahID = int.Parse(dr["Bongah_ID"].ToString());
                        bongah.Bongah_Type = dr["Bongah_Type"].ToString();
                        bongah.Bongah_Location = dr["Bongah_Location"].ToString();
                        bongah.Bongah_Attribute = dr["Bongah_Attribute"].ToString();
                        bongah.Bongah_buy = Convert.ToBoolean(dr["Bongah_Buy"].ToString());
                        bongah.Bongah_sale = Convert.ToBoolean(dr["Bongah_Sale"].ToString());
                        bongah.Bongah_investor = Convert.ToBoolean(dr["Bongah_Investor"].ToString());
                        bongah.Bongah_capitalist = Convert.ToBoolean(dr["Bongah_Capitalist"].ToString());
                    }
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Economic_GetBongahInfoByID", ex); }
            //finally { CloseConnection(conn); }
        }
        return bongah;
    }

    /***************************ArticleMarket*********************************/

    public static DataSet Economic_LoadAllArticleMarket()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {           
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Economic_LoadAllArticle", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_LoadAllArticleMarket", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }

    public static ArticleInfo Economic_GetArticleInfoByID(int articleID)
    {
        ArticleInfo article = new ArticleInfo();
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_GetArticleByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@articleID", articleID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        article.Article_ID = int.Parse(dr["Article_ID"].ToString());
                        article.Article_Type = dr["Article_Type"].ToString();
                        article.Article_Unit = dr["Article_Unit"].ToString();
                        article.Article_Attribute = dr["Article_Attribute"].ToString();
                        article.Article_Buy = Boolean.Parse(dr["Article_Buy"].ToString());
                        article.Article_Sale = Boolean.Parse(dr["Article_Sale"].ToString());
                        article.Article_Cost = dr["Article_Cost"].ToString();
                        article.Article_Status = Boolean.Parse(dr["Article_Status"].ToString());
                    }
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Economic_GetArticleInfoByID", ex); }
            //finally { CloseConnection(conn); }
        }
        return article;
    }

    public static void Economic_InsertArticle(String ArticleType, String ArticleUnit,
                String ArticleAttribute, Boolean ArticleBuy, Boolean ArticleSale, String ArticleCost, Boolean ArticleStatus)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_InsertArticle", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Article_Type", ArticleType);
                cmd.Parameters.AddWithValue("@Article_Unit", ArticleUnit);
                cmd.Parameters.AddWithValue("@Article_Attribute", ArticleAttribute);
                cmd.Parameters.AddWithValue("@Article_Buy", ArticleBuy);
                cmd.Parameters.AddWithValue("@Article_Sale", ArticleSale);
                cmd.Parameters.AddWithValue("@Article_Cost", ArticleCost);
                cmd.Parameters.AddWithValue("@Article_Status", ArticleStatus);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_InsertArticle", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void Economic_UpdateArticleInfo(int articleId, String articleType, String articleUnit,
                    String articleAttribute, Boolean articleBuy, Boolean articleSale, String articleCost, Boolean articleStatus)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_UpdateArticleByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Article_ID", articleId);
                cmd.Parameters.AddWithValue("@Article_Type", articleType);
                cmd.Parameters.AddWithValue("@Article_Unit", articleUnit);
                cmd.Parameters.AddWithValue("@Article_Attribute", articleAttribute);
                cmd.Parameters.AddWithValue("@Article_Buy", articleBuy);
                cmd.Parameters.AddWithValue("@Article_Sale", articleSale);
                cmd.Parameters.AddWithValue("@Article_Cost", articleCost);
                cmd.Parameters.AddWithValue("@Article_Status", articleStatus);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_UpdateArticleInfo", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void Economic_DeleteArticleByID(int articleId)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_DeleteArticleByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramArticleId = new SqlParameter("@articleId", SqlDbType.Int);
                paramArticleId.Value = articleId;
                cmd.Parameters.Add(paramArticleId);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_DeleteArticleByID", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    /****************************ArticleOrder*****************************/

    public static void Economic_RegisterArticleOrder(int articleID, Boolean orderType,
            Int32 orderValue, Int32 suggestCost, String address, String phone, String email)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Economic_InsertArticleOrder", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@artOrder_ArticleID", articleID);
                cmd.Parameters.AddWithValue("@artOrder_OrderType", orderType);
                cmd.Parameters.AddWithValue("@artOrder_OrderValue", orderValue);
                cmd.Parameters.AddWithValue("@artOrder_SuggestCost", suggestCost);
                cmd.Parameters.AddWithValue("@artOrder_Address", address);
                cmd.Parameters.AddWithValue("@artOrder_Phone", phone);
                cmd.Parameters.AddWithValue("@artOrder_Email", email);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Economic_RegisterArticleOrder", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    /**********************RSSMoney**************************/

    public static String Economic_GetMoneyRate(String RSSPath)
    {
        String marquee = "<marquee  onmouseover=\"this.stop()\" onmouseout=\"this.start()\" direction=\"up\" scrolldelay=\"1\" scrollamount=\"1\" style=\"width:99%;height:250px; padding: 0 1% 0 0;\">";
        String money = "";
        DataTable dt = new DataTable();
        try
        {
            dt = BLL.GetRss(RSSPath, 3);
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch
        {
            dt = null;
        }

        if (dt != null)
        {
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                money = dt.Rows[i][1].ToString();
                marquee += String.Format("<div style=\"direction: rtl\"> " +
                        "<ul>" +
                        "<li style=\"list-style:none; padding:0 3px 0 0;\">" +
                        "<img src=\"../Images/legend/dollar.png\" />  " +
                        "<a style=\"text-decoration:none;color:white;font-family:tahoma;font-size:10px; text-align:right; direction:ltr;\">{0}</a>" +
                        "</li>" +
                        "</div>", money);
            }
        }
        marquee += "</marquee>";
        return marquee;
    }

    /**********************RSSOther**************************/

    public static void RSSOther_Insert(RSSOtherInfo rssOther)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_RSSOther_Insert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", rssOther.RSSOther_ID);
                cmd.Parameters.AddWithValue("@author", rssOther.RSSOther_Author);
                cmd.Parameters.AddWithValue("@subject", rssOther.RSSOther_Subject);
                cmd.Parameters.AddWithValue("@linkRSS", rssOther.RSSOther_Link);
                cmd.Parameters.AddWithValue("@Date", rssOther.RSSOther_Date);
                cmd.Parameters.AddWithValue("@active", rssOther.RSSOther_Active);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RSSOther_Insert", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    /**********************RSSFeed**************************/

    public static DataView RSSOther_LoadRssSubjects()
    {

        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                dv = new DataView();
                adaptor = new SqlDataAdapter("SP_RSSOther_LoadSubjects", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
                dv = ds.Tables[0].DefaultView;
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RSSOther_LoadRssSubjects", ex); }
            //finally { CloseConnection(conn);  }
        }
        return dv;
    }

    public static void RssOther_DeleteByID(String otherID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_RSSOther_Delete", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramRssOtherId = new SqlParameter("@otherId", SqlDbType.NVarChar);
                paramRssOtherId.Value = otherID;
                cmd.Parameters.Add(paramRssOtherId);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RssOther_DeleteByID", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static DataView RSSFeed_LoadAllFeed()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {        
             ds = new DataSet();
             dv = new DataView();
            try
            {
                adaptor = new SqlDataAdapter("SP_RSSFeed_LoadAllFeed", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
                dv = ds.Tables[0].DefaultView;
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RSSFeed_LoadAllFeed", ex); }
            //finally { CloseConnection(conn); }
        }
        return dv;
    }

    public static DataView RSSFeed_LoadFeedBySubject(String subject)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                dv = new DataView();
                adaptor = new SqlDataAdapter("SP_RSSFeed_LoadFeedBySubject", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@subject", subject);
                OpenConnection(conn);
                adaptor.Fill(ds);
                dv = ds.Tables[0].DefaultView;
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RSSFeed_LoadFeedBySubject", ex); }
            //finally { CloseConnection(conn); }
        }
        return dv;
    }

    public static RSSFeedInfo GetRssFeedByID(int feedID)
    {
        RSSFeedInfo rssFeed = new RSSFeedInfo();
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_RSSFeed_GetFeedByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@feedID", feedID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        rssFeed.RssFeedID = dr["RSSFeed_ID"].ToString();
                        rssFeed.RssOtherID = dr["RSSFeed_OtherID"].ToString();
                        rssFeed.RssSite = dr["RssFeed_Site"].ToString();
                        rssFeed.RssTitle = dr["RssFeed_Title"].ToString();
                        rssFeed.RssDescription = dr["RssFeed_Description"].ToString();
                        rssFeed.RssIsHome = dr["RssFeed_IsHome"].ToString();
                        rssFeed.RssIsEconomic = dr["RssFeed_IsEConomic"].ToString();
                        rssFeed.RssIsEducation = dr["RssFeed_IsEducation"].ToString();
                        rssFeed.RssIsRacing = dr["RssFeed_IsRacing"].ToString();
                        rssFeed.RssIsActive = dr["RssFeed_IsActive"].ToString();
                    }
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("GetRssFeedByID", ex); }
            //finally { CloseConnection(conn); }
        }
        return rssFeed;
    }

    public static void RSSFeed_Insert(RSSFeedInfo rssFeed)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_RSSFeed_Insert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@otherID", rssFeed.RssOtherID);
                cmd.Parameters.AddWithValue("@site", rssFeed.RssSite);
                cmd.Parameters.AddWithValue("@title", rssFeed.RssTitle);
                cmd.Parameters.AddWithValue("@link", rssFeed.RssLink);
                cmd.Parameters.AddWithValue("@desc", rssFeed.RssDescription);
                cmd.Parameters.AddWithValue("@pubDate", rssFeed.RssPubDate);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RSSFeed_Insert", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void RssFeed_UpdateFeed(int feedID, String feedTitle, String feedDesc,
                Boolean feedIsHome, Boolean feedIsEconomic, Boolean feedIsEducation,
                Boolean feedIsRacing, Boolean feedIsActive)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_RSSFeed_UpdateFeedByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@feedID", feedID);
                cmd.Parameters.AddWithValue("@feedTitle", feedTitle);
                cmd.Parameters.AddWithValue("@feedDesc", feedDesc);
                cmd.Parameters.AddWithValue("@isHome", feedIsHome);
                cmd.Parameters.AddWithValue("@isEconomic", feedIsEconomic);
                cmd.Parameters.AddWithValue("@isEducation", feedIsEducation);
                cmd.Parameters.AddWithValue("@isRacing", feedIsRacing);
                cmd.Parameters.AddWithValue("@isActive", feedIsActive);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RssFeed_UpdateFeed", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static void RssFeed_DeleteByID(Int32 RssFeedID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_RSSFeed_DeleteByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramUserId = new SqlParameter("@RssFeedID", SqlDbType.BigInt);
                paramUserId.Value = RssFeedID;
                cmd.Parameters.Add(paramUserId);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("RssFeed_DeleteByID", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static String RssFeed_GetTopRSS(SP_TopRss sp, String imageUrl)
    {
        String marquee = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand(sp.ToString(), conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                String site, title, desc, link, date;
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                marquee = "<marquee  onmouseover=\"this.stop()\" onmouseout=\"this.start()\" direction=\"up\" scrolldelay=\"1\" scrollamount=\"1\" style=\"width:99%;height:250px; padding: 0 1% 0 0;\">";
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        site = dr["RSSFeed_Site"].ToString();
                        title = dr["RSSFeed_Title"].ToString();
                        desc = dr["RSSFeed_Description"].ToString();
                        link = dr["RSSFeed_Link"].ToString();
                        date = dr["RSSFeed_PubDate"].ToString();

                        int len = title.Length;
                        if (len >= 31)
                        {
                            title = title.Substring(0, 30) + "...";
                        }
                        else
                        {
                            for (int i = len - 1; i <= 31; i++)
                            {
                                title = title + ".";
                            }
                        }
                        marquee += String.Format("<div style=\"direction: rtl\"> " +
                            "<ul>" +
                            "<li style=\"list-style:none; padding:0 5px 0 0;\">" +
                            "<img src=\"" + imageUrl + "/legend/newspaper.png\" />  " +
                            "<a target=\"_blank\" style=\"text-decoration:none;color:white; text-align:right\" href=\"{0}\">{1}</a>" +
                            "</li>" +
                            "</div>", link, title);
                    }
                }
                else
                    marquee += "&nbsp;<p> تاکنون اخبار جدیدی در سایت ثبت نشده است </p>";
                marquee += "</marquee>";
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("RssFeed_GetTopRSS", ex); }
            //finally { CloseConnection(conn); }
        }
        return marquee;
    }
    /*******************************Sport*************************************************************/
    public static void Sport_InsertLowAccept(SportLowAccept lowAccept)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertLowAccept", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LowAccept_UserID", lowAccept.Lowaccept_UserID);
                cmd.Parameters.AddWithValue("@LowAccept_IsOk", lowAccept.LowAccept_IsOk);
                cmd.Parameters.AddWithValue("@LowAccept_Date", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertLowAccept", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static bool Sport_IsLowAccept(int userID)
    {
        bool flag = false;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_IsLowAccept", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LowAccept_UserID", userID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_IsLowAccept", ex); }
            //finally { CloseConnection(conn); }
        }
        return flag;
    }
    public static void Sport_InsertTeam(String teamName, int countryID, String sloganPicture)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertTeam", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Team_Name", teamName);
                cmd.Parameters.AddWithValue("@Team_CountryID", countryID);
                cmd.Parameters.AddWithValue("@Team_SloganPicture", sloganPicture);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertTeam", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_UpdateTeam(int teamID, String teamName, int countryID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_UpdateTeam", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TeamID", teamID);
                cmd.Parameters.AddWithValue("@TeamName", teamName);
                cmd.Parameters.AddWithValue("@CountryID", countryID);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_UpdateTeam", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static bool Sport_IsDuplicateTeam(string teamName)
    {
        bool flag = false;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_IsDuplicateTeam", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Team_Name", teamName);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_IsDuplicateTeam", ex); }
            //finally { CloseConnection(conn); }
        }
        return flag;
    }
    public static bool Sport_IsDuplicateRace(string raceName)
    {
        bool flag = false;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_IsDuplicateRace", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Race_Title", raceName);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_IsDuplicateRace", ex); }
            //finally { CloseConnection(conn); }
        }
        return flag;
    }
    public static DataSet Sport_LoadAllClassificationTable()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllClassificationTable", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("SP_Sport_LoadAllClassificationTable", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static void Sport_InsertClassificationTable(SportClassificationTable classificationTable)
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertClassificationTable", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ClassificationTable_Title", classificationTable.ClassificationTableTitle);
                cmd.Parameters.AddWithValue("@ClassificationTable_Logo", classificationTable.ClassificationTableLogo);
                cmd.Parameters.AddWithValue("@ClassificationTable_CreationDate", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@ClassificationTable_AuthorID", memberID);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_InsertClassificationTable", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_InsertClassificationTable(String title, String logo)
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertClassificationTable", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ClassificationTable_Title", title);
                cmd.Parameters.AddWithValue("@ClassificationTable_Logo", logo);
                cmd.Parameters.AddWithValue("@ClassificationTable_CreationDate", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@ClassificationTable_AuthorID",memberID);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_InsertClassificationTable", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static bool Sport_IsDuplicateClassificationTable(string title)
    {
        bool flag = false;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_IsDuplicateClassificationTable", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@title", title);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_IsDuplicateClassificationTable", ex); }
            //finally { CloseConnection(conn); }
        }
        return flag;
    }
    //public static bool Sport_IsEqualTeamCreation(int hostTeamID, int guestTeamID)
    //{
    //    bool flag = false;
    //    conn = new SqlConnection(GetConnectionString());
    //    cmd = new SqlCommand("SP_Sport_IsEqualTeamCreation", conn);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@HostTeamID", hostTeamID);
    //    cmd.Parameters.AddWithValue("@GuestTeamID", guestTeamID);
    //    if (conn.State == ConnectionState.Closed){OpenConnection(conn);}
    //    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
    //    dr.Read();
    //    if (dr.HasRows)
    //    {
    //        flag = true;
    //    }
    //    if (conn.State == ConnectionState.Open) { conn.Close(); }
    //    return flag;
    //}

    public static DataSet Sport_GetTeamsByCountryID(int countryID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetTeamsByCountryID", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@countryID", countryID);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetTeamsByCountryID", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetSearchTeamsByCountryID(int countryID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetSearchTeamsByCountryID", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@countryID", countryID);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetTeamsByCountryID", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllTeams()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllTeams", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllTeams", ex); }
            //finally { CloseConnection(conn); }
            }
        return ds;
    }
    public static int Sport_GetTeamIDByTeamName(string teamName)
    {
        int teamID = -1;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetTeamIDByTeamName", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Team_Name", teamName);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); teamID = int.Parse(dr["Team_ID"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetTeamIDByTeamName", ex); }
            //finally { CloseConnection(conn); }
        }
        return teamID;
    }

    public static void Sport_InsertRace(String raceTitle)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertRace", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RaceTitle", raceTitle);
                cmd.Parameters.AddWithValue("@Race_Author", HttpContext.Current.User.Identity.Name);
                cmd.Parameters.AddWithValue("@Race_CreateDate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertRace", ex); }
            //finally { CloseConnection(conn); }
        }
    }

    public static DataSet LoadAllRaceTitles()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllRaceTitles", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("LoadAllRaceTitles", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }

    public static String Sport_GetSymbolByCountryID(int countryID)
    {
        String symbol = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSymbolByCountryID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@countryID", countryID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); symbol = dr["Country_Symbol"].ToString(); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSymbolByCountryID", ex); }
            //finally { CloseConnection(conn); }
        }
        return symbol;
    }

    public static int Sport_GetMaxRowInRacingInfo()
    {
        int maxRow = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetMaxRowInRacingInfo", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); maxRow = int.Parse(dr["maxRow"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetMaxRowInRacingInfo", ex); }
            //finally { CloseConnection(conn); }
        }
        return maxRow;
    }

    public static int Sport_GetMaxRowInRacingForms()
    {
        int maxRow = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetMaxRowInRacingForms", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); maxRow = int.Parse(dr["maxRow"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetMaxRowInRacingForms", ex); }
            //finally { CloseConnection(conn); }
        }
        return maxRow;
    }
    public static int Sport_GetUserFormsCountByRacingInfoID(String racingInfoID, int userID)
    {
        int formCount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetUserFormsCountByRacingInfoID", conn);
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                cmd.Parameters.AddWithValue("@userID", userID);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); formCount = int.Parse(dr["formCount"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetUserFormsCountByRacingInfoID", ex); }
            ////finally { CloseConnection(conn); }
        }
        return formCount;
    }
    public static int Sport_GetAllFormsCountByRacingInfoID(String racingInfoID)
    {
        int formCount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetAllFormsCountByRacingInfoID", conn);
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); formCount = int.Parse(dr["formCount"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetAllFormsCountByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return formCount;
    }
    public static void Sport_InsertRacingInfo(SportRacingInfo racingInfo)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertRacingInfo", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RacingInfo_ID", racingInfo.RacingInfo_ID);
                cmd.Parameters.AddWithValue("@RacingInfo_RaceID", racingInfo.RacingInfo_RaceID);
                cmd.Parameters.AddWithValue("@RacingInfo_Details", racingInfo.RacingInfo_Details);
                cmd.Parameters.AddWithValue("@RacingInfo_CountryID", racingInfo.RacingInfo_CountryID);
                cmd.Parameters.AddWithValue("@RacingInfo_StartDate", racingInfo.RacingInfo_StartDate);
                cmd.Parameters.AddWithValue("@RacingInfo_EndDate", racingInfo.RacingInfo_EndDate);
                cmd.Parameters.AddWithValue("@RacingInfo_StartRespiteDate", racingInfo.RacingInfo_StartRespiteDate);
                cmd.Parameters.AddWithValue("@RacingInfo_EndRespiteDate", racingInfo.RacingInfo_EndRespiteDate);
                cmd.Parameters.AddWithValue("@RacingInfo_StartRespiteTime", racingInfo.RacingInfo_StartRespiteTime);
                cmd.Parameters.AddWithValue("@RacingInfo_EndRespiteTime", racingInfo.RacingInfo_EndRespiteTime);
                cmd.Parameters.AddWithValue("@RacingInfo_CreationDate", racingInfo.RacingInfo_CreationDate);
                cmd.Parameters.AddWithValue("@RacingInfo_LastUpdate", racingInfo.RacingInfo_LastUpdate);
                cmd.Parameters.AddWithValue("@RacingInfo_Author", HttpContext.Current.User.Identity.Name);
                cmd.Parameters.AddWithValue("@RacingInfo_Status", racingInfo.RacingInfo_Status);
                cmd.Parameters.AddWithValue("@RacingInfo_Active", racingInfo.RacingInfo_Active);
                cmd.Parameters.AddWithValue("@RacingInfo_Description", racingInfo.RacingInfo_Description);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertRacingInfo", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DateTime Sport_GetRespiteDateByRacingInfoID(string racingInfoID)
    {
        DateTime respiteDate = BLL.GetIranDateTime();
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetRespiteDateByRacingInfoID", conn);
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); respiteDate = DateTime.Parse(dr["RacingInfo_EndRespiteDate"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_InsertRacingInfo", ex); }
            //finally { CloseConnection(conn); }
        }
        return respiteDate;
    }
    public static String Sport_GetRespiteTimeByRacingInfoID(string racingInfoID)
    {
        string respiteTime = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetRespiteTimeByRacingInfoID", conn);
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); respiteTime = dr["RacingInfo_EndRespiteTime"].ToString(); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetRespiteTimeByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return respiteTime;
    }
    public static void Sport_InsertRacing(SportRacing racing)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertRacing", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Racing_RacingInfoID", racing.Racing_RacingInfoID);
                cmd.Parameters.AddWithValue("@Racing_GameID", racing.Racing_GameID);
                cmd.Parameters.AddWithValue("@Racing_HostTeamID", racing.Racing_HostTeamID);
                cmd.Parameters.AddWithValue("@Racing_GuestTeamID", racing.Racing_GuestTeamID);
                cmd.Parameters.AddWithValue("@Racing_GameDate", racing.Racing_GameDate);
                cmd.Parameters.AddWithValue("@Racing_GameTime", racing.Racing_GameTime);
                cmd.Parameters.AddWithValue("@Racing_GameLocation", racing.Racing_GameLocation);
                cmd.Parameters.AddWithValue("@Racing_GameResult", racing.Racing_GameResult);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertRacing", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_UpdateRacingByGameIDAndRacingInfoID(String racinginfoID, int gameID, int hostTeamID, int guestTeamID,
        DateTime gameDate, String gameTime, String gameLocation)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_UpdateRacingByGameIDAndRacingInfoID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfoID", racinginfoID);
                cmd.Parameters.AddWithValue("@gameID", gameID);
                cmd.Parameters.AddWithValue("@hostTeamID", hostTeamID);
                cmd.Parameters.AddWithValue("@guestTeamID", guestTeamID);
                cmd.Parameters.AddWithValue("@gameDate", gameDate);
                cmd.Parameters.AddWithValue("@gameTime", gameTime);
                cmd.Parameters.AddWithValue("@gameLocation", gameLocation);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertRacing", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static bool Sport_IsNotEnteredRacingGamesResults(string racingInfoID)
    {
        bool flag = false;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_IsNotEnteredRacingGamesResults", "@racingInfoID", racingInfoID);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Error in IsNotEnteredRacingGamesResults", ex); }
        return flag;
    }
    public static void Sport_InsertRacingGamesResult(String racingInfoID, int gameID,
                                                    decimal gameResult, int hostGoal, int guestGoal, String gameStatus)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertRacingGamesResult", "@Racing_RacingInfoID", racingInfoID, "@Racing_GameID", gameID,
                    "@Racing_GameResult", gameResult, "@Racing_GameHostGoal", hostGoal, "@Racing_GameGuestGoal", guestGoal,
                    "@Racing_GameStatus", gameStatus);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("InsertRacingGamesResult", ex); }
    }
    public static void Sport_InsertRacingForms(SportRacingForms racingForms)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertRacingForms", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Form_ID", racingForms.Form_ID);
                cmd.Parameters.AddWithValue("@Form_RacingInfoID", racingForms.Form_RacingInfoID);
                cmd.Parameters.AddWithValue("@Form_CreationDate", racingForms.Form_CreationDate);
                cmd.Parameters.AddWithValue("@Form_UserID", racingForms.Form_UserID);
                cmd.Parameters.AddWithValue("@Form_Amount", racingForms.Form_Amount);
                cmd.Parameters.AddWithValue("@Form_ActiveStatus", racingForms.Form_ActiveStatus);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertRacingForms", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static string Sport_GetFormDescription(string formID)
    {
        string description = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetFormDescription","@FormID", formID);
                if (dr.HasRows) { dr.Read(); description = dr["Form_Description"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFormDescription", ex); description = ""; }
        return description;
    }
    public static string Sport_GetRacingDescription(string racingInfoID)
    {
        string description = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetRacingDescription", "@racingInfoID", racingInfoID);
                if (dr.HasRows) { dr.Read(); description = dr["RacingInfo_Description"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { description = ""; BLL.SendEmail("GetRacingDescription", ex); }
        return description;
    }
    public static string Sport_GetRacingStatus(string racingInfoID)
    {
        string status = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetRacingStatus", "@racingInfoID", racingInfoID);
                if (dr.HasRows) { dr.Read(); status = dr["RacingInfo_Status"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { status = ""; BLL.SendEmail("Sport_GetRacingStatus", ex); }
        return status;
    }
    public static bool Sport_GetFormActiveStatus(string formID)
    {
        bool active = false;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetFormActiveStatus", "@FormID", formID);
                if (dr.HasRows) { dr.Read(); active = Boolean.Parse(dr["Form_ActiveStatus"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFormActiveStatus", ex); }
        return active;
    }
    public static void Sport_UpdateFormDescription(string formID, string description)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_UpdateFormDescription", "@FormID", formID, "@desc", description);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("UpdateFormDescription", ex); }
    }

    public static void Sport_UpdateRacingDescription(string racingInfoID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_UpdateRacingDescription", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_UpdateRacingDescription", ex); }
    }
    public static void Sport_DeleteFormByID(String form_ID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_DeleteRacingFormByID", "@Form_ID", form_ID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_DeleteFormByID", ex); }
    }
    public static void Sport_InsertRacingFormInfo(SportRacingFormInfo racingFormInfo)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                {
                    db.ExecNonQueryProc("SP_Sport_InsertRacingFormInfo", "@FormInfo_FormID", racingFormInfo.FormInfo_FormID, "@FormInfo_GameID", racingFormInfo.FormInfo_GameID,
                        "@FormInfo_HostTeamID", racingFormInfo.FormInfo_HostTeamID, "@FormInfo_GuestTeamID", racingFormInfo.FormInfo_GuestTeamID, "@FormInfo_IsHostWin", racingFormInfo.FormInfo_IsHostWin,
                        "@FormInfo_IsEqualGame", racingFormInfo.FormInfo_IsEqualTeams, "@FormInfo_IsGuestWin", racingFormInfo.FormInfo_IsGuestWin, "@FormInfo_CheckCount", racingFormInfo.FormInfo_CheckCount);
                }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertRacingFormInfo", ex); }
    }
    public static void Sport_UpdateRacingFormInfo(String formID, int gameID, int hostTeamID, int guestTeamID,
    Boolean isHostWin, Boolean isEqualTeams, Boolean isGuestWin, int checkCount)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_UpdateRacingFormInfo", "@FormInfo_FormID", formID, "@FormInfo_GameID", gameID,
                    "@FormInfo_HostTeamID", hostTeamID, "@FormInfo_GuestTeamID", guestTeamID, "@FormInfo_IsHostWin", isHostWin,
                    "@FormInfo_IsEqualGame", isEqualTeams, "@FormInfo_IsGuestWin", isGuestWin, "@FormInfo_CheckCount", checkCount);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_UpdateRacingFormInfo", ex); }
    }
    public static void Sport_UpdateRacingFormAmount(String formID, String racingInfoID, int userID, int formAmount, String formStatus)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_UpdateRacingFormAmount", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Form_ID", formID);
                cmd.Parameters.AddWithValue("@Form_RacingInfoID", racingInfoID);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@Form_Amount", formAmount);
                cmd.Parameters.AddWithValue("@Form_Description", formStatus);
                cmd.Parameters.AddWithValue("@Form_LastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_UpdateRacingFormAmount", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DataSet Sport_LoadAllForms()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllForms", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllForms", ex); }
            //finally { CloseConnection(conn); }
            }
        return ds;
    }
    public static DataSet Sport_GetActiveFormsForPdfByRacingInfoID(String racingInfoID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {           
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetActiveFormsForPdfByRacingInfoID", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetActiveFormsForPdfByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllActiveForms(String racingInfoID, String userIDs)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllActiveForms", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                adaptor.SelectCommand.Parameters.AddWithValue("@userIds", userIDs);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllActiveForms", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllArchiveForms(String racingInfoID, String userIDs)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllArchiveForms", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                adaptor.SelectCommand.Parameters.AddWithValue("@userIds", userIDs);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllArchiveForms", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllCurrentForms(String racingInfoID, String userIDs)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllCurrentForms", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                adaptor.SelectCommand.Parameters.AddWithValue("@userIds", userIDs);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllCurrentForms", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetActiveForms(int userID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadActiveForms", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@userID", userID);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetActiveForms", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetAllFormsSettledAmount(String racingInfoID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetAllFormsSettledAmount", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetAllFormsSettledAmount", ex); }
        return ds;
    }

    public static DataSet Sport_GetUserPayments(int userID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetAllPaymentByUserID", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@UserID", userID);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetUserPayments", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetActiveFormsBySearch(int userID, String racingInfoID, String formID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetActiveFormsBySearch", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@userID", userID);
                adaptor.SelectCommand.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                adaptor.SelectCommand.Parameters.AddWithValue("@formID", formID);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetActiveFormsBySearch", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static int Sport_GetOwnerForm(String formID)
    {
        int userID = -1;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetOwnerForm", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Form_ID", formID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); userID = int.Parse(dr["Form_UserID"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetOwnerForm", ex); }
            //finally{ if (dr != null) { dr.Close(); } CloseConnection(conn); }
        }
        return userID;
    }
    public static DataSet Sport_GetFirstWinForms(String racingInfoID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetFirstProminenceForms", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFirstWinForms", ex); }
        return ds;
    }
    public static DataSet Sport_GetSecondWinForms(String racingInfoID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetSecondProminenceForms", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetSecondWinForms", ex); }
        return ds;
    }
    public static DataSet Sport_GetWinnerProminenceForms(String racingInfoID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetWinnerProminenceForms", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetWinnerProminenceForms", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static int Sport_GetSumFormsAmountByRacingInfoID(String racingInfoID)
    {
        int sum = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetSumFormsAmountByRacingInfoID", "@racingInfoID", racingInfoID);
                if (dr.HasRows) { dr.Read(); sum = int.Parse(dr["formsAmount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetSumFormsAmountByRacingInfoID", ex); }
        return sum;
    }
    public static DataSet Sport_GetFormsByRacingInfoID(String racingInfoID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetFormsByRacingInfoID", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFormsByRacingInfoID", ex); }
        return ds;
    }
    public static DataSet Sport_GetFormsInfoForUltimateByRacingInfoID(String racingInfoID, Boolean isActive)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetFormsInfoForUltimateByRacingInfoID", "@racingInfoID", racingInfoID, "@isActive", isActive);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("SP_Sport_GetFormsInfoForUltimateByRacingInfoID", ex); }
        return ds;
    }
    public static DataSet Sport_GetFormsOrderByLastUpdateByRacingInfoID(String racingInfoID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetFormsOrderByLastUpdateByRacingInfoID", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFormsOrderByLastUpdateByRacingInfoID", ex); }
        return ds;
    }
    public static DataSet Sport_GetFormsByRacingInfoIDForReport(String racingInfoID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetFormsByRacingInfoIDForReport", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFormsByRacingInfoIDForReport", ex); }
        return ds;
    }
    public static void Sport_CalculateFormsProminence(String racingInfoID, String formID, int gameID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_CalculateFormsProminence", "@RacingInfoID", racingInfoID, "@FormInfo_FormID", formID, "@Game_ID", gameID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_CalculateFormsProminence", ex); }
    }
    public static void Sport_InsertRacingWinsStatistic(string racingInfoID, int firstCount, int secondCount,
        float firstReward, float secondReward, int formAmount, DateTime lastModified, string stattus)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertRacingWinsStatistic", "@Wins_RacingInfoID", racingInfoID, "@Wins_FirstCount", firstCount,
                    "@Wins_SecondCount", secondCount, "@Wins_FirstReward", firstReward, "@Wins_SecondReward", secondReward,
                    "@Wins_RacingFormAmount", formAmount, "@Wins_LastModifiedDate", lastModified, "@Wins_status", stattus);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertRacingWinsStatistic", ex); }
    }
    public static int Sport_GetCountActiveFormsByRacingInfoID(String racingInfoID)
    {
        int count = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetCountActiveFormsByRacingInfoID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); count = int.Parse(dr["FormsCount"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetCountActiveFormsByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return count;
    }
    public static void Sport_GetRacingStatisticByRacingInfoID(String racingInfoID,
        out int FormAmount, out int FirstCount, out float FirstReward, out int SecondCount, out float SecondReward)
    {
        FormAmount = 0;
        FirstCount = 0;
        FirstReward = 0;
        SecondCount = 0;
        SecondReward = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetRacingStatisticByRacingInfoID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    dr.Read();
                    FormAmount = int.Parse(dr["Wins_RacingFormAmount"].ToString());
                    FirstCount = int.Parse(dr["Wins_FirstCount"].ToString());
                    FirstReward = float.Parse(dr["Wins_FirstReward"].ToString());
                    SecondCount = int.Parse(dr["Wins_SecondCount"].ToString());
                    SecondReward = float.Parse(dr["Wins_SecondReward"].ToString());
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetRacingStatisticByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_InsertRacingWinsStatus(int userID, string racingInfoID, string formID, int formProminence, float rewardAmount, string status)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertRacingWinsStatus", "@RacingWinners_UserID", userID, "@RacingWinners_RacingInfoID", racingInfoID,
                    "@RacingWinners_FormID", formID, "@RacingWinners_FormProminence", formProminence, "@RacingWinners_RewardAmount", rewardAmount,
                    "@RacingWinners_Status", status);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertRacingWinsStatus", ex); }
    }
    public static void Sport_InsertDeductions(DateTime deduction_Date, int Deduction_UserID, int deduction_Amount,
        string deduction_RacingInfoID, string deduction_FormID, string deduction_Description)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertDeductions", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Deduction_Date", deduction_Date);
                cmd.Parameters.AddWithValue("@Deduction_UserID", Deduction_UserID);
                cmd.Parameters.AddWithValue("@Deduction_Amount", deduction_Amount);
                cmd.Parameters.AddWithValue("@Deduction_RacingInfoID", deduction_RacingInfoID);
                cmd.Parameters.AddWithValue("@Deduction_FormID", deduction_FormID);
                cmd.Parameters.AddWithValue("@Deduction_Description", deduction_Description);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertDeductions", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    //public static bool Sport_IsNotRacingInDeduction(string racingInfoID)
    //{
    //    bool flag = false;
    //    conn = new SqlConnection(GetConnectionString());
    //    cmd = new SqlCommand("SP_Sport_IsNotRacingInDeduction", conn);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
    //    OpenConnection(conn);
    //    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);dr.Read();
    //    if (dr.HasRows){flag = true;}
    //    if (conn.State == ConnectionState.Open) { conn.Close(); }
    //    return flag;
    //} 
    public static void Sport_DeleteRacingWinsStatusByRacingInfoID(string racingInfoID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_DeleteRacingWinsStatusByRacingInfoID", "@RacingWinners_RacingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_DeleteRacingWinsStatusByRacingInfoID", ex); }
    }
    public static void Sport_InsertSettleDemandReward(int userID, DateTime settleDemandDate, float settleDemandAmount, 
                string settleDemandDescription)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertSettleDemandReward", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SettleDemand_UserID", userID);
                cmd.Parameters.AddWithValue("@SettleDemand_Date", settleDemandDate);
                cmd.Parameters.AddWithValue("@SettleDemand_Amount", settleDemandAmount);
                cmd.Parameters.AddWithValue("@SettleDemand_Description", settleDemandDescription);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertSettleDemandReward", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_InsertTransferRewardToChargeBox(int userID,  float oldRewardInventory,float demandAmount, string description)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertTransferRewardToChargeBox", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TransferR2C_UserID", userID);
                cmd.Parameters.AddWithValue("@TransferR2C_Date", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@TransferR2C_OldRewardAmount", oldRewardInventory);
                cmd.Parameters.AddWithValue("@TransferR2C_SettleRewardAmount", demandAmount);
                cmd.Parameters.AddWithValue("@TransferR2C_Description", description);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertTransferRewardToChargeBox", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static string Sport_GetLastTransferRewardToChargeBoxByUserID(int userID)
    {
        DateTime settleDate;
        float amount;
        string info = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetLastTransferRewardToChargeBoxByUserID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userID", userID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    dr.Read();
                    settleDate = DateTime.Parse(dr["TransferR2C_Date"].ToString());
                    amount = float.Parse(dr["TransferR2C_SettleRewardAmount"].ToString());
                    info = settleDate.ToString() + ";" + amount;
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { info = ";0"; BLL.SendEmail("Sport_GetLastTransferRewardToChargeBoxByUserID", ex); }
            //finally { CloseConnection(conn); }
        }
        return info;
    }
    public static void Sport_InsertRewardQuota(string Quota_RacingInfoID, float Quota_Charitable, float Quota_Government,
    float Quota_Site, string Quota_Description)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertRewardQuota", "@Quota_Date", BLL.GetIranDateTime(), "@Quota_RacingInfoID", Quota_RacingInfoID,
                   "@Quota_Charitable", Quota_Charitable, "@Quota_Government", Quota_Government, "@Quota_Site", Quota_Site, "@Quota_Description", Quota_Description);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertRewardQuota", ex); }
    }
    public static void Sport_GetRewardQuotaByRacingInfoID(String racingInfoID,
    out float siteReward, out float governReward, out float charitableReward)
    {
        siteReward = 0;
        governReward = 0;
        charitableReward = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetRewardQuotaByRacingInfoID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    dr.Read();
                    siteReward = float.Parse(dr["Quota_Site"].ToString());
                    governReward = float.Parse(dr["Quota_Government"].ToString());
                    charitableReward = float.Parse(dr["Quota_Charitable"].ToString());
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetRewardQuotaByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_InsertReceiptDocument(long receiptID, int boxKind,
        float currentAmount, int rowNumber,DateTime receiptDate, string receiptDesc, 
        string docNumber, float receiptAmount,string comment, int selectUserID )
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertReceiptDocument", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ReceiptDoc_ID", receiptID);
                cmd.Parameters.AddWithValue("@ReceiptDoc_BoxKind", boxKind);
                cmd.Parameters.AddWithValue("@ReceiptDoc_RegisterDate", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@ReceiptDoc_RegisterDate2", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@ReceiptDoc_UserID", memberID);
                cmd.Parameters.AddWithValue("@ReceiptDoc_BoxCurrentAmount", currentAmount);
                cmd.Parameters.AddWithValue("@ReceiptDoc_RowNumber", rowNumber);
                cmd.Parameters.AddWithValue("@ReceiptDoc_ReceiptDate", receiptDate);
                cmd.Parameters.AddWithValue("@ReceiptDoc_Description", receiptDesc);
                cmd.Parameters.AddWithValue("@ReceiptDoc_DocumentNumber", docNumber);
                cmd.Parameters.AddWithValue("@ReceiptDoc_ReceiptAmount", receiptAmount);
                cmd.Parameters.AddWithValue("@ReceiptDoc_Comment", comment);
                cmd.Parameters.AddWithValue("@ReceiptDoc_SelectUserID", selectUserID);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertReceiptDocument", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DataSet Sport_GetReceiptDocumentsByBoxKindAndDate(int boxKind, DateTime fromReceiptDate, DateTime toReceiptDate)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetReceiptDocumentsByBoxKindAndDate", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.Parameters.AddWithValue("@FromRegDate", fromReceiptDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@ToRegDate", toReceiptDate);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetReceiptDocumentsByBoxKindAndDate", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static void Sport_GetReceiptDocumentsHeaderInfoByDocID(long docID, out string registerDate,
                out string comment, out string AuthorName)
    {
        registerDate = "";
        comment = "";
        AuthorName = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetReceiptDocumentsHeaderInfoByDocID", conn);
                cmd.Parameters.AddWithValue("@DocID", docID);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    dr.Read();
                    registerDate = dr["HdrReceiptDoc_RegisterDate"].ToString();
                    comment = dr["HdrReceiptDoc_Comment"].ToString();
                    AuthorName = dr["AuthorName"].ToString();
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetReceiptDocumentsHeaderInfoByDocID", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DataSet Sport_GetReceiptDocumentsForUsersRewardByBoxKindAndDate(int boxKind, DateTime fromRegDate, DateTime toRegDate)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {                
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetReceiptDocumentsForUsersRewardByBoxKindAndDate", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.Parameters.AddWithValue("@FromRegDate", fromRegDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@ToRegDate", toRegDate);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetReceiptDocumentsForUsersRewardByBoxKindAndDate", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetAllDocumentsByReceiptDocIDAndBoxKind(int boxKind, long receiptDocID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetAllDocumentsByReceiptDocIDAndBoxKind", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.Parameters.AddWithValue("@ReceiptDocID", receiptDocID);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);

            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetAllDocumentsByReceiptDocIDAndBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static float Sport_GetSumAmountReceiptDocumentsByBoxKind(int boxKind)
    {
        float totalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSumAmountReceiptDocumentsByBoxKind", conn);
                cmd.Parameters.AddWithValue("@boxKind", boxKind);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); totalAmount = float.Parse(dr["sumAmount"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSumAmountReceiptDocumentsByBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return totalAmount;
    }
    public static DataSet Sport_LoadAllReceiptDocumentsByBoxKind(int boxKind)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllReceiptDocumentsByBoxKind", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllReceiptDocumentsByBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllReceiptDocumentsForUsersRewardByBoxKind(int boxKind)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllreceiptDocumentsForUsersRewardByBoxKind", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllReceiptDocumentsForUsersRewardByBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static long Sport_GetMaxRowInReceiptDocuments()
    {
        int maxRow = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetMaxRowInReceiptDocuments", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); maxRow = int.Parse(dr["maxRow"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetMaxRowInReceiptDocuments", ex); }
            //finally { CloseConnection(conn); }
        }
        return maxRow;
    }
    public static void Sport_InsertPaymentDocument(long paymentID, int boxKind,
    float currentAmount, int rowNumber, DateTime paymentDate, string paymentDesc, string docNumber, float paymentAmount, string comment, int selectUserID)
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertPaymentDocument", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PaymentDoc_ID", paymentID);
                cmd.Parameters.AddWithValue("@PaymentDoc_BoxKind", boxKind);
                cmd.Parameters.AddWithValue("@PaymentDoc_RegisterDate", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@PaymentDoc_RegisterDate2", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@PaymentDoc_UserID", memberID);
                cmd.Parameters.AddWithValue("@PaymentDoc_BoxCurrentAmount", currentAmount);
                cmd.Parameters.AddWithValue("@PaymentDoc_RowNumber", rowNumber);
                cmd.Parameters.AddWithValue("@PaymentDoc_PaymentDate", paymentDate);
                cmd.Parameters.AddWithValue("@PaymentDoc_Description", paymentDesc);
                cmd.Parameters.AddWithValue("@PaymentDoc_DocumentNumber", docNumber);
                cmd.Parameters.AddWithValue("@PaymentDoc_PaymentAmount", paymentAmount);
                cmd.Parameters.AddWithValue("@PaymentDoc_Comment", comment);
                cmd.Parameters.AddWithValue("@PaymentDoc_SelectUserID", selectUserID);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertPaymentDocument", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DataSet Sport_GetPaymentDocumentsByBoxKindAndDate(int boxKind, DateTime fromRegDate, DateTime toRegDate)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetPaymentDocumentsByBoxKindAndDate", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.Parameters.AddWithValue("@FromRegDate", fromRegDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@ToRegDate", toRegDate);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetPaymentDocumentsByBoxKindAndDate", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetPaymentDocumentsForUsersRewardByBoxKindAndDate(int boxKind, DateTime fromPaymentDate, DateTime toPaymentDate)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetPaymentDocumentsForUsersRewardByBoxKindAndDate", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.Parameters.AddWithValue("@FromRegDate", fromPaymentDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@ToRegDate", toPaymentDate);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetPaymentDocumentsForUsersRewardByBoxKindAndDate", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static void Sport_GetPaymentDocumentsHeaderInfoByDocID(long docID, out string registerDate,
            out string comment, out string AuthorName)
    {
        registerDate = "";
        comment = "";
        AuthorName = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetPaymentDocumentsHeaderInfoByDocID", conn);
                cmd.Parameters.AddWithValue("@DocID", docID);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    dr.Read();
                    registerDate = dr["HdrPaymentDoc_RegisterDate"].ToString();
                    comment = dr["HdrPaymentDoc_Comment"].ToString();
                    AuthorName = dr["AuthorName"].ToString();
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetPaymentDocumentsHeaderInfoByDocID", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DataSet Sport_GetAllDocumentsByPaymentDocIDAndBoxKind(int boxKind, long paymentDocID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetAllDocumentsByPaymentDocIDAndBoxKind", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.Parameters.AddWithValue("@PaymentDocID", paymentDocID);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetAllDocumentsByPaymentDocIDAndBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static float Sport_GetSumAmountPaymentDocumentsByBoxKind(int boxKind)
    {
        float totalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSumAmountPaymentDocumentsByBoxKind", conn);
                cmd.Parameters.AddWithValue("@boxKind", boxKind);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); totalAmount = float.Parse(dr["sumAmount"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSumAmountPaymentDocumentsByBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return totalAmount;
    }
    public static DataSet Sport_LoadAllPaymentDocumentsByBoxKind(int boxKind)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllPaymentDocumentsByBoxKind", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllPaymentDocumentsByBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllPaymentDocumentsForUsersRewardByBoxKind(int boxKind)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllPaymentDocumentsForUsersRewardByBoxKind", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllPaymentDocumentsForUsersRewardByBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static long Sport_GetMaxRowInPaymentDocuments()
    {
        int maxRow = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetMaxRowInPaymentDocuments", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); maxRow = int.Parse(dr["maxRow"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetMaxRowInPaymentDocuments", ex); }
            //finally { CloseConnection(conn); }
        }
        return maxRow;
    }
    public static void Sport_InsertIntoDocumentsBox(int boxKind, int docKind, int docID, string comment,
    float debtor, float creditor, float remain, string note)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertIntoDocumentsBox", "@DocumentsBox_RegDate", BLL.GetIranDateTime(),
                    "@DocumentsBox_RegDate2", BLL.GetIranDateTime(), "@DocumentsBox_BoxKind", boxKind, "@DocumentsBox_DocKind", docKind,
                    "@DocumentsBox_DocID", docID, "@DocumentsBox_Comment", comment, "@DocumentsBox_Debtor", debtor,
                    "@DocumentsBox_Creditor", creditor, "@DocumentsBox_Remain", remain, "@DocumentsBox_Note", note);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertIntoDocumentsBox", ex); }
    }
    public static DataSet Sport_LoadReportDocumentsBoxByBoxKind(int boxKind)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadReportDocumentsBoxByBoxKind", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadReportDocumentsBoxByBoxKind", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetReportDocumentsBoxByBoxKindAndDate(int boxKind, DateTime startDate, DateTime endDate)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetReportDocumentsBoxByBoxKindAndDate", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@BoxKind", boxKind);
                adaptor.SelectCommand.Parameters.AddWithValue("@FromDate", startDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@ToDate", endDate);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetReportDocumentsBoxByBoxKindAndDate", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static void Sport_InsertIntoUserChargeBoxTurnover(int userID, String description,
    float debtor, float creditor, float remain, String comment)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertIntoUserChargeBoxTurnover", "@ChargeBoxTurnover_RegDate", BLL.GetIranDateTime(),
                    "@ChargeBoxTurnover_UserID", userID, "@ChargeBoxTurnover_Description", description, "@ChargeBoxTurnover_Debtor", debtor,
                    "@ChargeBoxTurnover_Creditor", creditor, "@ChargeBoxTurnover_Remain", remain, "@ChargeBoxTurnover_Comment", comment);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertIntoUserChargeBoxTurnover", ex); }
    }
    public static DataSet Sport_LoadAllChargeBoxTurnover()
    {            
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllChargeBoxTurnover", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_LoadAllChargeBoxTurnover", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetReportChargeBoxTurnoverByUserAndDate(int userID, DateTime startDate, DateTime endDate)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetReportChargeBoxTurnoverByUserAndDate", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@userID", userID);
                adaptor.SelectCommand.Parameters.AddWithValue("@startDate", startDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@endDate", endDate);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetReportChargeBoxTurnoverByUserAndDate", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static int Sport_GetFormsCountForFinalVerificationByRacingInfoID(String racingInfoID)
    {
        int formsCount = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetFormsCountForFinalVerificationByRacingInfoID", "@racingInfoID", racingInfoID);
                if (dr.HasRows) { dr.Read(); formsCount = int.Parse(dr["formsCount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFormsCountForFinalVerificationByRacingInfoID", ex); }
        return formsCount;
    }

    //public static int Sport_GetFormAmountByFormID(String formID)
    //{
    //    int formsAmount = 0;
    //    conn = new SqlConnection(GetConnectionString());
    //    cmd = new SqlCommand("SP_Sport_GetFormAmountByFormID", conn);
    //    cmd.Parameters.AddWithValue("@FormID", formID);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    OpenConnection(conn);
    //    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
    //    dr.Read();
    //    formsAmount = int.Parse(dr["Form_Amount"].ToString());
    //    if (conn.State == ConnectionState.Open) { conn.Close(); }
    //    return formsAmount;
    //}
    public static DataSet Sport_GetActiveRacing()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                String respiteDate = String.Format("{0:yyyy/MM/dd}", BLL.GetIranDateTime().Date);
                //String respiteDate = BLL.GetIranDateTime().Date.ToShortDateString();
                String respiteTime = BLL.GetTime();
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetActiveRacing", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteDate", respiteDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteTime", respiteTime);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetActiveRacing", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllInitialRacing()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllInitialRacing", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetActiveRacing", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetEndedRespiteActiveRacing()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                String respiteDate = String.Format("{0:yyyy/MM/dd}", BLL.GetIranDateTime().Date);
                //String respiteDate = BLL.GetIranDateTime().Date.ToShortDateString();
                String respiteTime = BLL.GetTime();
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetEndedRespiteActiveRacing", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteDate", respiteDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteTime", respiteTime);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetEndedRespiteActiveRacing", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetArchiveDisableRacing()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                String respiteDate = String.Format("{0:yyyy/MM/dd}", BLL.GetIranDateTime().Date);
                //String respiteDate = BLL.GetIranDateTime().Date.ToShortDateString();
                String respiteTime = BLL.GetTime();
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetArchiveDisableRacing", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteDate", respiteDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteTime", respiteTime);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetArchiveDisableRacing", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetAllRacingInfoByRaceID(int raceID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                String respiteDate = String.Format("{0:yyyy/MM/dd}", BLL.GetIranDateTime().Date);
                String respiteTime = BLL.GetTime();
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetAllRacingInfoByRaceID", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@Race_ID", raceID);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteDate", respiteDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@respiteTime", respiteTime);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetAllRacingInfoByRaceID", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllRacingWithInfo()
    {        
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllRacingWithInfo", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllRacingWithInfo", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllRacingForReport()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllRacingForReport", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllRacingForReport", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_LoadAllRacingForEnterResults()
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_LoadAllRacingForEnterResults", "@currentDate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_LoadAllRacingForEnterResults", ex); }
        return ds;
    }
    public static DataSet Sport_LoadAllRacingForFinalVerificationByDate()
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_LoadAllRacingForFinalVerificationByDate", "@currentDate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_LoadAllRacingForFinalVerificationByDate", ex); }
        return ds;
    }
    public static void Sport_DisableRacingByRacingInfoID(string racingInfoID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_DisableRacingByRacingInfoID", "@RacingInfo_ID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_DisableRacingByRacingInfoID", ex); }
    }
    public static void Sport_DisableFormsByRacingInfoID(string racingInfoID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_DisableFormsByRacingInfoID", "@RacingInfo_ID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_DisableFormsByRacingInfoID", ex); }
    }
    public static DataSet Sport_GetFormsInProminencesTempByRacingInfoID(String racingInfoID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetFormsInProminencesTempByRacingInfoID", conn);
                adaptor.SelectCommand.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetFormsInProminencesTempByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static DataSet Sport_GetFormGamesInProminencesTempByRacingInfoID(String racingInfoID, String formID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_GetFormGamesInProminencesTempByRacingInfoID", "@racingInfoID", racingInfoID, "@formID", formID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetFormGamesInProminencesTempByRacingInfoID", ex); }
        return ds;                    
    }
    public static void Sport_UpdateUltimateProminences(String formID, int gameID, int prominence)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_UpdateUltimateProminences", "@FormInfo_FormID", formID, "@Game_ID", gameID, "@prominence", prominence);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_UpdateUltimateProminences", ex); }
    }
    public static void Sport_UpdateMinusProminencesToZero(String formID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_UpdateMinusProminencesToZero", "@FormInfo_FormID", formID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_UpdateMinusProminencesToZero", ex); }
    }
    //public static void Sport_GetSelectedRacingInfo(String racingInfoID, out String Race_Title, out String RacingInfo_Details,
    //    out DateTime RacingInfo_StartDate, out DateTime RacingInfo_EndDate, out DateTime RacingInfo_EndRespiteDate,
    //    out DateTime RacingInfo_EndRespiteTime, out String RacingInfo_Country)
    //{        
    //    Race_Title = "";
    //    RacingInfo_Details = "";
    //    RacingInfo_StartDate = DateTime.MinValue;
    //    RacingInfo_EndDate = DateTime.MinValue;
    //    RacingInfo_EndRespiteDate = DateTime.MinValue;
    //    RacingInfo_EndRespiteTime = DateTime.MinValue;
    //    RacingInfo_Country = "";
    //    using (conn = new SqlConnection(GetConnectionString()))
    //    {
    //        try
    //        {
    //            OpenConnection(conn);
    //            cmd = new SqlCommand("SP_Sport_GetSelectedRacingInfo", conn);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("@racingInfo_ID", racingInfoID);
    //            cmd.Parameters.AddWithValue("@respiteDate", BLL.GetIranDateTime());
    //            cmd.Parameters.AddWithValue("@respiteTime", BLL.GetTime());
                
    //            using (dr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
    //            {
    //                if (dr.HasRows)
    //                {
    //                    while (dr.Read())
    //                    {
    //                        //RacingInfo_ID = dr["RacingInfo_ID"].ToString();
    //                        Race_Title = dr["Race_Title"].ToString();
    //                        RacingInfo_Details = dr["RacingInfo_Details"].ToString();
    //                        RacingInfo_StartDate = DateTime.Parse(dr["RacingInfo_StartDate"].ToString());
    //                        RacingInfo_EndDate = DateTime.Parse(dr["RacingInfo_EndDate"].ToString());
    //                        RacingInfo_EndRespiteDate = DateTime.Parse(dr["RacingInfo_EndRespiteDate"].ToString());
    //                        RacingInfo_EndRespiteTime =  DateTime.Parse(dr["RacingInfo_EndRespiteTime"].ToString());
    //                        RacingInfo_Country = dr["Country_Name"].ToString();
    //                    }
    //                }
    //            }
    //        }
    //        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
    //        catch (Exception ex) { BLL.SendEmail("Sport_GetSelectedRacingInfo", ex); }
    //        ////finally { CloseConnection(conn); }
    //    }
    //}
    public static String Sport_GetSelectedRacingInfo(String racingInfoID)
    {
        String info = "";
        String RacingInfo_ID = "";
        String Race_Title = "";
        String RacingInfo_Details = "";
        String RacingInfo_StartDate = "";
        String RacingInfo_EndDate = "";
        String RacingInfo_EndRespiteDate = "";
        String RacingInfo_EndRespiteTime = "";
        String RacingInfo_StartRespiteTime = "";
        String RacingInfo_Country = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSelectedRacingInfo", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfo_ID", racingInfoID);
                //cmd.Parameters.AddWithValue("@respiteDate", BLL.GetIranDateTime());
                //cmd.Parameters.AddWithValue("@respiteTime", BLL.GetTime());
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        RacingInfo_ID = dr["RacingInfo_ID"].ToString();
                        Race_Title = dr["Race_Title"].ToString();
                        RacingInfo_Details = dr["RacingInfo_Details"].ToString();
                        RacingInfo_StartDate = (DateTime.Parse(dr["RacingInfo_StartDate"].ToString())).ToString();
                        RacingInfo_EndDate = (DateTime.Parse(dr["RacingInfo_EndDate"].ToString())).ToString();
                        RacingInfo_EndRespiteDate = (DateTime.Parse(dr["RacingInfo_EndRespiteDate"].ToString())).ToString();
                        RacingInfo_EndRespiteTime = dr["RacingInfo_EndRespiteTime"].ToString();
                        RacingInfo_StartRespiteTime = dr["RacingInfo_StartRespiteTime"].ToString();
                        RacingInfo_Country = dr["Country_Name"].ToString();
                    }
                }
                info += racingInfoID + ";" + Race_Title + ";" + RacingInfo_Details + ";" + RacingInfo_StartDate +
                   ";" + RacingInfo_EndDate + ";" + RacingInfo_EndRespiteDate +
                   ";" + RacingInfo_EndRespiteTime + ";" + RacingInfo_Country + ";" + RacingInfo_StartRespiteTime;
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSelectedRacingInfo", ex); }
            // //finally { CloseConnection(conn); }
        }
        return info;
    }
    public static bool Sport_IsNotExpireRacingDate(string racingInfoID)
    {
        bool flag = false;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_IsNotExpireRacingDate", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                cmd.Parameters.AddWithValue("@respiteDate", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@respiteTime", BLL.GetTime());
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSelectedRacingInfo", ex); }
            ////finally { CloseConnection(conn); }
        }
        return flag;
    }
    public static String Sport_GetSelectedFormInfo(String formID)
    {
        String info = "";
        String RacingInfo_ID = "";
        String Race_Title = "";
        String RacingInfo_Details = "";
        String RacingInfo_StartDate = "";
        String RacingInfo_EndDate = "";
        String RacingInfo_EndRespiteDate = "";
        String RacingInfo_EndRespiteTime = "";
        String RacingInfo_Country = "";
        String Form_Amount = "0";
        Boolean Form_Active = false;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSelectedFormInfo", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Form_ID", formID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        RacingInfo_ID = dr["Form_RacingInfoID"].ToString();
                        Race_Title = dr["Race_Title"].ToString();
                        RacingInfo_Details = dr["RacingInfo_Details"].ToString();
                        RacingInfo_StartDate = (DateTime.Parse(dr["RacingInfo_StartDate"].ToString())).ToString();
                        RacingInfo_EndDate = (DateTime.Parse(dr["RacingInfo_EndDate"].ToString())).ToString();
                        RacingInfo_EndRespiteDate = (DateTime.Parse(dr["RacingInfo_EndRespiteDate"].ToString())).ToString();
                        RacingInfo_EndRespiteTime = dr["RacingInfo_EndRespiteTime"].ToString();
                        RacingInfo_Country = dr["Country_Name"].ToString();
                        Form_Amount = dr["Form_Amount"].ToString();
                        Form_Active = (dr["Form_Description"].ToString() != "غیرفعال توسط کاربر");
                    }
                }
                info += RacingInfo_ID + ";" + Race_Title + ";" + RacingInfo_Details + ";" + Convert.ToString(RacingInfo_StartDate) +
                   ";" + Convert.ToString(RacingInfo_EndDate) + ";" + Convert.ToString(RacingInfo_EndRespiteDate) +
                   ";" + RacingInfo_EndRespiteTime + ";" + RacingInfo_Country + ";" + Form_Amount + ";" + Form_Active;
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSelectedFormInfo", ex); }
            //finally { CloseConnection(conn); }
        }
        return info;
    }
    public static DataSet Sport_LoadAllGamesByRacingInfoID(String racingInfoID)
    {
        ds = new DataSet();
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                ds = db.ExecDataSetProc("SP_Sport_LoadAllGamesByRacingInfoID", "@racingInfo_ID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_LoadAllGamesByRacingInfoID", ex); }
        return ds;
    }
    public static DataSet Sport_LoadAllGamesByFormInfoID(String formID)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllGamesByFormInfoID", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                //adaptor.SelectCommand.Parameters.AddWithValue("@racingInfo_ID", racingInfoID);
                adaptor.SelectCommand.Parameters.AddWithValue("@formID", formID);
                //adaptor.SelectCommand.Parameters.AddWithValue("@gameID", gameID);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllGamesByFormInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static void Sport_InsertPeyments(SportPayments sportPayments)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertPayments", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Reservation", sportPayments.ReservationNumber);
                cmd.Parameters.AddWithValue("@Amount", sportPayments.Amount);
                cmd.Parameters.AddWithValue("@UserID", sportPayments.UserID);
                cmd.Parameters.AddWithValue("@UserIP", sportPayments.UserIP);
                cmd.Parameters.AddWithValue("@BankID", sportPayments.BankID);
                cmd.Parameters.AddWithValue("@SettleDate", sportPayments.SettleDate);
                cmd.Parameters.AddWithValue("@Sequence", sportPayments.Sequence);
                cmd.Parameters.AddWithValue("@TimeStamp", sportPayments.TimeStamp);
                cmd.Parameters.AddWithValue("@HashCode", sportPayments.HashCode);
                cmd.Parameters.AddWithValue("@Description", sportPayments.Description);
                cmd.Parameters.AddWithValue("@CurrencyCode", sportPayments.Currency_Code);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertPayments With Class", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_InsertPeyments(String reservationNumber, String amount, String bankID,
            String sequence, String timeStamp, String hashCode, String description, String currencyCode)
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertPayments", "@Reservation", reservationNumber, "@Amount", decimal.Parse(amount), "@UserID", memberID,
                    "@UserIP", HttpContext.Current.Request.UserHostAddress, "@BankID", bankID, "@SettleDate", BLL.GetIranDateTime(),
                    "@Sequence", sequence, "@TimeStamp", timeStamp, "@HashCode", hashCode, "@Description", description, "@CurrencyCode", currencyCode);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertPayments Without Class", ex); }
    }
    public static void Sport_UpdatePeymentsSaman(String bankID, String reservationNumber,
    String referenceNumber, String transactionState, String status)
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_UpdatePaymentsSaman", "@Reservation", reservationNumber,"@UserID", memberID,
                "@BankID", bankID,"@ReferenceNumber", referenceNumber,"@TransactionState", transactionState,
                "@VerificationDate", BLL.GetIranDateTime(),"@status", status);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_UpdatePeymentsSaman", ex); }
    }
    public static void Sport_UpdatePeymentsMelli(String bankID, String referenceNumber, String transactionState,
    String sequence, String timeStamp, String hashCodeDecript,
    String responseCode, String responseSubCode, String responseReasonCode, String responseReasonText, String status)
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_UpdatePaymentsMelli", "@UserID", memberID, "@BankID", bankID, "@ReferenceNumber", referenceNumber,
                    "@TransactionState", transactionState, "@Sequence", sequence, "@TimeStamp", timeStamp, "@VerificationDate", BLL.GetIranDateTime(),
                    "@HashCodeDecript", hashCodeDecript, "@ResponseCode", responseCode, "@ResponseSubCode", responseSubCode,
                    "@ResponseReasonCode", responseReasonCode, "@ResponseReasonText", responseReasonText, "@status", status);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_UpdatePeymentsMelli", ex); }
    }
    public static String Sport_GetReservationByReferenceInPayments(String refNumber)
    {
        String reservationNumber = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetReservationByReferenceInPayments","@Payment_ReferenceNumber", refNumber);
                if (dr.HasRows) { dr.Read(); reservationNumber = dr["Payment_ReservationNumber"].ToString(); }     
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetReservationByReferenceInPayments", ex); }
        return reservationNumber;
    }
    public static double Sport_GetPaymentsAmountByResNumber(String resNumber)
    {
        double amount = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetPaymentsAmountByResNumber", "@Reservation", resNumber);
                if (dr.HasRows) { dr.Read(); amount = double.Parse(dr["Payment_Amount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetPaymentsAmountByResNumber", ex); }
        return amount;
    }
    public static string Sport_GetPaymentTransactionByReservationNumber(String reservationNumber)
    {
        string tranactionInfo = "";
        string sequence = "";
        string timeStamp = "";
        string amount = "";
        string currencyCode = "";
        string fpHash = "";
        string description = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetPaymentTransactionByReservationNumber", "@reservation_Number", reservationNumber);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        sequence = dr["Payment_Sequence"].ToString();
                        timeStamp = dr["Payment_TimeStamp"].ToString();
                        amount = dr["Payment_Amount"].ToString();
                        currencyCode = dr["Currency_Code"].ToString();
                        fpHash = dr["Payment_HashCode"].ToString();
                        description = dr["Payment_Description"].ToString();
                    }
                }
                tranactionInfo += sequence + ";" + timeStamp + ";" + amount +
                            ";" + currencyCode + ";" + fpHash + ";" + description;
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetPaymentTransactionByReservationNumber", ex); }
        return tranactionInfo; 
    }

    public static bool Sport_CheckDoubleSpendingReferenceNumber(String refNumber)
    {
        Boolean flag = false;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_CheckDoubleSpendingReferenceNumber1", "@ReferenceNumber", refNumber);
                if (dr.HasRows) { dr.Read(); flag = true; }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_CheckDoubleSpendingReferenceNumber", ex); }
        return flag;
    }
    public static string Sport_GetLastPaymentInChargeBox(int userID)
    {
        DateTime settleDate; //= BLL.GetIranDateTime();
        float amount;
        string info = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetLastPaymentInChargeBox", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", userID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    dr.Read();
                    settleDate = DateTime.Parse(dr["Payment_SettleDate"].ToString());
                    amount = float.Parse(dr["Payment_Amount"].ToString());
                    info = settleDate.ToString() + ";" + amount;
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { info = ";0"; BLL.SendEmail("Sport_GetLastPaymentInChargeBox", ex); }
            //finally { CloseConnection(conn); }
        }
        return info;
    }
    public static string Sport_GetLastPaymentInRewardBox(int userID)
    {
        DateTime rewardIncDate;
        float amount;
        string info = "";
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetLastPaymentInRewardBox", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", userID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    dr.Read(); rewardIncDate = DateTime.Parse(dr["RewardIncDate"].ToString());
                    amount = float.Parse(dr["RewardInc_Amount"].ToString());
                    info = rewardIncDate.ToString() + ";" + amount;
                }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { info = ";0"; BLL.SendEmail("Sport_GetLastPaymentInRewardBox", ex); }
            //finally { CloseConnection(conn); }
        }
        return info;
    }
    public static Int32 Sport_GetChargeInventoryByUserID(int userID)
    {
        Int32 Charge_TotalAmount = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetChargeInventoryByUserID", "@userID", userID);
                if (dr.HasRows) { dr.Read(); Charge_TotalAmount = int.Parse(dr["ChargeBox_TotalAmount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetChargeInventoryByUserID", ex); }
        return Charge_TotalAmount;
    }
    public static int Sport_GetRewardInventoryByUserID(int userID)
    {
        int Reward_TotalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetRewardInventoryByUserID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userID", userID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); Reward_TotalAmount = int.Parse(dr["RewardBox_TotalAmount"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetRewardInventoryByUserID", ex); }
            //finally { CloseConnection(conn); }
        }
        return Reward_TotalAmount;
    }
    public static void Sport_InsertRewardIncrease(DateTime RewardIncDate, int userID, float amount, string racingInfoID, string formID, string description)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_InsertRewardIncrease", "@RewardInc_Date", RewardIncDate, "@RewardInc_UserID", userID,
                    "@RewardInc_Amount", amount, "@RewardInc_RacingInfoID", racingInfoID, "@RewardInc_FormID", formID, "@RewardInc_Description", description);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_InsertRewardIncrease", ex); }
    }
    public static string Sport_GetRewardIncreaseDescription(string formID)
    {
        string description = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetRewardIncreaseDescription", "@FormID", formID);
                if (dr.HasRows) { dr.Read(); description = dr["RewardInc_Description"].ToString(); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetRewardIncreaseDescription", ex); }
        return description;
    }
    public static void Sport_AddRewardAmountToRewardBox(DateTime rewardDate, int userID, float amount, string formID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_AddRewardAmountToRewardBox", "@RewardInc_Date", rewardDate, "@RewardInc_UserID", userID,
                    "@RewardInc_Amount", amount, "@RewardInc_FormID", formID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_AddRewardAmountToRewardBox", ex); }
    }
    public static void Sport_AddPaymentAmountToChargeBox(int amount, int userID)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_AddPaymentAmountToChargeBox", "@userID", userID, "@amount", amount);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_AddPaymentAmountToChargeBox", ex); }
    }
    /***********SiteBox***********/
    public static void Sport_AddAmountToSiteBox(string racingInfoID, float amount)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_AddAmountToSiteBox", "@racingInfoID", racingInfoID, "@amount", amount, "@lastUpdate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_AddAmountToSiteBox", ex); }
    }
    public static void Sport_ReduceAmountFromSiteBox(float amount)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_ReduceAmountFromSiteBoxByPayment", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_ReduceAmountFromSiteBox", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_AddAmountToSiteBoxByReceipt(float amount )
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_AddAmountToSiteBoxByReceipt", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_AddAmountToSiteBoxByReceipt", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_AddAmountToGovernBoxByReceipt(float amount)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_AddAmountToGovernBoxByReceipt", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_AddAmountToGovernBoxByReceipt", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_AddAmountToCharitableBoxByReceipt(float amount)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_AddAmountToCharitableBoxByReceipt", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_AddAmountToCharitableBoxByReceipt", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static long Sport_GetSiteBoxTotalAmount()
    {
        long totalAmount = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetSiteBoxTotalAmount");
                if (dr.HasRows) { dr.Read(); totalAmount = long.Parse(dr["SiteBox_TotalAmount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetSiteBoxTotalAmount", ex); }
        return totalAmount;
    }
    public static float Sport_GetSumSettleAmountToSiteBox()
    {
        float totalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSumSettleAmountToSiteBox", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); totalAmount = long.Parse(dr["SettleAmounts"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSumSettleAmountToSiteBox", ex); }
            //finally { CloseConnection(conn); }
        }
        return totalAmount;
    }
    /***********GovernmentBox***********/
    public static void Sport_AddAmountToGovernmentBox(string racingInfoID, float amount)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_AddAmountToGovernmentBox", "@racingInfoID", racingInfoID, "@amount", amount, "@lastUpdate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_AddAmountToGovernmentBox", ex); }
    }
    public static long Sport_GetGovernmentBoxTotalAmount()
    {
        long totalAmount = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetGovernmentBoxTotalAmount");
                if (dr.HasRows) { dr.Read(); totalAmount = long.Parse(dr["GovernmentBox_TotalAmount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetGovernmentBoxTotalAmount", ex); }
        return totalAmount;
    }
    public static float Sport_GetSumSettleAmountToGovernmentBox()
    {
        float totalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSumSettleAmountToGovernmentBox", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); totalAmount = long.Parse(dr["SettleAmounts"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSumSettleAmountToGovernmentBox", ex); }
            //finally { CloseConnection(conn); }
        }
        return totalAmount;
    }
    public static void Sport_ReduceAmountFromGovernmentBox(float amount)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_ReduceAmountFromGovernmentBoxByPayment", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_ReduceAmountFromGovernmentBox", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    /***********CharitableBox***********/
    public static void Sport_AddAmountToCharitableBox(string racingInfoID, float amount)
    {
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                db.ExecNonQueryProc("SP_Sport_AddAmountToCharitableBox", "@racingInfoID", racingInfoID, "@amount", amount, "@lastUpdate", BLL.GetIranDateTime());
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_AddAmountToCharitableBox", ex); }
    }
    public static long Sport_GetCharitableBoxTotalAmount()
    {
        long totalAmount = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetCharitableBoxTotalAmount");
                if (dr.HasRows) { dr.Read(); { totalAmount = long.Parse(dr["CharitableBox_TotalAmount"].ToString()); } }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetCharitableBoxTotalAmount", ex); }
        return totalAmount;
    }
    public static float Sport_GetSumSettleAmountToCharitableBox()
    {
        float totalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSumSettleAmountToCharitableBox", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); totalAmount = long.Parse(dr["SettleAmounts"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSumSettleAmountToCharitableBox", ex); }
            //finally { CloseConnection(conn); }
        }
        return totalAmount;
    }
    public static void Sport_ReduceAmountFromCharitableBox(float amount)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_ReduceAmountFromCharitableBoxByPayment", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_ReduceAmountFromCharitableBox", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    /***********RewardBox***********/
    public static float Sport_GetSumSettleAmountToRewardBox()
    {
        float totalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetSumSettleAmountToRewardBox", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); totalAmount = float.Parse(dr["SettleAmounts"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetSumSettleAmountToRewardBox", ex); }
            //finally { CloseConnection(conn); }
        }
        return totalAmount;
    }
    public static float Sport_GetRewardBoxTotalAmount()
    {
        float totalAmount = 0;
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetRewardBoxTotalAmount");
                if (dr.HasRows) { dr.Read(); totalAmount = float.Parse(dr["amount"].ToString()); }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetRewardBoxTotalAmount", ex); }
        return totalAmount;
    }
    public static void Sport_AddAmountToRewardBoxByReceiptAndUserID(int userID, float amount)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_AddAmountToRewardBoxByReceiptAndUserID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userID", userID);
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_AddAmountToRewardBoxByReceiptAndUserID", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static void Sport_ReduceAmountFromRewardBoxByReceiptAndUserID(int userID, float amount)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_ReduceAmountFromRewardBoxByReceiptAndUserID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userID", userID);
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@lastUpdate", BLL.GetIranDateTime());
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_ReduceAmountFromRewardBoxByReceiptAndUserID", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    /***********UsersChargeBox***********/
    public static long Sport_GetUsersChargeBoxTotalAmount()
    {
        long totalAmount = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetUsersChargeBoxTotalAmount", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); totalAmount = long.Parse(dr["amount"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetUsersChargeBoxTotalAmount", ex); }
            //finally { CloseConnection(conn); }
        }
        return totalAmount;
    }
    public static String Sport_GetPaymentStatus(String ReferenceNumber, String sequence, String TimeStamp)
    {
        string status = "";
        int userID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetPaymentStatus", "@UserID", userID, "@ReferenceNumber", ReferenceNumber,
                    "@sequence", sequence, "@TimeStamp", TimeStamp);
                if (dr.HasRows) { dr.Read(); status = dr["Payment_Status"].ToString(); }    
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetPaymentStatus", ex); }
        return status;
    }

    /**********************Reports***********************/
    public static DataSet Sport_LoadAllBanks()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_LoadAllBanks", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllBanks", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    //public static DataSet Sport_GetApprovedPaymentsToBanksBySearch(DateTime startDate, DateTime endDate,
    //        int startBankID, int endBankID, int startUserID, int endUserID)
    //{
    //    DataSet ds = new DataSet();
    //    conn = new SqlConnection(GetConnectionString());
    //    adaptor = new SqlDataAdapter("SP_Sport_GetApprovedPaymentsToBanksBySearch", conn);
    //    adaptor.SelectCommand.Parameters.AddWithValue("@startDate", startDate);
    //    //    adaptor.SelectCommand.Parameters.Add("@startDate", SqlDbType.DateTime).Value = DBNull.Value;
    //    adaptor.SelectCommand.Parameters.AddWithValue("@endDate", endDate);
    //    adaptor.SelectCommand.Parameters.AddWithValue("@startBankID", startBankID);
    //    adaptor.SelectCommand.Parameters.AddWithValue("@endBankID", endBankID);
    //    adaptor.SelectCommand.Parameters.AddWithValue("@startUserID", startUserID);
    //    adaptor.SelectCommand.Parameters.AddWithValue("@endUserID", endUserID);
    //    adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
    //    OpenConnection(conn);
    //    adaptor.Fill(ds);
    //    if (conn.State == ConnectionState.Open) { conn.Close(); }
    //    return ds;
    //}
    public static DataSet Sport_LoadAllApprovedPaymentsToBanks()
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("[SP_Sport_LoadAllApprovedPaymentsToBanks]", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_LoadAllApprovedPaymentsToBanks", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static string Sport_GetLastGameDateByRacingInfoID(String racingInfoID)
    {
        string lastDate = "";
        int userID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name.ToLower());
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetLastGameDateByRacingInfoID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); lastDate = dr["Racing_GameDate"].ToString(); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetLastGameDateByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return lastDate;
    }
    public static int Sport_GetCountryIDByRacingInfoID(String racingInfoID)
    {
        int CountryID = 0;
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_GetCountryIDByRacingInfoID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@racingInfoID", racingInfoID);
                OpenConnection(conn);
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.HasRows) { dr.Read(); CountryID = int.Parse(dr["RacingInfo_CountryID"].ToString()); }
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
            catch (Exception ex) { BLL.SendEmail("Sport_GetCountryIDByRacingInfoID", ex); }
            //finally { CloseConnection(conn); }
        }
        return CountryID;
    }
    public static string Sport_GetRaceTitleByRacingInfoID(String racingInfoID)
    {
        string raceTitle = "";
        try
        {
            using (AdoHelper db = new AdoHelper(GetConnectionString()))
            {
                dr = db.ExecDataReaderProc("SP_Sport_GetRaceTitleByRacingInfoID", "@racingInfoID", racingInfoID);
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("Sport_GetRaceTitleByRacingInfoID", ex); }
        return raceTitle;
    }
    public static DataSet Sport_GetUsersActiveChargeReport(DateTime stDate, DateTime endDate, String bankIDs, String userIDs)
    {
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                ds = new DataSet();
                adaptor = new SqlDataAdapter("SP_Sport_GetApprovedPaymentsToBanksBySearch", conn);
                adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptor.SelectCommand.Parameters.AddWithValue("@startDate", stDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@endDate", endDate);
                adaptor.SelectCommand.Parameters.AddWithValue("@bankIDs", bankIDs);
                adaptor.SelectCommand.Parameters.AddWithValue("@userIDs", userIDs);
                OpenConnection(conn);
                adaptor.Fill(ds);
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_GetUsersActiveChargeReport", ex); }
            //finally { CloseConnection(conn); }
        }
        return ds;
    }
    public static void Sport_InsertVariance(int varianceType, float varianceAmount, DateTime varianceDate, String varianceDescription)
    {
        int memberID = Membership_GetUserIDByUserName(HttpContext.Current.User.Identity.Name);
        using (conn = new SqlConnection(GetConnectionString()))
        {
            try
            {
                cmd = new SqlCommand("SP_Sport_InsertVariance", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Variance_RegisterDate", BLL.GetIranDateTime());
                cmd.Parameters.AddWithValue("@Variance_UserID", memberID);
                cmd.Parameters.AddWithValue("@Variance_Type", varianceType);
                cmd.Parameters.AddWithValue("@Variance_Amount", varianceAmount);
                cmd.Parameters.AddWithValue("@Variance_Date", varianceDate);
                cmd.Parameters.AddWithValue("@Variance_Description", varianceDescription);
                OpenConnection(conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("Sport_InsertVariance", ex); }
            //finally { CloseConnection(conn); }
        }
    }
    public static DataSet Sport_LoadVarianceByUser(int userID = -1)
    {
        ds = new DataSet();
        try
        {
            using ( AdoHelper db = new AdoHelper(GetConnectionString()) )
            {
                ds = db.ExecDataSetProc("SP_Sport_LoadVarianceByUser","@userID",userID);
            }
        }
        catch ( SqlException exSql ) { BLL.SendEmail("Sql Error",exSql); }
        catch ( Exception ex ) { BLL.SendEmail("Sport_LoadVarianceByUser",ex); }
        return ds;
    }
    private static bool CalculateRacingForDeductions(String racingInfoID)
    {
        bool flag = false;
        try
        {
            // if (DAL.Sport_IsNotEnteredRacingGamesResults(racingInfoID)) return false;
            if (DAL.Sport_GetFormsCountForFinalVerificationByRacingInfoID(racingInfoID) >= 1)
            {
                //لود تمام فرمهای مسابقه به ترتیب آخرین زمان ویرایش
                //DataSet ds_FormPromin = DAL.Sport_GetFormsInProminencesTempByRacingInfoID(racingInfoID);//"ir106-548e75bc9"
                DataSet ds_FormsOrderbyLastUpdate = DAL.Sport_GetFormsOrderByLastUpdateByRacingInfoID(racingInfoID);
                try
                {
                    //حلقه فرمهای فعال
                    for (int i = 0; i < ds_FormsOrderbyLastUpdate.Tables[0].Rows.Count; i++)
                    {
                        string formID = ds_FormsOrderbyLastUpdate.Tables[0].Rows[i]["Form_ID"].ToString();
                        string description = DAL.Sport_GetFormDescription(formID);
                        bool activeStatus = DAL.Sport_GetFormActiveStatus(formID);
                        if (description != "واريز در صندوق" && description != "دريافت جايزه" && description != "غیرفعال توسط کاربر" && activeStatus)
                        {
                            flag = true;
                            //چک برای فعال بودن فرم
                            int userID = DAL.Sport_GetOwnerForm(formID);
                            int userChargeInventoryAmount = DAL.Sport_GetChargeInventoryByUserID(userID);
                            int formAmount = int.Parse(ds_FormsOrderbyLastUpdate.Tables[0].Rows[i]["Form_Amount"].ToString());
                            //DataSet ds_FormGames = DAL.Sport_GetFormGamesInProminencesTempByRacingInfoID(racingInfoID, formID);
                            if (userChargeInventoryAmount >= formAmount)
                            {
                                ////ثبت امتیاز نهائی بازیهای فرم
                                //for (int j = 0; j < ds_FormGames.Tables[0].Rows.Count; j++)
                                //{DAL.Sport_UpdateUltimateProminences(ds_FormGames.Tables[0].Rows[j]["Promin_FormID"].ToString(), int.Parse(ds_FormGames.Tables[0].Rows[j]["Promin_GameID"].ToString()), int.Parse(ds_FormGames.Tables[0].Rows[j]["Form_Prominence"].ToString()));//}
                                DAL.Sport_InsertDeductions(BLL.GetIranDateTime(), userID, formAmount, racingInfoID, formID, "کسر اتوماتیک");
                                float remain = DAL.Sport_GetChargeInventoryByUserID(userID);
                                DAL.Sport_InsertIntoUserChargeBoxTurnover(userID, "کسر اتوماتیک برای مسابقه: " + racingInfoID + " و فرم شماره : " + formID, 0, formAmount, remain, "");
                                //کسر از صندوق
                                //اصلاح شرح فرم به واریز در صندوق
                            }
                            else
                            {
                                DAL.Sport_UpdateFormDescription(formID, "کمبود موجودي کاربر"); //کمبود موجودی
                            }
                        }
                    }
                }
                catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("CalculateRacingForDeductions For Loop- Outer Method", ex); }               
                DAL.Sport_UpdateRacingDescription(racingInfoID); //محاسبه شده
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }catch (Exception ex) { BLL.SendEmail("CalculateRacingForDeductions - Inner Method", ex); }
        return flag;
    }
    public static String CalculateAllRacings()
    {
        String racingCalculated = "";
        DataSet ds_Racing = new DataSet();
        try
        {
            //لود تمامی مسابقاتی که مهلت پیش بینی شان تمام شده و همچنین فعال نیز میباشند
            ds_Racing = DAL.Sport_LoadAllRacingForEnterResults();
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("CalculateAllRacings - Sport_LoadAllRacingForEnterResults", ex); }
        try
        {
            if (ds_Racing != null && ds_Racing.Tables[0] != null)
            {
                for (int i = 0; i < ds_Racing.Tables[0].Rows.Count; i++)
                {
                    String currentRacingInfoID = ds_Racing.Tables[0].Rows[i]["RacingInfo_ID"].ToString();
                    String racingDescription = DAL.Sport_GetRacingDescription(currentRacingInfoID);
                    if (racingDescription != "محاسبه شده" && racingDescription != "" && racingDescription != null)
                    {
                        if (currentRacingInfoID != null)
                        {
                            if (CalculateRacingForDeductions(currentRacingInfoID))
                            {
                                racingCalculated += "مسابقه شماره: " + currentRacingInfoID +
                                    " با عنوان: " + ds_Racing.Tables[0].Rows[i]["Race_Title"].ToString() +
                                    " و با جزئیات: " + ds_Racing.Tables[0].Rows[i]["RacingInfo_Details"].ToString() + "\n";
                            }
                        }
                    }
                }
            }
        }
        catch (SqlException exSql) { BLL.SendEmail("Sql Error", exSql); }
        catch (Exception ex) { BLL.SendEmail("CalculateAllRacings - If Condition", ex); }
        return racingCalculated;
    }
}