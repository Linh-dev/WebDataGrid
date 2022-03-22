<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="width: 100%">
        <ig:WebHierarchicalDataGrid runat="server" ID="wdgCustomers" DataSourceID="whdsMain"
            AutoGenerateColumns="false" Width="98%" Height="450">
			<Columns>
				<ig:BoundDataField Key="CustomerID" DataFieldName="CustomerID"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>">
				</ig:BoundDataField>
				<ig:BoundDataField Key="CompanyName" DataFieldName="CompanyName"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>">
				</ig:BoundDataField>
				<ig:BoundDataField Key="ContactName" DataFieldName="ContactName"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>">
				</ig:BoundDataField>
				<ig:BoundDataField Key="City" DataFieldName="City"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>">
				</ig:BoundDataField>
				<ig:BoundDataField Key="Country" DataFieldName="Country"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Country %>">
				</ig:BoundDataField>
			</Columns>
            <Bands>
                <ig:Band DataMember="dvOrders" DataKeyFields="OrderID" AutoGenerateColumns="false">
					<Columns>
						<ig:BoundDataField Key="OrderID" DataFieldName="OrderID"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderID %>">
						</ig:BoundDataField>
						<ig:BoundDataField Key="CustomerID" DataFieldName="CustomerID"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>">
						</ig:BoundDataField>
						<ig:BoundDataField Key="OrderDate" DataFieldName="OrderDate"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderDate %>">
						</ig:BoundDataField>
						<ig:BoundDataField Key="RequiredDate" DataFieldName="RequiredDate"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_RequiredDate %>">
						</ig:BoundDataField>
						<ig:BoundDataField Key="ShipCity" DataFieldName="ShipCity"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipCity %>">
						</ig:BoundDataField>
						<ig:BoundDataField Key="ShipCountry" DataFieldName="ShipCountry"  Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipCountry %>">
						</ig:BoundDataField>
					</Columns>
                    <Behaviors>
                        <ig:RowSelectors RowNumbering="true">
                        </ig:RowSelectors>
                    </Behaviors>
                </ig:Band>
            </Bands>
            <Behaviors>
                <ig:RowSelectors RowNumbering="true">
                </ig:RowSelectors>
                <ig:Activation>
                </ig:Activation>
                <ig:Selection RowSelectType="Multiple">
                </ig:Selection>
            </Behaviors>
        </ig:WebHierarchicalDataGrid>
        <ig:WebHierarchicalDataSource ID="whdsMain" runat="server">
            <DataViews>
                <ig:DataView DataSourceID="SqlDsCustomers" DataMember="DefaultView" ID="dvCustomers" />
                <ig:DataView DataSourceID="SqlDsOrders" DataMember="DefaultView" ID="dvOrders" />
            </DataViews>
            <DataRelations>
                <ig:DataRelation ParentDataViewID="dvCustomers" ChildDataViewID="dvOrders" ParentColumns="CustomerID"
                    ChildColumns="CustomerID" />
            </DataRelations>
        </ig:WebHierarchicalDataSource>
        <asp:SqlDataSource ID="SqlDsCustomers" runat="server" 
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Phone], [Country] FROM nwd.[Customers] ORDER BY [Country]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDsOrders" runat="server" 
            SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShipCity], [ShipAddress], [ShipName], [ShipCountry] FROM nwd.[Orders]">
        </asp:SqlDataSource>
    </div>
</asp:Content>