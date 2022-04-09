<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserRewardBox.ascx.cs" Inherits="UserPanel_UserRewardBox" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    <Services><asp:ServiceReference Path="~/UserPanelService.asmx" /></Services>
    <Scripts>
        <asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewScript.js" />
        <asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewDragDrop.js" />
        <asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewGlitz.js" />
    </Scripts>
</asp:ScriptManager>
<div class="userReward">
    <fieldset>
        <legend>صندوق جایزه</legend>
        <table cellpadding="2" cellspacing="3">
            <tr>
                <td colspan="4" class="userReward_cell">
                    <asp:Label ID="lbl_Today" runat="server" Text="امروز ....." ForeColor="#ffcc00"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="userReward_cell" style="width: 189px">
                    <asp:Label ID="Label1" runat="server" Text="مشخصات کاربری : "></asp:Label>
                </td>
                <td class="userReward_cell" style="width: 218px">
                    <asp:Label ID="lbl_UserAttr" runat="server" Text="....................." ForeColor="Lime"></asp:Label>
                </td>
                <td class="userReward_cell" style="width: 183px">
                    <asp:Label ID="Label3" runat="server" Text="شناسه کاربری : "></asp:Label>
                </td>
                <td style="width: 276px" class="userReward_cell">
                    <asp:Label ID="lbl_UserName" runat="server" Text="....................." ForeColor="Lime"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="userReward_cell" style="width: 189px">
                    <asp:Label ID="Label8" runat="server" Text="موجودی صندوق جایزه : "></asp:Label>
                </td>
                <td style="width: 218px" class="userReward_cell">
                    <asp:Label ID="lbl_RewardBoxInventory" runat="server" Text="............ ریال" ForeColor="Lime"></asp:Label>
                    <asp:HiddenField Value="0" ID="hdn_RewardBoxInventory" runat="server"></asp:HiddenField>
                </td>
                <td class="userReward_cell" style="width: 183px">
                    &nbsp;</td>
                <td style="width: 276px" class="userReward_cell">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="userReward_cell" style="width: 189px">
                    <asp:Label ID="Label10" runat="server" Text="مبلغ آخرین جایزه : "></asp:Label>
                </td>
                <td class="userReward_cell" style="width: 218px">
                    <asp:Label ID="lbl_LastRewardAmount" runat="server" Text="............ ریال" ForeColor="Lime"></asp:Label>
                </td>
                <td class="userReward_cell" style="width: 183px">
                    <asp:Label ID="Label7" runat="server" Text="تاریخ و ساعت آخرین جایزه : "></asp:Label>
                </td>
                <td style="width: 276px" class="userReward_cell">
                    <asp:Label ID="lbl_LastRewardDate" runat="server" Text="....................." ForeColor="Lime"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <hr style="color:#5D5852"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" id="btn_RewardsDetails" value="جزئیات جوایز" runat="server"
                    class="btn" onclick="getRewardDetails();" />
                    <input type="button" id="btn_SettleDemand" value="درخواست واریز" runat="server"
                    class="btn" onclick="onShowSettleDemand();"/>
                   <input type="button" id="btn_ChargeWithRewards" value="شارژ حساب با جوایز" runat="server"
                    class="btn" onclick="onChargeWithReward();"/>
                </td>
            </tr>
        </table>
    </fieldset>
    <div id="divRewardDetails" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">چزئیات جوائز</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_rewardDetails">
        <fieldset>
            <AjaxData:GridView ID="gv_RewardDetails" runat="server" CssClass="grid"
                CellSpacing="0" CellPadding="3" SortOrderAscendingImageUrl="~/Images/up.gif"
                SortOrderDescendingImageUrl="~/Images/dn.gif" SortCommandEvent="onSortCommand" RowDataBoundEvent="onRowDataBound">
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <RowStyle CssClass="RowStyle" Height="35px" />
                <HeaderStyle CssClass="HeaderStyle" BackColor="#1b1b1b" ForeColor="#ffcc00" Height="30px" VerticalAlign="Middle" HorizontalAlign="Center" />
                <Columns>
                    <AjaxData:GridViewBoundColumn HeaderText="ردیف" DataField="RowIndex" AllowDragAndDrop="false"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" ItemStyle-Width="5%">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="کد اطلاعاتی مسابقه" DataField="RacingInfo_ID" AllowDragAndDrop="false"
                        SortField="RacingInfo_ID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" ItemStyle-Width="15%">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="عنوان مسابقه" DataField="Race_Title" AllowDragAndDrop="false"
                        SortField="Race_Title" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" ItemStyle-Width="15%">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="تاریخ شروع مسابقه" DataField="RacingInfo_StartDate" AllowDragAndDrop="false"
                        SortField="RacingInfo_StartDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" ItemStyle-Width="15%">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="تاریخ پایان مسابقه" DataField="RacingInfo_EndDate" AllowDragAndDrop="false"
                        SortField="RacingInfo_EndDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" ItemStyle-Width="15%">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="رتبه شما" DataField="RcingWinners_FormProminence" AllowDragAndDrop="false"
                        SortField="RcingWinners_FormProminence" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" ItemStyle-Width="15%">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="جایزه شما" DataField="RacingWinners_RewardAmount" SortField="RacingWinners_RewardAmount" AllowDragAndDrop="false"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" ItemStyle-Width="15%">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewHyperLinkColumn HeaderText="نمایش فرم" DataTextField="RacingWinners_FormID" AllowDragAndDrop="false"
                    SortField="RacingWinners_FormID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" ItemStyle-Width="15%">
                    </AjaxData:GridViewHyperLinkColumn>
                </Columns>
            </AjaxData:GridView>
            <div style="text-align: center; font-size: 12px; background-color: #1b1b1b; color: Yellow;
                border-color: #222222; border-style: solid; border-width: 1px">
                <AjaxData:Pager ID="rewardPager" runat="server" CssClass="pager" ForeColor="#ffcc00" CurrentPageStyle-ForeColor="White" PageSize="5" HideOnSinglePage="true"
                    PageChangedEvent="pageChanged">
                    <CurrentPageStyle ForeColor="White" />
                </AjaxData:Pager> 
            </div>           
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
    </div>
