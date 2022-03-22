<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_AjaxIndicator_Display_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<script src="/samplesbrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
<link href="/samplesbrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanel.css" rel="stylesheet"
    type="text/css" />
    <style>
        .ig_AjaxIndicatorBlock
        {
            background: #909090;
            filter: alpha(opacity:30);
            opacity: 0.3;
        }
        
        #Div3
        {
           height: 130px;
        }
    </style>

    <br />
    <br />

    <div id="Div1" class="ControlPanelHeader">
        <img src="/samplesbrowser/samplescommon/aspnet/Common/config.png" />
        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPTitle") %></div>
    <div id="Div2" class="controlPanel">
        <div id="Div3" class="controlPanelEvent">
            <table>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_FadeInEquationTypeLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFadeInEquationType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFadeInEquationType_SelectedIndexChanged"
                            Width="120px">
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_Linear %>"
                                Value="0" Selected="True" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_EaseIn %>"
                                Value="1" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_EaseOut %>"
                                Value="2" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_EaseInOut %>"
                                Value="3" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_Bounce %>"
                                Value="4" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_LocationLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                            Width="120px">
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_NotSet %>"
                                Value="-1" Selected="True" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopLeft %>"
                                Value="0" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopCenter %>"
                                Value="1" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopRight %>"
                                Value="2" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopInfront %>"
                                Value="3" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopBehind %>"
                                Value="4" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleLeft %>"
                                Value="8" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleCenter %>"
                                Value="9" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleRight %>"
                                Value="10" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleInfront %>"
                                Value="11" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleBehind %>"
                                Value="12" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomLeft %>"
                                Value="16" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomCenter %>"
                                Value="17" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomRight %>"
                                Value="18" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomInfront %>"
                                Value="19" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomBehind %>"
                                Value="20" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveLeft %>"
                                Value="32" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveCenter %>"
                                Value="33" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveRight %>"
                                Value="34" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveInfront %>"
                                Value="35" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveBehind %>"
                                Value="36" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowLeft %>"
                                Value="64" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowCenter %>"
                                Value="65" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowRight %>"
                                Value="66" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowInfront %>"
                                Value="67" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowBehind %>"
                                Value="68" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_BlockAreaLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBlockArea" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBlockArea_SelectedIndexChanged"
                            Width="120px">
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_NotSet %>"
                                Value="0" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_Disabled %>"
                                Value="1" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_Control %>"
                                Selected="True" Value="2" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_Page %>"
                                Value="3" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_RequestDelayLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRequestDelay" runat="server" Width="120px">
                            <asp:ListItem Text="" Value="" Selected="True" />
                            <asp:ListItem Text="1 sec." Value="1000" />
                            <asp:ListItem Text="2 sec." Value="2000" />
                            <asp:ListItem Text="3 sec." Value="3000" />
                            <asp:ListItem Text="4 sec." Value="4000" />
                            <asp:ListItem Text="5 sec." Value="5000" />
                        </asp:DropDownList>
                        <span id="countdownSpan"></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="DataGridWrapper">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1" DataKeyFields="EmployeeID"
            AutoGenerateColumns="false" AutoGenerateBands="false" Height="500" Width="100%" OnInit="whdg1_Init">
            <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="1500" SlideCloseDirection="Auto"
                SlideCloseDuration="600" />
            <AjaxIndicator Enabled="True" BlockArea="Control" BlockCssClass="ig_AjaxIndicatorBlock" />
            <%--<ClientEvents Populating="startCountDown" />--%>
            <Columns>
                <ig:BoundDataField DataFieldName="EmployeeID" Key="EmployeeID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_EmployeeID %>" />
                <ig:BoundDataField DataFieldName="LastName" Key="LastName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_LastName %>"
                    Width="120px" />
                <ig:BoundDataField DataFieldName="FirstName" Key="FirstName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_FirstName %>"
                    Width="120px" />
                <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Region %>"
                    Width="120px" />
                <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Country %>"
                    Width="150px" />
            </Columns>
            <Bands>
                <ig:Band DataMember="AccessDataSource2_Orders" Key="Orders" AutoGenerateColumns="false" DataKeyFields="OrderID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_OrderID %>" />
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CustomerID %>"
                            Width="120px" />
                        <ig:BoundDataField DataFieldName="OrderDate" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_OrderDate %>"
                            DataFormatString="{0:MM/dd/yyyy}" Width="120px" />
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierName %>"
                            Width="120px" />
                        <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierPhone %>"
                            Width="120px" />
                    </Columns>
                    <Bands>
                        <ig:Band DataMember="AccessDataSource3_OrderDetails" Key="Details" AutoGenerateColumns="false" DataKeyFields="ProductName">
                            <Columns>
                                <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Product %>" />
                                <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                                <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice %>"
                                    DataFormatString="{0:c2}" />
                                <ig:BoundDataField DataFieldName="Quantity" Key="Quantity" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Quantity %>" />
                                <ig:BoundDataField DataFieldName="Discount" Key="Discount" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Discount %>"
                                    DataFormatString="{0:#.##%}" />
                            </Columns>
                        </ig:Band>
                    </Bands>
                </ig:Band>
            </Bands>
        </ig:WebHierarchicalDataGrid>        
        
        
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="EmployeeID" ParentDataViewID="AccessDataSource1_Employees"
                    ChildColumns="EmployeeID" ChildDataViewID="AccessDataSource2_Orders" />
                <ig:DataRelation ParentColumns="OrderID" ParentDataViewID="AccessDataSource2_Orders"
                    ChildColumns="OrderID" ChildDataViewID="AccessDataSource3_OrderDetails" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="AccessDataSource1_Employees" DataSourceID="AccessDataSource1" />
                <ig:DataView ID="AccessDataSource2_Orders" DataSourceID="AccessDataSource2" />
                <ig:DataView ID="AccessDataSource3_OrderDetails" DataSourceID="AccessDataSource3" />
            </DataViews>
        </ig:WebHierarchicalDataSource>        
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT EmployeeID, LastName, FirstName, Region, Country FROM Employees">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT top 20 Orders.OrderID, Orders.CustomerID, Orders.OrderDate, Shippers.CompanyName, Orders.EmployeeID, Shippers.Phone FROM Orders INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT Products.ProductName, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, Products.QuantityPerUnit, [Order Details].OrderID FROM (Products INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID)">
        </asp:AccessDataSource>
    </div>

    <script type="text/javascript" language="javascript">
        var milisec = 0;
        var seconds = 5;
        var secLabel = "sec.";

        function display() {
            if (seconds == 0 && milisec == 0)
                return;

            if (milisec <= 0) {
                milisec = 9;
                seconds -= 1;
            }
            if (seconds <= -1) {
                milisec = 0;
                seconds += 1;
            }
            else
                milisec -= 1;

            document.getElementById("countdownSpan").innerHTML = seconds + "." + milisec + " " + secLabel;

            setTimeout("display()", 107);
        }

        function startCountDown() {
            milisec = 0;
            seconds = document.getElementById("<%= this.ddlRequestDelay.ClientID %>").value / 1000;
            document.getElementById("countdownSpan").innerHTML = "";
            display();
        }
    </script>


</asp:Content>
