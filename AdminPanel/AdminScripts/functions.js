$(document).ready(function ()
{
    $("div.sidenav:eq(0)> div.subnav").hide();
    $("div.sidenav:eq(0)> div.navhead").click(function ()
    {
        $(this).parent().find("div.subnav").slideUp("normal");
        $(this).parent().find("div.navhead").removeClass("selected");
        $(this).next().slideToggle("slow");
        $(this).toggleClass("selected")
    });
   /* $("div.subnav:eq(0)> div.navhead2").click(function ()
    {
        $(this).parent().find("div.subnav.ul.submenu.li.navhead2.li.subnav").slideUp("normal");
        $(this).parent().find("div.subnav.ul.submenu.li.navhead2").removeClass("selected");
        $(this).next().slideToggle("slow");
        $(this).toggleClass("selected")
        alert('yes');
    });*/
    $(".close").click(function ()
    {
        $(this).parent().fadeTo(400, 0, function ()
        {
            $(this).slideUp(400)
        }); return false
    });
});