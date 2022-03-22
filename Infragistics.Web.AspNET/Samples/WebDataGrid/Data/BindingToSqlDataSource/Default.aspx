<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Binding_to_SqlDataSource_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" Height="400" Width="100%" DataSourceID="SqlDataSource1"
                    runat="server" AutoGenerateColumns="True">
                    <Behaviors>
                        <ig:Paging PageSize="13" QuickPages="5">
                        </ig:Paging>
                    </Behaviors>
                </ig:WebDataGrid>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
                    SelectCommand="SELECT nwd.Orders.ShipName, nwd.Orders.ShipCity, nwd.Orders.ShipCountry, nwd.Customers.CompanyName FROM nwd.Orders INNER JOIN nwd.Customers ON nwd.Orders.CustomerID = nwd.Customers.CustomerID">
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
