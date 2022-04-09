<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserRegisteration.ascx.cs" Inherits="UserControl_UserRegisteration"%>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %><%@ Register Assembly="FlashControl" Namespace="Bewise.Web.UI.WebControls" TagPrefix="Bewise" %><%@ Register Src="MenuPublic.ascx" TagName="MenuPublic" TagPrefix="uc1" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false"></asp:ScriptManager>
<div id="UserRegister"><div class="memberWrapper" id="memberWrapper"><div class="memberHeader" dir="rtl"><Bewise:FlashControl ID="FlashControl1" runat="server" Height="139px" MovieUrl="~/Flash/MemberHeader.swf" PluginsPage="" Quality="Autohigh" Width="935px" WMode="Transparent" Loop="True" SAlign="Top" Scale="Exactfit" Align="Left" BgColor="Black" /></div><div class="memberMenu"><uc1:MenuPublic ID="MenuPublic1" runat="server" /></div>
<asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate><div class="memberError"><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="کلمه عبور با تکرار آن مطابقت ندارد" Font-Size="10px" ForeColor="Yellow"></asp:CompareValidator><asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" ErrorMessage="ایمیل  با تکرار آن مطابقت ندارد" Font-Size="10px" ForeColor="Red"></asp:CompareValidator><asp:RegularExpressionValidator ID="regExpValEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="ایمیل را صحیح وارد نمایید" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="10px" ForeColor="Yellow"></asp:RegularExpressionValidator></div><div class="msg"><asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></div>
<div class="memberMain"><div class="memberCol1"><div class="col1Content"><table style="width: 100%"><tr><td style="height: 15px; width: 165px;" class="col1"><asp:Label ID="UserNameLabel5" runat="server" AssociatedControlID="txtFirstName" CssClass="lbl"> نام</asp:Label></td>
<td colspan="2" style="height: 15px" class="col2"><asp:TextBox ID="txtFirstName" runat="server" onkeypress="return keyEnter(this,event)" validation="required" TabIndex="1"></asp:TextBox></td></tr>
 <tr><td style="width: 165px;" class="col1"><asp:Label ID="UserNameLabel3" runat="server" AssociatedControlID="txtLastName" CssClass="lbl">نام خانوادگی</asp:Label></td>
<td colspan="2" style="height: 22px" class="col2"><asp:TextBox ID="txtLastName" runat="server" onkeypress="return keyEnter(this,event)" TabIndex="2"></asp:TextBox></td></tr>
 <tr><td style="height: 15px; width: 165px; table-layout: fixed" class="col1"><asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtUserName" CssClass="lblMust"> نام کاربری </asp:Label>
<asp:RequiredFieldValidator ID="regFieldValUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="*" SetFocusOnError="True" ForeColor="Yellow"></asp:RequiredFieldValidator></td>
<td class="col2"><asp:TextBox ID="txtUserName" runat="server" lang="en" ViewStateMode="Disabled" TabIndex="3" CssClass="txtUrgent" onkeypress="return checkChar(event,5);"></asp:TextBox></td>
<td style="width: 33px; min-width: 33px"><span id="msg"></span></td></tr><tr><td style="width: 165px" class="col1"><asp:Label ID="UserNameLabel0" runat="server" AssociatedControlID="txtPassword" CssClass="lblMust">رمز عبور</asp:Label>
<asp:RequiredFieldValidator ID="regFieldValPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" SetFocusOnError="True" ForeColor="Yellow"></asp:RequiredFieldValidator></td>
<td colspan="2" class="col2"><asp:TextBox ID="txtPassword" runat="server" CssClass="txtUrgent" TextMode="Password" TabIndex="4" ViewStateMode="Disabled" onkeypress="return checkChar(event,4,1);"></asp:TextBox></td></tr>
 <tr><td style="width: 165px" class="col1"><asp:Label ID="UserNameLabel1" runat="server" AssociatedControlID="txtConfirmPassword" CssClass="lblMust">تکرار رمز عبور</asp:Label><asp:RequiredFieldValidator ID="regFieldValPassword0" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="*" SetFocusOnError="True" ForeColor="Yellow"></asp:RequiredFieldValidator></td>
