using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ReceiptInfo
/// </summary>
public class DocumentInfo
{
	public DocumentInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private long documentID;

    public long DocumentID
    {
        get { return documentID; }
        set { documentID = value; }
    }
    private string registerDate;

    public string RegisterDate
    {
        get { return registerDate; }
        set { registerDate = value; }
    }
    private string userName;

    public string UserName
    {
        get { return userName; }
        set { userName = value; }
    }
    private long currentRemainAmountBox;

    public long CurrentRemainAmountBox
    {
        get { return currentRemainAmountBox; }
        set { currentRemainAmountBox = value; }
    }
}