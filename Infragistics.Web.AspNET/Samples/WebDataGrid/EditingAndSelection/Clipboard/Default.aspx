<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .batch-options { color: #656565; font-size: 12px; margin: 5px 0; padding: 5px; border: 1px solid #000000; font-weight:bold; }
        .batch-options > .batch-info { font-style: italic; margin: 5px 20px; font-weight: normal; }
        .batch-buttons { float: right; margin: 5px 0 5px 5px; }
    </style>
    <script type="text/javascript">
        var CONST = {
            txtPasting: '<%= this.GetGlobalResourceObject("WebDataGrid", "txt_pasting")%>',
		};
    	function cellValueChanging(sender, eventArgs)
    	{
    		if (eventArgs.get_cell().get_column().get_key() == "CustomerID")
    			eventArgs.set_cancel(true);
    	}
    	function clipboardPasting(sender, eventArgs)
    	{
    		alert(CONST.txtPasting + eventArgs.get_clipboardText());
    	}
        function btnDefaultData_ClientClick()
        {
            var wdg1 = $find("<%= wdg1.ClientID %>");
            var wdg2 = $find("<%= wdg2.ClientID %>");
            wdg1.get_behaviors().get_editingCore().clearBatchUpdates();
            wdg2.get_behaviors().get_editingCore().clearBatchUpdates();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>
            <div class="batch-options">
                <asp:Button ID="btnDefaultData" runat="server" CssClass="batch-buttons" OnClientClick="btnDefaultData_ClientClick();"
                    Text="<%$Resources:WebDataGrid , lbl_DefaultBatchData %>" />
                <div class="clear"></div>
            </div>

            <!--#BEGIN SNIPPET#-->
            <ig:WebDataGrid ID="wdg1" runat="server" width="100%"
                AutoGenerateColumns="false" DataSourceID="ods1" DataKeyFields="CustomerID" >
                <Behaviors>
                    <ig:Activation/>
                    <ig:EditingCore BatchUpdating="true">
						<EditingClientEvents CellValueChanging="cellValueChanging" />
						<Behaviors>
							<ig:CellEditing>
								<ColumnSettings>
									<ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
								</ColumnSettings>
							</ig:CellEditing>
						</Behaviors>
                    </ig:EditingCore>

					<ig:Clipboard ClipboardClientEvents-Pasting="clipboardPasting"/>
                    
                    <ig:Paging/>
                    <ig:Selection CellClickAction="Cell" RowSelectType="Multiple" CellSelectType="Multiple"/>
					<ig:RowSelectors/>
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

			<br/>

            <ig:WebDataGrid ID="wdg2" runat="server" width="100%"
                AutoGenerateColumns="false" DataSourceID="ods1" DataKeyFields="CustomerID" >
                <Behaviors>
                    <ig:Activation/>
                    <ig:EditingCore BatchUpdating="true">
						<EditingClientEvents CellValueChanging="cellValueChanging" />
						<Behaviors>
							<ig:CellEditing>
								<ColumnSettings>
									<ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
								</ColumnSettings>
							</ig:CellEditing>
						</Behaviors>
                    </ig:EditingCore>

					<ig:Clipboard ClipboardClientEvents-Pasting="clipboardPasting"/>
                    
                    <ig:Paging/>
                    <ig:Selection CellClickAction="Cell" RowSelectType="Multiple" CellSelectType="Multiple"/>
					<ig:RowSelectors/>
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