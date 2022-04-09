<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSelectRacing.ascx.cs" Inherits="UserControl_SportSelectRacing" %>
<link href="../Styles/CSSSportSelectRacing.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSCountDown.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery.lwtCountdown-1.0.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services><asp:ServiceReference Path="~/SelectRacingDateTimeService.asmx" /></Services>
</asp:ScriptManager>
<div id="selectRacing"><div class="activeRacingCharge"></div>
    <div class="dl_ActiveRacing">        
<%--        <asp:Label ID="lbl_DateNow" runat="server" Text="Label" ForeColor="White"></asp:Label><br />
        <asp:Label ID="lb_TimeNow" runat="server" Text="Label" ForeColor="White"></asp:Label>--%>
        <asp:Label ID="lbl_today" CssClass="lbl_Hidden" runat="server"></asp:Label>
        <asp:Label ID="lbl_TodayYear" CssClass="lbl_Hidden" runat="server"></asp:Label>
        <asp:Label ID="lbl_TodayMonth" CssClass="lbl_Hidden" runat="server"></asp:Label>
        <asp:Label ID="lbl_TodayDay" CssClass="lbl_Hidden" runat="server"></asp:Label>
        <asp:Label ID="lbl_TodayHour" CssClass="lbl_Hidden" runat="server"></asp:Label>
        <asp:Label ID="lbl_TodayMin" CssClass="lbl_Hidden" runat="server"></asp:Label>
        <asp:Label ID="lbl_TodaySec" CssClass="lbl_Hidden" runat="server"></asp:Label>
        <span></span>
        <asp:DataList ID="dl_ActiveRacing" runat="server" RepeatDirection="Horizontal" RepeatColumns="2"
            OnItemDataBound="dl_ActiveRacing_ItemDataBound">
            <ItemStyle CssClass="activeRacingItem"></ItemStyle>
                <ItemTemplate>
                <fieldset onclick="window.location.href='<%# Eval("RacingInfo_ID", "Sport_Racing.aspx?racingInfoID={0}") %>'">
                    <asp:Label ID="LblID" CssClass="activeRacingTitr lbl_Hidden" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>' Visible="false"></asp:Label>
                    <%--<a href='<%# Eval("RacingInfo_ID", "Sport_Racing.aspx?racingInfoID={0}") %>'>--%>
                    <img src="../Images/Sport/Sport_Racing/award00.gif" style="width:50px; height:50px" alt=""/><%--</a>--%>
                    <asp:HyperLink ID="hl_RaceTitle" runat="server" CssClass="activeRacingTitr" NavigateUrl='<%# Eval("RacingInfo_ID", "~/Sport/Sport_Racing.aspx?racingInfoID={0}") %>' ><%# Eval("Race_Title", "{0}")%></asp:HyperLink><br />
                    <asp:Label ID="Label2" CssClass="activeRacingSubItem" runat="server" Text="هفته"></asp:Label>:<asp:Label ID="Label5" runat="server" Text='<%# Eval("RacingInfo_Details","{0}") %>'></asp:Label><br />
                    <asp:Label ID="Label3" CssClass="activeRacingSubItem" runat="server" Text="مهلت"></asp:Label>:<asp:Label ID="Label6" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("RacingInfo_EndRespiteDate","{0}"), "S", false) %>'></asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" CssClass="activeRacingSubItem" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("RacingInfo_EndRespiteTime", "ساعت: {0}")) %>'></asp:Label><br />
                    <asp:Label ID="Label8" CssClass="activeRacingSubItem" runat="server" Text="Respite Date"></asp:Label>:<asp:Label ID="Label9" runat="server" Text='<%# Eval("RacingInfo_EndRespiteDate","{0:yyyy/MM/dd}") %>'></asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label10" CssClass="activeRacingSubItem" runat="server" Text='<%# Eval("RacingInfo_EndRespiteTime", "Time: {0}") %>'></asp:Label>
                    <%-- <asp:HyperLink ID="hl_EnterRacing" CssClass="activeRacingEnter" runat="server">ورود</asp:HyperLink>--%>
                    <hr style="width:353px; text-align: right"/>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("RacingInfo_EndRespiteDate","{0:MM/dd/yyyy}") %>' CssClass="lbl_Hidden"></asp:Label>
                    <asp:Label ID="Label7" CssClass="lbl_Hidden" runat="server" Text='<%# Eval("RacingInfo_EndRespiteTime") %>'></asp:Label>
