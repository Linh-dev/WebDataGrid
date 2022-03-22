<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Column_Hiding_Client_Side_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <style type="text/css">
        .column_options label
        {
            padding-right: 12px;
        }        

        .controlPanelEvent
        {
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function setColumn(obj, index) {
            grid = $find("<%=WebDataGridView.ClientID %>");
            grid.get_columns().get_column(index).set_hidden(obj.checked);
        }
		
    </script>
    <div>
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Configuration" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" /><%= this.GetGlobalResourceObject("WebDataGrid","ColumnHiding_Title_Sub_Client") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <table border="0" cellspacing="5" cellpadding="0">
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="chklColumns" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                CssClass="column_options" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="NorthWndDataSource"
        DataKeyFields="CustomerID" AutoGenerateColumns="False" Height="425" Width="100%"
        EnableRelativeLayout="true">
        <Columns>
            <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact">
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
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="NorthWndDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
