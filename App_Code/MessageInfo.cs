using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MessageInfo
/// </summary>
public class MessageInfo
{
	public MessageInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private String _message_ID;
    public String Message_ID
    {
        get { return _message_ID; }
        set { _message_ID = value; }
    }
    private String _message_Type;

    public String Message_Type
    {
        get { return _message_Type; }
        set { _message_Type = value; }
    }
    private String _message_Subject;

    public String Message_Subject
    {
        get { return _message_Subject; }
        set { _message_Subject = value; }
    }
    private String _message_Context;

    public String Message_Context
    {
        get { return _message_Context; }
        set { _message_Context = value; }
    }
    private String _message_CreationDate;

    public String Message_CreationDate
    {
        get { return _message_CreationDate; }
        set { _message_CreationDate = value; }
    }
    private String _message_SenderEmail;

    public String Message_SenderEmail
    {
        get { return _message_SenderEmail; }
        set { _message_SenderEmail = value; }
    }
    private String _message_ReceiverEmail;

    public String Message_ReceiverEmail
    {
        get { return _message_ReceiverEmail; }
        set { _message_ReceiverEmail = value; }
    }
    private String _message_Status;

    public String Message_Status
    {
        get { return _message_Status; }
        set { _message_Status = value; }
    }
    private String _message_Description;

    public String Message_Description
    {
        get { return _message_Description; }
        set { _message_Description = value; }
    }
}