<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Samples_WebDataMenu_Data_Data_Binding_Default" %>

<%@ Register Src="~/SamplesCommon/aspnet/Common/UserControls/DataSourceControl/DataSourceControl.ascx"
	TagName="DataSourceControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<link type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<uc1:DataSourceControl ID="SelectedDataSource" runat="server" ExcludedDataSource="AC|DT|DS" />
	<ig:webdialogwindow runat="server" id="WebDialogWindow1" height="250px" width="675px"
		modal="false" windowstate="Normal" resizer-enabled="true" moveable="False" top="200px"
		backcolor="Transparent" cssclass="dialog-window" left="20px">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataMenu, SampleDataBindingCaption %>"
            MaximizeBox-Visible="false" MinimizeBox-Visible="true">
            <MinimizeBox Visible="True"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <div style="height: 100%; width: 100%; background-image: url(/samplesbrowser/samplescommon/aspnet/WebDataMenu/Display/VerticalMenu/TreeBg.jpg);">
                    <ig:WebDataMenu ID="WebDataMenuSample" runat="server" MaxDataBindDepth="1" Width="100%"
                        StyleSetName="RedPlanet" EnableScrolling="false">
                        <GroupSettings Orientation="Horizontal" ExpandDirection="Down"/>
                        <DataBindings>
                            <ig:DataMenuItemBinding DefaultText=" " TextField="Text" ValueField="Value" ImageUrlField="ImageUrl"
                                NavigateUrlFields="URL" TargetField="_blank" ToolTipField="Text" />
                        </DataBindings>
                    </ig:WebDataMenu>
                    <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/CommunitySiteMenu/Menu"
                        DataFile='<%# this.GetXmlLocation("MenuData.xml") %>' />
                </div>
            </Template>
        </ContentPane>
    </ig:webdialogwindow>
</asp:Content>
