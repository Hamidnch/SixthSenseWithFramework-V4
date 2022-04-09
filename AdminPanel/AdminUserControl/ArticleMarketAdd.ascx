<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleMarketAdd.ascx.cs" Inherits="AdminPanel_AdminUserControl_ArticleMarketAdd" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function getImagePath()
    {
        return '<%= ImagePath %>';
    }
    function clearControlValues()
    {  
        var txt_ArticleType      = document.getElementById("<%= txt_ArticleType.ClientID %>");
        var txt_ArticleUnit      = document.getElementById("<%= txt_ArticleUnit.ClientID %>");
        var txt_ArticleAttribute = document.getElementById("<%= txt_ArticleAttribute.ClientID %>");
        var txt_ArticleCost      = document.getElementById('<%= txt_ArticleCost.ClientID %>');
       
        $('#<%= chk_ArticleBuy.ClientID %>').attr('checked', false);
        $('#<%= chk_ArticleSale.ClientID %>').attr('checked', false);
        $('#<%= chk_ArticleStatus.ClientID %>').attr('checked', true);

        txt_ArticleType.value       = "";
        txt_ArticleUnit.value       = "";
        txt_ArticleAttribute.value  = "";
        txt_ArticleCost.value       = "";
    }
</script>        
<script type="text/javascript" language="javascript">
    function SaveArticleData()
    {
        var imagePath = getImagePath();
        var articleType     = $("[id$= 'txt_ArticleType']").val();
        var articleUnit     = $("[id$= 'txt_ArticleUnit']").val();
        var articleAttribute= $("[id$= 'txt_ArticleAttribute']").val();
        var articleBuy      = $('#<%= chk_ArticleBuy.ClientID %>').is(':checked');
        var articleSale     = $('#<%= chk_ArticleSale.ClientID %>').is(':checked');
        var articleCost     = $("[id$= 'txt_ArticleCost']").val();
        var articleStatus   = $('#<%= chk_ArticleStatus.ClientID %>').is(':checked');

        var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');

        if (articleType == "")
        {
            lblMsg.innerHTML = 'نوع کالا را مشخص کنید';
            $("[id$= 'txt_ArticleType']").focus();
            return;
        }
        if (articleUnit == "")
        {
            lblMsg.innerHTML = 'واحد سنجش کالا را مشخص کنید';
            $("[id$= 'txt_ArticleUnit']").focus();
            return;
        }
        if (articleAttribute == "")
        {
            lblMsg.innerHTML = 'مشخصات کالا را وارد کنید';
            $("[id$= 'txt_ArticleAttribute']").focus();
            return;
        }
        if (articleCost == "")
        {
            lblMsg.innerHTML = 'حدود قیمت کالا را وارد کنید';
            $("[id$= 'txt_ArticleCost']").focus();
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
        $.PageMethod('InsertArticleMarket', onSuccess, onFail, 'articleType', articleType, 'articleUnit', articleUnit,
                 'articleAttribute', articleAttribute, 'articleBuy', articleBuy, 'articleSale', articleSale,
                 'articleCost', articleCost, 'articleStatus', articleStatus );
    }
    function onSuccess(response)
    {
        var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
        lblMsg.innerHTML = 'مشخصات کالای موردنظر ثبت گردید';
        clearControlValues();
        $.unblockUI();
    }
    function onFail(response)
    {
        $.unblockUI();
        alert("خطای  : " + response.d);
    }
</script>

<fieldset>
    <legend style="color: #66FF33">افزودن کالای جدید</legend>
    <div class="input_field">
        <label>
            تاریخ امروز:
        </label>
        <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
    </div>
    <div class="input_field">
        <label for="mf">
            نوع کالا:
        </label>
        <asp:TextBox ID="txt_ArticleType" CssClass="customTxt medium" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_ArticleType"
            ErrorMessage="نوع کالا را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
        <label>
           واحد سنجش کالا:
        </label>
        <asp:DropDownList ID="txt_ArticleUnit" CssClass="mediumfield" runat="server">
            <asp:ListItem>عدد</asp:ListItem>
            <asp:ListItem>کیلوگرم</asp:ListItem>
            <asp:ListItem>گرم</asp:ListItem>
            <asp:ListItem>متر</asp:ListItem>
            <asp:ListItem>تخته</asp:ListItem>
            <asp:ListItem>راس</asp:ListItem>
            <asp:ListItem>مثقال</asp:ListItem>
            <asp:ListItem>فروند</asp:ListItem>
            <asp:ListItem>شانه</asp:ListItem>
            <asp:ListItem>بطری</asp:ListItem>
            <asp:ListItem>قوطی</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="input_field">
        <label>
            مشخصات کالا:
        </label>
        <asp:TextBox ID="txt_ArticleAttribute" runat="server" CssClass="customTxt medium"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_ArticleAttribute"
            ErrorMessage="مشخصات کالا را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
        <asp:CheckBox ID="chk_ArticleBuy" Text="خرید" runat="server" />
    </div>
    <div class="input_field">
        <asp:CheckBox ID="chk_ArticleSale" Text="فروش" runat="server" />
    </div>
    <div class="input_field">
        <label>
             حدود قیمت روز:
        </label>
        <asp:TextBox ID="txt_ArticleCost" runat="server" CssClass="customTxt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_ArticleAttribute"
            ErrorMessage="مشخصات کالا را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
        <asp:CheckBox ID="chk_ArticleStatus" Checked="true" Text="وضعیت" runat="server" />
    </div>
    <div class="input_field no_margin_bottom">
        <asp:Button ID="btn_ArticleSave" CssClass="submit" runat="server" Text="ثبت" OnClientClick="javascript:SaveArticleData();return false;" />
        <input type="button" id="btn_ArticleNew" class="submit" value="جدید" onclick="clearControlValues()" />
        <asp:Button ID="btn_Exit" CssClass="submit" runat="server" Text="بستن" CausesValidation="False" />
        <%--        <a href="#" class="button">A button</a>--%>
        <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
    </div>
</fieldset>
