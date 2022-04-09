<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BoxesInventory.ascx.cs" Inherits="AdminPanel_AdminUserControl_BoxesInventory" %>
<div id="tabbed_box_1" class="tabbed_box">
    <h4>موجودی صندوق ها</h4><br />
    <div class="tabbed_area">
        <ul class="tabs">
            <li><a href="#" title="content_1" class="tab active" id="siteLink">صندوق سایت</a></li>
            <li><a href="#" title="content_2" class="tab" id="governLink">صندوق دولتی</a></li>
            <li><a href="#" title="content_3" class="tab" id="charitableLink">صندوق عام المنفعه</a></li>
            <li><a href="#" title="content_4" class="tab" id="rewardLink">صندوق جوایز</a></li>
            <li><a href="#" title="content_5" class="tab" id="UsersChargeLink">صندوق شارژ کاربران</a></li>
        </ul>
    </div>
    <div id="content_1" class="content" style="display: block;">
        <fieldset>
            <legend style="color: #ffcc00;">موجودی صندوق سایت</legend>
            <table>
                <tr>
                    <td class="Inventory_cell">
                        <span>امروز : </span>
                        <asp:Label ID="lbl_Today1" CssClass="lbl_Today" runat="server" Text="...." ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ واریزی به صندوق: </span>
                        <asp:Label ID="lbl_SiteSettleAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ برداشت از صندوق: </span>
                        <asp:Label ID="lbl_SiteTakeAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>مانده فعلی صندوق: </span>
                        <asp:Label ID="lbl_SiteBoxRemain" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="content_2" class="content" style="display: none;">
        <fieldset>
            <legend style="color: #ffcc00;">موجودی صندوق دولت</legend>
            <table>
                <tr>
                    <td class="Inventory_cell">
                        <span>امروز : </span>
                        <asp:Label ID="lbl_Today2" CssClass="lbl_Today" runat="server" Text="...." ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ واریزی به صندوق: </span>
                        <asp:Label ID="lbl_GovernmentSettleAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ برداشت از صندوق: </span>
                        <asp:Label ID="lbl_GovernmentTakeAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>مانده فعلی صندوق: </span>
                        <asp:Label ID="lbl_GovernmentBoxRemain" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="content_3" class="content" style="display: none">
        <fieldset>
            <legend style="color: #ffcc00;">موجودی صندوق عام المنفعه</legend>
            <table>
                <tr>
                    <td class="Inventory_cell">
                        <span>امروز : </span>
                        <asp:Label ID="lbl_Today3" CssClass="lbl_Today" runat="server" Text="...." ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ واریزی به صندوق: </span>
                        <asp:Label ID="lbl_CharitableSettleAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ برداشت از صندوق: </span>
                        <asp:Label ID="lbl_CharitableTakeAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>مانده فعلی صندوق: </span>
                        <asp:Label ID="lbl_CharitableBoxRemain" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="content_4" class="content" style="display: none">
        <fieldset>
            <legend style="color: #ffcc00;">موجودی صندوق جوایز</legend>
            <table>
                <tr>
                    <td class="Inventory_cell">
                        <span>امروز : </span>
                        <asp:Label ID="lbl_Today4" CssClass="lbl_Today" runat="server" Text="...." ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ واریزی به صندوق: </span>
                        <asp:Label ID="lbl_RewardSettleAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>کل مبلغ برداشت از صندوق: </span>
                        <asp:Label ID="lbl_RewardTakeAmount" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>مانده فعلی صندوق: </span>
                        <asp:Label ID="lbl_RewardBoxRemain" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="content_5" class="content" style="display: none">
        <fieldset>
            <legend style="color: #ffcc00;">مانده صندوق شارژ کاربران</legend>
            <table>
                <tr>
                    <td class="Inventory_cell">
                        <span>امروز : </span>
                        <asp:Label ID="lbl_Today5" CssClass="lbl_Today" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="Inventory_cell">
                        <span>جمع مبلغ مانده صندوق شارژ حساب کاربران: </span>
                        <asp:Label ID="lbl_RemainAmountUsersChargeBox" runat="server" Text="0.0" ForeColor="Lime"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</div>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function block()
    {
        $.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/2.gif" /><br /><br /></h4>',
            fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: false, css: { border: 'none', padding: '5px', top: '150px', left: '300px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000'}
        });
    }
    $(document).ready(function ()
    {
        block();
        $.PageMethod('getSiteBoxData', onSiteSuccess, onSiteFail);

        $("a.tab").click(function ()
        {
            $(".active").removeClass("active");
            $(this).addClass("active");
            $(".content").slideUp();
            var content_show = $(this).attr("title");
            $("#" + content_show).slideDown();
        });
        $('#siteLink').click(function ()
        {
            block();
            $.PageMethod('getSiteBoxData', onSiteSuccess, onSiteFail);
        });
        function onSiteSuccess(res)
        {
            var result = res.d;
            $("span[id$=lbl_Today1]").html(result.Today);
            $('span[id$=lbl_SiteSettleAmount]').html(addCommas(result.SettleAmount));
            $('span[id$=lbl_SiteTakeAmount]').html(addCommas(result.TakeAmount));
            $('span[id$=lbl_SiteBoxRemain]').html(addCommas(result.RemainAmount));
            $.unblockUI();
        }
        function onSiteFail(res) { alert(res.d); $.unblockUI(); }

        $('#governLink').click(function ()
        {
            block();
            $.PageMethod('getGovernmentBoxData', onGovernSuccess, onGovernFail);
        });
        function onGovernSuccess(res)
        {
            var result = res.d;
            $("span[id$=lbl_Today2]").html(result.Today);
            $('span[id$=lbl_GovernmentSettleAmount]').html(addCommas(result.SettleAmount));
            $('span[id$=lbl_GovernmentTakeAmount]').html(addCommas(result.TakeAmount));
            $('span[id$=lbl_GovernmentBoxRemain]').html(addCommas(result.RemainAmount));
            $.unblockUI();
        }
        function onGovernFail(res) { alert(res.d); $.unblockUI(); }

        $('#charitableLink').click(function ()
        {
            block();
            $.PageMethod('getCharitableBoxData', onCharitableSuccess, onCharitableFail);
        });
        function onCharitableSuccess(res)
        {
            var result = res.d;
            $("span[id$=lbl_Today3]").html(result.Today);
            $('span[id$=lbl_CharitableSettleAmount]').html(addCommas(result.SettleAmount));
            $('span[id$=lbl_CharitableTakeAmount]').html(addCommas(result.TakeAmount));
            $('span[id$=lbl_CharitableBoxRemain]').html(addCommas(result.RemainAmount));
            $.unblockUI();
        }
        function onCharitableFail(res) { alert(res.d); $.unblockUI(); }

        $('#rewardLink').click(function ()
        {
            block();
            $.PageMethod('getRewardBoxData', onRewardSuccess, onRewardFail);
        });
        function onRewardSuccess(res)
        {
            var result = res.d;
            $("span[id$=lbl_Today4]").html(result.Today);
            $('span[id$=lbl_RewardSettleAmount]').html(addCommas(result.SettleAmount));
            $('span[id$=lbl_RewardTakeAmount]').html(addCommas(result.TakeAmount));
            $('span[id$=lbl_RewardBoxRemain]').html(addCommas(result.RemainAmount));
            $.unblockUI();
        }
        function onRewardFail(res) { alert(res.d); $.unblockUI(); }

        $('#UsersChargeLink').click(function ()
        {
            block();
            $.PageMethod('getUsersChargeBoxData', onUsersChargeSuccess, onUsersChargeFail);
        });
        function onUsersChargeSuccess(res)
        {
            var result = res.d;
            $("span[id$=lbl_Today5]").html(result.Today);
            $('span[id$=lbl_RemainAmountUsersChargeBox]').html(addCommas(result.RemainAmount));
            $.unblockUI();
        }
        function onUsersChargeFail(res) { alert(res.d); $.unblockUI(); }
    });
</script>