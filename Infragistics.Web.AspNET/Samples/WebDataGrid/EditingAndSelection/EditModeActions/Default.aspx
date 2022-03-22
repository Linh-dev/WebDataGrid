<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Edit_Mode_Actions_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <asp:UpdatePanel ID="UpdatePanel1" ChildrenAsTriggers="true" UpdateMode="Conditional"
            runat="server">
            <ContentTemplate>
                <div id="topContentContainer">
                    <div id="headerContainer" class="ControlPanelHeader">
                        <img src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
                        <asp:Label ID="Label1" Text="<%$ Resources:WebDataGrid, DataEditing_CellEditingEnabled_HeaderTitle %>"
                            runat="server"></asp:Label>
                    </div>
                    <div id="countContainer" class="controlPanel">
                        <div id="eventList" class="controlPanelEvent">
                            <asp:Label ID="Label2" Text="<%$ Resources:WebDataGrid, DataEditing_CellEditingEnabled_ClickActionTitle %>"
                                runat="server"></asp:Label>
                            <asp:DropDownList ID="MousClickDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="MouseClickChanged">
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, DataEditing_CellEditingEnabled_ClickSingle  %>"
                                    Selected="True"></asp:ListItem>
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, DataEditing_CellEditingEnabled_ClickDouble  %>"></asp:ListItem>
                                <asp:ListItem Text="<%$ Resources:WebDataGrid, DataEditing_CellEditingEnabled_ClickNone  %>"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:CheckBox ID="EnableF2CB" runat="server" Text="EnableF2" OnCheckedChanged="EnableF2Checked"
                                AutoPostBack="true" CssClass="outputValue" /><br />
                            <asp:CheckBox ID="EnableOnKeyPressCB" runat="server" Text="EnableOnKeyPress" OnCheckedChanged="EnableOnKeyPressChecked"
                                AutoPostBack="true" Enabled="false" CssClass="outputValue" /><br />
                            <asp:CheckBox ID="EnableOnActiveCB" runat="server" Text="EnableOnActive" OnCheckedChanged="EnableOnActiveChecked"
                                AutoPostBack="true" Enabled="false" CssClass="outputValue" /><br />
                        </div>
                    </div>
                </div>
                <div id="container">
                    <div id="DataGridWrapper">
                        <ig:WebDataGrid ID="WebDataGrid1" runat="server" DataKeyFields="CustomerID" TabIndex="0"
                            Height="425" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <ig:BoundDataField Key="CustomerID" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderId %>" />
                                <ig:BoundDataField Key="CompanyName" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                                <ig:BoundDataField Key="ContactName" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                                <ig:BoundDataField Key="Address" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                                <ig:BoundDataField Key="City" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                                <ig:BoundDataField Key="PostalCode" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                                <ig:BoundDataField Key="Country" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                            </Columns>
                            <Behaviors>
                                <ig:Activation Enabled="true" />
                                <ig:EditingCore>
                                    <Behaviors>
                                        <ig:CellEditing />
                                    </Behaviors>
                                </ig:EditingCore>
                            </Behaviors>
                            <EditorProviders>
                                <ig:TextEditorProvider ID="WebTextEditProvider1" />
                            </EditorProviders>
                        </ig:WebDataGrid>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" UpdateMethod="UpdateCustomer"
        SelectMethod="GetCustomerDataSource" EnableCaching="false" TypeName="NorthwindDataSource">
        <UpdateParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
