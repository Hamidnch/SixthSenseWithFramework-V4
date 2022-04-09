<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSelectRacingForResult.ascx.cs" Inherits="UserControl_SportSelectRacingForResult" %>
<link href="../Styles/CSSSport_SelectRacingForResult.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div id="SelectRacingForResult">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="div_ddlRacing">
                <span style="color:Yellow">عنوان مسابقه را انتخاب نمایید: </span>
                <asp:DropDownList ID="ddl_Racing" runat="server" CssClass="ddl_Racing" AutoPostBack="True" onselectedindexchanged="ddl_Racing_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="dl_SelectRacingForResult"> 
                <asp:DataList ID="dl_SelectRacingForResult" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" onitemdatabound="dl_SelectRacingForResult_ItemDataBound">
                    <ItemStyle CssClass="SelectRacingForResultTitle"></ItemStyle>
                    <ItemTemplate>                            
                        <fieldset id="fld_Goto" runat="server">
                            <span class="SelectRacingForResultSpan">شماره مسابقه : </span><asp:Label ID="lbl_RacingInfoID" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>'></asp:Label><br />
                            <span class="SelectRacingForResultSpan">نام کشور      : </span><asp:Label ID="Label2" runat="server" Text='<%# Eval("Country_Name", "{0}") %>'></asp:Label><br />
                            <span class="SelectRacingForResultSpan">جزئیات مسابقه: </span><asp:Label ID="Lbl_RacingInfo_Details" Text='<%# Eval("Racinginfo_Details","{0}") %>' ForeColor="Lime" runat="server"></asp:Label>
                        </fieldset>
                    </ItemTemplate>            
                </asp:DataList>
            </div>            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddl_Racing" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <br /><br />
    <div class="divBtnForm"> 
        <input type="button" class="btnForm" value="برگشت" onclick="javascript:window.location.href='SportRacingTitles.aspx'" />
<%--        <asp:Button ID="btn_Exit" runat="server" Text="برگشت"  CssClass="btnForm" onclick="btn_Exit_Click"/> --%>           
    </div>
</div>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
//    function setBlock()
//    {
//        $.blockUI({  //'<img src="<=ResolveUrl("~") %>/ajaxImages/loading2.gif" />'
//        message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',fadeIn: 700,fadeOut: 700,css: {border: 'none',padding: '5px', backgroundColor: 'transparent','-webkit-border-radius': '10px','-moz-border-radius': '10px',opacity: .6,color: '#fff'}});}
    $(document).ready(function ()
    {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {setBlock();});
        prm.add_endRequest(function (){$.unblockUI();});
    });
  </script>