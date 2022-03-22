<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Column_Fixing_Client_Side_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        var columnName = "CompanyName";

        function EnableFixedColumnsCheck(checkbox) {

            var columnFixingBehavior = GetColumnFixingBehavior();

            if (columnFixingBehavior == null)
                return;

            if (checkbox.checked == true) {

                var fixLocation = GetFixLocation();
                columnFixingBehavior.fixColumnByKey(columnName, fixLocation);
            }
            else {
                if (columnFixingBehavior.containsFixedColumnByKey(columnName)) {
                    columnFixingBehavior.unfixColumnByKey(columnName);
                }
            }
        }

        function ColumnFixingLocation() {

            var columnFixingBehavior = GetColumnFixingBehavior();

            if (columnFixingBehavior == null)
                return;

            if (columnFixingBehavior.containsFixedColumnByKey(columnName)) {

                var fixLocation = GetFixLocation();
                columnFixingBehavior.fixColumnByKey(columnName, fixLocation);
            }
        }

        function WebDataGridView_FixedStateChanged(sender, e) {

            if (e.get_fixedColumn().get_column().get_key() == columnName) {
                document.getElementById('EnableFixedColumns').checked = e.get_isFixed();
            }
        }

        function GetWebDataGrid() {
            return $find("<%= this.WebDataGridView.ClientID %>");
        }

        function GetColumnFixingBehavior() {

            var webDataGrid = GetWebDataGrid();

            return webDataGrid.get_behaviors().get_columnFixing();
        }

        function GetFixLocation() {

            var leftColumnFixingRadio = document.getElementById('LeftColumnFixing');

            var fixLocation = $IG.FixLocation.Right;

            if (leftColumnFixingRadio.checked == true)
                fixLocation = $IG.FixLocation.Left;

            return fixLocation;
        }
        
    </script>
    <div>
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","Activation_Basic_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <table>
                    <tr>
                        <td>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:WebDataGrid, Columns_ColumnFixingClient_FixCompanyLabel %>" />
                        </td>
                        <td>
                            <input type="checkbox" id="EnableFixedColumns" checked="checked" onclick="EnableFixedColumnsCheck(this)" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:WebDataGrid, Columns_ColumnFixingClient_AlignCompanyLabel %>" />
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:WebDataGrid, ColumnFixing_Left %>" />
                                    </td>
                                    <td>
                                        <input type="radio" id="LeftColumnFixing" checked="checked" value="0" name="ColumnFixingRadio"
                                            onclick="ColumnFixingLocation()" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:WebDataGrid, ColumnFixing_Right %>" />
                                    </td>
                                    <td>
                                        <input type="radio" id="RightColumnFixing" name="ColumnFixingRadio" value="1" onclick="ColumnFixingLocation()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="GridDataSource"
        DataKeyFields="CustomerID" AutoGenerateColumns="False" Height="270" Width="100%">
        <Columns>
            <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Width="200px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Width="150px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Width="200px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Address" Key="Address" Width="200px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="City" Key="City" Width="200px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode" Width="200px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Country" Key="Country" Width="200px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
            </ig:BoundDataField>
        </Columns>
        <Behaviors>
            <ig:ColumnFixing ShowLeftSeparator="true" ShowRightSeparator="true" AutoAdjustCells="true">
                <ColumnFixingClientEvents FixedStateChanged="WebDataGridView_FixedStateChanged" />
                <ColumnSettings>
                    <ig:ColumnFixingSetting FixButtonAlignment="Left" ColumnKey="CompanyName" EnableFixing="True"
                        FixLocation="Left" />
                </ColumnSettings>
            </ig:ColumnFixing>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="GridDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
