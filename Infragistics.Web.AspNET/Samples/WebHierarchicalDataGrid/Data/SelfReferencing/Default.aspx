<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
        AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0"
        InitialDataBindDepth="0" Height="400px" DataKeyFields="EmployeeID" Width="100%"
        ExpandableAreaCssClass="ighg_FeatureBrowserExpandableArea">
        <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
            SlideCloseDuration="300" />
        <Columns>
            <ig:BoundDataField DataFieldName="EmployeeID" Key="Employee ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_EmployeeID %>" />
            <ig:BoundDataField DataFieldName="LastName" Key="LastName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_LastName %>" />
            <ig:BoundDataField DataFieldName="FirstName" Key="FirstName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_FirstName %>" />
            <ig:BoundDataField DataFieldName="ReportsTo" Key="ReportsTo" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ReportsTo %>" />
        </Columns>
        <Bands>
            <ig:Band DataMember="AccessDataSource1_DefaultView" Key="Employees" ShowHeader="false"
                ShowFooter="false" IsSelfReference="true" AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="EmployeeID" Key="EmployeeID" />
                    <ig:BoundDataField DataFieldName="LastName" Key="LastName" />
                    <ig:BoundDataField DataFieldName="FirstName" Key="FirstName" />
                    <ig:BoundDataField DataFieldName="ReportsTo" Key="ReportsTo" />
                </Columns>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ChildColumns="ReportsTo" ChildDataViewID="AccessDataSource1_DefaultView"
                ParentColumns="EmployeeID" ParentDataViewID="AccessDataSource1_DefaultView" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_DefaultView" DataSourceID="AccessDataSource1" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [ReportsTo] FROM [Employees]">
    </asp:AccessDataSource>
</asp:Content>
