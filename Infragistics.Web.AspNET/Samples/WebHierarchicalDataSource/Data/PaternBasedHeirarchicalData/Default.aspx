<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" AutoGenerateBands="false"
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
                    DataKeyFields="CustomerID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_CustomerID %>" Width="70"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Address" Key="Address" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_CustomerAddress %>"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_City %>"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_Country %>"></ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataSource ,HeaderText_PhoneNumber %>"></ig:BoundDataField>
                    </Columns>
                </ig:Band>
            </Bands>
        </ig:WebHierarchicalDataGrid>
        
        <asp:SqlDataSource ID="SqlCustomerSource" runat="server" 
            SelectCommand="SELECT [CustomerID], [ContactName], [CompanyName] FROM nwd.[Customers]">
        
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCustomerContactSource" runat="server" 
            SelectCommand="SELECT [CustomerID], [Address], [City], [Country], [Phone] FROM nwd.[Customers]">
        
        </asp:SqlDataSource>

        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataViews>
                <ig:DataView ID="SqlCustomer_DefaultView" DataMember="DefaultView" 
                    DataSourceID="SqlCustomerSource" />
                <ig:DataView ID="SqlCustomerContact_DefaultView" DataMember="DefaultView" 
                    DataSourceID="SqlCustomerContactSource" />
            </DataViews>
            <DataRelations>
                <ig:DataRelation ChildColumns="CustomerID" 
                    ChildDataViewID="SqlCustomerContact_DefaultView" ParentColumns="CustomerID" 
                    ParentDataViewID="SqlCustomer_DefaultView" />
            </DataRelations>
            
        </ig:WebHierarchicalDataSource>
    </div>
</asp:Content>