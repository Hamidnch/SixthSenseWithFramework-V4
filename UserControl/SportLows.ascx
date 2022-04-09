<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportLows.ascx.cs" Inherits="UserControl_SportLows" %>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $("#<%= chk_SportLows.ClientID %>").click(function ()
        {
            var btn = $("#<%= btn_acceptLows.ClientID %>");
            if ($(this).is(":checked"))
            {
                btn.attr("disabled", false);
            }
            else
            {
                btn.attr("disabled", true);
            }
//            $(btn).click(function ()
//            {
//                document.location.href = "Sport_SelectRacing.aspx";
//            });
            if (btn.is(':disabled') == false)
            {
                btn.removeClass("sport_btnAcceptLowsDis");
                btn.addClass("sport_btnAcceptLows");
            }
            else
            {
                btn.removeClass("sport_btnAcceptLows");
                btn.addClass("sport_btnAcceptLowsDis");
            }

        });
    });
</script>
<div class="sport_Lows"><p class=MsoNormal align=center dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:center;line-height:100%;direction:rtl;unicode-bidi:embed'><b><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:FA'>قوانین سایت<o:p></o:p></span></b></p><p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif"; mso-bidi-language:FA'>کاربران گرامی قبل از شرکت در مسابقات لازم است قوانین سایت را کامل مطالعه نمایند.<o:p></o:p></span></p>
<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";color:#00B0F0;mso-bidi-language:FA'>1 – </span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>هر کاربر می تواند پس از عضو شدن و تائید قوانین سایت وارد بخش پیش بینی مسابقات شده و در این بخش در مسابقات مختلف : فوتبال ، والیبال ، بسکتبال و ... شرکت نماید.<o:p></o:p></span></p>
<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";color:#00B0F0;mso-bidi-language:FA'>2 – </span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>در مسابقات فوتبال که لیگهای برتر ایران ، انگلستان ، آلمان ،ایتالیا ، اسپانیا و لیگ قهرمانان اروپا وجود دارد هر کاربر می تواند در هر کدام از مسابقات دلخواه شرکت نماید و فرم مربوطه را بر اساس گزینه های سه گانه تکمیل نماید و در صورت تمایل در یک لیگ یا مسابقه و یا در تمام مسابقات شرکت نماید.<o:p></o:p></span></p>
<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";color:#00B0F0;mso-bidi-language:FA'>3 – </span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>برای هر هفته از مسابقات هر لیگ یک فرم مسابقه موجود است و در مقابل هر بازی </span><span lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><span style='mso-spacerun:yes'> </span>(</span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>که شامل میزبان و میهمان است</span><span lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>)</span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> سه گزینه<span style='mso-spacerun:yes'>  </span>وجود دارد و کاربر می تواند برای هر بازی حداکثر 2 گزینه را انتخاب نماید بطوریکه:<o:p></o:p></span></p><p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;text-indent:36.0pt;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-family:"Tahoma","sans-serif";color:lime;mso-bidi-language:FA'>الف –</span><span lang=FA style='font-family:
"Tahoma","sans-serif";color:#00B050;mso-bidi-language:FA'> </span><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>هر کاربر می توند برای هر بازی <span style='color:red'>یک گزینه<span style='mso-spacerun:yes'>  </span>یا به دلخواه حداکثر 2 گزینه </span>را انتخاب نماید <o:p></o:p></span></p><p class=MsoNormal dir=RTL style='margin-top:0cm;margin-right:36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-family:"Tahoma","sans-serif";color:lime;mso-bidi-language:FA'>ب –</span><span lang=FA style='font-family:"Tahoma","sans-serif";color:#00B050;mso-bidi-language:FA'> </span><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'>هر کاربر نمی تواند برای هر بازی 3 گزینه را انتخاب نماید و در صورت اشتباه فرم جهت<o:p></o:p></span></p><p class=MsoNormal dir=RTL style='margin-top:0cm;margin-right:36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><span style='mso-spacerun:yes'> </span><span style='mso-spacerun:yes'>  </span><span style='mso-spacerun:yes'>  </span><span style='mso-spacerun:yes'> </span>شرکت در مسابقه فعال نخواهد شد.<o:p></o:p></span></p><p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:yellow;mso-bidi-language:FA'>نحوه امتیاز بندی فرمها:<o:p></o:p></span></p><p class=MsoListParagraphCxSpFirst dir=RTL style='margin-top:0cm;margin-right:36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:200%;mso-list:l0 level1 lfo1;direction:rtl;unicode-bidi:embed'><a name="OLE_LINK4"></a><a name="OLE_LINK3"><span style='mso-bookmark:OLE_LINK4'><![if !supportLists]><span style='font-family:Wingdings;mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings;color:#FAC090;mso-themecolor:accent6;mso-themetint:153;mso-style-textfill-fill-color:#FAC090;mso-style-textfill-fill-themecolor:accent6;mso-style-textfill-fill-alpha:100.0%;mso-style-textfill-fill-colortransforms:"lumm=60000 lumo=40000";mso-bidi-language:FA'><span style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span dir=RTL></span><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>اگر کاربر یک گزینه را انتخاب نماید و انتخاب صحیح باشد <span style='color:lime'>800 امتیاز</span><span style='color:#00B050'> <span style='mso-spacerun:yes'> </span></span>برای او منظور<span style='mso-spacerun:yes'>  </span>می گردد.</span></span></a><span style='mso-bookmark:OLE_LINK4'></span><span style='mso-bookmark:OLE_LINK3'></span><span dir=LTR style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><o:p></o:p></span></p><p class=MsoListParagraphCxSpMiddle dir=RTL style='margin-top:0cm;margin-right:36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:200%;mso-list:l0 level1 lfo1;direction:rtl;unicode-bidi:embed'><![if !supportLists]><span style='font-family:Wingdings;mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings;
color:#FAC090;mso-themecolor:accent6;mso-themetint:153;mso-style-textfill-fill-color:#FAC090;mso-style-textfill-fill-themecolor:accent6;mso-style-textfill-fill-alpha:100.0%;mso-style-textfill-fill-colortransforms:"lumm=60000 lumo=40000";mso-bidi-language:FA'><span style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><![endif]><span dir=RTL></span><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>اگر کاربر دو <span style='mso-spacerun:yes'> </span>گزینه را انتخاب نماید و یکی <span style='mso-spacerun:yes'> </span>صحیح باشد<span style='color:#00B050'> </span><span style='color:lime'>400 امتیاز</span><span style='color:#00B050'> </span><span style='mso-spacerun:yes'> </span>برای او منظور<span style='mso-spacerun:yes'></span>می گردد.</span><span dir=LTR style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><o:p></o:p></span></p><p class=MsoListParagraphCxSpMiddle dir=RTL style='margin-top:0cm;margin-right:
36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:200%;mso-list:l0 level1 lfo1;direction:rtl;unicode-bidi:embed'><![if !supportLists]><span style='font-family:Wingdings;mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings;color:#FAC090;mso-themecolor:accent6;mso-themetint:153;mso-style-textfill-fill-color:#FAC090;mso-style-textfill-fill-themecolor:accent6;mso-style-textfill-fill-alpha:100.0%;mso-style-textfill-fill-colortransforms:"lumm=60000 lumo=40000";mso-bidi-language:FA'><span style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><![endif]><span dir=RTL></span><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>اگر کاربر یک گزینه را انتخاب نماید و انتخاب غلط باشد <span style='color:lime'>200 امتیاز</span><span style='color:#00B050'> <span style='mso-spacerun:yes'> </span></span>برای او منظور<span style='mso-spacerun:yes'>  </span>می گردد.</span><span dir=LTR style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><o:p></o:p></span></p>
<p class=MsoListParagraphCxSpMiddle dir=RTL style='margin-top:0cm;margin-right:36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:200%;mso-list:l0 level1 lfo1;direction:rtl;unicode-bidi:embed'><![if !supportLists]><span style='font-family:Wingdings;mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings;color:#FAC090;mso-themecolor:accent6;mso-themetint:153;mso-style-textfill-fill-color:#FAC090;mso-style-textfill-fill-themecolor:accent6;mso-style-textfill-fill-alpha:100.0%;mso-style-textfill-fill-colortransforms:"lumm=60000 lumo=40000";mso-bidi-language:FA'><span style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><![endif]><span dir=RTL></span><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>اگر کاربر دو <span style='mso-spacerun:yes'> </span>گزینه را انتخاب نماید و هردو غلط<span style='mso-spacerun:yes'>  </span><span style='mso-spacerun:yes'> </span>باشد <span style='color:lime'>100 امتیاز</span><span style='color:#00B050'> <span style='mso-spacerun:yes'> </span></span>برای او منظور<span style='mso-spacerun:yes'>  </span>می گردد.</span><span dir=LTR
style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><o:p></o:p></span></p><p class=MsoListParagraphCxSpLast dir=RTL style='margin-top:0cm;margin-right:36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:auto;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><o:p>&nbsp;</o:p></span></p><p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>بدیهی است هر کاربر شرکت کننده در مسابقات با انتخاب یک گزینه بیشتر امتیاز کمتری را می گیرد و دقت و پیش بینی صحیح ملاک برنده شدن است و افزایش سرمایه گذاری هیچ مزیتی برای شرکت کننده ندارد.<o:p></o:p></span></p><p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";color:#00B0F0;mso-bidi-language:FA'>4 –</span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> پس از انتخاب گزینه ها و تکمیل فرم هر کاربر باید بر اساس هر گزینه انتخابی </span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> برای هر بازی </span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>)</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> مبلغ <span
style='color:lime'>500 تومان</span><span style='color:#00B050'> </span>بحساب
اعلام شده در جدول مسابقات واریز نمایند.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><i><span
lang=FA style='font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:
FA'>حساب شماره </span></i><i><span lang=FA style='font-size:6.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:FA'>..................................................</span></i><i><span
lang=FA style='font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:
FA'>بانک صادرات<span style='mso-spacerun:yes'>  </span>و یا حساب شماره </span></i><i><span
lang=FA style='font-size:6.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:#FFC000;mso-bidi-language:FA'>......................................</span></i><i><span
lang=FA style='font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:
FA'> بانک ملی ایران <o:p></o:p></span></i></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>برای مثال اگر برای هر کدام از لیگهای فوق در یک هفته 10
مسابقه وجود داشته باشد و یک کاربر در هر 10 مسابقه یک گزینه را انتخاب نماید باید
مبلغ <span style='color:lime'>5000 تومان</span><span style='mso-spacerun:yes'> 
</span>واگر برای هر 10 مسابقه 2 گزینه را انتخاب نماید باید مبلغ <span
style='color:lime'>10000 تومان</span> بحساب های اعلام شده واریز نماید.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>کاربران محترم برای ایجاد موجودی و انجام شارژ می توانند
بوسیله هر یک از روش های <span style='mso-spacerun:yes'> </span>کارت به کارت </span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>دستگاه خود پرداز </span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>)</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> پرداخت اینترنتی
با کارتهای بانکی عضو شبکه شتاب </span><span lang=FA style='font-size:10.0pt;
line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>(</span><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>آنلاین</span><span lang=FA style='font-size:10.0pt;
line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>)</span><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'> حواله اینترنتی </span><span lang=FA style='font-size:
10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:
"Tahoma","sans-serif";mso-bidi-language:FA'>بانکداری اینترنتی</span><span
lang=FA style='font-size:9.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>)</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> و یا حواله بانکی
اقدام نمایند.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:yellow;mso-bidi-language:FA'>تذکر: <o:p></o:p></span></p>

