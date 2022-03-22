<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	 <style type="text/css">
		 #sampleContainer { overflow: visible !important; }
		 .container1 { overflow: visible !important; }
	 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <div style="width: 100%">
        <table>
            <tr>
                <td width="220">
                    <span>
                        <%=this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_Filtering_FromLabel")%></span>
                    <ig:WebDatePicker runat="server" ID="WebDatePicker1" DropDownCalendarID="WebMonthCalendar1"
                        Width="200px">
                        <ClientSideEvents ValueChanging="set_str_date" />
                    </ig:WebDatePicker>
                    <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar1"
                        Width="200px" EnableMonthDropDown="True" EnableYearDropDown="True">
                    </ig:WebMonthCalendar>
                </td>
                <td width="220">
                    <span>
                        <%=this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_Filtering_ToLabel")%></span>
                    <ig:WebDatePicker runat="server" ID="WebDatePicker2" DropDownCalendarID="WebMonthCalendar2"
                        StyleSetName="Trendy" Width="200px">
                        <ClientSideEvents ValueChanging="set_end_date" />
                    </ig:WebDatePicker>
                    <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar2" StyleSetName="Trendy"
                        Width="200px" EnableMonthDropDown="True" EnableYearDropDown="True">
                    </ig:WebMonthCalendar>
                </td>
                <td valign="bottom">
                    <asp:Button ID="bSubmit" runat="server" Text="<%$ Resources:WebDatePicker, WebDatePicker_Filtering_ButtonText %>"
                        OnClick="bSubmit_Click" />
                </td>
            </tr>
        </table>
        <br style="clear: both;">
        <div id="container1">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="500px" Width="700px" DataSourceID="Orders"
                    DataKeyFields="OrderID" AutoGenerateColumns="False">
                    <Columns>
                        <ig:BoundDataField DataFieldName="OrderID" Key="OrderID">
                            <Header Text="<%$ Resources:WebDataGrid, EditorColumnOrderID %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ContactName" Key="CustomerID" Width="150px">
                            <Header Text="<%$ Resources:WebDataGrid, EditorColumnContactName %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField Key="OrderDate" DataFormatString="{0:d}">
                            <Header Text="<%$ Resources:WebDataGrid, EditorColumnOrderDate %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField Key="ShippedDate" DataFormatString="{0:d}">
                            <Header Text="<%$ Resources:WebDataGrid, EditorColumnShippingDate %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ShippingCompany" Key="ShipperID">
                            <Header Text="<%$ Resources:WebDataGrid, EditorColumnShippingCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Freight" Key="Freight">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderFreight %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Phone" Key="Phone" Width="90px">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPhone %>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Paging PageSize="20" PagerAppearance="Bottom" />
                    </Behaviors>
                </ig:WebDataGrid>
                <asp:AccessDataSource ID="Orders" runat="server"
                    SelectCommand="SELECT Orders.OrderID, Orders.CustomerID, Orders.ShipCity, Orders.ShippedDate, Orders.OrderDate, 
	                        Orders.ShipVia, Orders.ShipCountry, Customers.ContactName, Shippers.ShipperID, Shippers.CompanyName as ShippingCompany, Orders.Freight, Shippers.Phone
                            FROM Shippers INNER JOIN (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) 
                            ON Shippers.ShipperID = Orders.ShipVia WHERE OrderDate BETWEEN @OrderDateFrom and @OrderDateTo ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="WebDatePicker1" Name="OrderDateFrom" PropertyName="Date"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="WebDatePicker2" Name="OrderDateTo" PropertyName="Date"
                            Type="DateTime" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        function set_str_date(sender, args) {

            if ($find("<%= WebDatePicker1.ClientID %>").get_value() != "" &&
                $find("<%= WebDatePicker2.ClientID %>").get_value() < args.get_value()) {
                args.set_cancel(true);
            }
        }

        function set_end_date(sender, args) {

            if ($find("<%= WebDatePicker2.ClientID %>").get_value() != "" &&
                $find("<%= WebDatePicker1.ClientID %>").get_value() > args.get_value()) {
                args.set_cancel(true);
            }
        }
        
    </script>
</asp:Content>
