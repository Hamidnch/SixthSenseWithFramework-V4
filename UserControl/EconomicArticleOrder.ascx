<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicArticleOrder.ascx.cs" Inherits="UserControl_EconomicArticleOrder" %>
<link href="../Styles/CSSEco_ArticleOrder.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<link href="../Styles/WindowStyles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
 .loading { position:absolute; left:200px; top:50px; }   
    .style1
    {
        width: 102px;
    }
    .style2
    {
        width: 356px;
    }
    .style3
    {
        width: 193px;
    }
    .style4
    {
        width: 205px;
    }
</style>

<script type="text/javascript">
//    function chkEmail(sender, args)
//    {
//        args.IsValid = false;
//        $(".txt_Add").each(function ()
//        {
//            if (/^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/.test(this.value))
//            {
//                args.IsValid = true;
//            }
//        });
    //    }
    
    function ClearControlValue()
    {
        var articleType = document.getElementById("<%= txt_ArticleType.ClientID %>");
        var ddl_orderType = document.getElementById('<%= ddl_OrderType.ClientID %>');
        var orderValue = document.getElementById("<%= txt_OrderValue.ClientID %>");
        var suggestCost = document.getElementById("<%= txt_SuggestCost.ClientID %>");
        var articleAddress = document.getElementById("<%= txt_ArticleAddress.ClientID %>");
        var articlePhone = document.getElementById("<%= txt_ArticlePhone.ClientID %>");
        var articleEmail = document.getElementById("<%= txt_ArticleEmail.ClientID%>");
        articleType.value = "";
        // ddl_orderType.val('0');
        //alert($(ddl_orderType).find('option').filter(':selected').text());
        $(ddl_orderType).find('option').filter(':selected').val('0');
        orderValue.value = "";
        suggestCost.value = "";
        articleAddress.value = "";
        articlePhone.value = "";
        articleEmail.value = "";  
    }
    $(document).ready(function ()
    {
        $('.btnArticleOrder').click(function ()
        {
            ClearControlValue();
            var articleId = $(this).attr("id");
            var lbl_ArticleID = document.getElementById('<%= lbl_ArticleID.ClientID %>');
            lbl_ArticleID.value = articleId;
            $('#load').fadeIn();
            $.PageMethod('GetArticleType', onSuccess, onFail, 'articleID', articleId);
            function onSuccess(response)
            {
                var articleType = response.d;
                $('#load').fadeOut();
                var txt_ArticleType = document.getElementById('<%= txt_ArticleType.ClientID %>');
                txt_ArticleType.value = articleType;
                var lbl_MsgArticleOrder = document.getElementById('<%=lbl_MsgArticleOrder.ClientID %>');
                lbl_MsgArticleOrder.innerHTML = '';
            }
            function onFail(response)
            {
                $('#load').fadeOut();
            }
        });


        $('.registerArticle').click(function ()
        {
            var articleID = $("[id$='lbl_ArticleID']").val();
            //        var articleType = $("[id$='txt_ArticleType']").val();
            //var orderType = $("[id$='ddl_OrderType']").val();
            //var orderType = $("[id$='ddl_OrderType']").find('option').filter(':selected').text(); //return text of dropdown
            var orderType = $("[id$='ddl_OrderType']").find('option').filter(':selected').val(); // return value of dropdown
            var orderValue = $("[id$='txt_OrderValue']").val();
            var suggestCost = $("[id$='txt_SuggestCost']").val();
            var address = $("[id$='txt_ArticleAddress']").val();
            var phone = $("[id$='txt_ArticlePhone']").val();
            var email = $("[id$='txt_ArticleEmail']").val();
            //var path = document.URL + '/RegisterArticleOrder';
            var lbl_MsgArticleOrder = document.getElementById('<%=lbl_MsgArticleOrder.ClientID %>');
            lbl_MsgArticleOrder.innerHTML = "";

            orderType = (orderType == 0) ? true : false;

            if (orderValue == "")
            {
                lbl_MsgArticleOrder.innerHTML = 'مقدار سفارش را وارد کنید';
                orderValue.focus();
                return;
            }
            if (suggestCost == "")
            {
                lbl_MsgArticleOrder.innerHTML = 'قیمت پیشنهادی را وارد کنید';
                this.focus();
                return;
            }

            if (phone == "")
            {
                lbl_MsgArticleOrder.innerHTML = 'وارد کردن شماره تماس شما الزامی است';
                this.focus();
                return;
            }

            $('#load').fadeIn();
            $.ajax({
                type: "POST",
                url: "EconomicPartnership.aspx/RegisterArticleOrder",
                data: "{ articleID: '" + articleID + "',orderType: '" + orderType +
                "',orderValue: '" + orderValue + "',suggestCost: '" + suggestCost +
                "',address: '" + address + "',phone: '" + phone +
                "',email: '" + email + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    $('#load').fadeOut();
                    ClearControlValue();
                    var lbl_MsgArticleOrder = document.getElementById('<%=lbl_MsgArticleOrder.ClientID %>');
                    lbl_MsgArticleOrder.innerHTML = response.d;  //'ثبت سفارش شما با موفقیت پایان پذیرفت';
                },
                error: function ()
                {
                    $('#load').fadeOut();
                    alert("خطای مقابل به وقوع پیوست : " + response.d);
                }
            });

//            $.PageMethod('RegisterArticleOrder', onSuccess, onFail, 'articleID', articleID, 'orderType', orderType,
//                    'orderValue', orderValue, 'suggestCost', suggestCost, 'address', address, 'phone', phone, 'email', email);
//            function onSuccess(response)
//            {
//                $('#load').fadeOut();
//                ClearControlValue();
//                var lbl_MsgArticleOrder = document.getElementById('<%=lbl_MsgArticleOrder.ClientID %>');
//                lbl_MsgArticleOrder.innerHTML = response.d;  //'ثبت سفارش شما با موفقیت پایان پذیرفت';
//            }
//            function onFail(response)
//            {
//                $('#load').fadeOut();
//                alert(response.d);
//            }
        });
    });
