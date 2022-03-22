<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" MasterPageFile="~/SamplePage.master"
 Inherits="Samples_WebDataGrid_Data_Word_Exporter_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
 <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet"
        type="text/css" />
        <link href="<%= this.ResolveUrl("Style.css")%>" rel="Stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebWordExporter ID="wExporter" ExportMode="Download" runat="server" />
    <div style="padding-top: 30px;">
        <fieldset>
            <legend class="icoExporter">
                <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_ExportOptions") %></legend>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <fieldset class="fldOptions">
                        <legend><%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_GridsToExport")%></legend>
                        <asp:DropDownList ID="gridsToExportDDList" runat="server">
                            <asp:ListItem Text="<%$ Resources:WebDataGrid, WordExporter_ProductsGrid %>" Value="1" />
                            <asp:ListItem Text="<%$ Resources:WebDataGrid, WordExporter_CompaniesGrid %>" Value="2" />
                            <asp:ListItem Selected="True" Text="<%$ Resources:WebDataGrid, WordExporter_AllGrids %>" Value="3" />
                        </asp:DropDownList>
                    </fieldset>
                    <fieldset class="fldOptions">
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
                    <fieldset class="fldOptions">
                        <legend>
                            <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_Orientation")%></legend>
                        <div class="chkBoxesHolder">
                            <asp:RadioButtonList CssClass="props" ID="rblOrientation" runat="server" AutoPostBack="false"
                                ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_Orientation_ToolTip %>">
                                <asp:ListItem Text="Portrait" Value="Portrait" Selected="True" />
                                <asp:ListItem Text="Landscape" Value="Landscape" />
                            </asp:RadioButtonList>
                        </div>
                    </fieldset>
                    <fieldset class="fldOptions">
                        <legend>
                            <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_MarginsSize")%></legend>
                        <div style="margin-top: 5px">
                            <asp:DropDownList ID="ddMargins" Width="135px" runat="server" ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_Margins_ToolTip %>">
                                <asp:ListItem Text="Moderate"></asp:ListItem>
                                <asp:ListItem Text="Narrow" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Normal"></asp:ListItem>
                                <asp:ListItem Text="Wide"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div style="margin-top: 5px">
                            <asp:DropDownList ID="ddPaperSize" Width="135px" runat="server" ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_Size_ToolTip %>">
                                <asp:ListItem Text="A3" Value="A3"></asp:ListItem>
                                <asp:ListItem Text="A4" Value="A4"></asp:ListItem>
                                <asp:ListItem Text="A5" Value="A5"></asp:ListItem>
                                <asp:ListItem Text="Executive" Value="Executive"></asp:ListItem>
                                <asp:ListItem Text="Folio" Value="Folio"></asp:ListItem>
                                <asp:ListItem Text="Ledger" Value="Ledger"></asp:ListItem>
                                <asp:ListItem Text="Legal" Value="Legal"></asp:ListItem>
                                <asp:ListItem Text="Letter" Selected="True" Value="Letter"></asp:ListItem>
                                <asp:ListItem Text="Quatro" Value="Quatro"></asp:ListItem>
                                <asp:ListItem Text="Statement" Value="Statement"></asp:ListItem>
                                <asp:ListItem Text="Tabloid" Value="Tabloid"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </fieldset>
                    <fieldset class="bhvOptions">
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
                            <asp:CheckBox runat="server" ID="chkRowSelectors" Text="<%$ Resources:WebDataGrid, DocumentExporter_RowSelectors %>"
                                ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_RoqSelectorsTooltip %>"
                                AutoPostBack="true" />
                        </div>
                        <asp:RadioButtonList CssClass="props" ID="rblPAging" runat="server" AutoPostBack="true"
                            ToolTip="<%$ Resources:WebDataGrid, DocumentExporter_EnablePagingOrScrolling %>">
                            <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_EnablePaging %>"
                                Value="paging" Selected="True" />
                            <asp:ListItem Text="<%$ Resources:WebDataGrid, DocumentExporter_EnableVirtualScrolling %>"
                                Value="vscrolling" />
                        </asp:RadioButtonList>
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="display: block; clear: both;"></div>
            <div>
                <asp:Label runat="server" ID="lblFileName" Text="<%$ Resources:WebDataGrid, DocumentExporter_FileName %> "
                    CssClass="lblFileName" />
                <asp:TextBox runat="server" ID="tbFileName" Text="<%$ Resources:WebDataGrid, WordExporter_WebDataGridExportDefaultFileName %>" CssClass="txtFileName" />
                <asp:Button runat="server" ID="btnExport" Text="<%$ Resources:WebDataGrid, DocumentExporter_Export %>" />
            </div>
        </fieldset>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <fieldset style="width: auto; padding: 15px;">
                    <legend class="icoWebDataGrids">
                        <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_WebDataGrids") %></legend>
                    <h5>
                        <%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_ProductsGrid")%></h5>
                    <ig:WebDataGrid runat="server" ID="wdgProducts" DataSourceID="AccessDsProducts" DataKeyFields="ProductID"
                        AutoGenerateColumns="false" Width="85%" Height="222" StyleSetName="Default">
                        <AjaxIndicator Enabled="False" />
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
                            <ig:RowSelectors Enabled="false" />
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
                    <div style="display: block; clear: both; margin: 20px;">
                    </div>
                    <h5>
                        <%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_CompaniesGrid")%></h5>
                    <ig:WebDataGrid runat="server" ID="wdgCustomers" DataSourceID="AccessDsCustomers"
                        DataKeyFields="CustomerID" AutoGenerateColumns="false" Width="85%" Height="200"
                        StyleSetName="Office2007Black">
                        <AjaxIndicator Enabled="False" />
                        <Columns>
                            <ig:BoundDataField Key="Country" DataFieldName="Country" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                            <ig:BoundDataField Key="City" DataFieldName="City" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                            <ig:BoundDataField Key="CompanyName" DataFieldName="CompanyName" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                            <ig:BoundDataField Key="ContactName" DataFieldName="ContactName" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                            <ig:BoundDataField Key="Phone" DataFieldName="Phone" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderPhone %>" />
                        </Columns>
                        <Behaviors>
                            <ig:RowSelectors Enabled="false" />
                            <ig:Filtering Enabled="false" />
                            <ig:Sorting Enabled="false" />
                            <ig:Paging PageSize="5" QuickPages="3" Enabled="true" PagerMode="NumericFirstLast" />
                            <ig:VirtualScrolling Enabled="false" />
                            <ig:SummaryRow Enabled="false" />
                        </Behaviors>
                    </ig:WebDataGrid>
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
        
        <div style="display: block; clear: both;" ></div>
        <asp:AccessDataSource ID="AccessDsCustomers" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Phone], [Country] FROM [Customers] ORDER BY [Country]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDsProducts" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
        </asp:AccessDataSource>

</asp:Content>

