<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataMenu_Display_Vertical_Menu_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Common.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow2" Width="70%" Modal="false"
        WindowState="Normal" Resizer-Enabled="true" Moveable="False" Top="100px"
        Left="20px" CssClass="dialog-window" BackColor="Transparent">
        <Resizer MaxWidth="600" />
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataMenu, RetailSalesCaption %>"
            MaximizeBox-Visible="false" MinimizeBox-Visible="true">
            <MinimizeBox Visible="True"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <div style="height: 100%; width: 100%; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/Display/VerticalMenu/TreeBg.jpg);">
                    <ig:WebDataMenu ID="WebDataMenu1" runat="server" DataSourceID="MenuDataSource" EnableScrolling="false" BackColor="Transparent">
                        <GroupSettings Orientation="Vertical" />
                        <DataBindings>
                            <ig:DataMenuItemBinding DefaultText=" " TextField="Text" ValueField="Value" ImageUrlField="ImageUrl"
                                NavigateUrlFields="URL" TargetField="_blank" ToolTipField="Text" />
                        </DataBindings>
                    </ig:WebDataMenu>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
    <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/RetailSales/Menu"
        DataFile='<%# this.GetXmlLocation("MenuData.xml") %>' />
</asp:Content>
