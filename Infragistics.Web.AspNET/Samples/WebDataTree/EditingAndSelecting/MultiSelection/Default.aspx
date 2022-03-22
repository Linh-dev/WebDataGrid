<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataTree/sampleWebtreeMenu.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true"
        UpdateMode="Conditional">
        <ContentTemplate>
			<div style="height: 400px;">
				<ig:WebDataTree ID="WebDataTreeSample" runat="server"
					DataSourceID="TreeDataSource"
					Height="400px" Font-Size="Small"
					Width="300px" 
					Style="float:left"
					InitialExpandDepth="1" 
					EnableConnectorLines="True" 
					EnableAjax ="true" 
					EnableHotTracking = "true" 
					NodeEditing-EnableOnF2 = "true" 
					NodeEditing-Enabled = "true" 
					NodeEditing-EnableOnDoubleClick="true"
					SelectionType="Multiple">
					<DataBindings>
						<ig:DataTreeNodeBinding DataMember="Group" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
						<ig:DataTreeNodeBinding DataMember="Feed" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
					</DataBindings>
				</ig:WebDataTree>
			</div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/RssFeeds/Group" />
</asp:Content>