<%--                    <br />                    
                    <asp:Label ID="Label13" CssClass="activeRacingSubItem" runat="server" Text="First Date"></asp:Label><asp:Label ID="Label11" runat="server" Text='<%# Eval("RacingInfo_StartRespiteDate") %>'></asp:Label><br />
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("RacingInfo_StartRespiteTime", "Time:{0}") %>'></asp:Label>--%>

<%--                    <asp:Label ID="lbl_LastYear" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lbl_LastMonth" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lbl_LastDay" runat="server" Text="Label"></asp:Label>--%>
<%--                    <asp:Label ID="lbl_LastHour" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lbl_LastMinute" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lbl_LastSecond" runat="server" Text="Label"></asp:Label>--%>
                    <div style="position:relative; left: 130px;">
                        <div id='countdown_dashboard<%# Eval("RacingInfo_ID", "{0}") %>'>
                        <div class="dash weeks_dash">
                            <span class="dash_title">هفته</span>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                        </div>
                        <div class="dash days_dash">
                            <span class="dash_title">روز</span>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                        </div>
                        <div class="dash hours_dash">
                            <span class="dash_title">ساعت</span>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                        </div>
                        <div class="dash minutes_dash">
                            <span class="dash_title">دقیقه</span>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                        </div>
                        <div class="dash seconds_dash">
                            <span class="dash_title">ثانیه</span>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                            <div class="digit">
                                <div style="display: none;" class="top">0</div>
                                <div style="display: block;" class="bottom">0</div>
                            </div>
                        </div>
                        </div>
                    </div>
                    </fieldset>
                </ItemTemplate>
        </asp:DataList>
        <br /><br />
        <hr />
        <div class="divBtnForm">
            <input type="button" class="btnForm" value="برگشت" onclick="javascript:window.location.href='Sport_Home.aspx'" />
<%--            <asp:Button ID="btn_Exit" runat="server" Text="برگشت"  CssClass="btnForm" onclick="btn_Exit_Click"/>  --%>          
        </div>
    </div>
</div>