<%--    درخواست واریز--%>
    <div id="SettleDemand" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="Span1" class="ui-dialog-title">درخواست واریز</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-SettleDemand">
        <form id="frm_SettleDemand">
        <fieldset>
            <div style="direction:rtl;text-align:right;line-height:25px">
                <span >
                    مبلغ مورد درخواست خود جهت واریز به حساب شما را در این قسمت وارد نمائید.بدیهی است این مبلغ پس از بررسی ظرف مدت 48 ساعت به شماره حساب بانکی شما که در قسمت اطلاعات تکمیلی ثبت نموده اید واریز می گردد.
                </span>
                <table>
                    <tr>
                        <td style="width:50%">
                            <span>موجودی صندوق جایزه: </span>
                            <asp:Label ID="lbl_DemandInventoryRewardBox" runat="server" Text="......."></asp:Label>
                        </td>
                        <td style="width:50%">
                            <span>مبلغ مورد درخواست: </span>
                            <input type="text" id="txt_DemandYourAmount" class="txt" value="0" onkeydown="javascript:return jsNumbers(event);" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" value="تائید" onclick="onSettleDemandOk();"  class="btn"/>
                        </td>
                        <td>
                            <input type="button" value="بازگشت" class="btn" onclick="$('#dialog-SettleDemand').dialog('close');"/>
                        </td>
                    </tr>
                </table>
            </div>        
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>

<%--فرم تائید نهائی--%>
    <div id="SettleDemandOkFinal" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="Span2" class="ui-dialog-title">درخواست واریز</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog_SettleDemandFinalOk">
        <form id="frm_SettleDemandFinalOk">
        <fieldset>
            <div style="direction:rtl;text-align:right;line-height:25px">
                <table>
                    <tr>
                        <td colspan="3">
                            <span>شناسه کاربری: </span>
                            <asp:Label ID="lbl_DemandUserName" runat="server" Text=".........."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span> شماره حساب </span>
                            <asp:Label ID="lbl_DemandAccountNumber" runat="server" Text="........."></asp:Label>
                        </td>
                        <td>
                            <span> نام بانک : </span>
                            <asp:Label ID="lbl_DemandBankName" runat="server" Text="........."></asp:Label>
                        </td>
                        <td>
                            <span> به نام آقا / خانم : </span>
                            <asp:Label ID="lbl_DemandFullName" runat="server" Text=".............."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td  colspan="3">
                            <span> مبلغ جایزه درخواستی جهت دریافت : </span>
                            <asp:Label ID="lbl_DemandRewardAmount" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>                        
                    </tr>
                    <tr>
                        <td  colspan="3">
                            <span>درصورت صحت مشخصات و شماره حساب بانکی فوق گزینه تائید
                             را انتخاب نمائید،درغیر اینصورت گزینه اصلاح مشخصات را انتخاب نمائید.
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td  colspan="3">
                            <span>تذکر: </span>
                            <span>بدیهی است در صورت تائید نهائی توسط کاربر مسئولیت هرگونه مغایرتی در مشخصات
                             و شماره حساب بانکی به عهده کاربر می باشد و هیچگونه مسئولیتی متوجه سایت حس ششم نمی باشد.
                            </span>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td><input type="button" value="تائید نهائی" class="btn" onclick="onDemandOkFinal()"/></td>
                        <td><input type="button" value="اصلاح مشخصات" class="btn" onclick="onDemandGotoGeneralInfo()"/></td>
                        <td><input type="button" value="بازگشت" class="btn" 
                            onclick="$('#dialog_SettleDemandFinalOk').dialog('close');$('#dialog-SettleDemand').dialog('open');"/></td>
                    </tr>                        
                </table>
            </div>        
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>

