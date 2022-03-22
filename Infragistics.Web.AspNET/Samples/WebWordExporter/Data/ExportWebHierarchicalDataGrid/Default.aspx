<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master"
 AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Data_WordExport_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<ig:WebWordExporter ID="wExporter" ExportMode="Download" runat="server" />
    <div style="padding-top: 30px;">
        <fieldset>
            <legend class="icoExporter">
                <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_ExportOptions") %></legend>

                    <fieldset class="fldOptions">
                        <legend>
                            <%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_GridsToExport")%></legend>
                        <asp:DropDownList ID="gridsToExportDDList" runat="server">
                            <asp:ListItem Text="<%$ Resources:WebDataGrid, WordExporter_ProductsGrid %>"
                                Value="1" />
                            <asp:ListItem Text="<%$ Resources:WebDataGrid, WordExporter_EmployeesGrid %>"
                                Value="2" />
                            <asp:ListItem Selected="True" Text="<%$ Resources:WebDataGrid, WordExporter_AllGrids %>"
                                Value="3" />
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

            <div style="display: block; clear: both;"></div>
            <div>
                <asp:Label runat="server" ID="lblFileName" Text="<%$ Resources:WebDataGrid, DocumentExporter_FileName %> "
                    CssClass="lblFileName" />
                <asp:TextBox runat="server" ID="textBoxFileName" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGridExportDefaultFileName %>"
                    CssClass="txtFileName" />
                <asp:Button runat="server" ID="btnExport" Text="<%$ Resources:WebDataGrid, DocumentExporter_Export %>" />
            </div>
        </fieldset>
        <div style="margin-top: 20px;">
                <fieldset style="width: auto; padding: 20px;">
                    <legend class="icoWebDataGrids">
                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGridExcelExporter_GridArea") %></legend>
                    <br />
                    <h5>
                        <%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_ProductsGrid")%></h5>
                    <ig:WebHierarchicalDataGrid ID="whdgProducts" runat="server" AutoGenerateColumns="false"
                        DataSourceID="WebHierarchicalDataSource1" AutoGenerateBands="true" StyleSetName="Default"
                        Height="300" Width="100%" DataKeyFields="ProductID">
                        <AjaxIndicator Enabled="False" />
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
                                <Behaviors>
                                </Behaviors>
                            </ig:Band>
                        </Bands>
                        <Behaviors>
                            <ig:RowSelectors Enabled="true" RowNumbering="true" />
                            <ig:SummaryRow>
                            </ig:SummaryRow>
                            <ig:Sorting>
                            </ig:Sorting>
                            <ig:Paging>
                            </ig:Paging>
                        </Behaviors>
                    </ig:WebHierarchicalDataGrid>
                    <div style="display: block; clear: both; margin-top: 20px;">
                    </div>
                    <h5>
                        <%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_EmployeesGrid")%></h5>
                    <ig:WebHierarchicalDataGrid runat="server" ID="whdgEmpoyees" DataSourceID="whdsEmployees"
                        DataKeyFields="EmployeeID" AutoGenerateColumns="true" Width="100%" Height="220"
                        StyleSetName="RedPlanet">
                        <AjaxIndicator Enabled="False" />
                    </ig:WebHierarchicalDataGrid>
                </fieldset>
            </div>
    </div>
    <div style="display: block; clear: both; margin-top: 20px;" ></div>
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
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" SelectCommand="SELECT [OrderID], [UnitPrice], [ProductID], [Quantity], [Discount] FROM [Order Details]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
    </asp:AccessDataSource>
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
</asp:Content>

