<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Summaries_Basic_Features_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        label
        {
            cursor: pointer;
        }
        .configOptions
        {
            background: white url("/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/SummariesBasicFeatures/WebDataGridConfig.png") no-repeat 15px 20px;
            border: 1px solid #CCC;
            margin-top: 20px;
            padding: 20px 20px 20px 93px;
        }
        .configOptions ul
        {
            padding: 0;
            margin: 0;
        }
        .configOptions li
        {
            padding: 0;
            margin: 0;
            font-size: inherit;
            list-style: none;
        }
        .configOptions fieldset
        {
            float: left;
            display: block;
            border: 1px solid #CCCCCC;
            width: 48%;
            margin-right: 10px;
            margin-top: 5px;
            padding: 10px;
            min-height: 140px;
            width: 360px;
        }
        .configOptions select
        {
            width: 200px;
            margin-bottom: 5px;
        }
        
        .configOptions .lblCompact
        {
            display: block;
            width: 150px;
            margin-bottom: 5px;
        }
        
        .configOptions .lblEmpty
        {
            display: block;
            width: 150px;
            margin-bottom: 5px;
        }
        
        .configOptions .txtEmpty
        {
            width: 200px;
        }
        
        .txtEmpty, .configOptions select
        {
            border: 1px solid #CCCCCC;
            outline: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="configOptions">
        <div style="display: block; clear: left;">
        </div>
        <fieldset>
            <legend>
                <%= this.GetGlobalResourceObject("WebDataGrid","SummariesBasicFeatures_Summaries")%></legend>
            <ul> 
                <li>
                    <div style="margin-left: 5px">
                        <%= this.GetGlobalResourceObject("WebDataGrid","SummariesBasicFeatures_CompactRendering")%>
                        <asp:DropDownList ID="ddCompactRendering" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <div style="margin-left: 5px">
                        <%= this.GetGlobalResourceObject("WebDataGrid","SummariesBasicFeatures_EmptyText")%>
                        <asp:TextBox ID="tboxEmptyFooter" runat="server" Text="" MaxLength="50" CssClass="txtEmpty"></asp:TextBox>
                    </div>
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkShowButtons" Checked="true" AutoPostBack="true"
                        Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_ShowButtons%>" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkEnableFilter" Checked="true" AutoPostBack="true"
                        Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnableFilter%>" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkEnableAnimation" Checked="true" AutoPostBack="true"
                        Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnableAnimations%>" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkSummaryOptions" Checked="false" AutoPostBack="true"
                        Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnableColumnSummaryOptions%>" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkShowOptionsInDD" Checked="false" AutoPostBack="true"
                        Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_ShowOptionsInDD%>" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkAddRemoveSummaries" Checked="false" AutoPostBack="true"
                        Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_AddRemove%>" />
                </li>
            </ul>
        </fieldset>
        <fieldset style="width: auto;">
            <legend>
                <%= this.GetGlobalResourceObject("WebDataGrid","SummariesBasicFeatures_Behaviors")%></legend>
            <ul>
                <li>
                    <asp:CheckBox runat="server" ID="chkFiltering" Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnableFiltering %>"
                        Checked="true" AutoPostBack="true" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkSorting" Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnableSorting %>"
                        Checked="false" AutoPostBack="true" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkPaging" Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnablePaging %>"
                        Checked="false" AutoPostBack="true" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkMoving" Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnableMoving %>"
                        Checked="false" AutoPostBack="true" />
                </li>
                <li>
                    <asp:CheckBox runat="server" ID="chkFixing" Text="<%$ Resources:WebDataGrid, SummariesBasicFeatures_EnableFixing %>"
                        Checked="false" AutoPostBack="true" />
                </li>
            </ul>
        </fieldset>
        <div style="display: block; clear: left;">
        </div>
    </div>
    <div style="display: block; clear: left;">
    </div>
    <br />
    <ig:WebDataGrid ID="WebDataGrid1" DataSourceID="ProductsDataSource" DataKeyFields="ProductID"
        runat="server" Width="600px" Height="365px" AutoGenerateColumns="False">
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
            <ig:Sorting Enabled="false">
            </ig:Sorting>
            <ig:Paging PageSize="10" Enabled="false">
            </ig:Paging>
            <ig:Filtering Visibility="Visible">
            </ig:Filtering>
            <ig:ColumnMoving Enabled="false">
            </ig:ColumnMoving>
            <ig:ColumnFixing Enabled="false">
            </ig:ColumnFixing>
            <ig:RowSelectors>
            </ig:RowSelectors>
            <ig:SummaryRow Enabled="true" CompactRendering="Off">
                <ColumnSettings>
                    <ig:SummaryRowSetting ColumnKey="ProductID" EnableColumnSummaryOptions="false">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitPrice">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                            <ig:SummarySetting SummaryType="Max" ShowOptionInDropDown="false" />
                            <ig:SummarySetting SummaryType="Min" ShowOptionInDropDown="false" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsInStock">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsOnOrder">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                </ColumnSettings>
            </ig:SummaryRow>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="ProductsDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>
