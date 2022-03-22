<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Width="700" Modal="false"
        WindowState="Normal" Moveable="false" MaintainLocationOnScroll="false" Top="100px"
        Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false">
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
                        RenderMode="Inline">
                        <ContentTemplate>
                            <div id="container">
                                <table id="propertyList" style="width: 100%;" cellspacing="0" border="0">
                                    <td style="background-color: White; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
                                        background-repeat: no-repeat; border-right: 1px solid #89bd37; vertical-align: top;">
                                        <ig:WebDataMenu ID="WebDataMenuSample" runat="server" DataSourceID="MenuDataSource" EnableScrolling="false"
                                            MaxDataBindDepth="1" StyleSetName="RedPlanet">
                                            <GroupSettings Orientation="Horizontal" />
                                            <DataBindings>
                                                <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                            </DataBindings>
                                        </ig:WebDataMenu>
                                        <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/Menu" />
                                        <div style="height: 16px; width: 16px; margin: 80px auto;">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <img src="/samplesbrowser/samplescommon/aspnet/Common/ajax-loader.gif" alt="Loading..." />
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </div>
                                    </td>
                                    <td class="propertyPanel" style="vertical-align : top;">
                                        <div>
                                            <table style="width: 100%;">
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","OrientationCaption")%>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="OrientationHorizontal" GroupName="Orientation" Text="<%$ Resources:WebDataMenu, HorizontalCaption %>"
                                                            AutoPostBack="true" Checked="true" runat="server" />
                                                        <asp:RadioButton ID="OrientationVertical" GroupName="Orientation" Text="<%$ Resources:WebDataMenu, VerticalCaption %>"
                                                            AutoPostBack="true" Checked="false" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="itemRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","AnimationType") %>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="AnimationType" AutoPostBack="true" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","AnimationDuration") %>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="AnimationDuration" AutoPostBack="true" runat="server">
                                                            <asp:ListItem Selected="True" Text="0"></asp:ListItem>
                                                            <asp:ListItem Text="50"></asp:ListItem>
                                                            <asp:ListItem Text="100"></asp:ListItem>
                                                            <asp:ListItem Text="250"></asp:ListItem>
                                                            <asp:ListItem Text="500"></asp:ListItem>
                                                            <asp:ListItem Text="1000"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr class="itemRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","AnimationEquation") %>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="AnimationEquation" AutoPostBack="true" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","ExpandDirection") %>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ExpandDirection" AutoPostBack="true" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="itemRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","OffSetX") %>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="OffSetX" Width="20" Text="0" AutoPostBack="true" MaxLength="3" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","OffSetY") %>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="OffSetY" Width="20" Text="0" AutoPostBack="true" MaxLength="3" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="itemRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","SubMenuOffSetX") %>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="SubMenuOffSetX" Width="20" Text="0" AutoPostBack="true" MaxLength="3" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataMenu","SubMenuOffSetY") %>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="SubMenuOffSetY" Width="20" Text="0" AutoPostBack="true" MaxLength="3" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
