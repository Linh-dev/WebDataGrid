<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Performance_Configuring_Virtual_Scrolling_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div1">
        <div id="Div2">
            <div id="headerContainer" class="ControlPanelHeader">
                <img alt="Configuration" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" /><%= this.GetGlobalResourceObject("WebDataGrid","VirtualScrolling_ClientAPI_HeaderTitle")%></div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEvent">
                    <div>
                        <span class="leftTitle">
                            <%= this.GetGlobalResourceObject("WebDataGrid","VirtualScrolling_ScrollingMode")%></span>
                        <asp:RadioButton ID="VirtualRadio" GroupName="ScrollingMode" Text="<%$ Resources:WebDataGrid, VirtualScrolling_Mode_Virtual %>"
                            AutoPostBack="true" Checked="true" runat="server" OnCheckedChanged="VirtualRadio_CheckedChanged" />
                        <asp:RadioButton ID="DeferredRadio" GroupName="ScrollingMode" Text="<%$ Resources:WebDataGrid, VirtualScrolling_Mode_Deferred %>"
                            AutoPostBack="true" runat="server" OnCheckedChanged="DeferredRadio_CheckedChanged" />
                    </div>
                    <div style="padding-top: 10px; padding-bottom: 10px">
                        <span class="leftTitle">
                            <%= this.GetGlobalResourceObject("WebDataGrid","VirtualScrolling_RowCacheFactor") %></span>
                        <asp:DropDownList ID="RowCacheFactorList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RowCacheFactorList_SelectedIndexChanged"
                            CssClass="CSSform">
                            <asp:ListItem Text="1" Value="1" />
                            <asp:ListItem Text="2" Value="2" />
                            <asp:ListItem Text="3" Value="3" />
                        </asp:DropDownList>
                        <br style="clear: both;" />
                        <span class="leftTitle">
                            <%= this.GetGlobalResourceObject("WebDataGrid","VirtualScrolling_Thresholdactor") %></span>
                        <asp:DropDownList ID="ThresholdFactorList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ThresholdFactorList_SelectedIndexChanged"
                            CssClass="CSSform">
                            <asp:ListItem Text=".25" Value=".25" />
                            <asp:ListItem Text=".50" Value=".5" />
                            <asp:ListItem Text="1" Value="1" />
                        </asp:DropDownList>
                        <br style="clear: both;" />
                        <span class="leftTitle">
                            <%= this.GetGlobalResourceObject("WebDataGrid","VirtualScrolling_DataFetchDelay") %></span>
                        <asp:DropDownList ID="DataFetchDelayList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DataFetchDelayList_SelectedIndexChanged"
                            CssClass="CSSform">
                            <asp:ListItem Text="500" Value="500" />
                            <asp:ListItem Text="1000" Value="1000" />
                            <asp:ListItem Text="2000" Value="2000" />
                            <asp:ListItem Text="3000" Value="3000" />
                            <asp:ListItem Text="4000" Value="4000" />
                            <asp:ListItem Text="5000" Value="5000" />
                        </asp:DropDownList>
                        <br style="clear: both;" />
                    </div>
                </div>
            </div>
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="AccessDataSource1"
                    AutoGenerateColumns="False" Height="270" Width="100%">
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
                        <ig:VirtualScrolling ScrollingMode="Virtual" DataFetchDelay="500" RowCacheFactor="3"
                            ThresholdFactor="0.5" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
