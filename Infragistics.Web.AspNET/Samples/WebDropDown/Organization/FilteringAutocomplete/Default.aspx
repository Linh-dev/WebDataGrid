<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 650px;">
        <table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div>
				    <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/Organization/FilteringAutocomplete/eng/AutoCompleteHeader.png" ID="imgAutoCompleteHeader" runat="server"> 
				    </igsb:LocalizedImage>
				</div>
			</td>
		</tr>
		<tr>
			<td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; padding: 20px;">
				
				<div style="border: 1px solid #EEEEEE; background-color: #FAFAFA; padding: 10px; padding-left:150px;">
					<table width="80%" cellspacing="0" border="0" style="margin-left:30px;" >
						<tr height="30" >
							<td ><img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Organization/FilteringAutocomplete/monitor.png" align="absmiddle"/>&nbsp;&nbsp;<%= this.GetGlobalResourceObject("WebDropDown","AutoCompleteClientSideLabel") %></td></tr >
						<tr>	
						<td>
						<ig:WebDropDown runat="server" ID="ddClientFiltering" Width="250px" 
                        DataSourceID="DefaultDataSource" 
                        TextField="Company" EnableAutoCompleteFirstMatch="false" 
                        DropDownContainerHeight="300px" EnableViewState="false"  
                        EnableAutoFiltering="Client">
                        </ig:WebDropDown><br /></td>							
						</tr >
						<tr Height="30" >
						<td ><img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Organization/FilteringAutocomplete/server_go.png" align="absmiddle"/>&nbsp;&nbsp;<%= this.GetGlobalResourceObject("WebDropDown","AutoCompleteServerSideClientCacheLabel") %></td>
						 
						</tr>
						<tr>
						<td>
						<ig:WebDropDown runat="server" ID="ddClientCaching" Width="250px" 
                        DataSourceID="DefaultDataSource" EnableViewState="false"
                        EnableAutoFiltering="Server"
                        EnableCachingOnClient="true" TextField="Company" 
                        DropDownContainerHeight="300px"> 
                        </ig:WebDropDown><br></td>							
						</tr >
						<tr Height="30" >
							<td><img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Organization/FilteringAutocomplete/server.png"  align="absmiddle"/>&nbsp;&nbsp;<%= this.GetGlobalResourceObject("WebDropDown","AutoCompleteServerSide") %></td>
														
						</tr >
						<tr>
						<td >
						<ig:WebDropDown runat="server" ID="ddServerFiltering"  EnableAutoCompleteFirstMatch="false" Width="250px" 
                        DataSourceID="DefaultDataSource"  EnableViewState="false"
                        EnableAutoFiltering="Server"
                        TextField="Company" DropDownContainerHeight="300px">
                        </ig:WebDropDown><br></td>							
						</tr >
					</table>
				</div>
				
			</td>
		</tr>
		<tr>
			<td>
				<div><img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Organization/FilteringAutocomplete/wdd_AdvSearchFooter.png" /></div>
			</td>
		</tr>
	</table>
    </div>

    <asp:AccessDataSource ID="DefaultDataSource" runat="server"
        SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
        [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
    </asp:AccessDataSource>

</asp:Content>
