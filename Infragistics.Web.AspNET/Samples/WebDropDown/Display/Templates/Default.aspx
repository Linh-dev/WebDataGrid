<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<style type="text/css">
		.igg_HeaderCaption {
			font-size: 12px;
			padding: 5px 0px 5px 8px;
			overflow: hidden;
			text-align: left;
			height: 25px;
			font-family: Verdana;
			font-weight: normal;
			border-top: 1px solid #777777;
			border-right: 1px solid #777777;
			border-bottom: 1px solid #777777;
			border-left: 1px solid #888888;
			color: #FFFFFF;
			background-color: #888888;
		}

		.igdd_ListItem {
			border-style: solid;
			border-color: #FFFFFF #CCCCCC #CCCCCC #CCCCCC;
			border-width: 1px;
		}

			.igdd_ListItem:nth-child(odd) {
				background-color: #F6F6F6;
			}

		.igdd_ListItemHover {
			background-color: #CCCCCC !important;
		}

		.igdd_ListItemActive {
			background-color: #9ECBD6 !important;
			border: solid 1px #CCCCCC;
		}
	</style>
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div>
					<igsb:LocalizedImage ImageUrl="/samplesbrowser/samplescommon/aspnet/WebDropDown/Display/Templates/eng/wdd_TemplatesHeader.png" ID="imgTemplatesHeader" runat="server"></igsb:LocalizedImage>
				</div>
			</td>
		</tr>
		<tr>
			<td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; padding: 20px;">
				<div style="border: 1px solid #EEEEEE; background-color: #FAFAFA; padding: 10px; padding-left: 80px;">
					<table width="80%" cellspacing="0" border="0" style="margin-left: 30px;">
						<tr height="50">
							<td>
								<img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Display/Templates/table.png" />
							</td>
							<td>
								<%=this.GetGlobalResourceObject("WebDropDown","TemplatesTable") %>:
							</td>
							<td>
								<ig:WebDropDown ID="ddCustomTemplateTable" runat="server" EnableTheming="true" Width="200px"
									DropDownContainerHeight="240px" EnableDropDownAsChild="false" EnableAnimations="false" DropDownAnimationDuration="1000"
									DropDownContainerWidth="480px" StyleSetName="Default">
									<HeaderTemplate>
										<table cellspacing="0" cellpadding="4">
											<tr>
												<td class="igg_HeaderCaption" style="width: 140px;">
													<%=this.GetGlobalResourceObject("WebDropDown","ColumnHeader_Name") %>
												</td>
												<td class="igg_HeaderCaption" style="width: 220px;">
													<%=this.GetGlobalResourceObject("WebDropDown","ColumnHeader_Company") %>
												</td>
												<td class="igg_HeaderCaption" style="width: 100px;">
													<%=this.GetGlobalResourceObject("WebDropDown","ColumnHeader_PostalCode") %>
												</td>
											</tr>
										</table>
									</HeaderTemplate>
									<ItemTemplate>
										<table style="width: 100%" cellspacing="0" cellpadding="4">
											<tr>
												<td style="width: 140px;">
													<%# DataBinder.Eval(Container.DataItem, "Contact")%>
												</td>
												<td style="width: 220px;">
													<%# DataBinder.Eval(Container.DataItem, "Company")%>
												</td>
												<td style="width: 73px;">
													<%# DataBinder.Eval(Container.DataItem, "Zip")%>
												</td>
											</tr>
										</table>
									</ItemTemplate>
								</ig:WebDropDown>
							</td>
						</tr>
						<tr height="50">
							<td>
								<img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Display/Templates/table.png" />
							</td>
							<td>
								<%=this.GetGlobalResourceObject("WebDropDown","TemplatesCustomTemplate") %>
							</td>
							<td>
								<ig:WebDropDown ID="ddCustomList" runat="server" EnableTheming="true" Width="200px"
									DropDownContainerHeight="230px" EnableDropDownAsChild="false" EnableAnimations="false" DropDownAnimationDuration="500"
									DropDownContainerWidth="400px" StyleSetName="Default">
									<ItemTemplate>
										<asp:Image ID="Image1" runat="server" Style="vertical-align: middle;" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImageUrl")%>' />
										<%# DataBinder.Eval(Container.DataItem, "Text")%>
									</ItemTemplate>
								</ig:WebDropDown>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>
					<img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Display/Templates/wdd_AdvSearchFooter.png" />
				</div>
			</td>
		</tr>
	</table>
	<asp:AccessDataSource ID="DefaultDataSource" runat="server"
		SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
        [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]"></asp:AccessDataSource>
	<asp:XmlDataSource runat="server" ID="TreeDataSource" />
</asp:Content>
