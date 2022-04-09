<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSamanPayment.ascx.cs" Inherits="UserControl_SportSamanPayment" %>
<link href="../Styles/CssSport_SettleInternetShetab.css" rel="stylesheet" type="text/css" />
<%--<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>--%>
<%--<script src="../Scripts/PageMethod.js" type="text/javascript"></script>--%>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services>
        <asp:ServiceReference Path="~/PaymentReadyService.asmx" />
    </Services>
</asp:ScriptManager>--%>

<script type="text/javascript">
    // var selected = $('#<= rb_BankPort.ClientID %> input[type=radio]:checked').val();
    function getShetabPath() { return '<%= shetabPath %>'; }
    var shetabPath = getShetabPath();
    var result = "";
    function doOperation()
    {
        highlight('txt_amount');
        keyEnter('btnSend');
    }
    window.onload = doOperation();
    function getResNumber()
    {
        var resNum = "";
        $.ajax({
            type: "POST",
            url: shetabPath + "/CreateReservationNumber",
            data: "{}",
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data)
            {
                //result = data.d;
                resNum = data.d
            }
        });
        //alert(resNum);
        return resNum;
    }
   // function setAmountValue()
   // {           
//            var txt = document.getElementById("txt_amount");
//            $("input:hidden[id$=hdnAmount]").val(txt.value);
//            alert(txt.value);
//            $("input:hidden[id$=hdnResNum]").val(result);
//            alert($("input:hidden[id$=hdnResNum]").val());
            //SavePaymentReady();
            //PaymentReadyService.InsertPaymentReady(result, txt.value, "saman", onSaveSuccess);
 //           $.PageMethod('InsertPaymentReady', onSuccess, onFail, 'reservationNumber', reservationNumber, 'amount', amount, 'bankName', bankName);

//            function onSuccess()
//            {
//                alert("Yes");
//            }
//            function onFail()
//            {
//                alert("Error");
//            }
           // SavePaymentReady();
            //window.opener.self.location.href = "https://acquirer.sb24.com/CardServices/controller";
     //   }
//        function onSaveSuccess(res)
//        {
//            alert("Yes");
//        }
//     $('#<= btnSend.ClientID %>').click(function ()
//     {
//         setAmountValue();

        //     });
//    $(document).ready(function ()
//    {
//        $('#<= btnSend.ClientID %>').live('click', function ()
//    

   // {
    function setAndSave()
    {
        var txt = document.getElementById("txt_amount");
        $("input:hidden[id$=hdnAmount]").val(txt.value);
        //alert(txt.value);
        $("input:hidden[id$=hdnResNum]").val(getResNumber());  
        //alert($("input:hidden[id$=hdnResNum]").val());
//        if (document.getElementById("txt_amount").value == "0" || document.getElementById("txt_amount").value == "")
//        {
//            alert("مبلغ را وارد نمایید");
//            //return false;
//        }
        var reservationNumber = $("input:hidden[id$=hdnResNum]").val();
        //alert("resNum: " + reservationNumber);
        var amount = $("[id$= 'txt_amount']").val();
        //alert(amount);
        var bankID = "3";
        $.ajax({
            type: "POST",
            async: false,
            // cache: false,
            url: shetabPath + "/InsertPayments",
            data: "{ reservationNumber: '" + reservationNumber + "',amount: '" + amount + "',bankID: '" + bankID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            success: function ()
            {
               // alert(reservationNumber);
            },
            error: function (fail)
            {
                // alert("خطا به وقوع پیوست");
            }
        });
        //location.href = "https://acquirer.sb24.com/CardServices/controller";
        // $('<= btnSend.ClientID %>').submit;
        //return false;
    }
//        });
//    });

//     function SavePaymentReady()
//     {
//         var reservationNumber = result;
//         alert(reservationNumber);
//         var amount = $("[id$= 'txt_amount']").val();
//         alert(amount);
//         var bankName = "saman";
//         $.ajax({
//             type: "POST",
//             //async: true,
//             // cache: false,
//             url: shetabPath + "/InsertPaymentReady",
//             data: "{ reservationNumber: '" + reservationNumber + "',amount: '" + amount + "',bankName: '" + bankName + "'}",
//             contentType: "application/json; charset=utf-8",
//             dataType: "json",
//             success: function ()
//             {
//                 alert("Ok");
//             }
//            , error: function (fail)
//            {
//                alert("خطا به وقوع پیوست");
//            }
//         });
//         var reservationNumber = result;
//         alert(reservationNumber);
//         var amount = $("[id$= 'txt_amount']").val();
//         alert(amount);
//         var bankName = "saman";
         //PaymentReadyService.InsertPaymentReady(reservationNumber, amount, "saman", onSuccess);
//         $.ajax({
//             type: "POST",
//             cache: false,
//               url: "/PaymentReadyService.asmx/InsertPaymentReady",
//             data: "{ reservationNumber: '" + reservationNumber + "',amount: '" + amount +
//                "',bankName: '" + bankName + "'}",
//             contentType: "application/json; charset=utf-8",
//             dataType: "json",
//             success: function ()
//             {
//                 alert("Ok");
//             }

             //             ,error: function (fail)
             //             {
             //                 alert("خطا به وقوع پیوست");
             //             }
         // });

        // $.PageMethod('InsertPaymentReady', onSuccess, onFail, 'reservationNumber', reservationNumber, 'amount', amount, 'bankName', bankName);

//         function onSuccess(res)
//         {
//             alert("Yes");
//         }
       //  function onFail()
       //  {
        //     alert("Error");
       //  }
    // }
//     function onSuccess(res)
//     {
//         alert("Yes");
//     }   
</script>

<table style="width: 100%; line-height: 35px; padding: 20px">
    <tr>
        <td>
            بانک سامان
  <%--          <br />
            <img alt="" src="../Images/saman-payment.gif" 
                style="width: 136px; height: 106px" />--%>
        </td>
    </tr>
    <tr>
        <td align="center">
            <span id="lbl_titr">تعیین مبلغ که قصد دارید پرداخت نمائید</span>
        </td>
        <td>
            <span id="lbl_amount">مبلغ: </span>
            <input type="text" value="0" id="txt_amount" onkeydown="javascript:return jsNumbers(event);" />                
            <span id="lbl_rial">ریال</span>
        </td>        
        <td>
            <%--<input type="button" onclick="setAndSave()" value=" پرداخت سامان" />--%>
            <asp:Button ID="btnSend" runat="server" Text="پرداخت" CssClass="sport_BtnForm" OnClientClick="setAndSave();"
                PostBackUrl="https://acquirer.sb24.com/CardServices/controller" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td align="center" colspan="2">           
            &nbsp;
            </td>
    </tr>
</table>
<!-- hiden fields to pass parameters to Saman Bank Server -->
<input type="hidden" name="Amount" id="hdnAmount" value="0" />
<input type="hidden" name="ResNum" id="hdnResNum" value="0" />
<input type="hidden" name="MID" value="<%= MerchantID %>" />
<input type="hidden" name="RedirectURL" value="<%= RedirectURL %>" />
