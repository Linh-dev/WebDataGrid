<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Client_Binding_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlScript runat="server" Type="text/javascript" Src="jquery.tmpl.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="False" AjaxIndicator-Enabled="True"
        DataSourceID="AccessDataSource1" DefaultColumnWidth="12%" Height="400px" Width="90%">
        <ClientEvents Initialize="webDataGrid1_Initialize" />
        <AjaxIndicator BlockArea="Control" RelativeToControl="True" />
        <Columns>
            <ig:BoundDataField DataFieldName="ProductID" Key="ProductID">
                <Header Text="ProductID" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Width="18%">
                <Header Text="ProductName" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice">
                <Header Text="UnitPrice" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UnitsInStock" Key="UnitsInStock" Width="14%">
                <Header Text="UnitsInStock" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder"  Width="16%">
                <Header Text="UnitsOnOrder" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CategoryName" Key="CategoryName" Width="18%">
                <Header Text="CategoryName" />
            </ig:BoundDataField>
        </Columns>
    </ig:WebDataGrid>
    <br />
    <input type="button" value="<%= this.GetGlobalResourceObject("WebDataGrid","ClientBinding_StartRefreshing") %>" onclick="reloadGrid(); return false;" />
    <input type="button" value="<%= this.GetGlobalResourceObject("WebDataGrid","ClientBinding_StopRefreshing") %>" onclick="stopReloading(); return false;" />
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" SelectCommand="SELECT * FROM [Alphabetical List of Products]">
    </asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
    <script type="text/javascript">
        var grid;
        var interval;

        function webDataGrid1_Initialize(sender, args){
            grid = sender;
        }
        function reloadGrid() {
            interval = setInterval(reload, 2000);
        }

        function reload() {            
            var dataSource = grid.get_dataSource();

            for (var i = 0; i < dataSource.length; i++) {
                dataSource[i].UnitPrice = Math.floor(Math.random() * 25 + 1);
                dataSource[i].UnitsInStock = Math.floor(Math.random() * 125);
                dataSource[i].UnitsOnOrder = Math.floor(Math.random() * 11) * 10;
            }

            grid.set_dataSource(dataSource);            
            grid.get_ajaxIndicator().show(grid);
            setTimeout(nextOp, 1000);
        }

        function nextOp() {

            grid.applyClientBinding();
            grid.get_ajaxIndicator().hide(grid);
        }
        function stopReloading() {
            clearInterval(interval);
        }
    </script>
</asp:Content>