<%--فرم پیغام نهائی--%>
    <div id="DemandMessageFinal" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="Span3" class="ui-dialog-title">پیغام نهائی جهت درخواست واریز</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-DemandMessageFinal">
        <form id="frm_DemandMessageFinal">
        <fieldset>
            <div  style="direction:rtl;text-align:right;line-height:25px">
                <span>مبلغ درخواستی شما پس از بررسی در صورت تائید ظرف مدت حداکثر 48 ساعت به شماره حساب شما واریز و نتیجه از طریق پست الکترونیکی به شما اعلام می گردد.</span>         
                <br />
                <br />
                <span> مبلغ مورد درخواست: </span>
                <asp:Label ID="lbl_SettleDemandMessageAmount" runat="server" Text=".........."></asp:Label>&nbsp;&nbsp;&nbsp;
                <asp:HiddenField ID="hdn_SettleDemandMessageAmount" runat="server" Value="0" />
                <span> شماره حساب : </span>
                <asp:Label ID="lbl_SettleDemandMessageAccountNumber" runat="server" Text="................."></asp:Label>&nbsp;&nbsp;&nbsp;
                <span> نزد بانک : </span>
                <asp:Label ID="lbl_SettleDemandMessageBankName" runat="server" Text="............"></asp:Label>&nbsp;&nbsp;&nbsp;
                <span> به نام آقا/خانم : </span>
                <asp:Label ID="lbl_SettleDemandMessageFullName" runat="server" Text="............"></asp:Label>
                <br />
                <br />                
                <input type="button" ID="btn_SettleDemandRewardRegister" value="ثبت درخواست" class="btn" onclick="onDemandRewardRegister()" />
                <%--<asp:Button ID="btn_SettleDemandRewardRegister" runat="server" Text="ثبت درخواست" CssClass="btn" OnClick="btn_SettleDemandRewardRegister_Click"/>--%>
                <input type="button" value="بازگشت" class="btn" onclick="$('#dialog-DemandMessageFinal').dialog('close');$('#dialog_SettleDemandFinalOk').dialog('open');" />
            </div>
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<%--فرم شارژ حساب با جوایز--%>
    <div id="ChargeWithReward" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="Span4" class="ui-dialog-title">شارژ حساب با جوایز</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-ChargeWithReward">
        <form id="frm_ChargeWithReward">
        <fieldset>
            <div  style="direction:rtl;text-align:right;line-height:25px">
                <table>
                    <tr>
                        <td colspan="2">
                            <span> موجودی صندوق جایزه: </span>
                            <asp:Label ID="lbl_ChargeWithReward_Inventory" runat="server" Text="............."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span>مبلغ درخواستی جهت شارژ حساب</span>
                            <input type="text" id="txt_ChargeWithReward_DemandAmount" class="txt" value="0" onkeydown="javascript:return jsNumbers(event);" />                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span>تذکر: </span>
                            <span>درصورتی که بنا به درخواست کاربر مبلغی از صندوق جایزه وی کسر  و به شارژ حساب کاربر افزوده شود،این مبلغ قابل بازگشت نبوده و کاربر می تواند موجودی شارژ حساب را تنها جهت شرکت در مسابقه استفاده نماید. </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" value="تائید شارژ حساب" class="btn" onclick="onChargeWithRewardOk();"/>
                        </td>
                        <td>
                            <input type="button" value="بازگشت" class="btn" onclick="$('#dialog-ChargeWithReward').dialog('close');" />
                        </td>
                    </tr>
                </table>
            </div>
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>