<td colspan="2" class="col2"><asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="txtUrgent" TextMode="Password" TabIndex="5" ViewStateMode="Disabled" onkeypress="return checkChar(event,4,1);"></asp:TextBox></td></tr>
<tr><td style="width: 165px" class="col1"><asp:Label ID="UserNameLabel2" runat="server" AssociatedControlID="txtEmail" CssClass="lblMust">ایمیل</asp:Label><asp:RequiredFieldValidator ID="regFieldValEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" SetFocusOnError="True" ForeColor="Yellow"></asp:RequiredFieldValidator></td>
<td class="col2"><asp:TextBox ID="txtEmail" runat="server" CssClass="txtUrgent" TabIndex="6" ViewStateMode="Disabled" onkeypress="return checkChar(event,5);"></asp:TextBox></td>
<td style="width: 33px;"><span id="emailSpan"></span></td></tr><tr><td style="width: 165px" class="col1"><asp:Label ID="UserNameLabel15" runat="server" AssociatedControlID="txtEmail" CssClass="lblMust">تکرارایمیل</asp:Label>
<asp:RequiredFieldValidator ID="regFieldValDupEmail" runat="server" ControlToValidate="txtConfirmEmail" ErrorMessage="*" SetFocusOnError="True" ForeColor="Yellow"></asp:RequiredFieldValidator></td>
<td colspan="2" class="col2"><asp:TextBox ID="txtConfirmEmail" runat="server" CssClass="txtUrgent" TabIndex="7" ViewStateMode="Disabled" onkeypress="return checkChar(event,5);"></asp:TextBox></td></tr>
<tr><td style="width: 165px; height: 21px;" class="col1"><asp:Label ID="UserNameLabel7" runat="server" AssociatedControlID="ddlYear" CssClass="lbl">تاریخ تولد</asp:Label></td>
<td colspan="2" style="height: 21px" class="col2"><asp:DropDownList ID="ddlDay" runat="server" Width="55px" CssClass="dropdown" TabIndex="8"><asp:ListItem>&lt;روز&gt;</asp:ListItem>
<asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
<asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem><asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem>
<asp:ListItem>25</asp:ListItem><asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem><asp:ListItem>31</asp:ListItem></asp:DropDownList>
<asp:DropDownList ID="ddlMonth" runat="server" Width="55px" CssClass="dropdown" TabIndex="9"><asp:ListItem>&lt;ماه&gt;</asp:ListItem><asp:ListItem Value="1">فروردین</asp:ListItem><asp:ListItem Value="2">اردیبهشت</asp:ListItem><asp:ListItem Value="3">خرداد</asp:ListItem><asp:ListItem Value="4">تیر</asp:ListItem><asp:ListItem Value="5">مرداد</asp:ListItem>
<asp:ListItem Value="6">شهریور</asp:ListItem><asp:ListItem Value="7">مهر</asp:ListItem><asp:ListItem Value="7">آبان</asp:ListItem><asp:ListItem Value="8">آذر</asp:ListItem><asp:ListItem Value="9">دی</asp:ListItem><asp:ListItem Value="11">بهمن</asp:ListItem><asp:ListItem Value="12">اسفند</asp:ListItem></asp:DropDownList>
<asp:DropDownList ID="ddlYear" runat="server" Width="60px" CssClass="dropdown" TabIndex="10"><asp:ListItem>&lt;سال&gt;</asp:ListItem></asp:DropDownList></td></tr>
<tr><td style="width: 165px" class="col1"><span id="captchaSpan"></span>&nbsp;<asp:Label ID="UserNameLabel10" runat="server" AssociatedControlID="ddlSex" CssClass="lbl">جنسیت</asp:Label></td>
<td colspan="2" class="col2"><asp:DropDownList ID="ddlSex" runat="server" CssClass="dropdown" TabIndex="11" Width="80px"><asp:ListItem>مرد</asp:ListItem><asp:ListItem>زن</asp:ListItem></asp:DropDownList></td></tr></table></div></div>
<div class="memberCol2"><div class="col2Content"><table style="width: 100%; height: 301px;"><tr><td class="col1" style="width: 87px"><asp:Label ID="UserNameLabel11" runat="server" AssociatedControlID="ddlCountry" CssClass="lbl">کشور</asp:Label></td>
<td class="col2"><asp:DropDownList ID="ddlCountry" runat="server" CssClass="dropdown" TabIndex="12"><asp:ListItem>ایران</asp:ListItem></asp:DropDownList></td></tr>
<tr><td class="col1" style="width: 87px"><asp:Label ID="UserNameLabel12" runat="server" AssociatedControlID="ddlCity" CssClass="lbl">استان</asp:Label></td>
<td class="col2"><asp:DropDownList ID="ddlCity" runat="server" CssClass="dropdown" TabIndex="13">
<asp:ListItem>قزوین</asp:ListItem><asp:ListItem>تهران</asp:ListItem><asp:ListItem>اصفهان</asp:ListItem><asp:ListItem>تبریز</asp:ListItem>
<asp:ListItem>شیراز</asp:ListItem><asp:ListItem>خوزستان</asp:ListItem><asp:ListItem>اهواز</asp:ListItem><asp:ListItem>اردبیل</asp:ListItem>
<asp:ListItem>سمنان</asp:ListItem><asp:ListItem>کهکلویه و بویراحمد</asp:ListItem><asp:ListItem>سیستان و بلوچستان</asp:ListItem>
<asp:ListItem>گیلان</asp:ListItem><asp:ListItem>مازنداران</asp:ListItem><asp:ListItem>فارس</asp:ListItem><asp:ListItem>كرمانشاه</asp:ListItem>
<asp:ListItem>كردستان</asp:ListItem><asp:ListItem>ياسوج</asp:ListItem><asp:ListItem>يزد</asp:ListItem><asp:ListItem>زنجان</asp:ListItem>
<asp:ListItem>اروميه</asp:ListItem><asp:ListItem>گيلان</asp:ListItem><asp:ListItem>مشهد</asp:ListItem><asp:ListItem>اصفهان</asp:ListItem></asp:DropDownList></td></tr>
<tr><td class="col1" style="width: 87px"><asp:Label ID="UserNameLabel4" runat="server" AssociatedControlID="txtPhone" CssClass="lbl">شماره تلفن</asp:Label></td>
    <td class="col2"><asp:TextBox ID="txtPhone" runat="server" CssClass="txt" TabIndex="14"></asp:TextBox></td></tr>
