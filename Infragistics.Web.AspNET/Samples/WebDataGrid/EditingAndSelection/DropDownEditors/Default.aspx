<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_DropDown_Editors_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="500px" Width="100%" DataSourceID="Orders"
        DataKeyFields="OrderID" AutoGenerateColumns="False" OnRowUpdating="WebDataGrid1_RowUpdating">
        <EditorProviders>
            <ig:DropDownProvider ID="CustomerNameProvider">
                <EditorControl ID="EditorControl1" runat="server" DisplayMode="DropDownList" DataSourceID="Customers"
                    TextField="ContactName" ValueField="CustomerID" />
            </ig:DropDownProvider>
            <ig:DropDownProvider ID="ShipperProvider" EditorControl-DropDownContainerWidth="135px">
                <EditorControl ID="EditorControl2" runat="server" DisplayMode="DropDownList" DataSourceID="Shippers"
                    TextField="CompanyName" ValueField="ShipperID" />
            </ig:DropDownProvider>
            <ig:NumericEditorProvider ID="FreightValueProvider" />
            <ig:DatePickerProvider ID="DateInputProvider" />
            <ig:MaskEditorProvider EditorControl-DataMode="AllText" EditorControl-InputMask="(###) ###-####"
                ID="PhoneInputProvider" />
        </EditorProviders>
        <Columns>
            <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Width="50px">
                <Header Text="<%$ Resources:WebDataGrid, EditorColumnOrderID %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="CustomerID" Width="120px">
                <Header Text="<%$ Resources:WebDataGrid, EditorColumnContactName %>" />
            </ig:BoundDataField>
            <ig:BoundDataField Key="OrderDate" DataFormatString="{0:d}">
                <Header Text="<%$ Resources:WebDataGrid, EditorColumnOrderDate %>" />
            </ig:BoundDataField>
            <ig:BoundDataField Key="ShippedDate" DataFormatString="{0:d}">
                <Header Text="<%$ Resources:WebDataGrid, EditorColumnShippingDate %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ShippingCompany" Key="ShipperID" Width="120px">
                <Header Text="<%$ Resources:WebDataGrid, EditorColumnShippingCompany %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Freight" Key="Freight" Width="60px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderFreight %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Phone" Key="Phone" Width="110px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPhone %>" />
            </ig:BoundDataField>
        </Columns>
        <Behaviors>
            <ig:EditingCore>
                <Behaviors>
                    <ig:CellEditing Enabled="true">
                        <ColumnSettings>
                            <ig:EditingColumnSetting ColumnKey="CustomerID" EditorID="CustomerNameProvider" />
                            <ig:EditingColumnSetting ColumnKey="ShipperID" EditorID="ShipperProvider" />
                            <ig:EditingColumnSetting ColumnKey="OrderDate" EditorID="DateInputProvider" />
                            <ig:EditingColumnSetting ColumnKey="ShippedDate" EditorID="DateInputProvider" />
                            <ig:EditingColumnSetting ColumnKey="Freight" EditorID="FreightValueProvider" />
                            <ig:EditingColumnSetting ColumnKey="Phone" EditorID="PhoneInputProvider" />
                        </ColumnSettings>
                    </ig:CellEditing>
                </Behaviors>
            </ig:EditingCore>
            <ig:Paging PageSize="20" PagerAppearance="Bottom" />
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="Orders" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT top 50 Orders.OrderID, Orders.CustomerID, Orders.ShipCity, Orders.ShippedDate, Orders.OrderDate, 
	                        Orders.ShipVia, Orders.ShipCountry, Customers.ContactName, Shippers.ShipperID, Shippers.CompanyName as ShippingCompany, Orders.Freight, Shippers.Phone
                            FROM Shippers INNER JOIN (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) 
                            ON Shippers.ShipperID = Orders.ShipVia"></asp:AccessDataSource>
    <asp:AccessDataSource ID="Customers" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT Customers.CustomerID, Customers.ContactName FROM Customers">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="Shippers" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT Shippers.ShipperID, Shippers.CompanyName FROM Shippers">
    </asp:AccessDataSource>
</asp:Content>
