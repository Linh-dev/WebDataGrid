<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Adding_New_Row_Basic_Features_Default" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

	<script type="text/javascript">

	    function rowAdding(grid, e) {
	        window.status = "Row adding...";
	    }

	    function WebDataGridView_AJAXResponse(grid, e) {
	        if (e.get_gridResponseObject().Message)
	            alert(e.get_gridResponseObject().Message);
	    }

	</script>

    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  	<div id="container">
		<div id="DataGridWrapper">
			<div id="topContentContainer" style="margin-top: 25px; margin-bottom: 20px;">
				<div id="headerContainer" class="ControlPanelHeader">
					<img src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" alt="Config Icon" />
					<%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_AddRow_HeaderTitle") %></div>
				<div id="countContainer" class="controlPanel">
					<div id="eventList" class="controlPanelEvent">
						<span class="outputValue">
							<%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_AddRow_DescriptionText") %><br />
							<br />
							<span class="leftTitle">
                                <strong>
								    <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_AddRow_ConfigText") %>
                                </strong>
                            </span>
							<asp:DropDownList ID="Alignment" runat="server" AutoPostBack="True" Width="150px"
								OnSelectedIndexChanged="ChangeAlignment" CssClass="CSSform">
								<asp:ListItem Value="Bottom" Text="<%$ Resources:WebDataGrid, DataEditing_AddRow_Bottom %>"></asp:ListItem>
								<asp:ListItem Value="Top" Selected="True" Text="<%$ Resources:WebDataGrid, DataEditing_AddRow_Top %>"></asp:ListItem>
							</asp:DropDownList>
							<br />
							<br />
                        </span>
					</div>
				</div>
			</div>
			<ig:WebDataGrid ID="WebDataGrid1" runat="server" DataKeyFields="CustomerID" DataSourceID="ObjectDataSource1"
				DataKeyNames="CustomerId" Height="425" Width="100%" AutoGenerateColumns="false" OnRowAdded="WebDataGrid1_RowAdded">
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
					<ig:Activation Enabled="true" />
					<ig:EditingCore>
						<Behaviors>
							<ig:RowAdding Alignment="Top" EditModeActions-EnableOnActive="true" EditModeActions-MouseClick="Single"
								Enabled="true" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddCustomer"
		SelectMethod="GetCustomerDataSource" EnableCaching="false" TypeName="NorthwindDataSource">
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
