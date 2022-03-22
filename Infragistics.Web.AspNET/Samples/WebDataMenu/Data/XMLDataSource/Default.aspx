<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
	<ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="250px" Width="675px" Modal="false" 
        WindowState="Normal" Resizer-Enabled="true" Resizer-MaxWidth="720" Resizer-MaxHeight="400"
        Moveable="False" BackColor="Transparent" CssClass="dialog-window">
		<Header CloseBox-Visible="false" CaptionText="Resource Text"
			MinimizeBox-Visible="true">
			<MinimizeBox Visible="True"></MinimizeBox>
			<CloseBox Visible="False"></CloseBox>
		</Header>
		<ContentPane>
			<Template>
			<div style="height: 100%; width: 100%; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);" >
				<ig:WebDataMenu ID="WebDataMenuSample" runat="server" MaxDataBindDepth="1" Width="100%" >
					<GroupSettings Orientation="Horizontal" />
					<DataBindings>
						<ig:DataMenuItemBinding DefaultText=" " TextField="Text" ValueField="Value" ImageUrlField="ImageUrl" NavigateUrlFields="URL" TargetField="_blank" ToolTipField="Text" />
					</DataBindings>
				</ig:WebDataMenu>
				<asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/CommunitySiteMenu/Menu" />
				</div>
			</Template>
		</ContentPane>
	</ig:WebDialogWindow>
    </div>
</asp:Content>

