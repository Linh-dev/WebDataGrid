<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
            <!--#BEGIN SNIPPET#-->
            <ig:WebHierarchicalDataGrid runat="server" ID="wdgEmployees" DataSourceID="whdsMain"
            AutoGenerateColumns="false" Width="100%">
			<Columns>
				<ig:BoundDataField Key="FirstName" DataFieldName="FirstName"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_FirstName %>">
				</ig:BoundDataField>
				<ig:BoundDataField Key="LastName" DataFieldName="LastName"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_LastName %>">
				</ig:BoundDataField>
                <ig:BoundDataField Key="Region" DataFieldName="Region"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>">
				</ig:BoundDataField>
                <ig:BoundDataField Key="Country" DataFieldName="Country"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Country %>">
				</ig:BoundDataField>
			</Columns>
            <Bands>
                <ig:Band DataMember="dvOrders" DataKeyFields="OrderID" AutoGenerateColumns="false">
					<Columns>
						<ig:BoundDataField Key="OrderID" DataFieldName="OrderID"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderID %>">
						</ig:BoundDataField>
						<ig:BoundDataField Key="ShipRegion" DataFieldName="ShipRegion"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>">
						</ig:BoundDataField>
                        <ig:BoundDataField Key="ShipCity" DataFieldName="ShipCity"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>">
				        </ig:BoundDataField>
					</Columns>
                    <Behaviors>
                        <ig:Sorting Enabled="true" EnableCellMerging="true" SortingMode="Multi" />
                    </Behaviors>
                     <GroupingSettings EnableCellMerging="true" />
                </ig:Band>
            </Bands>
            <Behaviors>
                <ig:Activation>
                </ig:Activation>
                <ig:Selection RowSelectType="Single" CellClickAction="Row">
                </ig:Selection>
                <ig:Sorting EnableCellMerging="true"  SortingMode="Multi"/>
            </Behaviors>
            <GroupingSettings EnableColumnGrouping="True" GroupAreaVisibility="Visible" GroupAreaCssClass="GroupArea" EnableCellMerging="true" />
        </ig:WebHierarchicalDataGrid>
        <!--#END SNIPPET#-->
        <ig:WebHierarchicalDataSource ID="whdsMain" runat="server">
            <DataViews>
                <ig:DataView DataSourceID="SqlDsEmployees" DataMember="DefaultView" ID="dvEmployees" />
                <ig:DataView DataSourceID="SqlDsOrders" DataMember="DefaultView" ID="dvOrders" />
            </DataViews>
            <DataRelations>
                <ig:DataRelation ParentDataViewID="dvEmployees" ChildDataViewID="dvOrders" ParentColumns="EmployeeID"
                    ChildColumns="EmployeeID" />
            </DataRelations>
        </ig:WebHierarchicalDataSource>
        <asp:SqlDataSource ID="SqlDsEmployees" runat="server" 
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Region], [City], [Country] FROM nwd.[Employees]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDsOrders" runat="server" 
            SelectCommand="SELECT [OrderID], [ShipName], [ShipRegion], [ShipCity], [EmployeeID] FROM nwd.[Orders]">
        </asp:SqlDataSource>
</asp:Content>