<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebTab_Display_PropertyExplorer_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" CssClass="igtab_PositionRelative"
                    Modal="false" WindowState="Normal" Height="245px">
                    <Header CloseBox-Visible="false">
                        <CloseBox Visible="False"></CloseBox>
                    </Header>
                    <ContentPane EnableRelativeLayout="true">
                        <Template>
                            <div id="container">
                                <table class="mainTable" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="mainTdLeft">
                                            <div class="MainContent">
                                                <ig:WebTab ID="WebTab1" runat="server" Height="200px" Width="305px" TabOrientation="Horizontal"
                                                    TabLocation="TopLeft" SelectedIndex="0" EnableOverlappingTabs="false" EnableActivation="false">
                                                    <Tabs>
                                                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab1 %>"
                                                            ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Display/PropertyExplorer/Programming.png"
                                                            TabCssClasses-ImageCssClass="ClientTabs">
                                                            <Template>
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebTab, WebTab_Tab1 %>" />
                                                            </Template>
                                                        </ig:ContentTabItem>
                                                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab2 %>"
                                                            ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Display/PropertyExplorer/News.png"
                                                            TabCssClasses-ImageCssClass="ClientTabs">
                                                            <Template>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebTab, WebTab_Tab2 %>" />
                                                            </Template>
                                                        </ig:ContentTabItem>
                                                    </Tabs>
                                                </ig:WebTab>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="PE_RightContent">
                                                <table cellpadding="0" cellspacing="0">
                                                <tr class="bgTdDark">
                                                 <th colspan="2" class="tableLeftTd tableFeaturesRow"><%= this.GetGlobalResourceObject("WebTab","WebTab_Features")%></th>
                                                </tr>
                                                    <tr class="bgTdLight">
                                                        <td class="tableLeftTd">
                                                            <%= this.GetGlobalResourceObject("WebTab","WebTab_PropertyExplorer_Orientation")%>:
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                <asp:ListItem Text="Horizontal" />
                                                                <asp:ListItem Text="Vertical" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr class="bgTdDark">
                                                        <td class="tableLeftTd">
                                                            <%= this.GetGlobalResourceObject("WebTab","WebTab_PropertyExplorer_Location")%>:
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                                <asp:ListItem Text="BottomLeft" />
                                                                <asp:ListItem Text="BottomRight" />
                                                                <asp:ListItem Text="TopLeft" Selected="True" />
                                                                <asp:ListItem Text="TopRight" />
                                                                <asp:ListItem Text="LeftTop" />
                                                                <asp:ListItem Text="LeftBottom" />
                                                                <asp:ListItem Text="RightTop" />
                                                                <asp:ListItem Text="RightBottom" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr class="bgTdLight">
                                                        <td class="tableLeftTd">
                                                            <%= this.GetGlobalResourceObject("WebTab","WebTab_PropertyExplorer_SelectedIndex")%>:
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                                                <asp:ListItem Text="0" />
                                                                <asp:ListItem Text="1" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr class="bgTdDark">
                                                        <td class="tableLeftTd">
                                                            <%= this.GetGlobalResourceObject("WebTab","WebTab_PropertyExplorer_OverlappingTabs")%>:
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                        </td>
                                                    </tr>
                                                    <tr class="bgTdLight">
                                                        <td class="tableLeftTd">
                                                            <%= this.GetGlobalResourceObject("WebTab","WebTab_PropertyExplorer_Activation")%>:
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox2" runat="server" ToolTip="<%$ Resources:WebTab, WebTab_PropertyExplorer_ActivationTooltip %>"
                                                                AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" />
                                                        </td>
                                                    </tr>
                                                    <tr class="bgTdDark">
                                                        <td class="tableLeftTd">
                                                            <%= this.GetGlobalResourceObject("WebTab","WebTab_PropertyExplorer_TabMoving")%>:
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox3_CheckedChanged" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </Template>
                    </ContentPane>
                </ig:WebDialogWindow>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
