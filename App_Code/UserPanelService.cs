using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Configuration;

public class RewardDetails : BaseEntity
{
    private int _rowIndex;
    private string _racingInfo_ID;
    private string _racingWinners_FormID;
    private string _race_Title;
    private string _racingInfo_StartDate;
    private string _racingInfo_EndDate;
    private string _rcingWinners_FormProminence;
    private string _racingWinners_RewardAmount;
    
    public int RowIndex
    {
        get { return _rowIndex; }
        set { _rowIndex = value; }
    }
    public string RacingInfo_ID
    {
        get { return _racingInfo_ID; }
        set { _racingInfo_ID = value; }
    }
    public string RacingWinners_FormID
    {
        get { return _racingWinners_FormID; }
        set { _racingWinners_FormID = value; }
    }
    public string Race_Title
    {
        get { return _race_Title; }
        set { _race_Title = value; }
    }
    public string RacingInfo_StartDate
    {
        get { return _racingInfo_StartDate; }
        set { _racingInfo_StartDate = value; }
    }
    public string RacingInfo_EndDate
    {
        get { return _racingInfo_EndDate; }
        set { _racingInfo_EndDate = value; }
    }
    public string RcingWinners_FormProminence
    {
        get { return _rcingWinners_FormProminence; }
        set { _rcingWinners_FormProminence = value; }
    }
    public string RacingWinners_RewardAmount
    {
        get { return _racingWinners_RewardAmount; }
        set { _racingWinners_RewardAmount = value; }
    }
}
public class UserForms : BaseEntity
{
    private int     _rowIndex;
    private string  _racingInfo_ID;
    private string  _form_ID;
    private string  _race_Title;
    private string  _racingInfo_Details;
    private string  _racingInfo_FormAmount;
    private string  _form_CreationDate;
    private string  _form_LastUpdate;
    private string  _racingInfo_EndRespiteDate;
    //private string _racingInfo_EndRespiteTime;
  
    public int RowIndex
    {
        get { return _rowIndex; }
        set { _rowIndex = value; }
    }
    public string RacingInfo_ID
    {
        get { return _racingInfo_ID; }
        set { _racingInfo_ID = value; }
    }
    public string Form_ID
    {
        get { return _form_ID; }
        set { _form_ID = value; }
    }
    public string Race_Title
    {
        get { return _race_Title; }
        set { _race_Title = value; }
    }
    public string RacingInfo_Details
    {
        get { return _racingInfo_Details; }
        set { _racingInfo_Details = value; }
    }
    public string RacingInfo_FormAmount
    {
        get { return _racingInfo_FormAmount; }
        set { _racingInfo_FormAmount = value; }
    }
    public string Form_CreationDate
    {
        get { return _form_CreationDate; }
        set { _form_CreationDate = value; }
    }
    public string Form_LastUpdate
    {
        get { return _form_LastUpdate; }
        set { _form_LastUpdate = value; }
    }
    public string RacingInfo_EndRespiteDate
    {
        get { return _racingInfo_EndRespiteDate; }
        set { _racingInfo_EndRespiteDate = value; }
    }
    //public string RacingInfo_EndRespiteTime
    //{
    //    get { return _racingInfo_EndRespiteTime; }
    //    set { _racingInfo_EndRespiteTime = value; }
    //}
}
/// <summary>
/// Summary description for UserPanelService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
public class UserPanelService : System.Web.Services.WebService {