<p class=MsoListParagraphCxSpFirst dir=RTL style='margin-top:0cm;margin-right:
36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;line-height:200%;mso-list:l1 level1 lfo2;
direction:rtl;unicode-bidi:embed'><![if !supportLists]><span style='font-size:
12.0pt;line-height:200%;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol;color:#FFC000;mso-bidi-language:FA'><span
style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span dir=RTL></span><span lang=FA
style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>دقت نمائید که مشخصات رسید دریافتی از بانک، دستگاه خود
پرداز<span style='mso-spacerun:yes'>  </span>یا شماره پیگیری پرداخت
اینترنتی<span style='mso-spacerun:yes'>  </span>و تاریخ آن به هنگام وارد کردن
در سایت بطور کامل و دقیق باشد. </span><span dir=LTR style='font-size:12.0pt;
line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'><o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle dir=RTL style='margin-top:0cm;margin-right:
36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:
auto;text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
dir=LTR style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraphCxSpLast dir=RTL style='margin-top:0cm;margin-right:
36.0pt;margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;line-height:200%;mso-list:l1 level1 lfo2;
direction:rtl;unicode-bidi:embed'><![if !supportLists]><span style='font-size:
12.0pt;line-height:200%;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol;color:#FFC000;mso-bidi-language:FA'><span
style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span dir=RTL></span><span lang=FA
style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>بدیهی است هر کاربر برای تکمیل جدول مسابقات مربوط به هر
لیگ نیز باید گزینه های مربوطه را انتخاب<span style='mso-spacerun:yes'> 
</span>و شارژ لازم را انجام دهد و چنانچه تعداد انتخاب گزینه ها با شارژ مبلغ در
پایان صفحه مطابقت نداشته باشد فرم مربوطه برای کاربر فعال نخواهد شد.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:#00B0F0;mso-bidi-language:FA'>5 –</span><span lang=FA style='font-size:
12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'> هر کاربر می تواند جدول مورد نظر خود را تکمیل نموده و در فایل خود ذخیره نماید
ولی برای شرکت در مسابقه باید موجودی لازم را در حساب سایت تا قبل از پایان مهلت
شرکت در مسابقه تأمین نماید ، چنانچه شارژ پس از مهلت شرکت در مسابقه صورت گیرد
فرم کاربر در آن هفته فعال نمی شود ولی مبلغ بحساب کاربر باقی می ماند<span
style='mso-spacerun:yes'>  </span>و در هفته بعد کاربر <span
style='mso-spacerun:yes'>      </span>می تواند با همان موجودی در مسابقه شرکت
نماید بنابراین کاربران محترم باید در زمان تکمیل فرم و تأمین وجه حساب دقت لازم
را داشته باشند.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:#00B0F0;mso-bidi-language:FA'>6 –</span><span lang=FA style='font-size:
12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'> اگر کاربران بخواهند می توانند به دفعات مختلف در مسابقات هر هفته </span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>برای هر لیگ</span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>)</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> شرکت نمایند و لذا
یک شماره حساب برای چندین کاربر ثبت نام شده نیز مجاز است ولی باید دقت شود که
شماره حساب اعلام شده از طرف کاربر صحیح و دقیق باشد.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:#00B0F0;mso-bidi-language:FA'>7 –</span><span lang=FA style='font-size:
12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'> تمامی فرمهای کاربران شرکت کننده در هر مسابقه </span><span lang=FA
style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>برای هر هفته از
لیگهای فوتبال</span><span lang=FA style='font-size:10.0pt;line-height:200%;
font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>)</span><span lang=FA
style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'> در صفحه ای که مربوط به </span><b><span lang=FA
style='font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:FA'>فرمهای
کاربران</span></b><span lang=FA style='font-family:"Tahoma","sans-serif";
color:#FFC000;mso-bidi-language:FA'> </span><span lang=FA style='font-size:
12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'>است قبل از شروع هر مسابقه فوتبال قابل مشاهده است </span><span lang=FA
style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>در زمان بعد از شرکت
در مسابقات که قابل دسترسی نیست </span><span lang=FA style='font-size:10.0pt;
line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>)</span><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'> تا کاربران از صحت و سلامت مسابقه آگاه و مطمئن باشند .
بدیهی است تعداد شرکت کنندگان بهمراه فرم انتخابی آنان برای کاربران مشخص می شود </span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>فایل قابل دانلود
است</span><span lang=FA style='font-size:10.0pt;line-height:200%;font-family:
"Tahoma","sans-serif";mso-bidi-language:FA'>)</span><span lang=FA
style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:#00B0F0;mso-bidi-language:FA'>8 –</span><span lang=FA style='font-size:
12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'> پس از اتمام مسابقات هر هفته مربوط به هر لیگ نتایج از طریق رسانه های سمعی و
بصری ، اینترنت و سایت مشخص می شود و جدول نتایج قطعی هر هفته در صفحه نتایج اعلام
می گردد و سپس لیست کاربران بصورت </span><span lang=FA style='font-family:"Tahoma","sans-serif";
color:#FFC000;mso-bidi-language:FA'>تعداد کل نفرات</span><span lang=FA
style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'> شرکت کننده و </span><span lang=FA style='font-family:
"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:FA'>کل مبالغ<b> </b>واریزی<b>
</b></span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:
"Tahoma","sans-serif";mso-bidi-language:FA'>و اعلام </span><span lang=FA
style='font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:FA'>نفرات
اول</span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:
"Tahoma","sans-serif";mso-bidi-language:FA'> و </span><span lang=FA
style='font-family:"Tahoma","sans-serif";color:#FFC000;mso-bidi-language:FA'>دوم</span><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'> در هر جدول بطور جداگانه مشخص می شود.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
color:yellow;mso-bidi-language:FA'>نحوه تعیین جوایز نفرات برنده:<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-family:"Tahoma","sans-serif";color:lime;mso-bidi-language:
FA'>الف:</span><span lang=FA style='font-size:12.0pt;line-height:200%;
font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> نفرات اول شامل تمام
کسانی که در هر جدول بیشترین امتیاز را کسب کرده اند و <span style='color:lime'>65%</span>
جوایز به آنان تعلق می گیرد.<o:p></o:p></span></p>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed'><span
lang=FA style='font-family:"Tahoma","sans-serif";color:lime;mso-bidi-language:
FA'>ب:</span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:
"Tahoma","sans-serif";mso-bidi-language:FA'> نفرات دوم شامل تمام کسانی است که
در مرتبه دوم از نظر امتیاز در هرجدول قرار دارند و <span style='color:lime'>35% </span>از
جوایز به آنها تعلق می گیرد. <o:p></o:p></span></p>

