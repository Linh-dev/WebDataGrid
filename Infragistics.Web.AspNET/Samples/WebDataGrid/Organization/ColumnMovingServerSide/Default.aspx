<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Column_Moving_Server_Side_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .columnList
        {
            margin-top: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div3" class="wgDataBind">
        <div id="Div4">
            <div id="Div5" style="margin-left: 20px; margin-top: 10px">
            </div>
            <asp:UpdatePanel ID="UpdatePaneContainer" ChildrenAsTriggers="true" UpdateMode="Conditional"
                runat="server">
                <ContentTemplate>
                    <div id="headerContainer" class="ControlPanelHeader">
                        <img alt="Control Panel" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
                        <%= this.GetGlobalResourceObject("WebDataGrid","Activation_Basic_HeaderTitle") %></div>
                    <div id="countContainer" class="controlPanel">
                        <div id="eventList" class="controlPanelEvent">
                            <span class="leftTitle">
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnMoving_MovingType")%></span>
                            <asp:DropDownList ID="ColumnMovingType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ColumnMovingType_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="Slide" Text="<%$ Resources:WebDataGrid, ColumnMoving_DragStyleSlide  %>"></asp:ListItem>
                                <asp:ListItem Value="Follow" Text="<%$ Resources:WebDataGrid, ColumnMoving_DragStyleFollow  %>"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <span class="leftTitle">
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnMoving_Disable")%></span>
                            <asp:DropDownList ID="ColumnsList" runat="server" AutoPostBack="True" CssClass="columnList"
                                OnSelectedIndexChanged="ColumnsList_SelectedIndexChanged">
                                <asp:ListItem Value="None" Text="<%$ Resources:WebDataGrid, ColumnMoving_None %>"
                                    Selected="True"></asp:ListItem>
                                <asp:ListItem Value="CustomerID" Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>"></asp:ListItem>
                                <asp:ListItem Value="CompanyName" Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany  %>"></asp:ListItem>
                                <asp:ListItem Value="Contact" Text="<%$ Resources:WebDataGrid, ColumnHeaderContact  %>"></asp:ListItem>
                                <asp:ListItem Value="Address" Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress  %>"></asp:ListItem>
                                <asp:ListItem Value="City" Text="<%$ Resources:WebDataGrid, ColumnHeaderCity  %>"></asp:ListItem>
                                <asp:ListItem Value="PostalCode" Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode  %>"></asp:ListItem>
                                <asp:ListItem Value="Country" Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry  %>"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div id="DataGridWrapper">
                        <ig:WebDataGrid ID="WebDataGridSample" runat="server" DataKeyFields="CustomerID"
                            AutoGenerateColumns="False" Width="100%" Height="425" DataSourceID="NorthWndDataSource">
                            <Columns>
                                <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                                    <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
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
                            <Behaviors>
                                <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                                <ig:ColumnMoving DragStyle="Slide">
                                    <ColumnSettings>
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="CustomerID" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="CompanyName" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Contact" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Address" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="City" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="PostalCode" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Country" />
                                    </ColumnSettings>
                                </ig:ColumnMoving>
                            </Behaviors>
                        </ig:WebDataGrid>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <asp:AccessDataSource ID="NorthWndDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