</div>
<script src="../Scripts/OnlyNumber.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();

    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 830, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'جزئیات جوائز', modal: true
        }); $('.submit').click(function () { $("#dialog-form").dialog("close"); });

        $("#dialog-SettleDemand").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 830, direction: 'rtl',
            show: 'clip', hide: 'slide', stack: true, position: 'center', title: 'درخواست واریز', modal: true
        }); $('.submit').click(function () { $("#dialog-SettleDemand").dialog("close"); });

        $("#dialog_SettleDemandFinalOk").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 830, direction: 'rtl',
            show: 'slide', hide: 'clip', stack: true, position: 'center', title: 'درخواست واریز', modal: true
        }); $('.submit').click(function () { $("#dialog_SettleDemandFinalOk").dialog("close"); });

        $("#dialog-DemandMessageFinal").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 830, direction: 'rtl',
            show: 'slide', hide: 'clip', stack: true, position: 'center', title: 'پیغام نهائی جهت درخواست واریز', modal: true
        }); $('.submit').click(function () { $("#dialog-DemandMessageFinal").dialog("close"); });

        $("#dialog-ChargeWithReward").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 830, direction: 'rtl',
            show: 'slide', hide: 'clip', stack: true, position: 'center', title: 'شارژ حساب با جوایز', modal: true
        }); $('.submit').click(function () { $("#dialog-ChargeWithReward").dialog("close"); });
    });
    //blind-clip-drop-explode-fold-puff-slide-scale-size-pulsate
    function setBlock()
    {
        $.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br /></h4>',
            fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: true,
            css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000' }
        });
    }
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function ()
    {
        setBlock();
    });
    prm.add_endRequest(function ()
    {
        $.unblockUI();
    });

    var _gv_RewardDetails;
    var _pager;

    function getUserID()
    {
        return '<%= ActiveUserID %>';
    }
    var activeUserID = getUserID();

    function isUserAuthenticated()
    {
        return '<%= IsUserAuthenticated %>';
    }
    var isAuthenticated = isUserAuthenticated();
    function pageLoad(sender, e)
    {
        _gv_RewardDetails = $find('<%= gv_RewardDetails.ClientID %>');
        _pager = $find('<%= rewardPager.ClientID %>');
        //getRewardDetails();
    }
    function getRewardDetails()
    {
        if (isAuthenticated)
        {
            setBlock();
            var sortColumn = _gv_RewardDetails.get_sortColumn();
            var sortOrder = (_gv_RewardDetails.get_sortOrder() == AjaxDataControls.GridViewSortOrder.Descending) ? 'DESC' : 'ASC';
            var startIndex = (_pager.get_pageIndex() * _pager.get_pageSize());
            UserPanelService.getRewardsDetails(activeUserID, startIndex, _pager.get_pageSize(), sortColumn, sortOrder, onsuccessRewardDetails);
            $('#dialog-form').dialog('open');
        }
        else
        {
            location.href = "Home.aspx";
        }
    }
    function onsuccessRewardDetails(result)
    {
        if (result != null && result.Total != null)
        {
            _pager.set_recordCount(result.Total);
            _gv_RewardDetails.set_dataSource(result.Rows);
            _gv_RewardDetails.dataBind();
        }
        $.unblockUI();
    }