<div style='mso-element:para-border-div;border:none;border-bottom:solid windowtext 1.0pt;
mso-border-bottom-alt:solid windowtext .75pt;padding:0cm 0cm 1.0pt 0cm'>

<p class=MsoNormal dir=RTL style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:justify;line-height:200%;direction:rtl;unicode-bidi:embed;
border:none;mso-border-bottom-alt:none windowtext .75pt;padding:0cm;
mso-padding-alt:0cm 0cm 1.0pt 0cm'><span lang=FA style='font-size:12.0pt;
line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>بدیهی
است جوایز مربوط به هر گروه از برندگان </span><span lang=FA style='font-size:
10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";mso-bidi-language:
FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:200%;font-family:
"Tahoma","sans-serif";mso-bidi-language:FA'>نفرات اول و یا دوم دارای امتیاز
مساوی </span><span lang=FA style='font-size:10.0pt;line-height:200%;font-family:
"Tahoma","sans-serif";mso-bidi-language:FA'>)</span><span lang=FA
style='font-size:12.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'> بطور مساوی بین تعداد نفرات هر گروه تقسیم می شود و حداکثر
تا <span style='color:lime'>24 ساعت </span>به حساب بانکی مشخص هر کاربر </span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>(</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'>طبق فایل کاربری</span><span
lang=FA style='font-size:10.0pt;line-height:200%;font-family:"Tahoma","sans-serif";
mso-bidi-language:FA'>)</span><span lang=FA style='font-size:12.0pt;line-height:
200%;font-family:"Tahoma","sans-serif";mso-bidi-language:FA'> واریز می گردد و
لیست برندگان در صفحه مخصوص به برندگان <span style='mso-spacerun:yes'> </span>هر
جدول از لیگ قابل مشاهده است، تا چند هفته بعد نیز در فایل مربوطه باقی می ماند.<o:p></o:p></span></p>
</div></div><%--<div class="sport_chkAcceptLows"></div>--%>
<div class="sport_AcceptLows">    
    <input type="checkbox" id="chk_SportLows" class="sport_chkAcceptLows" runat="server"/>
     <span class="chkspan" id="chkSpan" runat="server">با قوانین سایت موافقم</span> 
    <br /><br />
    <input type="button" disabled="disabled" class="sport_btnAcceptLowsDis" id="btn_acceptLows" value="تائید و ورود به بخش مسابقات" runat="server" />
</div>