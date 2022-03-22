<%@ Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Style_Application_Styling_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="wrapper" class="wgDataBind">
	    <div id="container">
			<div class="OptionPanel">
				<div id="Icon2" style="position: relative; float: left; padding-right: 10px; margin-bottom: 10px;">
					<img src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Style/ApplicationStyling/StyleSet.png" alt="Style Set" title="Style Set" width="60" height="61" />
                </div>
			    <div id="DropDown" style="position: relative;float: left; padding-top: 20px; margin-bottom: 10px;">
			        <asp:Literal runat="server" Text="<%$ Resources:WebDataGrid, Styling_Theme_SelectATheme %>" />
			        <asp:DropDownList ID="DDList1" runat="server" AutoPostBack="True" CssClass="CSSform" >
					        <asp:ListItem>Appletini</asp:ListItem>
					        <asp:ListItem>Caribbean</asp:ListItem>
					        <asp:ListItem>Claymation</asp:ListItem>
					        <asp:ListItem Selected="True">Default</asp:ListItem>		
					        <asp:ListItem>ElectricBlue</asp:ListItem>
					        <asp:ListItem>Harvest</asp:ListItem>
					        <asp:ListItem>LucidDream</asp:ListItem>
					        <asp:ListItem>Nautilus</asp:ListItem>
					        <asp:ListItem>Office2007Black</asp:ListItem>
					        <asp:ListItem>Office2007Blue</asp:ListItem>
					        <asp:ListItem>Office2007Silver</asp:ListItem>
					        <asp:ListItem>Pear</asp:ListItem>
					        <asp:ListItem>RedPlanet</asp:ListItem>
					        <asp:ListItem>RubberBlack</asp:ListItem>
					        <asp:ListItem>Trendy</asp:ListItem>
                            <asp:ListItem>Windows7</asp:ListItem>
                            <asp:ListItem>Office2010Blue</asp:ListItem>
			        </asp:DropDownList>
			    </div>
                <div style="clear: both;"></div>
			</div>
			<div id="DataGridWrapper">
				<ig:WebDataGrid StyleSetName="Default" ID="WebDataGrid1" runat="server" DataKeyFields="CustomerID" AutoGenerateColumns="false" Width="100%">
					
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
						<ig:Paging PagerAppearance="Bottom" PageSize="8" Enabled="true" />
					</Behaviors>

				</ig:WebDataGrid>
			</div>
		</div>

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
		SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
	</asp:AccessDataSource>
    </div>

</asp:Content>