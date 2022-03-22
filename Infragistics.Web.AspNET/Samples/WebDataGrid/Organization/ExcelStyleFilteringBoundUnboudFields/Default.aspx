<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs"
 Inherits="Samples_WebDataGrid_Organization_ExcelStyleFilteringBoundUnboudFields_Default" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
        <script type="text/javascript">
            function CellValueChangedHandler(sender, args) {
                var editingCore = sender.get_behaviors().get_editingCore();
                editingCore.commit();
            }
            $(window).load(function () {
                $("#sampleContainer").addClass("filteringDropDown");
            });
        </script>
     <style type="text/css">
            .filteringDropDown
            {
              overflow: visible !important;
                }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="gridContainer" style="overflow: visible">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="350px" Width="700px" EnableAjax="false"
                    AutoGenerateColumns="false" DataSourceID="SqlDataSource1" DataKeyFields="ProductID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="ProductID" Key="ProductID"
                         Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderId  %>" Width="40px" />
                        <ig:BoundDataField DataFieldName="ProductName" Key="ProductName"
                         Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderProduct  %>" />
                        <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" 
                        Header-Text="<%$ Resources:WebDataGrid, UnitPrice  %>" />
                        <ig:BoundDataField DataFieldName="UnitsInStock" Key="UnitsInStock"
                         Header-Text="<%$ Resources:WebDataGrid, UnitsInStock  %>" />
                        <ig:BoundCheckBoxField DataFieldName="Discontinued" Key="Discontinued" 
                        Header-Text="<%$ Resources:WebDataGrid, Discontinued  %>" />
                        <ig:UnboundField Key="Total" DataType="System.Decimal"
                         Header-Text="<%$ Resources:WebDataGrid, UnboundColumn_Total  %>" Width="60px" />
                        <ig:UnboundCheckBoxField Key="Selected"
                         Header-Text="<%$ Resources:WebDataGrid, ColumnHeader_Selected  %>" HeaderCheckBoxMode="Off"
                            Width="65px" />
                    </Columns>
                    <Behaviors>
                        <ig:EditingCore>
                            <EditingClientEvents CellValueChanged="CellValueChangedHandler" />
                            <Behaviors>
                                <ig:CellEditing>
                                    <ColumnSettings>
                                        <ig:EditingColumnSetting ColumnKey="ProductID" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="ProductName" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="UnitPrice" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="UnitsInStock" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="Discontinued" ReadOnly="true" />
                                    </ColumnSettings>
                                </ig:CellEditing>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Filtering FilterType="ExcelStyleFilter">
                            <ColumnSettings>
                                <ig:ColumnFilteringSetting ColumnKey="ProductID" Enabled="false" />
                            </ColumnSettings>
                        </ig:Filtering>
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
        SelectCommand="SELECT ProductID, ProductName, UnitPrice, UnitsInStock, Discontinued FROM nwd.Products">
    </asp:SqlDataSource>
</asp:Content>