//    function onShowRewardDetails()
//    {
//        getRewardDetails();
//        $('#dialog-form').dialog('open');
//    }
    function pageChanged(sender, e)
    {
        setBlock();
        _pager.set_pageIndex(e.get_newPageIndex());
        getRewardDetails();
    }
    function onSortCommand(sender, e)
    {
        setBlock();
        _gv_RewardDetails.set_sortColumn(e.get_sortColumn())
        _gv_RewardDetails.set_sortOrder(e.get_sortOrder());
        _pager.set_pageIndex(0); // need to reset the page index as sorting is changed
        getRewardDetails();
    }
    function setColorToHeader(headerText, tr, color)
    {
        var ColumnName = _gv_RewardDetails.getColumnIndexByHeaderText(headerText);
        var ColumnText = tr.childNodes[ColumnName].childNodes[0];
        ColumnText.style.color = color;
    }
    function onRowDataBound(sender, e)
    {
        var row = e.get_row();
        if (row.get_rowType() == AjaxDataControls.GridViewRowType.Header)
        {
            var tr = row.get_container();
            var columnColor = "Lime";
            setColorToHeader('کد اطلاعاتی مسابقه',tr , columnColor);
            setColorToHeader('عنوان مسابقه', tr, columnColor);
            setColorToHeader('تاریخ شروع مسابقه', tr, columnColor);
            setColorToHeader('تاریخ پایان مسابقه', tr, columnColor);
            setColorToHeader('رتبه شما', tr, columnColor);
            setColorToHeader('جایزه شما', tr, columnColor);
            setColorToHeader('نمایش فرم', tr, columnColor);
        }
    }
    function onShowSettleDemand()
    {
        if (isAuthenticated)
        {
            setBlock();
            var rewardAmount = $("span[id$=lbl_RewardBoxInventory]").html();
            $("span[id$=lbl_DemandInventoryRewardBox]").html("<b>" + rewardAmount + "</b>");
            $('#dialog-SettleDemand').dialog('open');
            $.unblockUI();
        }
        else
        {
            location.href = "Home.aspx";
        }
    }
    function onDemandOkFinal()
    {
        if (isAuthenticated)
        {
            setBlock();
            $("span[id$=lbl_SettleDemandMessageAccountNumber]").html("<b style='color:Navy'>" + $("span[id$=lbl_DemandAccountNumber]").html() + "</b>");
            $("span[id$=lbl_SettleDemandMessageBankName]").html("<b style='color:Navy'>" + $("span[id$=lbl_DemandBankName]").html() + "</b>");
            $("span[id$=lbl_SettleDemandMessageFullName]").html("<b style='color:Navy'>" + $("span[id$=lbl_DemandFullName]").html() + "</b>");

            var userDemandAmount = $("span[id$=lbl_DemandRewardAmount]").html();
            $("span[id$=lbl_SettleDemandMessageAmount]").html("<b style='color:Red'>" + userDemandAmount + "</b>");

            $('#dialog_SettleDemandFinalOk').dialog('close');
            $('#dialog-DemandMessageFinal').dialog('open');
            $.unblockUI();
        }
        else
        {
            location.href = "Home.aspx";
        }
    }
    function onSettleDemandOk()
    {
        if (isAuthenticated)
        {
            setBlock();
            var hdnRewardAmount = $("input:hidden[id$=hdn_RewardBoxInventory]").val();
            //alert(hdnRewardAmount);
            var userDemandAmount = $("input:text[id$=txt_DemandYourAmount]").val();
            //alert(userDemandAmount);
            if (userDemandAmount == 0 || userDemandAmount == "")
            {
                jAlert("لطفا مبلغ درخواستی خود را وارد نمائید", "درخواست واریز");
                //alert("لطفا مبلغ درخواستی خود را وارد نمائید");
                $("input:text[id$=txt_DemandYourAmount]").select();
                $.unblockUI();
                return;
            }
            //        alert(hdnRewardAmount);
            //        alert(userDemandAmount);
            if (parseInt(userDemandAmount) > parseInt(hdnRewardAmount))
            {
                jAlert("مقدار درخواستی از موجودی صندوق جایزه شما بیشتر است", "درخواست واریز");
                $("input:text[id$=txt_DemandYourAmount]").select();
                $.unblockUI();
                return;
            }
            getAccountInformation();
            $('#dialog-SettleDemand').dialog('close');
            $('#dialog_SettleDemandFinalOk').dialog('open');
            //$.unblockUI();
        }
        else
        {
            location.href = "Home.aspx";
        }

    }
    function getAccountInformation()
    {
        if (isAuthenticated)
        {
            setBlock();
            // call server side method
            //PageMethods.GetAccountNumber(CallSuccess, CallFailed);
            PageMethods.getAccountInfo(CallSuccess, CallFailed);
        }
        else
        {
            location.href = "Home.aspx";
        }
    }

    // set the destination textbox value with the ContactName
    function CallSuccess(res)
    {
       $("span[id$=lbl_DemandUserName]").html("<b style='color:Green'>" + res.Username + "</b>");
       $("span[id$=lbl_DemandAccountNumber]").html("<b style='color:Navy'>" + res.AccountNumber + "</b>");
       $("span[id$=lbl_DemandBankName]").html("<b style='color:Navy'>" + res.BankName + "</b>");
       $("span[id$=lbl_DemandFullName]").html("<b style='color:Navy'>" + res.FName + " " + res.LastName + "</b>");

       var userDemandAmount = $("input:text[id$=txt_DemandYourAmount]").val();
       $("span[id$=lbl_DemandRewardAmount]").html("<b style='color:Red'>" + userDemandAmount.toString("n0") + " ریال" + "</b>");
       $.unblockUI();
    }
    // alert message on some failure
    function CallFailed(res)
    {
        $.unblockUI();
        jAlert(res.get_message(), "درخواست واریز");
    }
    function insertDemandSettleReward()
    {
        if (isAuthenticated)
        {
            setBlock();
            var amount = $("input:text[id$=txt_DemandYourAmount]").val();
            //alert(amount);
            PageMethods.InsertSettleDemandReward(amount, onSettleDemandRegisterSuccess, onSettleDemandRegisterFail);
        }
        else
        {
            location.href = "Home.aspx";
        }
    }
    function onSettleDemandRegisterSuccess(res)
    {
        alert("درخواست شما ثبت گردید.", "درخواست واریز");
        $('#dialog_SettleDemandFinalOk').dialog('close');
        $("input:button[id$=btn_SettleDemandRewardRegister]").attr('disabled', true);
        if (isAuthenticated)
        {
            location.href = "UserProfileRegister.aspx?moduleName=UserRewardBox";
        }
        else
        {
            jAlert("لطفا ابتدا لوگین کنید", "درخواست واریز");
            $.unblockUI(); 
        }
        $.unblockUI();
    }
    function onSettleDemandRegisterFail(res)
    {
        jAlert("خطا در هنگام ثبت درخواست شما", "درخواست واریز");
        $.unblockUI();        
    }
    function onDemandRewardRegister()
    {
        insertDemandSettleReward();
    }

    function onDemandGotoGeneralInfo()
    {
        if (isAuthenticated)
        {
            location.href = "UserProfileRegister.aspx?moduleName=UserGeneralInfo";
        }
        else
        {
            location.href = "Home.aspx";
        }
    }
    function onChargeWithReward()
    {
        if (isAuthenticated)
        {
            setBlock();
            var rewardAmount = $("span[id$=lbl_RewardBoxInventory]").html();
            $("span[id$=lbl_ChargeWithReward_Inventory]").html("<b>" + rewardAmount + "</b>");
            $('#dialog-ChargeWithReward').dialog('open');
            $.unblockUI();
        }
        else
        {
            location.href = "Home.aspx";
        }
    }

    function decreaseRewardBoxForChargeBox()
    {
        if (isAuthenticated)
        {
            setBlock();
            var oldRewardInventory = $("input:hidden[id$=hdn_RewardBoxInventory]").val();
            var RewardAmountForCharge = $("input:text[id$=txt_ChargeWithReward_DemandAmount]").val();
            PageMethods.IncreaseChargeBoxWithReward(oldRewardInventory, RewardAmountForCharge, onRewardChargeSuccess, onRewardChargeFail);
        }
        else
        {
            location.href = "Home.aspx";
        }
    }
    function onRewardChargeSuccess(res)
    {
        alert("شارژ حساب با جوایز با موفقیت انجام پذیرفت", "شارژ حساب با جوایز");
        if (isAuthenticated)
        {
            location.href = "UserProfileRegister.aspx?moduleName=UserRewardBox";          
        }
        else
        {
            jAlert("لطفا ابتدا لوگین کنید", "شارژ حساب با جوایز");
            $.unblockUI();
        }
        $.unblockUI();
    }
    function onRewardChargeFail(xhr, status, error)
    {
        $.unblockUI();
        //alert("وقوع خطا" + response.d);        
        // Boil the ASP.NET AJAX error down to JSON.
        //var err = eval("(" + xhr.responseText + ")");
        var err =  xhr.responseText; 
        // Display the specific error raised by the server (e.g. not a
        //   valid value for Int32, or attempted to divide by zero).
        jAlert(err, "شارژ حساب با جوایز");
    }
    function onChargeWithRewardOk()
    {
        var userDemandAmount = $("input:text[id$=txt_ChargeWithReward_DemandAmount]").val();
        var hdnRewardAmount = $("input:hidden[id$=hdn_RewardBoxInventory]").val();       
        if (userDemandAmount == 0 || userDemandAmount == "")
        {
            jAlert("لطفا مبلغ درخواستی خود را وارد نمائید", "شارژ حساب با جوایز");
            $("input:text[id$=txt_ChargeWithReward_DemandAmount]").select();
            $.unblockUI();
            return;
        }
        if (parseInt(userDemandAmount) > parseInt(hdnRewardAmount))
        {
            jAlert("مقدار درخواستی از موجودی صندوق جایزه شما بیشتر است", "شارژ حساب با جوایز");
            $("input:text[id$=txt_ChargeWithReward_DemandAmount]").select();
            $.unblockUI();
            return;
        }
        decreaseRewardBoxForChargeBox();
    }
</script>