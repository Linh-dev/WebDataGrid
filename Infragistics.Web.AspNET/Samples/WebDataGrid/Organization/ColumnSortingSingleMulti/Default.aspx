<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Column_Sorting_Single_Multi_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="Description" style="margin-left: 20px; margin-top: 10px">
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" ChildrenAsTriggers="true" UpdateMode="Conditional"
                runat="server">
                <ContentTemplate>
                    <div class="OptionPanel">
                        <div id="Icon" style="margin-right: 10px; float: left;">
                            <img src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Organization/ColumnSortingSingleMulti/SortingIcon.png" alt="Clock" width="50" height="55" /></div>
                        <div>
                            <%= this.GetGlobalResourceObject("WebDataGrid","Sorting_Basic_EventsHeaderTitle") %><br />
                            <span class="leftTitle"><strong>
                                <%= this.GetGlobalResourceObject("WebDataGrid","Sorting_Basic_SortingType") %></strong></span>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Text="<%$ Resources:WebDataGrid, Sorting_Basic_SingleColumn  %>"></asp:ListItem>
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, Sorting_Basic_MultiColumn  %>"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div id="DataGridWrapper">
                        <ig:WebDataGrid ID="WebDataGrid1" runat="server" DataKeyFields="CustomerID" AutoGenerateColumns="False"
                            DataSourceID="AccessDataSource1" Width="100%" Height="425">
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
                                <ig:BoundDataField DataFieldName="Region" Key="Region">
                                    <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderRegion %>" />
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                                    <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="Phone" Key="Phone">
                                    <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPhone %>" />
                                </ig:BoundDataField>
                            </Columns>
                            <Behaviors>
                                <ig:Sorting SortingMode="Single" Enabled="true" />
                                <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                            </Behaviors>
                        </ig:WebDataGrid>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
