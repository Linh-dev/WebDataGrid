<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_SelectiveRowExporting_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet"
        type="text/css" />
       <link href="<%= this.ResolveUrl("Style.css")%>" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<ig:WebWordExporter ID="wExporter" ExportMode="Download" runat="server" />
    <div>
         <fieldset class="fldOptions" style="width:680px">
            <legend class="icoExporter">
                <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_ExportOptions") %></legend>
                <asp:Label runat="server" ID="lblFileName" Text="<%$ Resources:WebDataGrid, DocumentExporter_FileName %> "
                    CssClass="lblFileName" />
                <asp:TextBox runat="server" ID="tbFileName" Text="<%$ Resources:WebDataGrid, WordExporter_WebDataGridExportDefaultFileName %>" CssClass="txtFileName" />
             <br />
             <br />
             <asp:Label CssClass="props" Text="<%$ Resources:WebDataGrid, WordExporter_SelectCity %>" runat="server" />
             <br />
             <ig:WebDropDown ID="citiesDDList" runat="server" CssClass="props"  Width="150px" DataSourceID="AccessDsCountries">             
                <DropDownItemBinding ValueField="shipcity" TextField="shipcity" />
                
             </ig:WebDropDown>
                <asp:Button runat="server" style="margin-left:100px;" CssClass="props" ID="btnExport" Text="<%$ Resources:WebDataGrid, DocumentExporter_Export %>" />

        </fieldset>
        <div style="clear:both"></div>
        
        <br />
        <fieldset style="width: auto; padding: 15px;">
            <legend class="icoWebDataGrids">
                <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_WebDataGrids") %></legend>
            <h5>
                <%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_ShipsGrid")%></h5>
                <ig:WebDataGrid ID="wdgShips" Height="400" Width="100%" DataSourceID="AccessDsShips"
                    runat="server" AutoGenerateColumns="True">
                    <Behaviors>
                    <ig:RowSelectors Enabled=true RowNumbering="true" />
                        <ig:Paging PageSize="13" QuickPages="5">
                        </ig:Paging>
                    </Behaviors>
                </ig:WebDataGrid>
        </fieldset>
    </div>
            <asp:AccessDataSource ID="AccessDsShips" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT Orders.ShipName, Orders.ShipCity, Orders.ShipCountry, Customers.CompanyName FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID">
        </asp:AccessDataSource>
                    <asp:AccessDataSource ID="AccessDsCountries" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="Select distinct shipcity from Orders">
        </asp:AccessDataSource>

</asp:Content>

