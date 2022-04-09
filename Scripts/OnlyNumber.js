function OnlyNumberSign(e, object)
{
    if (e.shiftKey || e.ctrlKey || e.altKey)
    { 
        e.preventDefault(); // Prevent character input
    }
    var KeyID = (window.event) ? event.keyCode : e.which;

    if ((KeyID >= 65 && KeyID <= 90) || (KeyID >= 97 && KeyID <= 122) || (KeyID >= 33 && KeyID <= 47 && KeyID != 45) ||
        (KeyID >= 58 && KeyID <= 64) || (KeyID >= 91 && KeyID <= 96) || (KeyID >= 123 && KeyID <= 126))
    {
        e.preventDefault();
    }
    if (KeyID == 32)
    {
        e.preventDefault();
    }
    if ((KeyID == 45))
    {
        var strvalue = object.value;
        if (strvalue.indexOf('-') > 0)
            e.preventDefault();
    }
}

function jsIsUserFriendlyChar(val, step)
{  
    // Backspace, Tab, Enter, Insert, and Delete
    if (val == 8 || val == 9 || val == 13 || val == 45 || val == 46)
    {
        return true;
    }
    // Ctrl, Alt, CapsLock, Home, End, and Arrows
    if ((val > 16 && val < 21) || (val > 34 && val < 41))
    {
        return true;
    }
    keychar = String.fromCharCode(val);
    if (keychar == '-') return true;
    if (step == "Decimals")
    {
        if (val == 190 || val == 110)
        {
            return true;
        }
    }
    // The rest
    return false;
}

function jsNumbers(e)
{
    var evt = (e) ? e : window.event;
    var key = (evt.keyCode) ? evt.keyCode : evt.which;
    if (key != null)
    {
        key = parseInt(key, 10);
        if ((key < 48 || key > 57) && (key < 96 || key > 105))
        {
           // var strvalue = object.value;
            if (!jsIsUserFriendlyChar(key, "Numbers"))
            {
                return false;
            }
//            if (strvalue.indexOf("-") > 0)
//                return false;
        }
        else
        {
            if (evt.shiftKey)
            {
                return false;
            }            
        }
    }
    return true;
}

//function numbersonly(e, decimal)
//{
//    var key;
//    var keychar;

//    if (window.event)
//        key = window.event.keyCode;
//    else if (e)
//        key = e.which;
//    else
//        return true;

//    keychar = String.fromCharCode(key);

//    if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13) || (key == 27))
//        return true;
//    else if ((("-0123456789").indexOf(keychar) > -1))
//        return true;
//    else if (decimal && (keychar == "."))
//        return true;
//    else
//        return false;
//}
//function mymy(e)
//{
//    if (e.shiftKey || e.ctrlKey || e.altKey)
//    { // if shift, ctrl or alt keys held down
//        e.preventDefault();         // Prevent character input
//    } else
//    {
//        var n = (window.event) ? event.keyCode : e.which; //e.keyCode;
//        if (!((n == 8)              // backspace
//        || (n == 46)                // delete
//        || (n == 45)                // hyphen
//        || (n >= 35 && n <= 40)     // arrow keys/home/end
//        || (n >= 48 && n <= 57)     // numbers on keyboard
//        || (n >= 96 && n <= 105))   // number on keypad
//        )
//        {
//            e.preventDefault();     // Prevent character input
//        }
//    }
//}
//    function validate(evt)
//    {
//        var theEvent = evt || window.event;
//        var key = theEvent.keyCode || theEvent.which;
//        key = String.fromCharCode(key);
//        var regex = /\-[0-9]/;        
//        if (!regex.test(key))
//        {
//            theEvent.returnValue = false;
//            if (theEvent.preventDefault) theEvent.preventDefault();
//        }
//    }
//    function validateNumber(evt)
//    {
//        var theEvent = evt || window.event;
//        var key = theEvent.keyCode || theEvent.which;
//        if ((key < 48 || key > 57) && !(key == 8 || key == 9 || key == 13 || key == 37 || key == 39 || key == 46))
//        {
//            theEvent.returnValue = false;
//            if (theEvent.preventDefault) theEvent.preventDefault();
//        }
//    }
