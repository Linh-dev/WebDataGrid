<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div>
        <div class="MainContent">
            <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" DataSourceID="WebHierarchicalDataSource1" Height="100%"
                Width="100%" AutoGenerateBands="true" AutoGenerateColumns="true" DataMember="CategoriesView" Key="CategoriesView" 
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
            <ig:DataView ID="CategoriesView" DataSourceID="AccessDataSource1" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    
      <div style="color:Red;">  
          <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile= '<%# this.GetMdbLocation("NWind.mdb")%>' 
                SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title], [ReportsTo] FROM [Employees]">
          </asp:AccessDataSource>
      </div>    
    </div>
</asp:Content>