<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Column_Fixing_Server_Side_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Configuration" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","Activation_Basic_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <table border="0" cellspacing="5" cellpadding="0">
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebDataGrid","ColumnFixing_Option1") %>
                        </td>
                        <td>
                            <asp:CheckBox runat="server" TextAlign="Left" ID="EnableFixedColumns" Checked="true"
                                AutoPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebDataGrid","ColumnFixing_Option4") %>
                        </td>
                        <td>
                            <asp:CheckBox TextAlign="Left" ID="EnableHeightAdjustment" runat="server" Checked="true"
                                AutoPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebDataGrid","ColumnFixing_Option2") %>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblColumnFixing" AutoPostBack="true" RepeatLayout="Flow"
                                RepeatDirection="Horizontal" runat="server" TextAlign="Left">
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, ColumnFixing_Left %>" Value="l"
                                    Selected="True" />
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, ColumnFixing_Right %>" Value="r" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebDataGrid","ColumnFixing_Option3") %>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblButtonAlignment" AutoPostBack="true" RepeatLayout="Flow"
                                RepeatDirection="Horizontal" runat="server" TextAlign="Left">
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, ColumnFixing_Left %>" Value="l" />
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, ColumnFixing_Right %>" Value="r"
                                    Selected="True" />
                            </asp:RadioButtonList>
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
                <ColumnSettings>
                    <ig:ColumnFixingSetting FixButtonAlignment="Left" EnableFixing="True" FixLocation="Left" />
                </ColumnSettings>
            </ig:ColumnFixing>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="GridDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
