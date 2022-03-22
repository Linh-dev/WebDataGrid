<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Navigation_Paging_Server_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  	<div id="wrapper" class="wgDataBind">
		<div id="container">
            <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true" UpdateMode="Conditional">
		        <ContentTemplate>
			        <div id="headerContainer" class="ControlPanelHeader">
				        <img alt="Server Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
				        <%= this.GetGlobalResourceObject("WebDataGrid","Paging_Server_HeaderTitle") %>
				    </div>
			        <div id="countContainer" class="controlPanel">
				        <div id="eventList" class="controlPanelEventServer">
				            <asp:Label ID="ServerMessage" runat="server"></asp:Label>
				        </div>
			        </div>
			        <div id="DataGridWrapper">
				        <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="DefaultDataSource" EnableAjax="false"
					        DataKeyFields="CustomerID" AutoGenerateColumns="false" OnPageIndexChanged="WebDataGrid1_PageIndexChanged"
					        Width="100%" Height="440" >
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
						        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
					        </Behaviors>
				        </ig:WebDataGrid>
			        </div>
		        </ContentTemplate>
            </asp:UpdatePanel>		        

		</div>
	</div>
	
	<asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
		SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
	</asp:AccessDataSource>
</asp:Content>
