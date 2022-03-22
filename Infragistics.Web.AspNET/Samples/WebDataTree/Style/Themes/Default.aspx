<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="MainContent">
        <div style="float: left; padding-top: 6px;">
            <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_Styles_SelectTheme")%>
        </div>
        <div style="float: left; padding-left: 5px;">
            <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" DropDownContainerWidth="200px"
                DropDownContainerHeight="200px">
                <AutoPostBackFlags SelectionChanged="On" />
                <Items>
                    <ig:DropDownItem Text="Appletini">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Caribbean">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Claymation">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Default">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="ElectricBlue">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Harvest">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="LucidDream">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Nautilus">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2007Black">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2007Blue">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2007Silver">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Pear">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="RedPlanet">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="RubberBlack">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Trendy">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Windows7">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2010Blue">
                    </ig:DropDownItem>
                </Items>
            </ig:WebDropDown>
        </div>
    </div>
    <br/>
    <div style="height:200px;">
        <div style="padding-bottom: 5px;">
            <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="210px" Width="350px"
				StyleSetName="Appletini" Modal="false" WindowState="Normal" Resizer-Enabled="False"
				Moveable="False" BackColor="Transparent" CssClass="dialog-window">
				<Header CloseBox-Visible="false" CaptionText="<%$ Resources:Strings, AppletiniStyle %>"
					MaximizeBox-Visible="false" MinimizeBox-Visible="false">
					<MaximizeBox Visible="False"></MaximizeBox>
					<MinimizeBox Visible="false"></MinimizeBox>
					<CloseBox Visible="False"></CloseBox>
				</Header>
				<ContentPane>
					<Template>
						<div style="text-align: left;">
							<ig:WebDataTree ID="WebDataTree1" runat="server" DataSourceID="TreeDataSource" InitialExpandDepth="1" Font-Size="Small"
								Style="float: left" EnableConnectorLines="True" StyleSetName="Appletini">
								<DataBindings>
									<ig:DataTreeNodeBinding DataMember="Item" TextField="Text" ValueField="Text" ImageUrlField="ImageUrl" />
								</DataBindings>
							</ig:WebDataTree>
						</div>
					</Template>
				</ContentPane>
			</ig:WebDialogWindow>
        </div>
    </div>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/HelpTopics/Item" />
</asp:Content>