<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Custom_Client_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_CustomClientEvents_EventsHeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="container">
            <table width="100%">
                <tr valign="top">
                    <td width="80%">
                        <div id="DataGridWrapper">
                            <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="CustomerID" runat="server" AutoGenerateColumns="False"
                                DataSourceID="AccessDataSource1" Width="100%" Height="425">
                                <ClientEvents KeyUp="WebDataGridView_KeyUp" MouseDown="WebDataGridView_MouseDown" />
                                <Columns>
                                    <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
                                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="Address" Key="Address">
                                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="City" Key="City">
                                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                                    </ig:BoundDataField>
                                    <ig:BoundDataField DataFieldName="Country" Key="Country">
                                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                                    </ig:BoundDataField>
                                </Columns>
                                <Behaviors>
                                    <ig:Activation Enabled="true" />
                                    <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                                    <ig:Selection CellSelectType="Single" ColumnSelectType="Single" Enabled="true" />
                                </Behaviors>
                                <ClientEvents AJAXResponse="WebDataGridView_AJAXResponse" />
                            </ig:WebDataGrid>
                        </div>
                    </td>
                    <td style="padding-left: 10px;">
                        <span>
                            <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_CustomClientEvents_ActiveCellText") %></span>
                        <br />
                        <asp:TextBox ID="txtCurrentActiveCell" TextMode="MultiLine" Width="170px" runat="server"
                            Height="50px" ReadOnly="true" CssClass="calender_date" Font-Size="10" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
    <script type="text/javascript">

        function WebDataGridView_AJAXResponse(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","ClientMessageAJAXResponse") %>');
        }

        function WebDataGridView_KeyUp(webDataGrid, evntArgs) {

            var str = '<%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_CustomClientEvents_ClientMessageKeyUp") %>';
            addLine(str);

            GetText(webDataGrid.get_behaviors().get_activation().get_activeCell().get_text());
        }

        function WebDataGridView_MouseDown(webDataGrid, evntArgs) {
            var event = evntArgs.get_browserEvent();

            if (evntArgs.get_item() != null && evntArgs.get_browserEvent().button == 0) {

                var str = '<%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_CustomClientEvents_ClientMessageMouseDown") %>';
                addLine(str);

                GetText(evntArgs.get_item().get_text());
            }
        }

        function GetText(text) {
            document.getElementById("<%= txtCurrentActiveCell.ClientID %>").value = text;
        }
       
    </script>
</asp:Content>
