<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow2" Width="600" Height="368" Modal="false"
        WindowState="Normal" Moveable="false" Resizer-Enabled="false" MaintainLocationOnScroll="false" Top="100px"
        Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false">
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" RenderMode="Inline" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div id="container">
                                <table id="propertyList" runat="server" style="width: 100%; height:330px; border: none" cellspacing="0">
                                    <tr>
                                        <td style="background-color: White; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
                                            background-repeat: no-repeat; border-right: 1px solid #89bd37; vertical-align: top;">
                                            
                                            <ig:WebExplorerBar ID="WebExplorerBar1" runat="server">
                                                <DataBindings>
                                                    <ig:ExplorerBarItemBinding DataMember="Group" TextField="Name" />
                                                    <ig:ExplorerBarItemBinding DataMember="Feed" TextField="Name" ImageUrlField="ImageUrl" />
                                                </DataBindings>
                                            </ig:WebExplorerBar>
                                            
                                            <div style="height: 16px; width: 16px; margin: 80px auto;">
                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                    <ProgressTemplate>
                                                        <img src="/samplesbrowser/samplescommon/aspnet/Common/ajax-loader.gif" alt="Loading..." />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </div>                                           
                                            
                                        </td>
                                        <td class="propertyPanel">
                                            <div>
                                                <table style="width: 100%;">
                                                    <tr class="itemRow">
                                                        <td class="textAlignR">
                                                            <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_ExpandModeLabel")%>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ebExpandMode" AutoPostBack="true" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr class="altRow">
                                                        <td class="textAlignR">
                                                            <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_BehaveModeLabel")%>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ebBehaveMode" AutoPostBack="true" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr class="itemRow">
                                                        <td class="textAlignR">
                                                            <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_MaxGroupHeightLabel")%>:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtExplorerBarContainerMaxGroupHeight" Width="30" runat="server"
                                                                AutoPostBack="true" />
                                                        </td>
                                                    </tr>
                                                    <tr class="altRow">
                                                        <tr class="itemRow">
                                                            <td class="textAlignR">
                                                                <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_GroupContentsHeightLabel")%>:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtExplorerBarContainerGroupContentsHeight" Width="30" runat="server"
                                                                    AutoPostBack="true" />
                                                            </td>
                                                        </tr>
                                                        <tr class="altRow">
                                                            <td class="textAlignR">
                                                                <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_ContainerHeightLabel")%>:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtExplorerBarContainerHeight" Width="30" runat="server" AutoPostBack="true" />
                                                            </td>
                                                        </tr>
                                                        <tr class="itemRow">
                                                            <td class="textAlignR">
                                                                <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_ContainerWidthLabel")%>:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtExplorerBarContainerWidth" Width="30" runat="server" AutoPostBack="true" /><span><small> (max 500)</small></span>
                                                            </td>
                                                        </tr>
                                                        <tr class="altRow">
                                                            <td class="textAlignR">
                                                                <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_EnableExpandImages")%>:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="chkExpandImages" Text="<%$ Resources:WebExplorerBar, PropertyExplorerEnable %>"
                                                                    AutoPostBack="true" Checked="true" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr class="itemRow">
                                                            <td class="textAlignR">
                                                                <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_ItemIndent")%>:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtExplorerBarItemIndent" Width="30" runat="server" AutoPostBack="true" />
                                                            </td>
                                                        </tr>
                                                        <tr class="altRow">
                                                            <td class="textAlignR">
                                                                <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_AnimationDuration")%>:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ebAnimationDuration" runat="server" AutoPostBack="true">
                                                                 <asp:ListItem Text="0" />
                                                                 <asp:ListItem Text="50"/>
                                                                 <asp:ListItem Text="100"/>
                                                                 <asp:ListItem Text="250"/>
                                                                 <asp:ListItem Text="500"/>
                                                                 <asp:ListItem Text="750"/>
                                                                 <asp:ListItem Text="1000"/>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr class="itemRow">
                                                            <td class="textAlignR">
                                                                <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_AnimationEquation")%>:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ebAnimationEquation" AutoPostBack="true" runat="server" />
                                                            </td>
                                                        </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="/Data/RssFeeds/Group" />
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>


