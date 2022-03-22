<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Persistent_Selection_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        fieldset
        {
            margin: 5px;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #CCCCCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Button ID="btnPostBack" Text="<%$ Resources:WebDataGrid, PersistentSelection_PostBack %>"
        runat="server" />
    <br />
    <br />
    <fieldset class="fieldset">
        <legend>
            <%= this.GetGlobalResourceObject("WebDataGrid","PersistentSelection_Paging")%></legend>
        <ig:WebDataGrid ID="grid" AutoGenerateColumns="True" DataSourceID="ds" DataKeyFields="ProductID"
            Width="100%" Height="300px" OnRowSelectionChanged="grid_RowSelectionChanged" runat="server">
            <Behaviors>
                <ig:RowSelectors />
                <ig:Selection CellClickAction="Row" EnableCrossPageSelection="True" RowSelectType="Multiple" />
                <ig:Paging>
                </ig:Paging>
            </Behaviors>
        </ig:WebDataGrid>
    </fieldset>
    <fieldset class="fieldset">
        <legend>
            <%= this.GetGlobalResourceObject("WebDataGrid","PersistentSelection_Scrolling")%>
        </legend>
        <ig:WebDataGrid ID="scrollingGrid" AutoGenerateColumns="True" DataSourceID="ds" DataKeyFields="ProductID"
            Width="100%" Height="300px" OnRowSelectionChanged="grid_RowSelectionChanged" runat="server">
            <Behaviors>
                <ig:RowSelectors />
                <ig:Selection CellClickAction="Row" EnableCrossPageSelection="True" RowSelectType="Multiple">
                </ig:Selection>
                <ig:VirtualScrolling />
            </Behaviors>
        </ig:WebDataGrid>
    </fieldset>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
        SelectCommand="SELECT [ProductID] as [ProductID], [ProductName] as [Product Name], [QuantityPerUnit] as [Quantity Unit], [UnitPrice] as [Unit Price], [UnitsInStock] as [Unit In Stock], [UnitsOnOrder] as [Unit In Order], [ReorderLevel] as [Reodred Level] FROM nwd.[Products]">
    </asp:SqlDataSource>
</asp:Content>
