<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Excel_Exporter_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanel.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        fieldset
        {
            padding: 10px;
            border: 1px solid #CCCCCC;
        }
        .fldOptions
        {
            height: 80px;
        }
        
        .chkBoxesHolder span
        {
            display: block;
            
        }
        
        .btnExport
        {
            background: url("/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Data/ExcelExporter/WebGrid.png") top left no-repeat;
        }
        
        .icoExporter
        {
            background: url("/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Data/ExcelExporter/DocumentExporter.png") no-repeat scroll 3px 0 transparent;
            padding-left: 23px;
        }
        
        .icoWebDataGrids
        {
            background: url("/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Data/ExcelExporter/WebGrid.png") no-repeat scroll 3px 0 transparent;
            padding-left: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebExcelExporter runat="server" ID="eExporter" ExportMode="Download" />
    <div>
        <fieldset style="padding: 10px;">
            <legend class="icoExporter">
                <%= this.GetGlobalResourceObject("WebExcelExporter","ExportOptions") %></legend>
            <div>
                <fieldset class="fldOptions">
                    <legend>
                        <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_Format") %></legend>
                    <asp:RadioButtonList ID="rblExcelFormat" runat="server" AutoPostBack="false" ToolTip="<%$ Resources:WebExcelExporter, Format_ToolTip %>"
                        RepeatColumns="2" RepeatLayout="Table">
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Format2003 %>" Value="Excel97To2003"
                            Selected="True" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Excel97To2003Template %>" Value="Excel97To2003Template" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Format2007 %>" Value="Excel2007" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Excel2007MacroEnabled %>" Value="Excel2007MacroEnabled" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Excel2007MacroEnabledTemplate %>" Value="Excel2007MacroEnabledTemplate" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_Excel2007Template %>" Value="Excel2007Template" />
                    </asp:RadioButtonList>
                </fieldset>
            </div>
            <div style="margin-top: 10px;">
                <fieldset class="fldOptions" style="float: left;">
                    <legend>
                        <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_ExportMode")%></legend>
                    <asp:RadioButtonList ID="rblExportData" runat="server" AutoPostBack="false"
                        ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_ExportMode_ToolTip %>">
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_VisibleData %>"
                            Value="DataInGridOnly" Selected="True" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_AllData %>"
                            Value="AllDataInDataSource" />
                    </asp:RadioButtonList>
                </fieldset>
                <fieldset class="fldOptions" style="float: left; margin-left: 5px;">
                    <legend>
                        <%= this.GetGlobalResourceObject("WebExcelExporter","Sheets") %></legend>
                    <asp:RadioButtonList ID="rblSheets" runat="server" AutoPostBack="false">
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_SingleSheet %>" Value="single" />
                        <asp:ListItem Text="<%$ Resources:WebExcelExporter, EO_MultiSheets %>" Value="separate"
                            Selected="True" />
                    </asp:RadioButtonList>
                </fieldset>
                <fieldset id="behaviorsFieldSet" runat="server" class="fldOptions" style="float: left; margin-left: 5px;">
                    <legend>
                        <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_Behaviors")%></legend>
                    <div class="chkBoxesHolder" style="display: block; float: left;">
                        <asp:CheckBox runat="server" ID="chkFiltering" Text="<%$ Resources:WebDataGrid, DocumentExporter_Filtering %>"
                            ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_FilteringTooltip %>"
                            AutoPostBack="true" />
                        <asp:CheckBox runat="server" ID="chkSorting" Text="<%$ Resources:WebDataGrid, DocumentExporter_Sorting %>"
                            ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_SortingTooltip %>"
                            AutoPostBack="true" />
                        <asp:CheckBox runat="server" ID="chkSummaries" Text="<%$ Resources:WebDataGrid, DocumentExporter_Summaries %>"
                            ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_SummariesTooltip %>"
                            AutoPostBack="true" />
                    </div>
                    <asp:RadioButtonList ID="rblPAging" runat="server" AutoPostBack="true"
                        ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_EnablePagingOrScrolling %>">
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_EnablePaging %>"
                            Value="paging" Selected="True" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_EnableVirtualScrolling %>"
                            Value="vscrolling" />
                    </asp:RadioButtonList>
                </fieldset>
            </div>
            <div style="display: block; clear: both; " ></div>
            <div style="margin-top: 10px;">
                <asp:Label runat="server" ID="lblFileName" Text="<%$ Resources:WebExcelExporter, EO_LableFileName %>" />
                <asp:TextBox runat="server" ID="tbFileName" Style="float: right;" Width="440px" Text="<%$ Resources:WebExcelExporter, EO_FileName %>" />
            </div>
            <div style="display: block; clear: both; "></div>
            <asp:Button runat="server" ID="btnExport" Text="<%$ Resources:WebExcelExporter, EO_ExportButtonText %>" />
        </fieldset>
        <br />
        <fieldset style="padding: 15px;">
            <legend class="icoWebDataGrids">
                <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_WebDataGrids") %></legend>
            <ig:WebDataGrid runat="server" ID="wdgProducts" DataSourceID="SqlDsProducts" DataKeyFields="ProductID"
                AutoGenerateColumns="false" Width="85%" Height="220">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" DataType="System.Int32" Key="ProductID">
                        <Header Text="ProductID" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="ProductName" DataType="System.String" Key="ProductName">
                        <Header Text="ProductName" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitPrice" DataType="System.Decimal" Key="UnitPrice">
                        <Header Text="UnitPrice" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitsInStock" DataType="System.Int32" Key="UnitsInStock">
                        <Header Text="UnitsInStock" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitsOnOrder" DataType="System.Int32" Key="UnitsOnOrder">
                        <Header Text="UnitsOnOrder" />
                    </ig:BoundDataField>
                </Columns>
                <Behaviors>
                    <ig:Filtering Enabled="false" />
                    <ig:Sorting Enabled="false" />
                    <ig:Paging PageSize="5" QuickPages="3" Enabled="true" PagerMode="NumericFirstLast" />
                    <ig:VirtualScrolling Enabled="false" />
                    <ig:SummaryRow Enabled="false" />
                </Behaviors>
                <EditorProviders>
                    <ig:TextBoxProvider />
                </EditorProviders>
            </ig:WebDataGrid>
            <div style="display: block; clear: both; margin-top: 20px;"></div>
            <ig:WebDataGrid runat="server" ID="wdgCustomers" DataSourceID="SqlDsCustomers" DataKeyFields="CustomerID"
                AutoGenerateColumns="false" Width="85%" Height="220" StyleSetName="Caribbean">
                <Columns>
                    <ig:BoundDataField Key="Country" DataFieldName="Country" Header-Text="<%$ Resources:WebDataGrid, WebDataGridExcelExporter_ColumnCountry %>" />
                    <ig:BoundDataField Key="City" DataFieldName="City" Header-Text="<%$ Resources:WebDataGrid, WebDataGridExcelExporter_ColumnCity %>" />
                    <ig:BoundDataField Key="CompanyName" DataFieldName="CompanyName" Header-Text="<%$ Resources:WebDataGrid, WebDataGridExcelExporter_ColumnCompany %>" />
                    <ig:BoundDataField Key="ContactName" DataFieldName="ContactName" Header-Text="<%$ Resources:WebDataGrid, WebDataGridExcelExporter_ColumnContact %>" />
                    <ig:BoundDataField Key="Phone" DataFieldName="Phone" Header-Text="<%$ Resources:WebDataGrid, WebDataGridExcelExporter_ColumnPhone %>" />
                </Columns>
                <Behaviors>
                    <ig:Filtering Enabled="false" />
                    <ig:Sorting Enabled="false" />
                    <ig:Paging PageSize="5" QuickPages="3" Enabled="true" PagerMode="NumericFirstLast" />
                    <ig:VirtualScrolling Enabled="false" />
                    <ig:SummaryRow Enabled="false" />
                </Behaviors>
            </ig:WebDataGrid>
        </fieldset>
        <div style="display: block; clear: both;" ></div>
        <asp:SqlDataSource ID="SqlDsCustomers" runat="server" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Phone], [Country] FROM nwd.[Customers] ORDER BY [Country]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDsProducts" runat="server" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
            SelectCommand="SELECT  [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM nwd.[Products]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
