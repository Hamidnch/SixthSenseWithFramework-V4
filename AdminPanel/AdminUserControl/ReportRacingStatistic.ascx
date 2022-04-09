<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportRacingStatistic.ascx.cs" Inherits="AdminPanel_AdminUserControl_ReportRacingStatistic" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">گزارش عملکرد مسابقه</legend>
    <fieldset>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="float: right">
                    <span>شماره مسابقه: </span>
                    <asp:DropDownList ID="ddl_AllRacing" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddl_AllRacing_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div style="float: right;padding: 5px 15px;">
                    <span>نام مسابقه: </span>
                    <asp:Label ID="lbl_RaceTitle" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>
                <div style="clear: both">
                </div><br /><br />
                <div style="float: right; padding-left: 30px">
                    <span>تاریخ آخرین مسابقه: </span>
                    <asp:Label ID="lbl_RacingLastDate" runat="server" Text="......................." ForeColor="Lime"
                        Font-Bold="true"></asp:Label>
                </div>
                <div style="float: right;padding-left: 30px">
                    <span>تعداد کل فرمها: </span>
                    <asp:Label ID="lbl_RacingAllFormCount" runat="server" Text="............." ForeColor="Lime"
                        Font-Bold="true"></asp:Label>
                </div>
                <div style="float: right">
                    <span>تعداد فرمهای فعال: </span>
                    <asp:Label ID="lbl_RacingActiveFormsCount" runat="server" Text="............." ForeColor="Lime"
                        Font-Bold="true"></asp:Label>
                </div> <br /><br /> <br />
                <hr style="background-color:White; height:1px;"/><br /><br />
                <div style="float: right">
                    <span>مبلغ کل فرمهای فعال : </span>
                    <asp:Label ID="lbl_ActiveFormsAmount" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>
                <div style="clear: both"><br /><br />
                <div style="float: right;padding-left: 50px">
                    <span>تعداد نفرات اول : </span>
                    <asp:Label ID="lbl_FirstCount" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>
                <div style="float: right; padding-left: 50px">
                    <span>جایزه هر نفر اول : </span>
                    <asp:Label ID="lbl_RewardForEachFirst" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>
                <div style="float: right">
                    <span>جمع جایزه نفرات اول : </span>
                    <asp:Label ID="lbl_RewardFirstSum" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>
                <div style="clear: both"><br /><br />
                    <div style="float: right; padding-left: 50px">
                        <span>تعداد نفرات دوم : </span>
                        <asp:Label ID="lbl_SecondCount" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                    </div>
                    <div style="float: right; padding-left: 50px">
                        <span>جایزه هر نفر دوم : </span>
                        <asp:Label ID="lbl_RewardForEachSecond" runat="server" Text="...." ForeColor="Lime"
                            Font-Bold="true"></asp:Label>
                    </div>
                    <div style="float: right;">
                        <span>جمع جایزه نفرات دوم : </span>
                        <asp:Label ID="lbl_RewardSecondSum" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                    </div><br /><br /><br />
                    <hr style="background-color: White; height: 1px;" /><br /><br />
                    <div style="float: right">
                        <span>مبلغ کل جایزه مسابقه : </span>
                        <asp:Label ID="lbl_RacingRewardTotalAmount" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                    </div>
                    <div style="clear: both"><br /><br />
                    <div style="float: right">
                        <span>مبلغ 10% </span><span> هزینه های اجرائی سایت: </span>
                        <asp:Label ID="lbl_RewardSite" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                    </div>
                    <div style="clear: both"><br /><br />
                    <div style="float: right">
                        <span>مبلغ </span><span>5% </span><span>وجوه دولتی : </span>
                        <asp:Label ID="lbl_RewardGovernment" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                    </div>
                    <div style="clear: both"><br /><br />
                    <div style="float: right">
                        <span>مبلغ </span><span>5% </span><span>وجوه عمومی(عام المنفعه) : </span>
                        <asp:Label ID="lbl_RewardCharitable" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </fieldset><br />
    <asp:Button runat="server" Text="برگشت به صفحه گزارشات" CssClass="submit" 
    onclick="Unnamed1_Click" />
</fieldset>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function setBlock()
    {
        $.blockUI(
                {  //'<img src="<=ResolveUrl("~") %>/ajaxImages/loading2.gif" />'
                    message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
                    fadeIn: 700,
                    fadeOut: 700,
                    css: {
                        border: 'none',
                        padding: '5px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
    }
    $(document).ready(function ()
    {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function ()
        {
            setBlock();
        });
        prm.add_endRequest(function ()
        {
            $.unblockUI();
        });
    });
</script>