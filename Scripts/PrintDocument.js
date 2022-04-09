function CallPrint(strid, foreColor, backColor)
{
    var prtContent = document.getElementById(strid);
    var WinPrint = window.open('', '', 'right=0,top=0,width=800,height=600,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.dir = 'rtl';
    //        WinPrint.document.getElementById("gridDiv").style.fontFamily = "Tahoma";
    WinPrint.document.write("<div style='font-family:Tahoma;color:" + foreColor + ";background-color:" + backColor + ";text-align:center;;direction:rtl'>" + prtContent.innerHTML + "</div>");
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
}