</script>

<%--<script type="text/javascript">
    $(document).ready(function ()
    {
        loadArticleInfo();
    }); 
</script>
<script type="text/javascript">
    function pageLoad(sender, args)
    {
        if (args.get_isPartialLoad())
        {
            loadArticleInfo();
        }
    }
</script>--%>
<div id="load" align="center" style="display: none" class="loading">
    <img src="../Images/loading.gif" alt="در حال انجام" width="100" height="100" />
    درحال انجام...
</div>
<div class="articleOrder_table">
    <table style="width: 87%">
<%--        <tr>
            <td colspan="4" class="articleOrder_Header">
               ثبت سفارش
            </td>
        </tr>--%>
        <tr>
            <td class="style2">
                نوع کالا</td>
            <td class="style3">
                <asp:TextBox ID="txt_ArticleType" runat="server" Width="200px"
                    CssClass="articleOrder_text orderType" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="style1">
                <asp:Label ID="lbl_ArticleID" runat="server" ForeColor="Black"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                نوع سفارش</td>
            <td class="style3">
                <asp:DropDownList ID="ddl_OrderType" runat="server" 
                    CssClass="ddl">
                    <asp:ListItem Value="0">خرید</asp:ListItem>
                    <asp:ListItem Value="1">فروش</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                مقدار سفارش </td>
            <td class="style3">
                <asp:TextBox ID="txt_OrderValue" runat="server" Width="150px" 
                    CssClass="articleOrder_text"></asp:TextBox>
                    <label style="color: Red">کیلوگرم</label>
            </td>
            <td class="style1">
                قیمت پیشنهادی </td>
            <td class="style4">
                <asp:TextBox ID="txt_SuggestCost" runat="server" Width="150px" 
                    CssClass="articleOrder_text"></asp:TextBox>
                <label style="color: Red">ریال</label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                آدرس</td>
            <td colspan="3">
                <asp:TextBox ID="txt_ArticleAddress" runat="server" Height="66px" TextMode="MultiLine" 
                    Width="500px" CssClass="articleOrder_text"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                تلفن</td>
            <td class="style3">
                <asp:TextBox ID="txt_ArticlePhone" runat="server" Width="200px" 
                    CssClass="articleOrder_text"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                ایمیل</td>
            <td class="style3">
                <asp:TextBox ID="txt_ArticleEmail" runat="server" Width="200px" CssClass="txt_Add articleOrder_text"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:RegularExpressionValidator ID="regExpValEmail" runat="server" ControlToValidate="txt_ArticleEmail"
                    ErrorMessage="ایمیل را صحیح وارد نمایید" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <input type="button" id="btn_RegOrder" value="ثبت" class="btn_RegOrder registerArticle"/>
                     
                &nbsp;<input type="button" id="btn_Exit" value="بازگشت" onclick="showModal('none')" class="btn_RegOrder" />            
            </td>
            <td colspan="2">
                <asp:Label ID="lbl_MsgArticleOrder" runat="server" ForeColor="#333333" 
                    Font-Bold="True"></asp:Label>
                </td>
        </tr>
    </table>
</div>