<tr><td class="col1" style="width: 87px"><asp:Label ID="UserNameLabel6" runat="server" AssociatedControlID="txtMobile" CssClass="lbl">شماره موبایل</asp:Label></td>
    <td class="col2"><asp:TextBox ID="txtMobile" runat="server" CssClass="txt" TabIndex="15"></asp:TextBox></td></tr>
<tr><td class="col1" style="height: 63px; width: 87px;"><asp:Label ID="UserNameLabel8" runat="server" AssociatedControlID="txtAddress" CssClass="lbl">آدرس</asp:Label></td>
    <td class="col2"><asp:TextBox ID="txtAddress" runat="server" CssClass="textarea" TabIndex="16" Height="63px" Width="171px" TextMode="MultiLine"></asp:TextBox></td></tr>
<tr><td class="col1" style="width: 87px"><asp:Label ID="UserNameLabel13" runat="server" AssociatedControlID="txtAccountName" CssClass="lbl">نام دارنده حساب</asp:Label></td>
    <td class="col2"><asp:TextBox ID="txtAccountName" runat="server" TabIndex="17"></asp:TextBox></td></tr>
<tr><td class="col1" style="width: 87px"><asp:Label ID="lbltxtAccountFamily" runat="server" AssociatedControlID="txtAccountFamily" CssClass="lbl">نام خانوادگی</asp:Label></td>
    <td class="col2"><asp:TextBox ID="txtAccountFamily" runat="server" TabIndex="18"></asp:TextBox></td></tr>
<tr><td class="col1" style="width: 87px"><asp:Label ID="UserNameLabel14" runat="server" AssociatedControlID="txtAccountNumber" CssClass="lbl">شماره حساب</asp:Label></td>
    <td class="col2"><asp:TextBox ID="txtAccountNumber" runat="server" CssClass="txt" TabIndex="19"></asp:TextBox></td></tr>
