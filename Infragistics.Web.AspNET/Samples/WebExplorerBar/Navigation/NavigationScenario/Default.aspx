<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<div style="width: 947px; height: 518px;">
		<div style="padding: 8px; float: left; border: 1px solid #D7D7D7; width: 947px; height: 500px;
			background-color: White; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/BrowserBackground.jpg)">
			<div style="float: left; background-color:White; height:100%;">
				<ig:WebExplorerBar ID="WebExplorerBar1" DataSourceID="ExplorerBarDataSource" GroupExpandBehavior="SingleExpanded"
					Width="250px" runat="server">
						<DataBindings>
					<ig:ExplorerBarItemBinding DataMember="Group" TextField="Name" />
					<ig:ExplorerBarItemBinding DataMember="Feed" TextField="Name" NavigateUrlField="URL" TargetField="Target" ImageUrlField="ImageUrl" />
				</DataBindings>
				</ig:WebExplorerBar>
			</div>
			<div style="border-left: solid 1px #D7D7D7; width: 694px; float: left;">
				<div style="text-align: left; width: 100%; background-color: White;">
					<iframe id="_view" name="_view" width="100%" height="500px" frameborder="0" 
						runat="server" src="http://www.enderminh.com/minh/"></iframe>
				</div>
			</div>
		</div>
	</div>
<asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="/Data/RssFeeds/Group" />
</asp:Content>