<script type="text/javascript">
    var year_Today, month_Today , day_Today , hour_Today , min_Today , sec_Today;
    //var LastYear, LastMonth, LastDay; var M1 = 31, M2 = 28, M3 = 31, M4 = 30, M5 = 31, M6 = 30, M7 = 31, M8 = 31, M9 = 30, M10 = 31, M11 = 30, M12 = 31;
    function getToday() { SelectRacingDateTimeService.GetToday(onTodaySuccess); }
    function onTodaySuccess(response)
    {
        var today = response;
        year_Today = today.Year;
        month_Today = today.Month;
        day_Today = today.Day;
        hour_Today = today.Hour;
        min_Today = today.Minute;
        sec_Today = today.Second;
        Go();
        //setTimeout( Go(), 10);
    }
    function isValidDate(dateStr)
    {
        // Checks for the following valid date formats:
        // MM/DD/YY   MM/DD/YYYY   MM-DD-YY   MM-DD-YYYY
        var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/; // requires 4 digit year
        var matchArray = dateStr.match(datePat); // is the format ok?
//        if (matchArray == null)
//        {
//            alert(dateStr + " Date is not in a valid format.")
//            return false;
//        }
        month = matchArray[1]; // parse date into variables
        day = matchArray[3];
        year = matchArray[4];
//        if (month < 1 || month > 12)
//        { // check month range
//            alert("Month must be between 1 and 12.");
//            return false;
//        }
//        if (day < 1 || day > 31)
//        {
//            alert("Day must be between 1 and 31.");
//            return false;
//        }
//        if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31)
//        {
//            alert("Month " + month + " doesn't have 31 days!")
//            return false;
//        }
//        if (month == 2)
//        { // check for february 29th
//            var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
//            if (day > 29 || (day == 29 && !isleap))
//            {
//                alert("February " + year + " doesn't have " + day + " days!");
//                return false;
//            }
//        }
        return true;
    }
    function isValidTime(timeStr)
    {
        // Checks if time is in HH:MM:SS AM/PM format.
        // The seconds and AM/PM are optional.

        var timePat = /^(\d{1,2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;

        var matchArray = timeStr.match(timePat);
//        if (matchArray == null)
//        {
//            alert("Time is not in a valid format.");
//            return false;
//        }
        hour = matchArray[1];
        minute = matchArray[2];
        second = matchArray[4];
        ampm = matchArray[6];

        if (second == "") { second = null; }
        if (ampm == "") { ampm = null }

//        if (hour < 0 || hour > 23)
//        {
//            alert("Hour must be between 1 and 12. (or 0 and 23 for military time)");
//            return false;
//        }
//        if (hour <= 12 && ampm == null)
//        {
//            if (confirm("Please indicate which time format you are using.  OK = Standard Time, CANCEL = Military Time"))
//            {
//                alert("You must specify AM or PM.");
//                return false;
//            }
//        }
//        if (hour > 12 && ampm != null)
//        {
//            alert("You can't specify AM or PM for military time.");
//            return false;
//        }
//        if (minute < 0 || minute > 59)
//        {
//            alert("Minute must be between 0 and 59.");
//            return false;
//        }
//        if (second != null && (second < 0 || second > 59))
//        {
//            alert("Second must be between 0 and 59.");
//            return false;
//        }
        return true;
    }
    var years, months, days, hours, mins, secs;
    function dateDiff(firstdate, firsttime, seconddate, secondtime)
    {
        date1 = new Date();
        date2 = new Date();
        diff = new Date();
        if (isValidDate(firstdate) && isValidTime(firsttime))
        { // Validates first date 
            date1temp = new Date(firstdate + " " + firsttime);
            date1.setTime(date1temp.getTime());
        }
        else return false; // otherwise exits

        if (isValidDate(seconddate) && isValidTime(secondtime))
        { // Validates second date 
            date2temp = new Date(seconddate + " " + secondtime);
            date2.setTime(date2temp.getTime());
        }
        else return false; // otherwise exits
        // sets difference date to difference of first date and second date
        diff.setTime(Math.abs(date1.getTime() - date2.getTime()));
        timediff = diff.getTime();
        //alert(timediff);
//        weeks = Math.floor(timediff / (1000 * 60 * 60 * 24 * 7));
//        timediff -= weeks * (1000 * 60 * 60 * 24 * 7);
//        days = Math.floor(timediff / (1000 * 60 * 60 * 24));
//        timediff -= days * (1000 * 60 * 60 * 24);
//        hours = Math.floor(timediff / (1000 * 60 * 60));
//        timediff -= hours * (1000 * 60 * 60);
//        mins = Math.floor(timediff / (1000 * 60));
//        timediff -= mins * (1000 * 60);
//        secs = Math.floor(timediff / 1000);
//        timediff -= secs * 1000;
//        alert(weeks + " weeks, " + days + " days, " + hours + " hours, " + mins + " minutes, and " + secs + " seconds");

        years = Math.floor(timediff / (1000 * 365 * 60 * 60 * 24));
        //alert(years);
        months = Math.floor((timediff - years * 1000 * 365 * 60 * 60 * 24) / (1000 * 30 * 60 * 60 * 24));
        days = Math.floor((timediff - years * 1000 * 365 * 60 * 60 * 24 - months * 1000 * 30 * 60 * 60 * 24) / (1000 * 60 * 60 * 24));
        timediff -= days * (1000 * 60 * 60 * 24);
        hours = Math.floor(timediff / (1000 * 60 * 60));
        timediff -= hours * (1000 * 60 * 60);
        mins = Math.floor(timediff / (1000 * 60));
        timediff -= mins * (1000 * 60);
        secs = Math.floor(timediff / 1000);
        timediff -= secs * 1000;

        //alert(years + " years, " + months + " months, " + days + " days, " + hours + " hours, " + mins + " minutes, and " + secs + " seconds");
        return false; // form should never submit, returns false
    }
//    function getLastDate(racingInfoID){SelectRacingDateTimeService.GetLastDateByRacingInfoID(racingInfoID, onLastDateSuccess);}
//    function onLastDateSuccess(response){var lastDate = response;LastYear = response.Year;LastMonth = response.Month;LastDay = response.Day; $('span[id$=lbl_LastYear]').text(lastDate.Year);$('span[id$=lbl_LastMonth]').text(lastDate.Month);$('span[id$=lbl_LastDay]').text(lastDate.Day);}
    $(document).ready(function ()
    {
        $(".activeRacingCharge").click(function ()
        { window.location.href = "Sport_SettleIndex.aspx"; });
        getToday();
    });

    function Go()
    {
        var lbl_Today = $('span[id$=lbl_today]').text();
        // var PmAmNow = (hour_Today > 11) ? "PM" : "AM";
        day_Today = (day_Today < 10) ? "0" + day_Today : day_Today;
        month_Today = (month_Today < 10) ? "0" + month_Today : month_Today;
        hour_Today = (hour_Today < 10) ? "0" + hour_Today : hour_Today;
        min_Today = (min_Today < 10) ? "0" + min_Today : min_Today;
        var firstdate = month_Today + "/" + day_Today + "/" + year_Today;
        var firsttime = hour_Today + ":" + min_Today;
        //alert("First Date: " + firstdate);
        //alert("First Time: " + firsttime);
        //var nowDate = month_Today + "/" + day_Today + "/" + year_Today + " " + hour_Today + ":" + min_Today;  //+ " " + PmAmNow;
        //alert(nowDate);
        //alert(month_Today);alert(day_Today);alert(year_Today);   alert(hour_Today);alert(min_Today);
//        var st = "9/20/2011 12:00:00 AM"; var letters = []; for (var i = 1; i <= st.length; i++){letters[i] = st.substring((i - 1), i);} for (var i = 1; i <= st.length; i++){alert( i - 1 + " = " + letters[i]);}
        $('div[id*=countdown_dashboard]').each(function (index, item)
        {
            var lbl_Date = $(item).closest("td").find('span[id$=Label4]').html();
            //var racingInfo_ID = $(item).closest("td").find('span[id$=LblID]').text(); alert(racingInfo_ID); //getLastDate(racingInfo_ID);
            var lbl_Time = $(item).closest("td").find('span[id$=Label7]').html();
            //var day_Today = parseInt(lbl_Today.substr(8, 2));var month_Today = parseInt(lbl_Today.substr(5, 2));var year_Today = parseInt(lbl_Today.substr(0, 4));var hour_Today = parseInt(lbl_Today.substr(11, 2));var min_Today = parseInt(lbl_Today.substr(14, 2));var sec_Today = 0;var sss = lbl_Today.substr(20, 3);

            var day_Last = parseInt(lbl_Date.substr(2, 3)); //alert("dayLast = " + day_Last); //8,2
            var month_Last = parseInt(lbl_Date[0]); //alert("monthLast = " + month_Last); //6,2
            var year_Last = parseInt(lbl_Date.substr(5, 8)); //alert("yearLast = " + year_Last); //0,4
            var hour_Last = parseInt(lbl_Time.substr(0, 2)); //alert("hourLast = " + hour_Last); //0,2
            var min_Last = parseInt(lbl_Time.substr(3, 5)); //alert("minLast = " + min_Last); //3,5    

            var year = year_Last - year_Today; if (year < 0) year = 0; if (isNaN(year)) year = 0;
            var month = month_Last - month_Today; if (month < 0) month = 0; if (isNaN(month)) month = 0;
            var day = day_Last - day_Today; if (day < 0) day = 0; if (isNaN(day)) day = 0;
            var hour = hour_Last - hour_Today; if (hour < 0) hour = 0; if (isNaN(hour)) hour = 0;
            var min = min_Last - min_Today; if (min < 0) min = 0; if (isNaN(min)) min = 0;
            var sec = 0;
            //alert("year = " + year); alert("month = " + month); alert("day = " + day); alert("hour = " + hour); alert("min = " + min);

            //var PmAmLast = (hour_Last > 11) ? "PM" : "AM";
            //var lastDate = month_Last + "/" + day_Last + "/" + year_Last + " " + hour_Last + ":" + min_Last; //+ " " + PmAmLast;
            //var lastDate = lbl_Date + " " + lbl_Time;
            //alert(lastDate);
            var seconddate = lbl_Date;
            var secondtime = lbl_Time;
            //alert("Second Date: " + seconddate);
            //alert("Second Time: " + secondtime);
            dateDiff(firstdate,firsttime, seconddate, secondtime);
            $(item).countDown({
                targetOffset: {
                    'day': days,
                    'month': months,
                    'year': years,
                    'hour': hours,
                    'min': mins,
                    'sec': secs
                },
                onComplete: function () { $(item).closest("td").fadeOut("1000"); $(item).closest("td").remove(); }
            });
        });
    }
    //});
</script>