<tr><td class="col1" style="width: 87px"><asp:Label ID="lblBankName" runat="server" AssociatedControlID="ddlBankName" CssClass="lbl">نزد بانک</asp:Label></td>
    <td class="col2"><asp:DropDownList ID="ddlBankName" runat="server" CssClass="dropdown" TabIndex="20"><asp:ListItem>سیبای ملی</asp:ListItem><asp:ListItem>سپهر صادرات</asp:ListItem><asp:ListItem>جام ملت</asp:ListItem><asp:ListItem>مهر کشاورزی</asp:ListItem><asp:ListItem>بانک سپه</asp:ListItem><asp:ListItem>بانک تجارت</asp:ListItem><asp:ListItem>بانک سامان</asp:ListItem></asp:DropDownList></td></tr></table></div></div>
                <div class="memberCol3"><div class="col3Content"><div class="siteLow"><div class="lowText">
                                <br /><p align="center"><b><font color="#ffffff">کاربر گرامي</font></b></p><p align="center" style="color: White">
                                    قوانین ثبت نام در سایت و استفاده از مطالب  </p><p style="color: Aqua">
                                    با تشکر از اينکه سايت ما را جهت مشاهده و فعالیت انتخاب کرده ايد. به لحاظ حفظ قانون
                                    سايت و همچنين راحتي کاربران اين قوانين را وضع شده است ، که کاربران مي بايست طبق
                                    آن عمل کنند . در غير اين صورت مسئولين سايت اين حق را دارند که موضوعات ، مقالات ،
                                    اخبار و تمامي توضيحات و در برخي مواقع اكانت آن کاربر را از سايت حذف نمايند. اين
                                    قوانين به صورت کامل در زير منتشر شده اند و ممكن است در هر زمان تغيير كند . لطفاً
                                    جهت مشاهده آخرين قوانين سايت به پيغامهايي که ممکن است برخي از روزها به هر نحوي به
                                    اطلاع كاربران ميرسد دقت فرماييد. اين قوانين بلااستثناء مي باشند و در رابطه با تمامي
                                    كاربران از جمله تازه وارد ، فعال ، همكاران سايت ، مديران انجمن ها و... اجرا خواهند
                                    شد.. پس از خواندن دقيق اين قوانين گزينه "ضمن مطالعه دقیق اساسنامه ، با همه موارد
                                    موافقم" را تيك بزنيد و سپس كليد "ثبت نام" را بفشاريد . شما ميتوانيد براي خواندن
                                    قوانين به بخش قوانين سايت نيز مراجعه نماييد.</p></font><font color="white"></font> </p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 1)</font></b> تمامي کاربران
                                        مي بايست در هنگام ثبت نام در سايت ، از کلمات مناسب جهت استفاده در نام کاربري خود
                                        استفاده نمايند. در صورت مشاهده کلمات رکيک و نامناسب، اكانت آن كاربر در اولين فرصت
                                        حذف خواهد شد و دسترسي وي به انجمنها قطع خواهد شد حتي المقدور نام كاربري را با حروف
                                        انگيسي به جاي فارسي ايجاد نماييد همچنين پس از عضويت امكان لغو عضويت توسط كاربر و
                                        يا مدير وجود نخواهد داشت</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 2)</font></b> کاربران سايت
                                        مي بايست در هنگام ارسال پيغام در انجمن ها از کلمات مناسب استفاده نمايند. در صورت
                                        مشاهده کلمات رکيک و نامناسب ، اكانت آن كاربر در اولين فرصت حذف خواهد شد و دسترسي
                                        وي به انجمنها قطع خواهد شد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 3)</font></b> کاربران مي
                                        بايست در هنگام ارسال سوالات و مشکلات و پيغامهاي خود از يک موضوع مناسب استفاده نمايند.
                                        اين موضوع مي بايست در رابطه با سوال ، مشکل و يا پيغام ايشان باشد. در غير اينصورت
                                        در حالتي که کاربر جديد باشد به او اخطار داده خواهد شد. در صورت تکرار مکرر اين موضوع
                                        توسط کاربران چه جديد و چه قديم ، برخورد جدي خواهد شد. از انتخاب عناويني از جمله
                                        كمك ، تورو خدا كمكم كنيد ، خيلي مهم ، هر كي ميتونه جواب بده ، نياز به پاسخ فوري
                                        ، يك برنامه ، چطوري ميتونم ، كرك برنامه و جملاتي شبيه به اين پيغامها جدا خودداري
                                        نماييد كه طبق قوانين با شما بر خورد خواهد شد. راهنمايي در اين زمينه :‌براي انتخاب
                                        موضوع ميتوانيد از كلمات كليدي سوال خود استفاده كنيد. </font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 4)</font></b> طفا"ً در هنگام
                                        ایجادتاپیک یا مطرح کردن سوالات خود ، انجمن مناسب راانتخاب نماییدو از مطرح کردن سوالات
                                        خود در انجمن های نامتناسب با سوالتان خودداری نمایید.</font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 5)</font></b> لطفا" از ارسال
                                        تاپیکهای تکراری جدا" خودداری فرمایید. قبل از ایجاد تاپیک یا طرح سوال با استفاده
                                        ازگزینه جستجواز عدم وجود مطلب ارسالی در انجمن ها مطمئن شوید.. از نوشتن یک سوال و
                                        یا یک نامه درانجمن های مختلف خودداریفرماییید</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 6)</font></b> در صورتي که
                                        مايل به ارسال مطلبي از يک سايت ديگر مي باشيد ، حتماً منبع آن را ذکر نماييد. در صورتي
                                        که مطلب يا موضوع مذکور نوشته شده توسط شخص خاصي بود ، حتماً نام وي را ذکر نماييد.</font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 7)</font></b> در هنگام ساختن
                                        امضا در مشخصات شخصي خود ، از تبليغات تجاري (سايت و غير) خودتان و ديگران جدا خودداري
                                        نماييد. در صورتي كه سايت شما فعاليت آموزشي و يا فرهنگي دارد با ذكر فعاليت سايت براي
                                        شناساندن آن به كاربران ميتوانيد امضا را به سايت خود لينك دهيد البته توجه داشته باشيد
                                        كه امضا بايد كوتاه باشد . همچنين در سايت محلي در انجمن ساخته شده است که شما مي توانيد
                                        از آن جهت تبليغ سايت و کارهاي خود استفاده نماييد. در صورتي که به غير از اين عمل
                                        شود حساب آن کاربر در اولين فرصت حذف خواهد شد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 8)</font></b> لطفاً از ساخت
                                        بيشتر از يک حساب در سايت جداً خودداري فرماييد. در صورت مشاهده بيشتر از يک حساب از
                                        طرف يک کاربر ، تمامي آنها در اولين فرصت حذف خواهند شد و و دسترسي وي به انجمنها قطع
                                        خواهد شد </font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 9)</font></b> مباحث مربوط
                                        به Hack (از ديد منفي) و مسائلي که باعث آزار و اذيت ديگران شود اکيداً در سايت ممنوع
                                        مي باشد. فقط موارد مثبت مانند Crack برنامه ها و آموزش موارد امنيتي سيستم و مقابله
                                        با هكران و مشابه که براي کاربران مفيد واقع شود، مجاز است. در صورتي که غير از اين
                                        عمل شود آن اكانت در اولين فرصت حذف خواهد شد </font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 10)</font></b> لطفاً در هنگام
                                        مطرح کردن سوالات خود ، انجمن مناسب را انتخاب نماييد و از مطرح کردن سوالات خود در
                                        انجمنهاي نامتناسب با سوالتان خودداري نماييد </font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 11)</font></b> لطفاً در هنگام
                                        طرح سوالات خود آنها را به صورت جداگانه مطرح فرماييد. بدين معني که در صورتي که سوالهاي
                                        گوناگوني داريد ، آنها را در چندين ارسال مطرح نماييد و از مطرح کردن تمامي سوالات
                                        در يک ارسال خودداري فرماييد . </font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 12)</font></b> لطفاً در هنگام
                                        جواب دادن به سوالات از به کار گيري الفاظ و جملاتي که باعث دلسردي کاربر سوال کننده
                                        شود خودداري فرماييد. اين را بدانيد که اين سايت محل آموزش است و کساني هستند که سوالهايشان
                                        بسيار ابتدايي مي باشد. لذا از به کارگيري کلماتي که باعث شود کاربر به جاي گرفتن جواب
                                        سوال خود دلسرد شود اکيداً خودداري فرماييد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 13)</font></b> لطفاً در صورتي
                                        که جواب يک سوالي را نمي دانيد از ارسال مطالبي که باعث شلوغ کردن آن ارسال ( يا سوال
                                        ) شود خودداري فرماييد. در صورتي که بحث خاصي داريد مي توانيد براي خودتان يک بحث عمومي
                                        باز کنيد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 14)</font></b> از نوشتن نامه
                                        هاي تجاري و يا تبليغات تجاري پرهيز كنيد. در صورتي كه ارسال هاي مذكور مربوط به تبليغات
                                        تجاري باشند توسط مديران حذف خواهند شد و در صورت تكرار اين عمل توسط كاربر ، آن اكانت
                                        براي هميشه بسته خواهد شد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 15)</font></b> از نوشتن يك
                                        سوال و يا يك نامه در انجمنهاي مختلف خودداري كنيد. طبق قانون شماره 10 انجمن مناسب
                                        و مربوط به موضوع نامه خود را انتخاب كنيد و فقط در آن انجمن نامه خود را ارسال كنيد.</font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 16)</font></b> مسئوليت تمامي
                                        فايلها و يا تصاوير و ... كه از طريق سايت رد و بدل ميشوند بر عهده كاربر فرستنده ميباشد
                                        و سايت در قبال اين گونه مسايل هيچ تعهدي در زمينه سالم بودن آنها، ويروسي نبودن آنها
                                        و ... ندارد. ما به شما پيشنهاد ميكنيم حتما پس از دريافت فايلها و ... آنها را قبل
                                        از استفاده توسط نرم افزارهايي كه كار ويروس يابي و اسكن فايلها را بر عهده دارند ،
                                        چك نماييد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 17)</font></b> براي امنيت
                                        بيشتر جهت گرفتن پاسخ سوال از انجمنها استفاده نماييد در صورتي كه مستقيما با يك كاربر
                                        از طريق ايميل ، چت و يا هر طريقه ديگري ارتباط داشته باشيد سايت هيچ گونه تعهدي در
                                        مقابل بوجود آمدن مشكالات احتمالي نخواهد داشت</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 18)</font></b> در صورت مشاهده
                                        هر گونه بي احترامي به كاربران ديگر و مديران و مسئولان سايت با كاربر مربوطه برخورد
                                        خواهد شد و در صورت لزوم دسترسي وي به انجمنها قطع خواهد شد.</font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 19)</font></b> تغيير نام
                                        كاربري فقط توسط مدير سايت مجاز است . چنانچه تمايل به تغيير نام كاربر خود داريد براي
                                        مديران ارشد سايت پيغام خصوصي ارسال نماييد و در آن پيغام نام كاربري قبلي ، نام كاربري
                                        جديد و آدرس ايميل خود را قيد نماييد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 20)</font></b> لطفاْ در زمان
                                        مطرح كردن مطلبي در انجمنها ، به مسايل و قوانين جمهوري اسلامي احترام بگذاريد و از
                                        قرار دادن مطالب و تصاوير مخالف با آن جداْ خودداري فرماييد. ضمناْ از نوشتن هرگونه
                                        مسايل مربوط به سياست جلوگيري كنيد كه در اين صورت ، دسترسي كاربر براي هميشه به سايت
                                        قطع خواهد شد.</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 21)</font></b> چنانچه تاپيک
                                        و يا پيغامي‌ از کاربران توسط مديري در انجمن حذف و يا ويرايش شد در صورت داشتن سوال
                                        در اين رابطه و يا خواهان جويا شدن علت موضوع لطفا براي مدير آن انجمن يک پيغام خصوصي‌
                                        ارسال کرده و سوال خود را به صورت خصوصي‌ مطرح کنيد تا آن مدير نيز در اينباره شمارا
                                        راهنمايي‌ و جواب سوالات شمارا بطور کامل بدهد. در صورت مطرح کردن سوال در اين رابطه
                                        و يا جويا شدن علت موضوع در انجمن هاي عمومي‌ آن ارسال و يا تاپيک زائد سريعا حذف خواهد
                                        شد و شما نيز جواب سوال خودرا دريافت نخواهيد کرد.</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 22)</font></b> در صورت ملاحظه
                                        هرگونه مسايل خلاف قوانين انجمن از يک کاربر در صورت تمايل آدرس تاپيک را براي مدير
                                        آن انجمن ارسال نمائيد تا سريعا به موضوع رسيدگي‌ شود، چنانچه کاربري خود بجاي مدير
                                        در زمينه اي تصميم گيري و شخصا با کاربر ديگري برخورد کند سريعا ارسال کاربر تذکر دهنده
                                        حذف و به او اخطار داده خواهد شد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 23)</font></b> در صورت ملاحظه
                                        هرگونه ارسال تمسخر آميز، توهين آميز و يا مسايل و مشکلات شخصي‌ در مورد يک کاربر و
                                        يا يک مدير در انجمن ها آن ارسال سريعا حذف و در صورت تکرار موجب برخورد با آن کاربر
                                        خواهد شد. </font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 24)</font></b> هرگونه تاپيک
                                        و ارسال اعتراض آميز و يا انتقاد آميز در رابطه با يک کاربر و يا مدير بدون اخطار قبلي
                                        و سريعا حذف خواهد شد و در صورت تکرار موجب برخورد با آن کاربر خواهد شد</font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 25)</font></b> هرگونه بحثي‌
                                        که موجب انحراف تاپيک ها از مسير اصلي‌ خود بشود که به نوعي برخلاف قوانين انجمن باشد
                                        در صورت تشخيص مديران، در صورت لزوم تاپيک و يا بحث هاي اضافه حذف خواهد شد. بنابراين
                                        کاربران موظف هستند از تاپيک هاي ارسال شده خود مراقبت کنند و از منحرف شدن آن جلوگيري
                                        کنند. در صورتي‌ که کاربري باعث انحراف تاپيک هاي ارسالي‌ شما شد ميتوانيد لينک تاپيک
                                        را براي مدير آن انجمن ارسال نمائيد تا در صورت لزوم با آن کاربر برخورد شود. </font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 26)</font></b> لطفاْ از ارسال
                                        پست هاي تكراري خودداري فرماييد. پست هاي تكراري توسط مديران به سرعت حذف خواهند شد
                                        و در صورتي كه كاربر قصد تبليغ و يا نمايش يك مطلب در تمامي انجمن ها را داشته باشد
                                        ، تمامي آن ارسالها حذف خواهند شد. چرا كه اين كار باعث اذيت كاربران ديگر مي شود.
                                        در صورت تكرار اين عمل از سوي كاربر ، اكانت وي نيز در اولين فرصت حذف خواهد شد</font></p>
                                <p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 27)</font></b> در صورت داشتن
                                        انتقاد از يک مدير لطفا در صورت تمايل به وسيله پيغام خصوصي‌ آنرا براي آن مدير ارسال
                                        نمائيد، چنانچه انتقاد و يا اعتراض نسبت به عمل يا رفتار مديري در انجمن داريد لطفا
                                        آنرا فقط از طريق پيغام خصوصي‌ براي مدیریت سایت‌ : ارسال نمائيد تا به موضوع رسيدگي‌
                                        و در صورت لزوم مشورت هاي لازم انجام شود. همچنين ميتوانيد از قسمت تماس با ما براي
                                        مدير انجمنها ايميل ارسال کنيد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 28)</font></b> قانون كپي
                                        : در صورتي كه ميخواهيد از مباحث و آموزشهايي كه در اين انجمنها ذكر شده است در جايي
                                        ديگر و يا در سايت خود استفاده كنيد ذكر نام سايت و نام نويسنده مطلب الزاميست و در
                                        صورت امكان لينك پيغام را هم براي اطلاعات بيشتر ذكر نماييد</font></p><p><font color="#0a0a0a"><b><font color="#df2d00">قانون شماره 29)</font></b> <span lang="fa">
                                        سواستفاده تبلیغاتی از امکانات سایت برای تبلیغ سایت با معرفی خدمات</span>, <span lang="fa">
                                            از ارسال تاپیک های تبلیغاتی در سایت خودداری کرده و اگر قصد دارید سایت خود را معرفی
                                            کنید در انجمن معرفی سایت میتوانید سایت خود را معرفی کرده و پس از تایید مدیران سایت
                                            شما معرفی خواهد شد. از ارسال تاپیک های تبلیغاتی و معرفی محصولات و امثال آن خودداری
                                            کنید و برای معرفی چنین خدماتی با مدیریت سایت تماس گرفته و بنر تبلیغاتی در سایت اجاره
                                            کنید. از ارسال پیغام خصوصی و ارسال پست در انجمن ها و پروفایل ها و ...&nbsp; جهت
                                            دعوتنامه برای عضویت در سایتهای دیگر&nbsp; خودداری کنید . در صورت رعایت نکردن این
                                            موارد نام کاربری شما مسدود شده و آدرس سایت شما در سیستم سایت مسدود خواهد شد.</span></font></p>
                                <p><font color="#0a0a0a">با خواندن اين قوانين شما مسئوليت رفتار و ارسالهاي خود را در سايت
                                        به عهده خواهيد گرفت. در صورتي که از قوانين مذکور حمايت نکنيد (در صورت امكان) به
                                        شما اخطار داده خواهد شد و در صورت تکرار حساب شما از سايت حذف خواهد شد.</font></p>
                                <p><font color="#0a0a0a"><b><font color="#008000">با اميد به اينکه با به کارگيري قوانين
                                        سايت و دستورالعملهايي که در آينده به آنها اضافه خواهد شد بتوانيم رضايت شما کاربر
                                        گرامي را جلب کنيم, به اميد ساعات خوش در هنگام مشاهده اين سايت براي شما.</font> </b>
                                    </font></p></div><asp:CheckBox ID="chk_Low" Checked="false" runat="server" />قوانین سایت را قبول دارم.</div>
                        <div class="captchaControl"><table style="width: 100%"><tr><td style="text-align: center; padding-right: 10px;">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"><ContentTemplate><div class="captcha"><cc2:CaptchaControl ID="secCode" runat="server" CaptchaBackgroundNoise="High" CaptchaLength="5" FontColor="Black" NoiseColor="Pink" LineColor="Red" CaptchaHeight="60" CaptchaWidth="206" CaptchaLineNoise="Low" CaptchaMinTimeout="5" CaptchaMaxTimeout="240" CaptchaChars="ACDEFGHJKLNPQRTUVXYZ2346789" Width="207px" BackColor="White" BorderColor="Black" /></div></ContentTemplate>
                                            <Triggers><asp:AsyncPostBackTrigger ControlID="lb_RefreshSecCode" EventName="Click" /></Triggers></asp:UpdatePanel></td></tr>
                                <tr><td style="text-align: center"><asp:LinkButton ID="lb_RefreshSecCode" runat="server" CausesValidation="False" ForeColor="Yellow" EnableViewState="False" Font-Size="9px" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="True" TabIndex="-1">کد ناخواناست</asp:LinkButton></td></tr>
                                <tr><td style="text-align: center"><asp:TextBox ID="txtSecurityCode" runat="server" Width="194px" CssClass="txtUrgent lblMust" TabIndex="21"></asp:TextBox></td></tr>
                                <tr><td><asp:Button ID="btnCancel" runat="server" CssClass="focus" Text="بازگشت" Width="100px" CausesValidation="False" PostBackUrl="~/Home.aspx" TabIndex="23" Font-Names="Tahoma" UseSubmitBehavior="False" /><asp:Button ID="btnRegister" CssClass="focus register" Text="تکمیل ثبت نام" Style="display: block; font-family: tahoma; width: 94px;" TabIndex="22" runat="server" OnClick="btnRegister_Click" /></td></tr>
