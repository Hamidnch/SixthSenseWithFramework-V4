using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for RacingManagementService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class RacingManagementService : System.Web.Services.WebService {

    public RacingManagementService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
    private static IDbConnection CreateConnection()
    {
        IDbConnection cnn = new System.Data.SqlClient.SqlConnection(ConnectionString);
        cnn.Open();
        return cnn;
    }    
    /*******************************************************************************************************************/
    public class RacingManagement : BaseEntity
    {
        private int rowIndex;
        private string racingInfo_ID;
        private string race_Title;
        private string racingInfo_Details;
        private string country_Name;
        private string racing_LastUpdateDate;

        public int RowIndex
        {
            get { return rowIndex; }
            set { rowIndex = value; }
        }
        public string RacingInfo_ID
        {
            get { return racingInfo_ID; }
            set { racingInfo_ID = value; }
        }
        public string Race_Title
        {
            get { return race_Title; }
            set { race_Title = value; }
        }
        public string RacingInfo_Details
        {
            get { return racingInfo_Details; }
            set { racingInfo_Details = value; }
        }
        public string Country_Name
        {
            get { return country_Name; }
            set { country_Name = value; }
        }
        public string Racing_LastUpdateDate
        {
            get { return racing_LastUpdateDate; }
            set { racing_LastUpdateDate = value; }
        }
    }
    private static RacingManagement BuildRacingManagement(IDataReader reader)
    {
        RacingManagement racingManagement = new RacingManagement();
        racingManagement.RowIndex               = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);
        racingManagement.RacingInfo_ID          = reader.IsDBNull(1) ? string.Empty : reader.GetString(1).Trim();
        racingManagement.Race_Title             = reader.IsDBNull(2) ? string.Empty : reader.GetString(2).Trim();
        racingManagement.RacingInfo_Details     = reader.IsDBNull(3) ? string.Empty : reader.GetString(3).Trim();
        racingManagement.Country_Name           = reader.IsDBNull(4) ? string.Empty : reader.GetString(4).Trim();
        racingManagement.Racing_LastUpdateDate  = reader.IsDBNull(5) ? string.Empty : PersianClass.getPersiaDate(reader.GetDateTime(5), "L", true);
        return racingManagement;
    }
    [WebMethod()]
    public PagedResult<RacingManagement> getRacingManagement(int start, int max, string sortColumn, string sortOrder)
    {
        if (max == 0) max = 10;
        List<RacingManagement> racingManagementList = new List<RacingManagement>();
        int total = 0;
        using (IDbConnection cnn = CreateConnection())
        {
            using (IDbCommand cmd = cnn.CreateCommand())
            {
                const string SQL = 
                    @"
                    DECLARE @RcingTable TABLE (RowIndex INT, RacingInfo_ID NVARCHAR(50), 
					Race_Title NVARCHAR(50),RacingInfo_Details NVARCHAR(50), Country_Name NVARCHAR(50), Racing_LastUpdateDate DATETIME)
                    INSERT INTO @RcingTable
	                    SELECT RowIndex, RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, Racing_LastUpdateDate		
	                    FROM 
	                    ( 
		                    SELECT ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS RowIndex, 
			                tsri.RacingInfo_ID,tsr.Race_Title,tsri.RacingInfo_Details,tc.Country_Name, tsri.Racing_LastUpdateDate				
		                    FROM tbl_SportRacingInfo tsri, tbl_SportRace tsr, tbl_Country tc
		                    WHERE (tsr.Race_ID = tsri.RacingInfo_RaceID) AND (tc.Country_ID = tsri.RacingInfo_CountryID)AND (tsri.Racing_Status = 'فعال')
	                    ) AS NewTable
	                    SELECT RowIndex, RacingInfo_ID,Race_Title,RacingInfo_Details,Country_Name, Racing_LastUpdateDate
	                    FROM @RcingTable
	                    WHERE (RowIndex > {2}) AND (RowIndex <= ({2} + {3}) )  
	                    ORDER BY Racing_LastUpdateDate DESC		
	                    SELECT COUNT(*) FROM @RcingTable
                    ";
                cmd.CommandText = string.Format(SQL, sortColumn, sortOrder, start, max);
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        RacingManagement p = BuildRacingManagement(rdr);
                        racingManagementList.Add(p);
                    }
                    if ((rdr.NextResult()) && (rdr.Read()))
                    {
                        total = rdr.GetInt32(0);
                    }
                }
            }
        }
        if ((racingManagementList.Count == 0) || (total == 0)) { return null; }
        PagedResult<RacingManagement> result = new PagedResult<RacingManagement>();
        result.Rows = racingManagementList;
        result.Total = total;
        return result;
    }
}
