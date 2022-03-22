<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Add_Row_Server_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet"
        type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Server Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_AddRowServer_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="CustomerID" runat="server" AutoGenerateColumns="False"
                    DataSourceID="ObjectDataSource1" EnableAjax="true" OnRowAdded="WebDataGrid1_RowAdded"
                    OnRowAdding="WebDataGrid1_RowAdding" Height="425" Width="100%">
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
                        <ig:Activation>
                        </ig:Activation>
                        <ig:EditingCore>
                            <Behaviors>
                                <ig:RowAdding Alignment="Top" EditModeActions-EnableOnActive="true" EditModeActions-MouseClick="Single"
                                    Enabled="true">
                                    <AddNewRowClientEvents ExitedEditMode="WebDataGridView_ExitedEditMode" />
                                </ig:RowAdding>
                            </Behaviors>
                        </ig:EditingCore>
                    </Behaviors>
                    <EditorProviders>
                        <ig:TextEditorProvider ID="WebTextEditProvider1" />
                    </EditorProviders>
                    <ClientEvents AJAXResponse="WebDataGridView_AJAXResponse" />
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        function WebDataGridView_AJAXResponse(webDataGrid, evntArgs) {
            var errorMessage;
            if (evntArgs.get_browserResponseObject().status == 200)
                errorMessage = evntArgs.get_gridResponseObject().Message;
            else
                errorMessage = evntArgs.get_browserResponseObject().responseText;
            $get("eventList").innerHTML = errorMessage;
        }

        function WebDataGridView_ExitedEditMode(webDataGrid, evntArgs) {
            $get("eventList").innerHTML = "";
        }
    
    </script>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddCustomer"
        ConflictDetection="CompareAllValues" SelectMethod="GetCustomerDataSource" EnableCaching="false"
        TypeName="NorthwindDataSource">
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
