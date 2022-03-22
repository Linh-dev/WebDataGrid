<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        var CONST;
        function batchUpdateAlert(sender, eventArgs) {
            var grid = $find('<%= wdg1.ClientID %>'),
            editedRows = grid.get_behaviors().get_editingCore().get_editedRows(),
            addedRows = grid.get_behaviors().get_editingCore().get_addedRows(),
            deletedRows = grid.get_behaviors().get_editingCore().get_deletedRows(),
            modifiedRows = addedRows.length + deletedRows.length + editedRows.length,
            message;

            if (modifiedRows > 0) {
                message = CONST.txtBatchUpdate + ":" + CONST.newLineTab +
                CONST.txtEditedRows + ": " + editedRows.length + CONST.newLineTab +
                CONST.txtAddedRows + ": " + addedRows.length + CONST.newLineTab +
                CONST.txtDeletedRows + ": " + deletedRows.length + CONST.newLineTab;
                alert(message);
            }
        }

        function validateAddingRow(sender, eventArgs) {
            var currentColumnName = eventArgs.getCell().get_idPair().columnIDPair.key[0],
                currentRowKey;
            eventArgs.set_displayText(eventArgs.get_displayText().toUpperCase());
            currentRowKey = [eventArgs.get_displayText()];
            if (currentColumnName === "CustomerID") {
                if (sender.get_rows().get_rowFromKey(currentRowKey) !== null) {
                    eventArgs.set_cancel(true);
                    alert(CONST.txtRowKeyDuplicated);
                }
            }
        }

        // When a chkBatch is checked, there is also a postback. That's why batch update will be executed.
        // Because chkBatch is in an UpdatePanel it will be created dynamically and jQuery live method is used.
        $(document).on("click", "#<%= chkBatch.ClientID %>", function () { batchUpdateAlert(); });

        // Returns localized messages relevant to different actions in the sample.
        // For example, in English, txtAddedRows is ‘Added Rows’.
        CONST = {
            txtBatchUpdate: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_batchUpdateAlert")%>',
            txtEditedRows: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_editedRowsAlert")%>',
            txtAddedRows: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_addedRowsAlert")%>',
            txtDeletedRows: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_deletedRowsAlert")%>',
            txtRowKeyDuplicated: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_rowKeyDuplicated")%>',
            newLineTab: "\n\t"
        };
    </script>
    <style type="text/css">
        .batch-options { color: #656565; font-size: 12px; margin: 5px 0; padding: 5px; border: 1px solid #000000; font-weight:bold; }
        .batch-options > .batch-info { font-style: italic; margin: 5px 20px; font-weight: normal; }
        .batch-buttons { float: right; margin: 5px 0 5px 5px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>
            <div class="batch-options">
                <asp:CheckBox ID="chkBatch" runat="server" Checked="true"
                     AutoPostBack="true" OnCheckedChanged="chkBatch_CheckedChanged"/>
                <asp:Literal ID="ltrEnableBatch" runat="server" Text="<%$ Resources:WebDataGrid, BatchUpdatingEnable %>"></asp:Literal>
                <div ID="tbBatchInfo" runat="server" class="batch-info">
                    <asp:Literal ID="ltrBatchInfo" runat="server" Text="<%$ Resources:WebDataGrid, BatchUpdatingEnabledDescription %>"></asp:Literal>
                </div>
            </div>
            <!--#BEGIN SNIPPET#-->
            <ig:WebDataGrid ID="wdg1" runat="server" Width="99.9%" 
                AutoGenerateColumns="false" DataSourceID="ods1" DataKeyFields="CustomerID" >
                <Behaviors>
                    <ig:Activation/>                 
                    <ig:EditingCore BatchUpdating="true">
                        <Behaviors>
                            <ig:RowAdding>
                                <ColumnSettings>
                                    <ig:RowAddingColumnSetting ColumnKey="CustomerID" DefaultValueAsString="---" />
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
                    
                    <ig:ColumnFixing ColumnFixingClientEvents-FixedStateChanging="batchUpdateAlert"/>
                    <ig:ColumnMoving ColumnMovingClientEvents-HeaderDragEnd="batchUpdateAlert"/>
                    <ig:ColumnResizing ColumnResizingClientEvents-ColumnResizing="batchUpdateAlert"/>
                    <ig:Filtering FilteringClientEvents-DataFiltering="batchUpdateAlert"/>
                    <ig:Paging PagingClientEvents-PageIndexChanging="batchUpdateAlert"/>
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
            </ig:WebDataGrid>
            <!--#END SNIPPET#-->
            <div class="batch-options">
                <asp:Button ID="btnSaveData" runat="server" CssClass="batch-buttons"
                    Text="<%$Resources:WebDataGrid , lbl_BatchUpdateSaveData %>" />

                <asp:Button ID="btnDefaultData" runat="server" CssClass="batch-buttons"
                    Text="<%$Resources:WebDataGrid , lbl_DefaultBatchData %>" />
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