</table></div></div></div></div></ContentTemplate><Triggers><asp:AsyncPostBackTrigger ControlID="btnRegister" EventName="Click" /></Triggers></asp:UpdatePanel>
<div class="warning"><asp:Label ID="Label8" runat="server" ForeColor="Gray" Text="* تکمیل کردن تمام گزینه های با حاشیه زردرنگ الزامی است. "></asp:Label><br /><asp:Label ID="Label9" runat="server" ForeColor="Gray" Text="* نام کاربري شما بايد يکتا باشد و قبلاً توسط کاربر ديگري انتخاب نشده باشد. "></asp:Label><br /><asp:Label ID="Label11" runat="server" ForeColor="Gray" Text="* نام کاربري با عدد نمي تواند شروع شود و حتماً بايد با حروف آغاز شود. "></asp:Label><br /><asp:Label ID="Label10" runat="server" ForeColor="Gray" Text="* حداقل تعداد حروف نام کاربري و رمز عبور مي بايست 5 حرف باشد. "></asp:Label><br /><asp:Label ID="Label12" runat="server" ForeColor="Gray" Text="* فقط از نام کاربري با حروف انگليسي استفاده نماييد. "></asp:Label><br /><asp:Label ID="Label13" runat="server" ForeColor="Gray" Text="* در وارد کردن شماره حساب خود دقت فرماييد. "></asp:Label><br /><asp:Label ID="Label14" runat="server" ForeColor="Gray" Text="* در حفظ و نگهداري نام کاربري و رمز عبور خود نهايت دقت را فرماييد. "></asp:Label></div><div class="result"></div></div>
<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto; width: 500px; top: 82px; left: 460px;">
<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-dialog-title-dialog-form" class="ui-dialog-title">عضویت کاربر</span>
<a role="button" class="ui-dialog-titlebar-close ui-corner-all" href="UserRegisteration.aspx"><span class="ui-icon ui-icon-closethick">بستن</span> </a>
</div><div style="width: auto; min-height: 0px; height: auto;" class="ui-dialog-content ui-widget-content" id="dialog-form"><form id="frm_Membership"><fieldset><div style="height: 260px">
<img alt="" src="Images/UserSuccess/UserReg.png" style="width: 80px; height: 85px; float: right;" /><b style="float: right; padding-top: 10px; width: 279px;">عضویت شما با موفقیت انجام گردید</b>
<div style="clear: both;">
<%--جهت ویرایش مشخصات کاربری خود به قسمت<br /><br /><a href="UserPanel/UserProfileRegister.aspx">پروفایل کاربری</a>&nbsp;--%>
 جهت ورود به صفحه اصلی <a href="Home.aspx" style="color: #703A70">اینجا</a> را کلیک نمایید
