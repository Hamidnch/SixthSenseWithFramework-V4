using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SportClassificationTable
/// </summary>
public class SportClassificationTable
{
	public SportClassificationTable()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private String _classificationTable_ID;
    private String _classificationTable_Title;
    private String _classificationTable_Logo;
    private String _classificationTable_CreationDate;
    private String _classificationTable_AuthorID;
    private String _classificationTable_Status;
    private String _classificationTable_Description;

    public string ClassificationTableId
    {
        get { return _classificationTable_ID; }
        set { _classificationTable_ID = value; }
    }

    public string ClassificationTableTitle
    {
        get { return _classificationTable_Title; }
        set { _classificationTable_Title = value; }
    }

    public string ClassificationTableLogo
    {
        get { return _classificationTable_Logo; }
        set { _classificationTable_Logo = value; }
    }

    public string ClassificationTableCreationDate
    {
        get { return _classificationTable_CreationDate; }
        set { _classificationTable_CreationDate = value; }
    }

    public string ClassificationTableAuthorId
    {
        get { return _classificationTable_AuthorID; }
        set { _classificationTable_AuthorID = value; }
    }

    public string ClassificationTableStatus
    {
        get { return _classificationTable_Status; }
        set { _classificationTable_Status = value; }
    }

    public string ClassificationTableDescription
    {
        get { return _classificationTable_Description; }
        set { _classificationTable_Description = value; }
    }
}