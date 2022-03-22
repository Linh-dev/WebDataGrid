<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        fieldset
        {
            padding: 10px;
            border: 1px solid #CCCCCC;
        }
        .fldOptions
        {
            width: 200px;
            height: 75px;
        }
        
        .chkBoxesHolder span
        {
            display: block;
            margin-left: 5px;
        }
        
        .btnExport
        {
            background: url("/SamplesBrowser/SamplesCommon/aspnet/Common/ControlIcons/sm/WebGrid.png") top left no-repeat;
        }
        
        .icoExporter
        {
            background: url("/SamplesBrowser/SamplesCommon/aspnet/Common/ControlIcons/sm/DocumentExporter.png") no-repeat scroll 3px 0 transparent;
            padding-left: 23px;
        }
        
        .icoWebDataGrids
        {
            background: url("/SamplesBrowser/SamplesCommon/aspnet/Common/ControlIcons/sm/WebGrid.png") no-repeat scroll 3px 0 transparent;
            padding-left: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebExcelExporter runat="server" ID="eExporter" ExportMode="Download" />
    <div>
        <fieldset style="padding: 15px;">
            <legend class="icoExporter">
                <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGridExcelExporter_ExportOptions") %></legend>
            <div>
                <fieldset class="fldOptions" style="float: left;">
                    <legend>
                        <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_Format") %></legend>
                    <asp:RadioButtonList ID="rblExcelFormat" runat="server" AutoPostBack="false" ToolTip="<%$ Resources:WebExcelExporter, Format_ToolTip %>">
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Format2003 %>" Value="Excel97To2003"
                            Selected="True" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Format2007 %>" Value="Excel2007" />
                    </asp:RadioButtonList>
                </fieldset>
                <fieldset class="fldOptions" style="float: left; margin-left: 10px;">
                    <legend>
                        <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_ExportMode")%></legend>
                    <asp:RadioButtonList CssClass="props" ID="rblExportData" runat="server" AutoPostBack="false"
                        ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_ExportMode_ToolTip %>">
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_VisibleData %>"
                            Value="DataInGridOnly" Selected="True" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_AllData %>"
                            Value="AllDataInDataSource" />
                    </asp:RadioButtonList>
                </fieldset>
                <fieldset class="fldOptions" style="float: right;">
                    <legend>
                        <%= this.GetGlobalResourceObject("WebExcelExporter","Sheets") %></legend>
                    <asp:RadioButtonList ID="rblSheets" runat="server" AutoPostBack="false">
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_SingleSheet %>" Value="single" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_MultiSheets %>" Value="separate"
                            Selected="True" />
                    </asp:RadioButtonList>
                </fieldset>
            </div>
            <div style="display: block; clear: both;"></div>
            <div style="margin-top: 10px;">
                <asp:Label runat="server" ID="lblFileName" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGridExcelExporter_Enter_File_Name %>" />
                <asp:TextBox runat="server" ID="tbFileName" Style="float: right;" Width="460px" Text="WebHierarchicalDataGridExport" />                
            </div>
            <div style="display: block; clear: both;"></div>
            <asp:Button runat="server" ID="btnExport" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGridExcelExporter_Export %>" />
        </fieldset>
        <fieldset style="padding: 15px; margin-top: 20px">
            <legend class="icoWebDataGrids">
                <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGridExcelExporter_GridArea") %></legend>
            <ig:WebHierarchicalDataGrid ID="whdgProducts" runat="server" AutoGenerateColumns="false"
                DataSourceID="WebHierarchicalDataSource1" StyleSetName="Appletini" AutoGenerateBands="true"
                Height="300" Width="100%" DataKeyFields="ProductID">
                <GroupingSettings EnableColumnGrouping="True" GroupAreaVisibility="Visible" ShowBandInGroupByArea="true" />
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="ProductID" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductName %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice %>" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                </Columns>
                <Bands>
                    <ig:Band DataMember="AccessDataSource1_Orders" Height="150" AutoGenerateColumns="true"
                        DataKeyFields="OrderID">
                    </ig:Band>
                </Bands>
                <Behaviors>
                    <ig:SummaryRow>
                    </ig:SummaryRow>
                    <ig:Sorting>
                    </ig:Sorting>
                    <ig:Paging>
                    </ig:Paging>
                </Behaviors>
            </ig:WebHierarchicalDataGrid>
            <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
                <DataRelations>
                    <ig:DataRelation ParentColumns="ProductID" ParentDataViewID="AccessDataSource2_Products"
                        ChildColumns="ProductID" ChildDataViewID="AccessDataSource1_Orders" />
                </DataRelations>
                <DataViews>
                    <ig:DataView ID="AccessDataSource1_Orders" DataSourceID="AccessDataSource1" />
                    <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
                </DataViews>
            </ig:WebHierarchicalDataSource>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                SelectCommand="SELECT [OrderID], [UnitPrice], [ProductID], [Quantity], [Discount] FROM [Order Details]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="AccessDataSource2" runat="server"
                SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
            </asp:AccessDataSource>
            <div style="display: block; clear: both; margin-top: 20px;" ></div>
            <ig:WebHierarchicalDataGrid runat="server" ID="wdgEmpoyees" DataSourceID="whdsEmployees"
                DataKeyFields="EmployeeID" AutoGenerateColumns="true" Width="100%" Height="220"
                StyleSetName="Caribbean">
            </ig:WebHierarchicalDataGrid>
            <div style="display: block; clear: both;" ></div>
        </fieldset>
        <ig:WebHierarchicalDataSource ID="whdsEmployees" runat="server">
            <DataViews>
                <ig:DataView ID="vEmployees" DataSourceID="SqlDsEmployees" />
            </DataViews>
            <DataRelations>
                <ig:DataRelation ChildDataViewID="vEmployees" ChildColumns="ReportsTo" ParentDataViewID="vEmployees"
                    ParentColumns="EmployeeID" />
            </DataRelations>
        </ig:WebHierarchicalDataSource>
        <asp:SqlDataSource ID="SqlDsEmployees" runat="server" ConnectionString="<%# this.GetConnectionString() %>"
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [ReportsTo] FROM nwd.[Employees]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
