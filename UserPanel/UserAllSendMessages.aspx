<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAllSendMessages.aspx.cs" Inherits="UserPanel_UserAllSendMessages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>حس ششم - پیامهای ارسالی</title>
    <link href="../Styles/CSSUserProfile.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">    
    <div id="userAllSendMessages">   
        <h3>پیام های ارسالی به سایر کاربران</h3>
        <hr />         
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="gv_UserSendMessages" EnableViewState="false" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                        CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle" PageSize="10">
                        <RowStyle BackColor="#8C7AAD" Height="33px" ForeColor="Yellow" VerticalAlign="Middle" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="#333333" BorderWidth="1"/>                
                        <Columns>
                            <asp:TemplateField HeaderText="شماره پیام" SortExpression="Message_ID">
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>                    
                                    <asp:Label ID="lbl_Message_ID" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>                            
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="تاریخ ایجاد" SortExpression="Message_CreationDate">
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>                    
                                    <asp:Label ID="lbl_Message_CreationDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Message_CreationDate", "{0}"), "L", true, "H")) %>'></asp:Label>
                                </ItemTemplate>                            
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="موضوع تماس" SortExpression="Message_Subject">
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>                    
                                    <asp:Label ID="lbl_Message_Subject" runat="server" Text='<%# Eval("Message_Subject") %>'></asp:Label>
                                </ItemTemplate>                            
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="نام گیرندگان" SortExpression="Message_ReceiverEmail">
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>                    
                                    <asp:Label ID="lbl_Message_ReceiverEmail" runat="server" Text='<%# Eval("Message_ReceiverEmail") %>'></asp:Label>
                                </ItemTemplate>                            
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="متن پیام" SortExpression="Message_Context">
                                <ItemStyle Width="40%"/>
                                <ItemTemplate>                    
                                    <asp:Label ID="lbl_Contact_Phone" runat="server" Text='<%# Eval("Message_Context") %>'></asp:Label>
                                </ItemTemplate>                            
                            </asp:TemplateField>
<%--                            <asp:TemplateField HeaderText="نمایش پیام">
                                <ItemStyle Width="10%" />
                                <ItemTemplate>
                                    <a id='<%# Eval("Message_ID") %>' class="Message_Show" style="cursor: pointer">
                                        <img border="0" src="../Images/ajaxImages/Show.png" alt="نمایش" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>               
                </ContentTemplate>
            </asp:UpdatePanel>   
        </div>
        <hr />
        <div style="float:right"><input type="button" class="btn" value="برگشت" onclick="javascript:window.location.href='UserProfileRegister.aspx'"/></div>
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    prm.add_beginRequest(function () { setBlock(); });
    prm.add_endRequest(function () { $.unblockUI(); });
</script>
