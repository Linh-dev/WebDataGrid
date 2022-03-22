<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Src="~/SamplesCommon/aspnet/Common/UserControls/DataSourceControl/DataSourceControl.ascx" tagname="DataSourceControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:DataSourceControl ID="SelectedDataSource" runat="server" ExcludedDataSource="AC|DT|DS" />
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="380px" Width="640px"
		Modal="false" WindowState="Normal" Resizer-Enabled="true" Moveable="False" Top="190px"
		BackColor="Transparent" Left="25px" CssClass="dialog-window">
		<Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataTree, SampleDataBindingCaption %>" MaximizeBox-Visible="true" MinimizeBox-Visible="true">
			<MaximizeBox Visible="false"></MaximizeBox>
			<MinimizeBox Visible="false"></MinimizeBox>
			<CloseBox Visible="False"></CloseBox>
		</Header>
		<ContentPane ScrollBars="Hidden">
			<Template>
                    <ig:WebDataTree ID="WebDataTreeSample" runat="server"
                        DataSourceID="TreeDataSource"
                        Height="100%" 
                        Width="100%" 
                        Style="float:left" Font-Size="Small"
                        InitialExpandDepth="0" StyleSetName="IG">  
                        <DataBindings>
                            <ig:DataTreeNodeBinding DataMember="Book" TextField="Title" ValueField="Title" ImageUrlField="ImageUrl" />
                            <ig:DataTreeNodeBinding DataMember="Chapter" TextField="Title" ValueField="Title" ImageUrlField="ImageUrl" />
                        </DataBindings>
                </ig:WebDataTree>
			</Template>
		</ContentPane>
	</ig:WebDialogWindow>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/books/book" />
</asp:Content>

