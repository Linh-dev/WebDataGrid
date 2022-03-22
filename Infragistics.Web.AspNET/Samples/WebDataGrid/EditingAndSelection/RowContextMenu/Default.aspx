<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Row_Context_Menu_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .FontSmall { font-size: 10px; }
        .customEditRowTable { text-align: left; color: #000000; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataMenu runat="server" ID="ContextMenu" IsContextMenu="true" 
        BorderStyle="Solid" BorderWidth="1" BorderColor="#CCCCCC">
        <ClientEvents ItemClick="MenuItem_Click" />
        <Items>
            <ig:DataMenuItem Text="Select Current Row" Key="Select" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/EditingAndSelection/RowContextMenu/sendto.png" />
            <ig:DataMenuItem Text="Edit" Key="Edit" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/EditingAndSelection/RowContextMenu/edit.png" />
            <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, ContextMenuDelete %>"
                Key="Delete" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/EditingAndSelection/RowContextMenu/stop.png" />
        </Items>
    </ig:WebDataMenu>
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="CustomerID" runat="server" AutoGenerateColumns="False"
                    Height="425" Width="100%">
                    <ClientEvents MouseDown="GridMouseDown" />
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
                        <ig:Activation Enabled="true" />
                        <ig:Selection RowSelectType="Single" CellClickAction="Row" Enabled="true" />
                        <ig:EditingCore>
                            <Behaviors>
                                <ig:RowDeleting Enabled="true" />
                                <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK" RowEditingClientEvents-TemplateClosed="Closed">
                                    <EditModeActions EnableF2="true" />
                                    <ClientBindings>
                                        <ig:RowEditingClientBinding ColumnKey="CompanyName" ControlID="control1" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Contact" ControlID="control2" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Address" ControlID="control3" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="City" ControlID="control4" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="PostalCode" ControlID="control5" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Country" ControlID="control6" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                    </ClientBindings>
                                    <Template>
                                        <div style="background-color: white; border: 1px solid black;">
                                            <table border="0" class="customEditRowTable">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="CompanyLabel" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control1" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control2" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control3" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control4" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control5" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control6" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="buttonOK" runat="server" OnClientClick="return" Text="<%$ Resources:WebDataGrid, ButtonOK %>"
                                                            UseSubmitBehavior="False" />&nbsp;
                                                        <asp:Button ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return"
                                                            Text="<%$ Resources:WebDataGrid, ButtonCancel %>" UseSubmitBehavior="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </Template>
                                </ig:RowEditingTemplate>
                            </Behaviors>
                        </ig:EditingCore>
                    </Behaviors>
                    <EditorProviders>
                        <ig:TextEditorProvider ID="WebTextEditProvider1" />
                    </EditorProviders>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">

        var currentSelectedRow = null;
        var isInEditMode = false;

        function MenuItem_Click(menu, eventArgs) {
            if (currentSelectedRow == null)
                return;

            switch (eventArgs.getItem().get_key()) {
                case "Delete":

                    if (isInEditMode) {
                        getCurrentRowEditBehavior().exitEditMode(currentSelectedRow);
                        isInEditMode = false;
                    }

                    currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().clear();

                    if (currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().indexOf(currentSelectedRow) == -1)
                        currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().add(currentSelectedRow);

                    if (confirm(getWarningMessage())) {
                        var grid = $find("<%= this.WebDataGrid1.ClientID %>");
                        grid.get_rows().remove(currentSelectedRow);
                    }
                    break;
                case "Select":
                    if (isInEditMode) {
                        getCurrentRowEditBehavior().exitEditMode(currentSelectedRow);
                        isInEditMode = false;
                    }
                    if (currentSelectedRow.get_grid().get_behaviors().get_selection() != null) {
                        if (currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().indexOf(currentSelectedRow) == -1)
                            currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().add(currentSelectedRow);
                        else
                            currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().remove(currentSelectedRow);
                    }
                    break;
                case "Edit":
                    currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().clear();

                    if (currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().indexOf(currentSelectedRow) == -1)
                        currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().add(currentSelectedRow);

                    if (!isCurrentRowInEditMode()) {
                        getCurrentRowEditBehavior().enterEditMode(currentSelectedRow);
                        isInEditMode = true;
                    }
                    else {
                        getCurrentRowEditBehavior().exitEditMode(currentSelectedRow);
                        isInEditMode = false;
                    }
                    break;
            }
        }

        function getWarningMessage() {
            return '<%= this.GetGlobalResourceObject("WebDataGrid","WebDataGridWithContextMenu_DeleteMessage") %>'.replace("{0}", currentSelectedRow.get_cellByColumnKey('CustomerID').get_text());
        }

        function getMenuSelectionMessage() {
            var message = "";

            if (!isCurrentRowSelected())
                message = '<%= this.GetGlobalResourceObject("WebDataGrid","WebDataGridWithContextMenu_RowSelected") %>'.replace("{0}", currentSelectedRow.get_cellByColumnKey('CustomerID').get_text());
            else
                message = '<%= this.GetGlobalResourceObject("WebDataGrid","WebDataGridWithContextMenu_RowUnselected") %>'.replace("{0}", currentSelectedRow.get_cellByColumnKey('CustomerID').get_text());
            return message;
        }


        function getMenuEditMessage() {
            var message = "";

            if (!isCurrentRowInEditMode())
                message = '<%= this.GetGlobalResourceObject("WebDataGrid","WebDataGridWithContextMenu_RowNotInEditMode") %>'.replace("{0}", currentSelectedRow.get_cellByColumnKey('CustomerID').get_text());
            else
                message = '<%= this.GetGlobalResourceObject("WebDataGrid","WebDataGridWithContextMenu_RowInEditMode") %>'.replace("{0}", currentSelectedRow.get_cellByColumnKey('CustomerID').get_text());

            return message;
        }

        function getCurrentRowEditBehavior() {
            return currentSelectedRow.get_grid().get_behaviors().get_editingCore().get_behaviors().get_rowEditingTemplate();
        }

        function isCurrentRowSelected() {
            if (currentSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().indexOf(currentSelectedRow) == -1)
                return false;
            else
                return true;
        }

        function isCurrentRowInEditMode() {
            return currentSelectedRow.get_grid().get_behaviors().get_editingCore().get_behaviors().get_rowEditingTemplate().get_isInEditMode(currentSelectedRow);
        }

        function Closed() {
            isInEditMode = false;
        }

        function GridMouseDown(grid, eventArgs) {

            if (eventArgs.get_item() == null || !eventArgs.get_item().get_row) {
                return;
            }

            currentSelectedRow = eventArgs.get_item().get_row();

            var menu = $find("<%= this.ContextMenu.ClientID %>");

            menu.getItems().getItem(0).set_text(getMenuSelectionMessage());
            menu.getItems().getItem(1).set_text(getMenuEditMessage());

            if (menu != null && eventArgs.get_browserEvent() != null && eventArgs.get_browserEvent().button == 2) {
                menu.showAt(null, null, eventArgs.get_browserEvent());
            }
        }
    </script>
</asp:Content>
