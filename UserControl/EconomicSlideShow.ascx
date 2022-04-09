<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicSlideShow.ascx.cs" Inherits="UserControl_EconomicSlideShow" %>
<%--<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>--%>
<script src="../Scripts/globalVariables.js" type="text/javascript"></script>
<script type="text/javascript">
    function slideSwitch()
    {
        var $active = $('#slideshow IMG.active');
        if ($active.length == 0)
            $active = $('#slideshow IMG:first');

        var $next = $active.next().length ? $active.next() : $('#slideshow IMG:first');

        $active.addClass('first-active');

        if (!flag)
        {
            $next.css({ opacity: 0.3 }).addClass('active').animate({ opacity: 5.0 }, 3000, function ()
            {
                $active.removeClass('active first-active');
            });
        }
    }

    $(function ()
    {
        setInterval("slideSwitch()", 5000);
    });
</script>
<div id="content">
    <div id="slideshow">
        <img id="imgEco_Home" src="~/Images/Economic/Economic_SlideShow/1.jpg" alt="" class="active" runat="server" />
        <img id="imgEco_Analysis" src="~/Images/Economic/Economic_SlideShow/2.jpg" alt="" runat="server" />
        <img id="imgEco_Services" src="~/Images/Economic/Economic_SlideShow/3.jpg" alt="" runat="server" />
        <img id="imgEco_Partnership" src="~/Images/Economic/Economic_SlideShow/4.jpg" alt="" runat="server" />
        <img id="imgEco_ContactUs" src="~/Images/Economic/Economic_SlideShow/5.jpg" alt="" runat="server" />
    </div>
</div>
