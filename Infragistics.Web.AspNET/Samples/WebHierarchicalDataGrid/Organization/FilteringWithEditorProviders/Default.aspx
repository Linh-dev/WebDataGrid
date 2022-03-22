<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/samplesbrowser/samplescommon/aspnet/common/styles/igthemes/IG/ig_monthcalendar.css" rel="stylesheet" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div>
    <ig:webhierarchicaldatagrid ID="WebHierarchicalDataGrid1"
            DataSourceID="WebHierarchicalDataSource1" runat="server" Height="350px"
        Width="100%" DataKeyFields="CustomerID" OnInit="InitWHDG">

            <Behaviors>
                <ig:Activation Enabled="true">
                </ig:Activation>
                <ig:Filtering Enabled="true" EnableInheritance="true"> 
                     <ColumnSettings>
                        <ig:ColumnFilteringSetting ColumnKey="ContactTitle" 
                        EditorID="WebHierarchicalDataGrid1_DropDownProvider1" />
                    </ColumnSettings>         
                </ig:Filtering>
            </Behaviors>
        
            <Bands>
                <ig:Band Key="Orders" DataMember="AccessDataSource2_Orders" DataKeyFields="OrderID">
                    <Behaviors>
                        <ig:Filtering>
                            <ColumnSettings>
                                <ig:ColumnFilteringSetting ColumnKey="OrderDate" 
                                EditorID="WebHierarchicalDataGrid1_DatePickerProvider1" />
                            </ColumnSettings>
                        </ig:Filtering>
                    </Behaviors>
                </ig:Band>
            </Bands>
        
            <EditorProviders>
                <ig:DropDownProvider ID="WebHierarchicalDataGrid1_DropDownProvider1">
                    <EditorControl DropDownContainerMaxHeight="200px" Width="200px" runat="server" EnableAnimations="False" 
                        EnableDropDownAsChild="False" ValueField="ContactTitle" TextField="ContactTitle">
                        <Button AltText="" />
                    </EditorControl>
                </ig:DropDownProvider>
                <ig:DatePickerProvider ID="WebHierarchicalDataGrid1_DatePickerProvider1">
                </ig:DatePickerProvider>
            </EditorProviders>
        
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
        <asp:AccessDataSource ID="AccessDataSource1" runat="server"
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle] FROM [Customers]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server"           
            SelectCommand="SELECT [OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate] FROM [Orders]">
        </asp:AccessDataSource>
        </div>
</asp:Content>