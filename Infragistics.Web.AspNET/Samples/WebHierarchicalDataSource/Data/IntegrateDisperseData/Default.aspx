<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div>
        <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" AutoGenerateBands="true"
                AutoGenerateColumns="false" DataSourceID="WebHierarchicalDataSource1" Width="100%" 
                Height="400" InitialExpandDepth="0" DataKeyFields="CustomerID">
            <ExpandCollapseAnimation FadeCloseDuration="300" FadeOpenDuration="300" />
            <Columns>
                <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_CustomerID %>" Width="70"></ig:BoundDataField>
                <ig:BoundDataField DataFieldName="ContactName" Key="ContactName" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_ContactName %>"></ig:BoundDataField>
                <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_CompanyName %>"></ig:BoundDataField>
            </Columns>
            <Bands>
                <ig:Band DataMember="SqlCustomerContact_DefaultView" Key="CustomerID" AutoGenerateColumns="false"
                    DataKeyFields="OrderID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_CustomerID %>" Width="70"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_OrderID %>" Width="50"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="OrderDate" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_OrderDate %>"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ShipName" Key="ShipName" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_ShipName %>"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ShipAddress" Key="ShipAddress" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_ShipAddress %>"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ShipCity" Key="ShipCity" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_ShipCity %>"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ShipCountry" Key="ShipCountry" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_ShipCountry %>"></ig:BoundDataField>
                    </Columns>
                </ig:Band>
            </Bands>
        </ig:WebHierarchicalDataGrid>
        
        <asp:SqlDataSource ID="SqlCustomersSource" runat="server" 
            SelectCommand="SELECT [CustomerID], [ContactName], [CompanyName] FROM nwd.[Customers]">
        
        </asp:SqlDataSource>

        <asp:ObjectDataSource ID="ObjectEmployeeTerritoriesSource" runat="server"
                              TypeName="NwindDataSource" SelectMethod="GetOrdersDataSource">
        
        </asp:ObjectDataSource>

        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataViews>
                <ig:DataView ID="SqlDataSource1_DefaultView" DataMember="DefaultView" 
                    DataSourceID="SqlCustomersSource" />
                <ig:DataView ID="SqlDataSource2_DefaultView" DataMember="DefaultView" 
                    DataSourceID="ObjectEmployeeTerritoriesSource" />
            </DataViews>
            <DataRelations>
                <ig:DataRelation ChildColumns="CustomerID" 
                    ChildDataViewID="SqlDataSource2_DefaultView" ParentColumns="CustomerID" 
                    ParentDataViewID="SqlDataSource1_DefaultView" />
            </DataRelations>
        </ig:WebHierarchicalDataSource>
    </div>
</asp:Content>