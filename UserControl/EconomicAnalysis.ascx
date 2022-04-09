<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicAnalysis.ascx.cs" Inherits="UserControl_EconomicAnalysis" %>

<link href="../Styles/CSSEco_Analysis.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(function ()
    {
        $('#movies').panelGallery({
            viewDuration: 3000,
            transitionDuration: 500,
            boxSize: 45,
            boxFadeDuration: 500,
            boxTransitionDuration: 50
        });
    });
</script>
 <script type="text/javascript">
     function scrollToStu()
     {
         var el = document.getElementById("analysisContext");
         el.scrollIntoView(true);
     }
     $(document).ready(function ()
     {
         $(".scroll").click(function (event)
         {
             //prevent the default action for the click event
             event.preventDefault();

             //get the full url - like mysitecom/index.htm#home
             var full_url = this.href;

             //split the url by # and get the anchor target name - home in mysitecom/index.htm#home
             var parts = full_url.split("#");
             var trgt = parts[1];

             //get the top offset of the target anchor
             var target_offset = $("#" + trgt).offset();
             var target_top = target_offset.top - 15;

             //goto that anchor by setting the body scroll top to anchor top
             $('html, body').animate({ scrollTop: target_top }, 500);
         });
     });

</script>

<div class="ecoAnalysis_mainContent">
    <div style="width:278px; height: 500px; position: relative; overflow: hidden; 
        background: url(&quot;loading.gif&quot;) no-repeat scroll 50% 50% rgb(102, 102, 102); cursor: auto;" id="movies" 
        class="ecoAnalysis_LeftPicContent">
        <img src="../Images/Economic/Economic_Analysis/Eco_AnalisysSlideshow/Eco_AnalysisPic.jpg" />
        <img src="../Images/Economic/Economic_Analysis/Eco_AnalisysSlideshow/Image1.jpg" />
        <img src="../Images/Economic/Economic_Analysis/Eco_AnalisysSlideshow/Image2.jpg" />
        <img src="../Images/Economic/Economic_Analysis/Eco_AnalisysSlideshow/Image3.jpg" />
        <img src="../Images/Economic/Economic_Analysis/Eco_AnalisysSlideshow/Image4.jpg" />
    </div>

    <div class="ecoAnalysis_GridTitle">
        <asp:GridView ID="gv_EconomicAnalysisTitle" runat="server" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="None" PageSize="3" ShowHeader="False" 
            Width="568px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>                
                <asp:TemplateField>                    
                    <ItemStyle CssClass="analysisTitleRow" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Title" runat="server" Text='<%# Eval("EconomicAnalysis_Title") %>'></asp:Label>                
                        <div class="analysisReadMore">
                            <a href='#<%# Container.DataItemIndex+1 %>' class="scroll" id="readMore">ادامه مطلب</a>   
                        </div>                                                     
                    </ItemTemplate>                    
                </asp:TemplateField>
            </Columns>
<%--            <RowStyle CssClass="analysisRow" />--%>
            <RowStyle BorderColor="Gainsboro" />
        </asp:GridView>
    </div> 

</div>
<div class="ecoAnalysis_GridContext">
    <asp:GridView ID="gv_EconomicAnalysisContext" runat="server" AutoGenerateColumns="False"
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" GridLines="None" PageSize="3" ShowHeader="False" 
        Width="852px">
        <AlternatingRowStyle BackColor="Window" />
        <Columns>                
            <asp:TemplateField>                    
                <ItemStyle CssClass="analysisContextRow" />
                <ItemTemplate>
                    <div id='<%# Container.DataItemIndex+1 %>'>
<%--                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("EconomicAnalysis_Title") %>'></asp:Label>
                        <br />  --%>
                        <asp:Label ID="lblContext" runat="server" Text='<%# Eval("EconomicAnalysis_Context") %>'></asp:Label>  
                    </div>  
                        <div class="analysisReadMore">
                            <a onclick="javascript:window.scroll(0,0);" style="cursor:pointer;color:Green" id="goTopPage">بالای صفحه</a>
                        </div>                                                                   
                </ItemTemplate>                    
            </asp:TemplateField>
        </Columns>
        <RowStyle BackColor="Gainsboro" />
    </asp:GridView>        
</div>