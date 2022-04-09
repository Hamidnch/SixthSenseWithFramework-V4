<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserSportRacingEditForm.aspx.cs" Inherits="UserPanel_UserSportRacingEditForm" %>

<%@ Register src="SportRacingFormEdit.ascx" tagname="SportRacingFormEdit" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ویرایش فرم یک مسابقه خاص در حس ششم</title>
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/CustomBlockUI.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server"><div><uc1:SportRacingFormEdit ID="SportRacingFormEdit1" runat="server" /></div></form>
</body>
</html>
