<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" />
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
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
                    RenderMode="Inline">
                    <ContentTemplate>
                        <table id="propertyList" style="width: 100%;" cellspacing="0">
                            <tr style="height: 5px;">
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td style="background: #fff url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg) no-repeat;">
                                    <div style="width: 200px; margin: 80px auto;">
                                        <div style="height: 16px">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <img src="/samplesbrowser/samplescommon/aspnet/Common/ajax-loader.gif" alt="Loading..." />
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </div>
                                        <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" DataSourceID="DefaultDataSource"
                                            TextField="Company" ValueField="Id" StyleSetName="IG">
                                        </ig:WebDropDown>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="propertyPanel">
                                    <table style="width: 100%;">
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerDisplayModeLabel") %>:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddDisplayMode" runat="server" AutoPostBack="true" />
                                            </td>
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerAnimationLabel") %>:
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkAnimations" Text="<%$ Resources:WebDropDown, PropertyExplorerEnable %>"
                                                    AutoPostBack="true" Checked="true" runat="server" />
                                            </td>
                                        </tr>
                                        <tr class="itemRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerOrientationLabel")%>:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddOrientationType" runat="server" AutoPostBack="true" />
                                            </td>
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerAnimationDurationLabel") %>:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddAnimationDuration" runat="server" AutoPostBack="true">
                                                    <asp:ListItem Selected="True" Text="5"></asp:ListItem>
                                                    <asp:ListItem Text="<%$ Resources: WebDropDown, PropertyExplorerDuration0 %>" Value="500"></asp:ListItem>
                                                    <asp:ListItem Text="<%$ Resources: WebDropDown, PropertyExplorerDuration1 %>" Value="1000"></asp:ListItem>
                                                    <asp:ListItem Text="<%$ Resources: WebDropDown, PropertyExplorerDuration2 %>" Value="2000"></asp:ListItem>
                                                    <asp:ListItem Text="<%$ Resources: WebDropDown, PropertyExplorerDuration3 %>" Value="3000"></asp:ListItem>
                                                    <asp:ListItem Text="<%$ Resources: WebDropDown, PropertyExplorerDuration4 %>" Value="4000"></asp:ListItem>
                                                    <asp:ListItem Text="<%$ Resources: WebDropDown, PropertyExplorerDuration5 %>" Value="5000"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerCaseSensitivityLabel") %>:
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkCaseSensitivity" Text="<%$ Resources:WebDropDown, PropertyExplorerEnable %>"
                                                    AutoPostBack="true" Checked="true" runat="server" />
                                            </td>
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerAnimationTypeLabel") %>:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddAnimationType" runat="server" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="itemRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerAutoCompleteLabel") %>:
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkAutoCompleteFirstMatch" Text="<%$ Resources:WebDropDown, PropertyExplorerEnable %>"
                                                    AutoPostBack="true" Checked="true" runat="server" />
                                            </td>
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerContainerHeightLabel") %>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDropDownContainerHeight" Width="30" runat="server" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerOffsetYLabel") %>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtOffSetY" Width="30" runat="server" AutoPostBack="true" />
                                            </td>
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerContainerMaxHeightLabel") %>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDropDownContainerMaxHeight" Width="30" runat="server" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="itemRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerOffsetXLabel") %>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtOffSetX" Width="30" runat="server" AutoPostBack="true" />
                                            </td>
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","PropertyExplorerContainerWidth") %>:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDropDownContainerWidth" Width="30" runat="server" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebDropDown","AutoSelectOnMatch") %>:
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkAutoSelectOnMatch" Text="<%$ Resources:WebDropDown, PropertyExplorerEnable %>"
                                                    AutoPostBack="true" Checked="true" runat="server" />
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server"
        SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
    [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>

