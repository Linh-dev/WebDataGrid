<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" Inherits="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function WebDataGridView_AJAXResponse(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","ClientMessageAJAXResponse") %>');
        }

        function WebDataGridView_EnteringEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","UpdateRow_EnteringEditMode") %>');
        }

        function WebDataGridView_EnteredEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","UpdateRow_EditMode") %>');
        }

        function WebDataGridView_ExitedEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","UpdateRow_ExitedEditMode") %>');
        }

        function WebDataGridView_ExitingEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","UpdateRow_ExitingEditMode") %>');
        }
    
    </script>
    <div id="wrapper" class="wgDataBind">
        <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true"
            UpdateMode="Conditional">
            <ContentTemplate>
                <div id="headerContainer" class="ControlPanelHeader">
                    <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
                    <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_UpdateRowClient_HeaderTitle") %></div>
                <div id="countContainer" class="controlPanel">
                    <div id="eventList" class="controlPanelEvent">
                        <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
                    </div>
                </div>
                <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 20px;">
                    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425" Width="100%" DataKeyFields="CustomerID"
                        AutoGenerateColumns="false" DataSourceID="ObjectDataSource1">
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
                            <ig:Activation />
                            <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
                            <ig:EditingCore>
                                <Behaviors>
                                    <ig:CellEditing Enabled="true">
                                        <EditModeActions EnableF2="true" EnableOnActive="true" MouseClick="Single" />
                                        <ColumnSettings>
                                            <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
                                        </ColumnSettings>
                                        <CellEditingClientEvents EnteringEditMode="WebDataGridView_EnteringEditMode" EnteredEditMode="WebDataGridView_EnteredEditMode"
                                            ExitedEditMode="WebDataGridView_ExitedEditMode" ExitingEditMode="WebDataGridView_ExitingEditMode" />
                                    </ig:CellEditing>
                                </Behaviors>
                            </ig:EditingCore>
                        </Behaviors>
                        <ClientEvents AJAXResponse="WebDataGridView_AJAXResponse" />
                        <EditorProviders>
                            <ig:TextEditorProvider ID="WebTextEditProvider1" />
                        </EditorProviders>
                    </ig:WebDataGrid>
                </div>
                <br />
                <asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:WebDataGrid, SaveButton %>" />
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