    private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
    public UserPanelService()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    private static IDbConnection CreateConnection()
    {
        IDbConnection cnn = new System.Data.SqlClient.SqlConnection(ConnectionString);cnn.Open();return cnn;
    }
    private static RewardDetails BuildRewardDetails(IDataReader reader)
    {
        RewardDetails rewardDetails = new RewardDetails();
        rewardDetails.RowIndex = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);
        rewardDetails.RacingInfo_ID = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        rewardDetails.RacingWinners_FormID = reader.IsDBNull(2) ? string.Empty : reader.GetString(2).Trim();
        rewardDetails.Race_Title = reader.IsDBNull(3) ? string.Empty : reader.GetString(3).Trim();
        rewardDetails.RacingInfo_StartDate = reader.IsDBNull(4) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(4), "D", false);
        rewardDetails.RacingInfo_EndDate = reader.IsDBNull(5) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(5), "D", false);
        rewardDetails.RcingWinners_FormProminence = reader.IsDBNull(6) ? "0" : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", reader.GetInt32(6)));
        rewardDetails.RacingWinners_RewardAmount  = reader.IsDBNull(7) ? "0" : PersianClass.getPersianNumberStyle(string.Format("{0:n0}", reader.GetInt32(7)));
        return rewardDetails;
    }
    private static UserForms BuildUserForms(IDataReader reader)
    {
        UserForms userForms = new UserForms();
        userForms.RowIndex                  = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);
        userForms.RacingInfo_ID             = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        userForms.Form_ID                   = reader.IsDBNull(2) ? string.Empty : reader.GetString(2).Trim();
        userForms.Race_Title                = reader.IsDBNull(3) ? string.Empty : reader.GetString(3).Trim();
        userForms.RacingInfo_Details        = reader.IsDBNull(4) ? string.Empty : reader.GetString(4).Trim();
        userForms.RacingInfo_FormAmount     = reader.IsDBNull(5) ? string.Empty : PersianClass.getPersianNumberStyle(string.Format("{0:n0}",reader.GetInt32(5)));
        userForms.Form_CreationDate         = reader.IsDBNull(6) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(6), "D", true, "H");
        userForms.Form_LastUpdate           = reader.IsDBNull(7) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(7), "D", true, "H");
        userForms.RacingInfo_EndRespiteDate = reader.IsDBNull(8) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(8), "D", false) + " " + (reader.IsDBNull(9) ? string.Empty : PersianClass.getPersianNumberStyle(reader.GetString(9).Trim()));
        //userForms.RacingInfo_EndRespiteTime = reader.IsDBNull(9) ? string.Empty : reader.GetString(9).Trim();
        return userForms;
    }

    [WebMethod()]
    public PagedResult<RewardDetails> getRewardsDetails(int userID, int start, int max, string sortColumn, string sortOrder)
    {
        if (max == 0) max = 10;
        if (string.IsNullOrEmpty(sortColumn) || (string.Compare(sortColumn, "RacingInfo_ID", true) == 0))
        { sortColumn = "RacingInfo_ID"; }
        else if (string.Compare(sortColumn, "RacingWinners_FormID") == 0)
        { sortColumn = "RacingWinners_FormID"; }
        else if (string.Compare(sortColumn, "Race_Title") == 0)
        { sortColumn = "Race_Title"; }
        else if (string.Compare(sortColumn, "RacingInfo_StartDate") == 0)
        { sortColumn = "RacingInfo_StartDate"; }
        else if (string.Compare(sortColumn, "RacingInfo_EndDate") == 0)
        { sortColumn = "RacingInfo_EndDate"; }
        else if (string.Compare(sortColumn, "RacingWinners_FormProminence") == 0)
        { sortColumn = "RacingWinners_FormProminence"; }
        else if (string.Compare(sortColumn, "RacingWinners_RewardAmount") == 0)
        { sortColumn = "RacingWinners_RewardAmount"; }
        if (string.IsNullOrEmpty(sortOrder))
        { sortOrder = "ASC"; }
        List<RewardDetails> rewardDetaildList = new List<RewardDetails>();
        int total = 0;
        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                string SQL =
                    @"
                    DECLARE @RewardTable TABLE (RowIndex INT, RacingInfo_ID NVARCHAR(50), RacingWinners_FormID NVARCHAR(50),
					Race_Title NVARCHAR(50),RacingInfo_StartDate DATETIME, RacingInfo_EndDate DATETIME, 
					RacingWinners_FormProminence INT,RacingWinners_RewardAmount INT)
					
                    INSERT INTO @RewardTable
	                    SELECT RowIndex, RacingInfo_ID,RacingWinners_FormID,Race_Title,RacingInfo_StartDate,RacingInfo_EndDate,
	                    	RacingWinners_FormProminence, RacingWinners_RewardAmount
	                    FROM 
	                    ( 
		                    SELECT ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS RowIndex, 
								tsri.RacingInfo_ID,tsrw.RacingWinners_FormID,tsr.Race_Title,tsri.RacingInfo_StartDate,tsri.RacingInfo_EndDate,
								tsrw.RacingWinners_FormProminence,tsrw.RacingWinners_RewardAmount 
			                			
		                    FROM tbl_SportRacingInfo tsri, tbl_SportRace tsr, tbl_SportRacingWinners tsrw
		                    
		                    WHERE (tsri.RacingInfo_ID = tsrw.RacingWinners_RacingInfoID) AND (tsri.RacingInfo_RaceID = tsr.Race_ID)
								AND (tsrw.RacingWinners_UserID = '" + userID + @"')
                        ) AS NewTable		                    
	                    SELECT RowIndex, RacingInfo_ID,RacingWinners_FormID,Race_Title,RacingInfo_StartDate,RacingInfo_EndDate,
	                    	RacingWinners_FormProminence, RacingWinners_RewardAmount
	                    FROM @RewardTable
	                    WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}) )  
	                    SELECT COUNT(*) FROM @RewardTable
                    ";
                cmd.CommandText = string.Format(SQL, sortColumn, sortOrder, start, max);
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        RewardDetails p = BuildRewardDetails(rdr);
                        rewardDetaildList.Add(p);
                    }
                    if ((rdr.NextResult()) && (rdr.Read()))
                    {
                        total = rdr.GetInt32(0);
                    }
                }
            }
        }
        if ((rewardDetaildList.Count == 0) || (total == 0)) { return null; }
        PagedResult<RewardDetails> result = new PagedResult<RewardDetails>();
        result.Rows = rewardDetaildList;
        result.Total = total;
        return result;
    }

    [WebMethod()]
    public PagedResult<UserForms> getUserForms(int userID, int status, int start, int max, string sortColumn, string sortOrder)
    {

        PagedResult<UserForms> result = new PagedResult<UserForms>(); 
        try
        {
            if ( max == 0 ) max = 10;
            if ( string.IsNullOrEmpty(sortColumn) || ( string.Compare(sortColumn,"RacingInfo_ID",true) == 0 ) )
            { sortColumn = "RacingInfo_ID"; }
            else if ( string.Compare(sortColumn,"Form_ID") == 0 )
            { sortColumn = "Form_ID"; }
            else if ( string.Compare(sortColumn,"Race_Title") == 0 )
            { sortColumn = "Race_Title"; }
            else if ( string.Compare(sortColumn,"RcingInfo_Details") == 0 )
            { sortColumn = "RcingInfo_Details"; }
            else if ( string.Compare(sortColumn,"RacingInfo_FormAmount") == 0 )
            { sortColumn = "Form_Amount"; }
            else if ( string.Compare(sortColumn,"Form_CreationDate") == 0 )
            { sortColumn = "Form_CreationDate"; }
            else if ( string.Compare(sortColumn,"Form_LastUpdate") == 0 )
            { sortColumn = "Form_LastUpdate"; }
            else if ( string.Compare(sortColumn,"RacingInfo_EndRespiteDate") == 0 )
            { sortColumn = "RacingInfo_EndRespiteDate"; }
            //else if (string.Compare(sortColumn, "RacingInfo_EndRespiteTime") == 0)
            //{ sortColumn = "RacingInfo_EndRespiteTime"; }
            if ( string.IsNullOrEmpty(sortOrder) )
            { sortOrder = "ASC"; }
            DateTime currentDate = BLL.GetIranDateTime(); //String.Format("{0:yyyy/MM/dd}", BLL.GetIranDateTime().Date);
            String currentTime = BLL.GetTime();
            String Criteria = "";
            if ( status == 1 )
            {
                Criteria = @" AND( CONVERT(DateTime,(CONVERT(NVARCHAR(10), tsri.RacingInfo_StartRespiteDate , 111) + ' ' + tsri.RacingInfo_StartRespiteTime), 111) <= @DateTimeNow)
            AND ( CONVERT(DateTime,(CONVERT(NVARCHAR(10), tsri.RacingInfo_EndRespiteDate , 111) + ' ' + tsri.RacingInfo_EndRespiteTime), 111) >= @DateTimeNow)";
            }
            else
                if ( status == 0 )
                {
                    Criteria = @" AND( CONVERT(DateTime,(CONVERT(NVARCHAR(10), tsri.RacingInfo_StartRespiteDate , 111) + ' ' + tsri.RacingInfo_StartRespiteTime), 111) < @DateTimeNow)
            AND ( CONVERT(DateTime,(CONVERT(NVARCHAR(10), tsri.RacingInfo_EndRespiteDate , 111) + ' ' + tsri.RacingInfo_EndRespiteTime), 111) < @DateTimeNow)";
                }
            List<UserForms> UserFormList = new List<UserForms>();
            int total = 0;
            using ( IDbConnection cnn = CreateConnection() )
            {
                using ( IDbCommand cmd = cnn.CreateCommand() )
                {
                    string SQL =
                    @"
                    DECLARE @UserFormTable TABLE (RowIndex INT, RacingInfo_ID NVARCHAR(50), Form_ID NVARCHAR(50),
					Race_Title NVARCHAR(50),RacingInfo_Details NVARCHAR(50),Form_Amount INT, Form_CreationDate DATETIME, 
					Form_LastUpdate DATETIME, RacingInfo_EndRespiteDate DATETIME, RacingInfo_EndRespiteTime NVARCHAR(8) )	
	                
                    DECLARE @dateString NVARCHAR(10) = CONVERT(NVARCHAR(10),'" + currentDate + @"', 111)
                    DECLARE @timeString NVARCHAR(5) = '" + currentTime + @"' 
                    DECLARE @dateTimeString NVARCHAR(15) = @dateString + ' ' + @timeString
                	DECLARE @DateTimeNow DATETIME = CONVERT(DateTime, @dateTimeString, 111)

                    INSERT INTO @UserFormTable
	                    SELECT RowIndex, RacingInfo_ID, Form_ID,Race_Title,RacingInfo_Details, Form_Amount INT, Form_CreationDate, 
								Form_LastUpdate, RacingInfo_EndRespiteDate, RacingInfo_EndRespiteTime
	                    FROM 
	                    ( 
		                    SELECT ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS RowIndex, 
							 tsri.RacingInfo_ID, tsrf.Form_ID,sr.Race_Title,tsri.RacingInfo_Details, tsrf.Form_Amount, tsrf.Form_CreationDate,
							 tsrf.Form_LastUpdate, tsri.RacingInfo_EndRespiteDate, RacingInfo_EndRespiteTime
			                			
							FROM tbl_SportRacingForms tsrf, tbl_SportRacingInfo tsri, tbl_SportRace sr
		                    
							WHERE	(
									 tsri.RacingInfo_ID = tsrf.Form_RacingInfoID AND 
									 sr.Race_ID = tsri.RacingInfo_RaceID AND 
                                     tsrf.Form_UserID = '" + userID + @"' AND 
                                     tsrf.Form_ActiveStatus = '" + status + @"'" +
                                                                     Criteria + @"
                                        )
                        ) AS NewTable                    
	                    SELECT RowIndex, RacingInfo_ID, Form_ID,Race_Title,RacingInfo_Details,Form_Amount, Form_CreationDate, 
								Form_LastUpdate, RacingInfo_EndRespiteDate, RacingInfo_EndRespiteTime
	                    FROM @UserFormTable
	                    WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}) )    
	                    SELECT COUNT(*) FROM @UserFormTable
                    ";
                    cmd.CommandText = string.Format(SQL,sortColumn,sortOrder,start,max);
                    using ( IDataReader rdr = cmd.ExecuteReader() )
                    {
                        while ( rdr.Read() )
                        {
                            UserForms p = BuildUserForms(rdr);
                            UserFormList.Add(p);
                        }
                        if ( ( rdr.NextResult() ) && ( rdr.Read() ) )
                        {
                            total = rdr.GetInt32(0);
                        }
                    }
                }
            }
            if ( ( UserFormList.Count == 0 ) || ( total == 0 ) ) { return null; }
            result.Rows = UserFormList;
            result.Total = total;
        }
        catch ( Exception ex )
        {
            BLL.SendEmail("getUserForms", ex);
        }
        return result;
    }
}
