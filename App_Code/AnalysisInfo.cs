using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AnalysisInfo
/// </summary>
public class AnalysisInfo
{
    private int _analysisID;

    public int AnalysisID
    {
        get { return _analysisID; }
        set { _analysisID = value; }
    }
    private DateTime _analysisDate;

    public DateTime AnalysisDate
    {
        get { return _analysisDate; }
        set { _analysisDate = value; }
    }
    private String _analysisTitle;

    public String AnalysisTitle
    {
        get { return _analysisTitle; }
        set { _analysisTitle = value; }
    }
    private String _analysisContext;

    public String AnalysisContext
    {
        get { return _analysisContext; }
        set { _analysisContext = value; }
    }
    private String _analysisAuthor;

    public String AnalysisAuthor
    {
        get { return _analysisAuthor; }
        set { _analysisAuthor = value; }
    }
    private Boolean _analysisStatus;

    public Boolean AnalysisStatus
    {
        get { return _analysisStatus; }
        set { _analysisStatus = value; }
    }
    //private int _analysisPriority;

	public AnalysisInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}