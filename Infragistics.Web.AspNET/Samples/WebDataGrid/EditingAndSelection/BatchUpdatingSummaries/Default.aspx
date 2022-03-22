<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        var CONST;
        // <!--#BEGIN SNIPPET#-->
        function wdg1CalculateSummary(sender, eventArgs) {
            var grid = $find('<%= wdg1.ClientID %>');
            if (confirm(CONST.batchMessage)) {
                // do manual postback
                $("#hdnSubmit").click();
            } else {
                // undo the deleted row.
                grid.get_behaviors().get_editingCore().undoBatchUpdate(getRow(33));
                showMessage(CONST.deleteID, CONST.rowIsRecovered);
            }
        }
        // <!--#END SNIPPET#-->

        function deleteRow(keyID) {
            var grid = $find('<%= wdg1.ClientID %>'),
                rowToDelete = getRow(keyID);
            if (rowToDelete !== null) {
                showMessage(CONST.deleteID, CONST.rowIsDeleted);
                grid.get_rows().remove(rowToDelete);
            } else {
                $("#btn33").prop("disabled", true);
                showMessage(CONST.deleteID, CONST.rowIsAlreadyDeleted);
            }
        }

        function updateRow(keyID) {
            var rowToUpdate = getRow(keyID),
                randStock = randomFromTo(0, 1000),
                randOrder = randomFromTo(0, 1000);
            rowToUpdate.get_cellByColumnKey("UnitsInStock").set_value(randStock);
            rowToUpdate.get_cellByColumnKey("UnitsOnOrder").set_value(randOrder);
            showMessage(CONST.updateID, CONST.rowIsUpdated);
        }

        function getRow(keyID) {
            var grid = $find('<%= wdg1.ClientID %>');
            return grid.get_rows().get_rowFromKey([keyID]);
        }
        function wdg1SummaryCalculated(sender, eventArgs) {
            var summary;
            if (eventArgs.get_columnSummaryInfo() !== null) {
                summary = eventArgs.get_columnSummaryInfo().get_summary(0);
                summary.set_value(roundNumber(summary.get_value(), 2));
            }
        }
        function randomFromTo(from, to) {
            return Math.floor(Math.random() * (to - from + 1) + from);
        }
        function roundNumber(num, dec) {
            return Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);
        }
        function showMessage(container, message) {
            $("#" + container).html(message).stop(true, true).fadeIn(500).delay(3000).fadeOut(500);
        }
        function wdg1PageIndexChanging(sender, eventArgs) {
            if (eventArgs.get_newPageIndex() === 3) {
                $("#btn32").prop("disabled", false);
                $("#btn33").prop("disabled", false);
            } else {
                $("#btn32").prop("disabled", true);
                $("#btn33").prop("disabled", true);
            }
        }
        function validateAddingRow(sender, eventArgs) {
            var currentColumnName = eventArgs.getCell().get_idPair().columnIDPair.key[0],
                currentRowKey = [eventArgs.get_displayText()];
            if (currentColumnName === "Product ID") {
                if (sender.get_rows().get_rowFromKey(currentRowKey) !== null) {
                    eventArgs.set_cancel(true);
                    alert(CONST.txtRowKeyDuplicated);
                }
            }
        }

        $(window).load(function () {
            $(document).on("click", "#btn32", function () { updateRow(32); });
            $(document).on("click", "#btn33", function () { deleteRow(33); });
        });

        // Returns localized messages relevant to different actions in the sample.
        // For example, in English, batchMessage is ‘A batch update is going to executed’.
        CONST = {
            batchMessage: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_batchUpdateSummariesAlert")%>',
            rowIsDeleted: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_batchUpdateRowDeleted")%>',
            rowIsRecovered: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_batchUpdateRowRecovered")%>',
            rowIsAlreadyDeleted: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_batchUpdateAlreadyDeleted")%>',
            rowIsUpdated: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_batchUpdateRowUpdated")%>',
            txtRowKeyDuplicated: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_rowKeyDuplicated")%>',
            updateID: "update-message",
            deleteID: "delete-message"
        };
    </script>
    <style type="text/css">
        .button-container { float: left; }
        .clear { clear: both; }
        .batch-buttons { display: block; margin: 5px 0; width: 180px; }
        .right-buttons { width: 120px; }
        .batch-button-combined { height: 53px; margin: 5px 0; width: 180px; }
        .buttons-default-save { float: right; }
        .help-container { height: 30px; }
        .help-container > div { color: #FF0000; font-weight: bold; margin: 5px 0 0 10px; } 
        #btn3 { font-weight: bold; }
        #hdnSubmit { visibility: hidden; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>
            <div class="batch-summaries-options">
                <div class="button-container">
                    <input id="btn32" type="button" class="batch-buttons"
                            value="<%= this.GetGlobalResourceObject("WebDataGrid", "lbl_button32")%>" />
                    <input id="btn33" type="button" class="batch-buttons"
                            value="<%= this.GetGlobalResourceObject("WebDataGrid", "lbl_button33")%>" />
                </div>
                <div class="button-container">
                    <div class="help-container"><div id="update-message"></div></div>
                    <div class="help-container"><div id="delete-message"></div></div>
                </div>
                <div class="buttons-default-save">
                    <asp:Button ID="btnSaveData" runat="server" CssClass="batch-buttons right-buttons"
                        Text="<%$Resources:WebDataGrid , lbl_BatchUpdateSaveData %>" />

                    <asp:Button ID="btnDefaultData" runat="server" CssClass="batch-buttons right-buttons"
                        Text="<%$Resources:WebDataGrid , lbl_DefaultBatchData %>" />
                </div>
                <div class="clear"></div>
            </div>

            <!--#BEGIN SNIPPET#-->
            <ig:WebDataGrid ID="wdg1" runat="server" 
                AutoGenerateColumns="false" DataSourceID="ods1" DataKeyFields="ProductID" Width="100%">
                <Behaviors>
                    <ig:EditingCore BatchUpdating="true">
                        <Behaviors>
                            <ig:RowAdding>
                                <AddNewRowClientEvents ExitingEditMode="validateAddingRow" />
                            </ig:RowAdding>
                            <ig:RowDeleting/>
                            <ig:CellEditing>
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="Product ID" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:CellEditing>
                        </Behaviors>
                    </ig:EditingCore>
                    <ig:SummaryRow SummaryRowClientEvents-CalculateSummary="wdg1CalculateSummary" SummaryRowClientEvents-SummaryCalculated="wdg1SummaryCalculated">
                        <ColumnSummaries>
                            <ig:ColumnSummaryInfo ColumnKey="Product">
                                <Summaries>
                                    <ig:Summary SummaryType="Count" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="UnitPrice">
                                <Summaries>
                                    <ig:Summary SummaryType="Min" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="UnitsInStock">
                                <Summaries>
                                    <ig:Summary SummaryType="Average" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="UnitsOnOrder">
                                <Summaries>
                                    <ig:Summary SummaryType="Average"/>
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                        </ColumnSummaries>
                    </ig:SummaryRow>
                    <ig:Selection CellClickAction="Row" RowSelectType="Multiple" ColumnSelectType="Multiple"></ig:Selection>
                    <ig:RowSelectors />
                    <ig:Paging PageSize="10" PageIndex="3" PagingClientEvents-PageIndexChanging="wdg1PageIndexChanging"></ig:Paging>
                </Behaviors>
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebDataGrid ,ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebDataGrid ,ProductName %>" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebDataGrid ,QuantityPerUnit %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebDataGrid ,UnitPrice %>" />
                    <ig:BoundDataField DataFieldName="UnitsInStock" Key="UnitsInStock" Header-Text="<%$ Resources:WebDataGrid ,UnitPrice %>" />
                    <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder" Header-Text="<%$ Resources:WebDataGrid ,UnitPrice %>" />
                    <ig:BoundCheckBoxField DataFieldName="Discontinued" Key="Discontinued" Header-Text="<%$ Resources:WebDataGrid ,Discontinued %>" />
                </Columns>
            </ig:WebDataGrid>
            <!--#END SNIPPET#-->

            <asp:ObjectDataSource ID="ods1" runat="server"
                SelectMethod="GetProductsDataSource"
                UpdateMethod="UpdateProduct"
                InsertMethod="AddProduct"
                DeleteMethod="DeleteProduct"  
                EnableCaching="false"
                TypeName="NorthwindDataSource" >
		        <UpdateParameters>
			        <asp:Parameter Name="ProductID" Type="Int32" />
			        <asp:Parameter Name="ProductName" Type="String" />
			        <asp:Parameter Name="SupplierID" Type="Int32" />
			        <asp:Parameter Name="QuantityPerUnit" Type="String" />
			        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="UnitsInStock" Type="Int16" />
			        <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
		        </UpdateParameters>
                <InsertParameters>
			        <asp:Parameter Name="ProductID" Type="Int32" />
			        <asp:Parameter Name="ProductName" Type="String" />
			        <asp:Parameter Name="SupplierID" Type="Int32" />
			        <asp:Parameter Name="QuantityPerUnit" Type="String" />
			        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="UnitsInStock" Type="Int16" />
			        <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </DeleteParameters>
            </asp:ObjectDataSource>
            <input id="hdnSubmit" type="submit" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>