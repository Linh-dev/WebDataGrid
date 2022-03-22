<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 10px; width: 100%">
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/WebHierarchicalDataGrid/Display/ExpandCollapseAnimation/config.png" />
            <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_PanelHeaderTitle")%></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <table border="0">
                    <td>
                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_EnableCBoxText")%>
                    </td>
                    <td>
                        <input type="checkbox" id="enableWHDGAnimations" checked="checked" onclick="ExpandWebPanel(this)" />
                    </td>
                </table>
                <table>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_AnimationTypeLabel")%>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_AnimationTypeFade")%>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="FadeRadio" value="0" onclick="ApplayAnimation();" />
                                    </td>
                                    <td>
                                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_AnimationTypeSlide") %>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="SlideRadio" checked="checked" value="1" onclick="ApplayAnimation();" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_SlideDirectionLabel")%>
                        </td>
                        <td>
                            <select id="SlideDirection" onchange="ApplayAnimation();">
                                <option value="0" selected="selected">
                                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_SlideDirectionAuto")%></option>
                                <option value="1">
                                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_SlideDirectionVertical")%></option>
                                <option value="2">
                                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_SlideDirectionHorizontal")%></option>
                                <option value="3">
                                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ExpandAnimations_SlideDirectionBoth")%></option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0"
            DataKeyFields="SupplierID" InitialDataBindDepth="0" Height="400" Width="100%">
            <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="1500" SlideCloseDirection="Auto"
                SlideCloseDuration="600" />
            <Columns>
                <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
                <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
                <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
                <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>" />
            </Columns>
            <Bands>
                <ig:Band DataMember="AccessDataSource2_Products" Key="Products" AutoGenerateColumns="false"
                    DataKeyFields="ProductID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                        <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                        <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    </Columns>
                </ig:Band>
            </Bands>
        </ig:WebHierarchicalDataGrid>
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="AccessDataSource1_Suppliers"
                    ChildColumns="SupplierID" ChildDataViewID="AccessDataSource2_Products" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="AccessDataSource1_Suppliers" DataSourceID="AccessDataSource1" />
                <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
            </DataViews>
        </ig:WebHierarchicalDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
        </asp:AccessDataSource>
    </div>
    <script type="text/javascript">

        function ExpandWebPanel(checkbox) {
            ApplayAnimation();
        }

        function ApplayAnimation() {
            if (GetEnableWHDGAnimations().checked) {

                if (GetFadeRadio().checked) {
                    ApplayFadeAnimation(1500, 600);
                }
                else {
                    ApplayFadeAnimation(1, 1);
                }

                if (GetSlideRadio().checked) {

                    var sdIndex = GetSlideDirection().selectedIndex;
                    var direction = GetSlideDirection().options[sdIndex].value;

                    ApplaySlideAnimation(direction, 1500, direction, 600);
                }
                else {
                    ApplaySlideAnimation(0, 0, 0, 0);
                }

            }
            else {
                ApplaySlideAnimation(0, 0, 0, 0);
                ApplayFadeAnimation(1, 1);
            }
        }

        function ApplaySlideAnimation(slideOpenDirection, slideOpenDuration, slideCloseDirection, slideCloseDuration) {
            GetWHDGControl().get_animation().set_slideOpenDirection(slideOpenDirection);
            GetWHDGControl().get_animation().set_slideOpenDuration(slideOpenDuration);

            GetWHDGControl().get_animation().set_slideCloseDirection(slideCloseDirection);
            GetWHDGControl().get_animation().set_slideCloseDuration(slideCloseDuration);
        }

        function ApplayFadeAnimation(fadeOpenDuration, fadeCloseDuration) {
            GetWHDGControl().get_animation().set_fadeOpenDuration(fadeOpenDuration);

            GetWHDGControl().get_animation().set_fadeCloseDuration(fadeCloseDuration);
        }

        function GetEnableWHDGAnimations() {
            return document.getElementById("enableWHDGAnimations");
        }

        function GetFadeRadio() {
            return document.getElementById("FadeRadio");
        }

        function GetSlideRadio() {
            return document.getElementById("SlideRadio");
        }

        function GetSlideDirection() {
            return document.getElementById("SlideDirection");
        }


        function GetWHDGControl() {
            return $find("<%= this.whdg1.ClientID %>");
        }
        
    </script>
</asp:Content>
