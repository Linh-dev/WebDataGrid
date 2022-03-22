<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="hl1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="hs1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
    <script type="text/javascript">
        var CONST;
        // <!--#BEGIN SNIPPET#-->
        function batchUndoing(sender, eventArgs) {
            var idPair = eventArgs.get_row().get_idPair(),
                message =
				"<div class='event-fired'>batchUndoing " + CONST.txtEventFired + "</div>" +
				"<div class='event-args'>" +
                    CONST.txtRowIndex + ": " + idPair.index + "<br />" + 
                    CONST.txtRowKey + ": " + idPair.key[0] + "<br />" + 
				"</div>";
            showEvent(message);
        }
        function batchUndone(sender, eventArgs) {
            var idPair = eventArgs.get_row().get_idPair(),
                message =
				"<div class='event-fired'>batchUndone " + CONST.txtEventFired + "</div>" +
				"<div class='event-args'>" +
                    CONST.txtRowIndex + ": " + idPair.index + "<br />" +
                    CONST.txtRowKey + ": " + idPair.key[0] + "<br />" +
				"</div>";
            showEvent(message);
        }
        // <!--#BEGIN SNIPPET#-->

        function showEvent(message) {
            $("#<%= eventList.ClientID%>").html($("#<%= eventList.ClientID%>").html() + message).prop({ scrollTop: $("#<%= eventList.ClientID%>").prop("scrollHeight") });
            
            // Use this hidden field to save the client-events during postbacks.
            $("#<%= hdnClientEvents.ClientID %>").val($("#<%= hdnClientEvents.ClientID %>").val() + encodeURIComponent(message));
        }

        function onGridInit(sender, eventArgs) {
            $("#<%= eventList.ClientID%>").prop({ scrollTop: $("#<%= eventList.ClientID%>").prop("scrollHeight") });
            $("#<%= hdnClientEvents.ClientID %>").val(CONST.emptyString);
        }

        function validateAddingRow(sender, eventArgs) {
            var currentColumnName = eventArgs.getCell().get_idPair().columnIDPair.key[0],
                currentRowKey;
            eventArgs.set_displayText(eventArgs.get_displayText().toUpperCase());
            currentRowKey = [eventArgs.get_displayText()];
            if (currentColumnName === "CustomerID") {
                if (sender.get_rows().get_rowFromKey(currentRowKey) !== null) {
                    eventArgs.set_cancel(true);
                    message = "<div class='event-fired'>" + CONST.txtRowKeyDuplicated + "</div>";
                    showEvent(message);
                }
            }
        }

        // Returns localized messages relevant to different actions in the sample.
        // For example, in English, txtEventFired is ‘event fired’.
        CONST = {
            txtEventFired: '<%= this.GetGlobalResourceObject("WebDataGrid","txt_eventFired")%>',
            txtRowIndex: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_rowIndex")%>',
            txtRowKey: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_rowKey")%>',
            txtRowKeyDuplicated: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_rowKeyDuplicated")%>',
            emptyString: ""
        };
    </script>
    <style type="text/css">
        .batch-options { color: #656565; font-size: 12px; margin: 5px 0; padding: 5px; font-weight:bold; }
        .chk-container { margin-bottom: 20px; }
        .ControlPanelHeader { width: 690px; }
        .controlPanel { width: 680px; padding-top: 10px; }
        .eventsWrapper { border: solid 1px #000; margin: 20px 0 10px; padding: 5px 0px 5px 20px; }
        .eventsLegend { padding-left: 3px; padding-right: 3px; }
        .event-fired { font-weight: bold; margin: 5px 0 0; }
        .server-events { padding-left: 330px; }
        .batch-buttons { float: right; margin: 5px 0 5px 5px; }
        .batch-server-tag { margin-left: 200px; }
        .clear { clear: both; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>
            <div class="batch-options">
                <div class="chk-container">
                    <asp:CheckBox ID="chkBatch" runat="server" Checked="true"
                            AutoPostBack="true" OnCheckedChanged="chkBatch_CheckedChanged"/>
                    <asp:Literal ID="ltrEnableBatch" runat="server" Text="<%$ Resources:WebDataGrid, BatchUpdatingEnable %>"></asp:Literal>
                </div>
                <div id="div2" class="ControlPanelHeader">
                    <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
                    <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %>
                    <span class="batch-server-tag">
                        <img src="/samplesbrowser/samplescommon/aspnet/Common/serversideEvent.png" />
                        <%= this.GetGlobalResourceObject("Strings","ServerEventsCaption") %>
                        <asp:HiddenField ID="hdnClientEvents" runat="server" />
                    </span>
                </div>
                <div id="countContainer" class="controlPanel">
                    <div ID="eventList" runat="server" class="controlPanelEvent"></div>
                </div>
            </div>
            <!--#BEGIN SNIPPET#-->
            <ig:WebDataGrid ID="wdg1" runat="server"
                AutoGenerateColumns="false" DataSourceID="ods1" DataKeyFields="CustomerID" EnableAjax="false">
                <Behaviors>
                    <ig:Activation/>
                    <ig:Paging PageSize="7"/>
                    <ig:EditingCore BatchUpdating="true">
                        <EditingClientEvents
                            BatchUpdateUndoing="batchUndoing" 
                            BatchUpdateUndone="batchUndone"/>
                        <Behaviors>
                            <ig:RowAdding>
                                <ColumnSettings>
                                    <ig:RowAddingColumnSetting ColumnKey="CustomerID" DefaultValueAsString="---"/>
                                </ColumnSettings>
                                <AddNewRowClientEvents ExitingEditMode="validateAddingRow" />
                            </ig:RowAdding>
                            <ig:RowDeleting/>
                            <ig:CellEditing>
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:CellEditing>
                        </Behaviors>
                    </ig:EditingCore>

                    <ig:Selection CellClickAction="Row" RowSelectType="Multiple" ColumnSelectType="Multiple"/>
                    <ig:RowSelectors RowNumbering="true" />
                </Behaviors> 
                <Columns>
                    <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                    <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                    <ig:BoundDataField DataFieldName="Address" Key="Address" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                    <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                    <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                    <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                </Columns>
                <ClientEvents Initialize="onGridInit" />
            </ig:WebDataGrid>
            <!--#END SNIPPET#-->

            <div class="buttons-default-save">
                <asp:Button ID="btnSaveData" runat="server" CssClass="batch-buttons"
                    Text="<%$Resources:WebDataGrid , lbl_BatchUpdateSaveData %>" />
               <div class="clear"></div>
            </div>

            <asp:ObjectDataSource ID="ods1" runat="server"
                SelectMethod="GetCustomerDataSource"  
                UpdateMethod="UpdateCustomer"
                InsertMethod="AddCustomer"
                DeleteMethod="DeleteCustomer"
                EnableCaching="false"
                TypeName="NorthwindDataSource" >
                <SelectParameters>
                    <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
                </SelectParameters>
                <UpdateParameters>
			        <asp:Parameter Name="CustomerID" Type="String" />
			        <asp:Parameter Name="CompanyName" Type="String" />
			        <asp:Parameter Name="ContactName" Type="String" />
			        <asp:Parameter Name="Address" Type="String" />
			        <asp:Parameter Name="City" Type="String" />
			        <asp:Parameter Name="PostalCode" Type="String" />
			        <asp:Parameter Name="Country" Type="String" />
		        </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
			        <asp:Parameter Name="CompanyName" Type="String" />
			        <asp:Parameter Name="ContactName" Type="String" />
			        <asp:Parameter Name="Address" Type="String" />
			        <asp:Parameter Name="City" Type="String" />
			        <asp:Parameter Name="PostalCode" Type="String" />
			        <asp:Parameter Name="Country" Type="String" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
                </DeleteParameters>
            </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>

</asp:Content>