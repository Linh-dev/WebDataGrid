<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Organization_ExcelStyleFiltering_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <div style=" margin-top:30px; ">
    <ig:webhierarchicaldatagrid ID="WebHierarchicalDataGrid1" 
            DataSourceID="WebHierarchicalDataSource1" runat="server" Height="350px"
        Width="100%" DataKeyFields="CustomerID">
            <Behaviors>
                <ig:Activation Enabled="true">
                </ig:Activation>
                <ig:Filtering Enabled="true" EnableInheritance="true" FilterType="ExcelStyleFilter" />
            </Behaviors>
            <Bands>
                <ig:Band Key="Orders" DataMember="AccessDataSource2_Orders" DataKeyFields="OrderID">
                    <Behaviors>
                        <ig:Filtering FilterType="ExcelStyleFilter">
                            <ColumnSettings>
                                <ig:ColumnFilteringSetting ColumnKey="EmployeeID" Enabled="false" />
                            </ColumnSettings>
                        </ig:Filtering>
                    </Behaviors>
                </ig:Band>
            </Bands>
    </ig:webhierarchicaldatagrid>
    <ig:webhierarchicaldatasource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="CustomerID" ParentDataViewID="AccessDataSource1_Customers"
                    ChildColumns="CustomerID" ChildDataViewID="AccessDataSource2_Orders" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="AccessDataSource1_Customers" DataSourceID="AccessDataSource1" />
                <ig:DataView ID="AccessDataSource2_Orders" DataSourceID="AccessDataSource2" />
            </DataViews>
        </ig:webhierarchicaldatasource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'   
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle] FROM [Customers]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'      
            SelectCommand="SELECT [OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate] FROM [Orders]">
        </asp:AccessDataSource>
        </div>
</asp:Content>