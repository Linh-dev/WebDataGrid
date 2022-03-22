<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="250px"
        Width="500px" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="CategoryID" InitialDataBindDepth="0"
        InitialExpandDepth="0" AutoGenerateBands="false" OnInit="OnInit">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:BoundDataField DataFieldName="CategoryID" Key="CategoryID" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_CategoryID %>" />
            <ig:BoundDataField DataFieldName="CategoryName" Key="CategoryName" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_CategoryName %>" />
            <ig:BoundDataField DataFieldName="Description" Key="Description" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_Description %>" />
        </Columns>
        <Bands>
            <ig:Band DataMember="AccessDataSource2_DefaultView" Key="CategoryID" AutoGenerateColumns="false"
                DataKeyFields="ProductID">
                <Columns>
                    <ig:BoundDataField DataFieldName="CategoryID" Key="CategoryID" Hidden="true" />
                    <ig:BoundDataField DataFieldName="ProductID" Key="ProductID" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_ProductName %>" />
                </Columns>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ChildColumns="CategoryID" ChildDataViewID="AccessDataSource2_DefaultView"
                ParentColumns="CategoryID" ParentDataViewID="AccessDataSource1_DefaultView" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_DefaultView" DataMember="DefaultView" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="AccessDataSource2_DefaultView" DataMember="DefaultView" DataSourceID="AccessDataSource2" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        runat="server" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        runat="server" SelectCommand="SELECT [ProductID], [ProductName], [CategoryID] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>
