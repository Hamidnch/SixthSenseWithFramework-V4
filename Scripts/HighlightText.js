function highlight(txt)
{
    $("input:text[id$=" + txt + "]").focus();
    $("input:text[id$=" + txt + "]").select();
}
function keyEnter(btnSend)
{
    var keycode; if (window.event) keycode = window.event.keyCode; else if (e) keycode = e.which;
    /* ENTER PRESSED*/
    if (e.keyCode == 13)
    {
        $("input[id$=" + btnSend + "]").click;
    }
}