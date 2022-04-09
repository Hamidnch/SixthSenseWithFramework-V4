<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BongahAdd.ascx.cs" Inherits="AdminPanel_AdminUserControl_BongahAdd" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function getImagePath()
    {
        return '<%= ImagePath %>';
    }        
    var imagePath = getImagePath();
    function clearControlValues()
    {
        var txt_BongahType = document.getElementById("<%= txt_BongahType.ClientID %>");
        var txt_BongahLocation = document.getElementById("<%= txt_BongahLocation.ClientID %>");
        var txt_BongahAttribute = document.getElementById("<%= txt_BongahAttribute.ClientID%>");
        $('#<%= chk_BongahBuy.ClientID %>').attr('checked', false);
        $('#<%= chk_BongahSale.ClientID %>').attr('checked', false);
        $('#<%= chk_BongahInvestor.ClientID %>').attr('checked', false);
        $('#<%= chk_Capitalist.ClientID %>').attr('checked', false);
        txt_BongahType.value = "";
        txt_BongahLocation.value = "";
        txt_BongahAttribute.value = "";
    }
</script>
<script type="text/javascript" language="javascript">
    function SaveBongahData()
    {
        var BongahType = $("[id$= 'txt_BongahType']").val();
        var BongahLocation = $("[id$= 'txt_BongahLocation']").val();
        var BongahAttribute = $("[id$='txt_BongahAttribute']").val();
        var BongahBuy = $('#<%= chk_BongahBuy.ClientID %>').is(':checked');
        var BongahSale = $('#<%= chk_BongahSale.ClientID %>').is(':checked');
        var BongahInvestor = $('#<%= chk_BongahInvestor.ClientID %>').is(':checked');
        var BongahCapitalist = $('#<%= chk_Capitalist.ClientID %>').is(':checked');

        var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
        if (BongahType == "")
        {
            lblMsg.innerHTML = 'نوع بنگاه را مشخص کنید';
            $("[id$= 'txt_BongahType']").focus();
            return;
        }
        if (BongahLocation == "")
        {
            lblMsg.innerHTML = 'موقعیت بنگاه را مشخص کنید';
            $("[id$= 'txt_BongahLocation']").focus();
            return;
        }
        if (BongahAttribute == "")
        {
            lblMsg.innerHTML = 'مشخصات بنگاه را وارد کنید';
            $("[id$='txt_BongahAttribute']").focus();
            return;
        }
        $.blockUI(
                {
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
        $.PageMethod('InsertBongah', onSuccess, onFail, 'bongahType', BongahType, 'bongahLocation', BongahLocation,
                'bongahAttribute', BongahAttribute, 'bongahBuy', BongahBuy, 'bongahSale', BongahSale,
                'bongahInvestor', BongahInvestor, 'bongahCapitalist', BongahCapitalist);
    }
    function onSuccess(response)
    {
        $.unblockUI();
        var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
        lblMsg.innerHTML = 'بنگاه موردنظر نظر ثبت گردید';
        clearControlValues();
    }
    function onFail(response)
    {
        $.unblockUI();
        alert("خطای  : " + response.d);
    }
</script>

<fieldset>
    <legend style="color: #66FF33">افزودن بنگاه جدید</legend>
    <div class="input_field">
        <label>
            تاریخ امروز:
        </label>
        <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
    </div>
    <div class="input_field">
        <label for="mf">
            نوع بنگاه:
        </label>
        <asp:TextBox ID="txt_BongahType" CssClass="customTxt medium" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_BongahType"
            ErrorMessage="نوع بنگاه را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
        <label>
            موقعیت بنگاه:
        </label>
        <asp:TextBox ID="txt_BongahLocation" runat="server" CssClass="customTxt big" Width="550px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_BongahLocation"
            ErrorMessage="موقعیت بنگاه را مشخص نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
        <label>
            مشخصات بنگاه:
        </label>
        <asp:TextBox ID="txt_BongahAttribute" runat="server" Height="200px" Width="95%" TextMode="MultiLine"
            CssClass="customTxt big"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_BongahAttribute"
            ErrorMessage="مشخصات بنگاه را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
        <asp:CheckBox ID="chk_BongahBuy" CssClass="checkbox" Text=" " Checked="false" runat="server" />خرید
        <br />
        <asp:CheckBox ID="chk_BongahSale" CssClass="checkbox" Text=" " Checked="false" runat="server" />فروش
        <br />
        <asp:CheckBox ID="chk_BongahInvestor" CssClass="checkbox" Text=" " Checked="false"
            runat="server" />مشارکت سرمایه گذار
        <br />
        <asp:CheckBox ID="chk_Capitalist" CssClass="checkbox" Text=" " Checked="false" runat="server" />مشارکت
        سرمایه پذیر
    </div>
    <div class="input_field no_margin_bottom">
        <asp:Button ID="btn_BongahSave" CssClass="submit" runat="server" Text="ثبت" OnClientClick="javascript:SaveBongahData();return false;" />
        <input type="button" id="btn_ArticleNew" class="submit" value="جدید" onclick="clearControlValues()" />
        <asp:Button ID="btn_Exit" CssClass="submit" runat="server" Text="بستن" CausesValidation="False"
            OnClick="btn_Exit_Click" />
        <%--        <a href="#" class="button">A button</a>--%>
        <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
    </div>
</fieldset>
