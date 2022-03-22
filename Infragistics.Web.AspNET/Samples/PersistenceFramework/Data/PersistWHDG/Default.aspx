<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="properties">
        <asp:CheckBox ID="chkShowHeader" runat="server" CssClass="persistence-checkbox"
            OnCheckedChanged="chkShowHeader_CheckedChanged" Text="<%$ Resources:PersistenceFramework, lbl_show_header %>" 
            AutoPostBack="True"/>
        <asp:CheckBox ID="chkShowFooter" runat="server" CssClass="persistence-checkbox"
            OnCheckedChanged="chkShowFooter_CheckedChanged" Text="<%$ Resources:PersistenceFramework, lbl_show_footer %>" 
            AutoPostBack="True"/>
        <asp:CheckBox ID="chkShowBandHeader" runat="server" CssClass="persistence-checkbox"
            OnCheckedChanged="chkShowBandHeader_CheckedChanged" Text="<%$ Resources:PersistenceFramework, lbl_show_band_header %>" 
            AutoPostBack="True"/>
        <asp:CheckBox ID="chkShowBandFooter" runat="server" CssClass="persistence-checkbox"
                OnCheckedChanged="chkShowBandFooter_CheckedChanged" Text="<%$ Resources:PersistenceFramework, lbl_show_band_footer %>" 
                AutoPostBack="True"/>
    </div>
    <div id="grid">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" OnInit="whdg1_Init" 
            DataSourceID="whds1" DataKeyFields="SupplierID"
            AutoGenerateColumns="false" AutoGenerateBands="true" 
            InitialExpandDepth="0" InitialDataBindDepth="0"
            Height="450" Width="700px">
            <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
                SlideCloseDuration="300" />
            <Columns>
                <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
                <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Company %>"
                    Width="230px" />
                <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Contact %>"
                    Width="150px" />
                <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Region %>"
                    Width="80px" />
            </Columns>
            <Behaviors>
                <ig:Paging></ig:Paging>
            </Behaviors>
        </ig:WebHierarchicalDataGrid>
    </div>
    <ig:WebHierarchicalDataSource ID="whds1" runat="server"> 
        <DataRelations> 
            <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="adsParent_Suppliers" 
                             ChildColumns="SupplierID" ChildDataViewID="adsChild_Products" />
        </DataRelations> 
        <DataViews> 
            <ig:DataView ID="adsParent_Suppliers" DataSourceID="adsParent" /> 
            <ig:DataView ID="adsChild_Products" DataSourceID="adsChild" /> 
        </DataViews> 
    </ig:WebHierarchicalDataSource>

    <asp:AccessDataSource ID="adsParent" runat="server"
        SelectCommand="SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="adsChild" runat="server"
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
    </asp:AccessDataSource>
</asp:Content>