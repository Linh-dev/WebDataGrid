<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataMenu_Data_Hierarchical_Data_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="padding-top: 30px; padding-left: 1px;">
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="300px" Width="640px"
            Modal="false" WindowState="Normal" Resizer-Enabled="true" Moveable="False" Top="100px"
            BackColor="Transparent" Left="20px" CssClass="dialog-window">
            <Resizer MaxWidth="600" />
            <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataMenu, SampleDataBindingCaption %>"
                MaximizeBox-Visible="false" MinimizeBox-Visible="true">
                <MinimizeBox Visible="True"></MinimizeBox>
                <CloseBox Visible="False"></CloseBox>
            </Header>
            <ContentPane ScrollBars="Hidden">
                <Template>
                    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <ig:WebDataMenu runat="server" ID="WebDataMenuSample" ActivateOnHover="false" AccessKey="j"
                                    Width="100%" StyleSetName="Default" EnableScrolling="false" DataSourceID="whds">
                                    <GroupSettings Orientation="Horizontal" ExpandDirection="Down" />
                                    <DataBindings>
                                        <ig:DataMenuItemBinding ImageUrlField="ImageUrl" NavigateUrlFields="URL" TargetField="Target"
                                            TextField="DisplayText" DataMember="Root" />
                                        <ig:DataMenuItemBinding ImageUrlField="ImageUrl" NavigateUrlFields="URL" TargetField="Target"
                                            TextField="DisplayText" DataMember="Sub" />
                                    </DataBindings>
                                </ig:WebDataMenu>
                            </td>
                        </tr>
                        <tr style="height: 1px;">
                            <td style="background-color: #CCCCCC;" />
                        </tr>
                        <tr>
                            <td>
                                <div style="width: 100%; background-color: #DDDDDD; margin: 0px; background-image: url(images/adrsBG.png);
                                    background-repeat: repeat-x;">
                                    <table cellpadding="0" cellspacing="0" style="height: 35px;">
                                        <tr>
                                            <td style="border-bottom: 1px solid #CCCCCC; padding-left: 5px; padding-right: 0px;">
                                                <div style="width: 55px">
                                                    <%= this.GetGlobalResourceObject("WebDataMenu","AddressCaption") %></div>
                                            </td>
                                            <td style="width: 100%; border-bottom: 1px solid #CCCCCC; padding-left: 5px; padding-right: 5px;">
                                                <div style="float: left; width: 4px; background-image: url(images/adrsLeft.png);
                                                    background-repeat: no-repeat; height: 21px">
                                                </div>
                                                <div style="float: left; background-image: url(images/adrsMid.png); background-repeat: repeat-x;
                                                    height: 21px; width: 98%;">
                                                    <asp:TextBox runat="server" ID="addressBar" Style="border: 0px; outline: none; background-color: Transparent;
                                                        vertical-align: text-bottom;" TextMode="SingleLine" Text="http://" Width="100%"></asp:TextBox></div>
                                                <div style="float: left; width: 4px; background-image: url(images/adrsRight.png);
                                                    background-repeat: no-repeat; height: 21px">
                                                </div>
                                            </td>
                                            <td style="border-bottom: 1px solid #CCCCCC; padding-right: 10px;">
                                                <div>
                                                    <asp:Image ID="goImg" runat="server" ImageUrl="~/SamplesCommon/aspnet/WebDataMenu/GoBtn.png" /></div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 100%; width: 100%;">
                            <td style="height: 100%; width: 100%">
                                <iframe style="width: 99%; height: 99%;" name="inner" frameborder="0" src="<%= this.GetGlobalResourceObject("WebDataMenu","HierarchicalDataBindingDefaultURL") %>">
                                </iframe>
                            </td>
                        </tr>
                    </table>
                </Template>
            </ContentPane>
        </ig:WebDialogWindow>
    </div>
    <asp:AccessDataSource ID="RootItems" runat="server" DataFile='<%# this.GetMdbLocation("SampleHierarchicalData.mdb") %>'
        SelectCommand="SELECT [ID], [URL], [Target], [ImageUrl], [DisplayText] FROM [Menu]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="SubMenus" runat="server" DataFile='<%# this.GetMdbLocation("SampleHierarchicalData.mdb") %>'
        SelectCommand="SELECT [ID], [ParentId], [URL], [Target], [ImageUrl], [DisplayText] FROM [SubMenus]">
    </asp:AccessDataSource>
    <ig:WebHierarchicalDataSource ID="whds" runat="server">
        <DataViews>
            <ig:DataView DataSourceID="RootItems" ID="Root" />
            <ig:DataView DataSourceID="SubMenus" ID="Sub" />
        </DataViews>
        <DataRelations>
            <ig:DataRelation ParentDataViewID="Root" ParentColumns="ID" ChildDataViewID="Sub"
                ChildColumns="ParentId" />
        </DataRelations>
    </ig:WebHierarchicalDataSource>
</asp:Content>
