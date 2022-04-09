function storeCaret(textEl)
{
    if (textEl.createTextRange)
        textEl.caretPos = document.selection.createRange().duplicate();
}
var lang = 1;
var farsikey = [
   0x0020, 0x0021, 0x061B, 0x066B, 0x00A4, 0x066A, 0x060C, 0x06AF,
   0x0029, 0x0028, 0x002A, 0x002B, 0x0648, 0x002D, 0x002E, 0x002F,
   0x0030, 0x0031, 0x0032, 0x0033, 0x0034, 0x0035, 0x0036, 0x0037,
   0x0038, 0x0039, 0x003A, 0x0643, 0x003E, 0x003D, 0x003C, 0x061F,
   0x066C, 0x0624, 0x200C, 0x0698, 0x0649, 0x064D, 0x0625, 0x0623,
   0x0622, 0x0651, 0x0629, 0x00BB, 0x00AB, 0x0621, 0x004E, 0x005D,
   0x005B, 0x0652, 0x064B, 0x0626, 0x064F, 0x064E, 0x0056, 0x064C,
   0x0058, 0x0650, 0x0643, 0x062C, 0x005C, 0x0686, 0x00D7, 0x0640,
   0x200D, 0x0634, 0x0630, 0x0632, 0x064A, 0x062B, 0x0628, 0x0644,
   0x0627, 0x0647, 0x062A, 0x0646, 0x0645, 0x067E, 0x062F, 0x062E,
   0x062D, 0x0636, 0x0642, 0x0633, 0x0641, 0x0639, 0x0631, 0x0635,
   0x0637, 0x063A, 0x0638, 0x007D, 0x007C, 0x007B, 0x007E];


function changeLang()
{
    if (lang == 0)
    {
        lang = 1;
        return true;
    }
    else
    {
        lang = 0;
        return true;
    }
}


function FKeyDown()
{
    if (window.event.shiftKey && window.event.altKey)
    {
        if (lang == 0)
        {
            lang = 1;
            window.defaultStatus = "Farsi Mode";
        }
        else
        {
            lang = 0;
            window.defaultStatus = "English Mode";
        }
        return false;
    }
    return true;
}
// change the Farsi
function FKeyPress()
{
    var key = window.event.keyCode;
    // Avoid processing if control or higher than ASCII (i.e., in Arabic Windows)
    if (key < 0x0020 || key >= 0x00FF)
        return;
    if (lang == 1)
    { //If Farsi
        if (key == 0x0020 && window.event.shiftKey) // Shift-space -> ZWNJ
            window.event.keyCode = 0x200C;
        else
            window.event.keyCode = farsikey[key - 0x0020];
    }
    return true;
}

function CheckAlpha(element)
{
    if ((event.keyCode < 1741 && event.keyCode > 1560))
        ;
    else
        if (event.keyCode == 32)
            ;
        else
            event.returnValue = false
    }
    function CheckAlpha_Num(element)
    {

        if ((event.keyCode < 1741 && event.keyCode > 1560))
            ;
        else
            if (event.keyCode == 32)
                ;
            else
                if (event.keyCode < 48 || event.keyCode > 57)
                    ;
                else
                    event.returnValue = false
}