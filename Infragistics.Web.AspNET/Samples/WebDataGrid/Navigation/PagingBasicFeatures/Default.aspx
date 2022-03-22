<%@  Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="Samples_WebDataGrid_Navigation_Paging_Basic_Features_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <asp:UpdatePanel ID="UpdatePanel1" ChildrenAsTriggers="true" UpdateMode="Conditional"
                runat="server">
                <ContentTemplate>
                    <div class="OptionPanel">
                        <div id="Icon" style="float: left;">
                            <img src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Navigation/PagingBasicFeatures/PagingIcon.png"
                                alt="Clock" width="47" height="55" /></div>
                        <div id="ComboBox" style="float: left; margin-top: 18px; margin-left: 5px;">
                            <asp:Literal runat="server" Text="<%$ Resources:WebDataGrid, Paging_Basic_PagerPositionText %>" />
                            <asp:DropDownList ID="PagerLocation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PagerLocation_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Text="<%$ Resources:WebDataGrid, Paging_Basic_PagerPosition_Item1 %>"></asp:ListItem>
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, Paging_Basic_PagerPosition_Item2 %>"></asp:ListItem>
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, Paging_Basic_PagerPosition_Item3 %>"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Literal runat="server" Text="<%$ Resources:WebDataGrid, Paging_Basic_NumberOfItemsText %>" /><asp:DropDownList
                                ID="NumberofItems" runat="server" AutoPostBack="True" OnSelectedIndexChanged="NumberofItems_SelectedIndexChanged">
                                <asp:ListItem Text="10" Value="10" />
                                <asp:ListItem Text="20" Value="20" />
                                <asp:ListItem Text="50" Value="50" />
                            </asp:DropDownList>
                        </div>
                        <br style="clear: both;" />
                    </div>
                    <div id="DataGridWrapper">
                        <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="DefaultDataSource"
                            DataKeyFields="CustomerID" AutoGenerateColumns="false" Width="100%" Height="425">
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
                                <ig:RowSelectors Enabled="true" RowNumbering="true" />
                                <ig:Selection CellSelectType="Multiple" RowSelectType="Multiple" ColumnSelectType="Multiple"
                                    Enabled="true" />
                            </Behaviors>
                        </ig:WebDataGrid>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
        </asp:AccessDataSource>
    </div>
</asp:Content>
