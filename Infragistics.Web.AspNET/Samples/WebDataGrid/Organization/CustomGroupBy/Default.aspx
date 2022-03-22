<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div>
        <div>
            <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" DataSourceID="WebHierarchicalDataSource1"
                InitialDataBindDepth="0"
                Height="100%" Width="100%" AutoGenerateColumns="true" DataMember="EmployeeView" Key="EmployeeView" 
                DataKeyFields="EmployeeID">
                
                <Behaviors>
                <ig:Selection Enabled="true" CellClickAction="Row" RowSelectType="Single">
                
                </ig:Selection>
                </Behaviors>
                
                <GroupingSettings EnableColumnGrouping="True" GroupAreaVisibility="Visible" />

            </ig:WebHierarchicalDataGrid>
        </div>
        
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        
        <DataViews>
            <ig:DataView ID="EmployeeView" DataSourceID="AccessDataSource1" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'   
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title], [ReportsTo] FROM [Employees]"></asp:AccessDataSource>
        
    </div>
</asp:Content>