<br /><br /><hr /><asp:Label ID="lbl_Info" Text="" runat="server" Font-Names="Tahoma" Font-Size="13px" ForeColor="Red" />
</div></div></fieldset></form></div><div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div></div></div>
<script type="text/javascript">var Farsi = ['1590', '1589', '1579', '1602', '1601', '1594', '1593', '1607', '1582', '1581', '1580', '1670', '1588', '1587', '1740', '1576', '1604', '1575', '1578', '1606', '1605', '1705', '1711', '1592', '1591', '1586', '1585', '1584', '1583', '1574', '1608', '1662'];
var English = ['113', '119', '101', '114', '116', '121', '117', '105', '111', '112', '91', '93', '97', '115', '100', '102', '103', '104', '106', '107', '108', '59', '39', '122', '120', '99', '118', '98', '110', '109', '44', '92'];
[ ].indexOf || (Array.prototype.indexOf = function (v, n){n = (n == null) ? 0 : n; var m = this.length;
 for (var i = n; i < m; i++) if (this[i] == v) return i;return -1;});function keyEnter(field, e){if (window.event){ keynum = e.keyCode; } else if (e.which) { keynum = e.which; } var englishIndex = English.indexOf(keynum.toString());
if (englishIndex != -1) { var farsiCode = Farsi[englishIndex]; field.value += String.fromCharCode(farsiCode); return false; } else { return true; }}
function getImagePath(){ return '<%= ImagePath %>'; } var imagePath = getImagePath();function BlockUI(elementID){var prm = Sys.WebForms.PageRequestManager.getInstance();prm.add_beginRequest(function ()
{$("#" + elementID).block({ message: '<table><tr><td>' + '<img src="' + imagePath + '/ajaxImages/loading_User.gif" /></td></tr></table>',
css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px',
'-moz-border-radius': '10px', opacity: .6, color: '#fff'},overlayCSS: { backgroundColor: 'Silver', opacity: 0.6, border: '1px solid #000000' }});});
prm.add_endRequest(function (){$("#" + elementID).unblock();});}$(document).ready(function (){BlockUI("memberWrapper");$.blockUI.defaults.css = {};});
function checkChar(e, type, AllowSpace){var keycode;if (window.event)keycode = window.event.keyCode;else if (e)keycode = e.which;
if (keycode == 0 || keycode == 8 || keycode == 9 || keycode == 13 || (AllowSpace != undefined && keycode == 32)) return true;
switch (type){ case 1: if (keycode < 48 || keycode > 57) return false;  // Only Number
break;case 2: if (keycode < 1570 || keycode > 1740) return false;  // Only Persian
break;case 3: if (keycode < 65 || (keycode > 90 && keycode < 97) || keycode > 122) return false; // Only English
break;case 4: if (keycode >= 1570 && keycode <= 1740) return false; //English with Special Char and Space
break;case 5: if (keycode >= 1570 && keycode <= 1740 || keycode == 32) return false; //English with Special Char without Space
break;}return true;}
$('input').live("keypress", function (e){ /* ENTER PRESSED*/
if (e.keyCode == 13){ /* FOCUS ELEMENT */
var inputs = $(this).parents("form").eq(0).find("button,:input,textarea,select");
var idx = inputs.index(this);if (idx == inputs.length - 1){inputs[0].focus()} else
{inputs[idx + 1].focus(); // handles submit buttons
//inputs[idx + 1].select();
}return false;}});
<%--User Check--%>
function checkUserExists(){$("#<%= txtUserName.ClientID %>").blur(function (event)
{var user_name = $('#<%= txtUserName.ClientID %>').val();if (user_name == "" || user_name == null)
{$('#msg').innerHTML = ""; $('#msg').css("display", "none");return;}$('#msg').html("<img src='Images/ajaxImages/waiting.gif' style='background:transparent;'>");
$.ajax({type: "POST",url: "UserRegisteration.aspx/IsUserAvailable",data: "{'username': '" + $('#<%= txtUserName.ClientID %>').val() + "'}",
contentType: "application/json; charset=utf-8",dataType: "json",success: function (result){var delay = function (){
$('#msg').css("display", "block");if (result.d == true){isValidUser = true;$('#msg').html("<img src='Images/ajaxImages/ok.gif' style='background:transparent;'>");
$('#<%= txtPassword.ClientID %>').focus();}else{isValidUser = false;$('#msg').html("<img src='Images/ajaxImages/error.gif' style='background:transparent;'>");
$('#<%= txtUserName.ClientID %>').select();}};setTimeout(delay, 0);},error: function (result){
$('#msg').html("<img src='' style='background:transparent;'>");isValidUser = false;alert(result.status + ' ' + result.statusText);}});});}
<%--Email Check--%>
function checkEmailExists(){ $(document).ready(function (){$("#<%= txtEmail.ClientID %>").blur(function (event)
{var Email = $('#<%= txtEmail.ClientID %>').val();if (Email == "" || Email == null){$('#emailSpan').innerHTML = "";
$('#emailSpan').css("display", "none");return;}$('#emailSpan').html("<img src='Images/ajaxImages/waiting.gif' style='background:transparent;'>");
$.ajax({type: "POST",url: "UserRegisteration.aspx/IsEmailAvailable",data: "{'email': '" + Email + "'}",contentType: "application/json; charset=utf-8",
dataType: "json",success: function (msg){var delay = function (){AjaxEmailSucceeded(msg);};setTimeout(delay, 0);},error: AjaxEmailFailed});});});
function AjaxEmailSucceeded(result2){$('#emailSpan').css("display", "block");if (result2.d == true){isValidEmail = true;
$('#emailSpan').html("<img src='Images/ajaxImages/ok.gif' style='background:transparent;'>");}else{isValidEmail = false;$('#emailSpan').html("<img src='Images/ajaxImages/error.gif' style='background:transparent;'>");//$('#<%= txtEmail.ClientID %>').select();
}}function AjaxEmailFailed(result2){$('#emailSpan').html("<img src='' style='background:transparent;'>");isValidEmail = false;alert(result2.status + ' ' + result2.statusText);}}var isValidUser = false;var isValidEmail = false;function pageLoad(sender, args){if (args.get_isPartialLoad()){checkUserExists();checkEmailExists();}}$(document).ready(function (){$("#dialog:ui-dialog").dialog("destroy");$("#dialog-form").dialog({autoOpen:false,height:400,width:600,modal:true,resizable:false});$('.submit').click(function (){$("#dialog-form").dialog("close");});checkUserExists();checkEmailExists();});</script>