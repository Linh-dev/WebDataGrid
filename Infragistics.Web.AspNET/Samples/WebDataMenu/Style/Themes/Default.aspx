<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <style type="text/css">
        #sampleContainer 
        {
            overflow: visible;
        }
        #WebDialogWindow1
        {
            overflow: visible!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="MainContent">
        <div style="float: left;">
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
                    <ig:DropDownItem Text="IG">
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
    <div style="height: 240px;">
        <div style="padding-bottom: 5px; position: relative;">
            <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" ClientIDMode="Static" Height="200px" Width="300px"
			    Modal="false" WindowState="Normal" Resizer-Enabled="true" Moveable="False" StyleSetName="Appletini"
			    BackColor="Transparent">
			    <Header CloseBox-Visible="false" CaptionText="<%$ Resources:Strings, AppletiniStyle %>"
				    MaximizeBox-Visible="true" MinimizeBox-Visible="False">
				    <MaximizeBox Visible="False"></MaximizeBox>
				    <MinimizeBox Visible="False"></MinimizeBox>
				    <CloseBox Visible="False"></CloseBox>
			    </Header>
			    <ContentPane>
				    <Template>
					    <ig:WebDataMenu runat="server" ID="WebDataMenu1" Width="100%" DataSourceID="MenuDataSource" EnableScrolling="false"
						    MaxDataBindDepth="1" StyleSetName="Appletini">
						    <GroupSettings Orientation="Horizontal" />
						    <DataBindings>
							    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
						    </DataBindings>
					    </ig:WebDataMenu>
				    </Template>
			    </ContentPane>
		    </ig:WebDialogWindow>
        </div>
    </div>
	<asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/Menu" />
</asp:Content>

