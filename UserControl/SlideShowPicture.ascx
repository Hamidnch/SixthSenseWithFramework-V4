﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SlideShowPicture.ascx.cs" Inherits="UserControl_SlideShowPicture" %>
<div id="content"><div id="slideshow"><img id="imgHome" src="../Images/SlideShowPicture/01.jpg" alt="" class="active" runat="server" /><img id="imgEconomic" src="../Images/SlideShowPicture/02.jpg" alt="" runat="server" /><img id="imgRace" src="../Images/SlideShowPicture/03.jpg" alt="" runat="server" /><img id="imgEducate" src="../Images/SlideShowPicture/04.jpg" alt="" runat="server" /><img id="imgContactUs" src="../Images/SlideShowPicture/05.jpg" alt="" runat="server" /></div></div>
<script src="../Scripts/globalVariables.js" type="text/javascript"></script>
<script type="text/javascript">function slideSwitch(){var $active = $('#slideshow IMG.active');if ($active.length == 0)$active = $('#slideshow IMG:first');var $next = $active.next().length ? $active.next() : $('#slideshow IMG:first');$active.addClass('first-active');
if (!flag){$next.css({ opacity: 0.3 }).addClass('active').animate({ opacity: 5.0 }, 3000, function (){$active.removeClass('active first-active');});}}$(function (){setInterval("slideSwitch()", 5000);});</script>