<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Width="700px" Height="450px">
                <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Width="700px" Height="450px" 
                    Modal="false" WindowState="Normal" Moveable="false" MaintainLocationOnScroll="false">
                    <Header CloseBox-Visible="false" CssClass="dialog-window">
                        <CloseBox Visible="False"></CloseBox>
                    </Header>
                    <ContentPane>
                        <Template>
                            <div>
                                <div class="mainTdLeft" style="float: left">
                                    <iframe id="MainIFrame" runat="server" scrolling="yes" 
                                        width="600px" style="border: 1px solid gray; margin: 10px;"></iframe>
                                    <br />
                                   &nbsp &nbsp<asp:Label ID="ScrollingLabel" Text="<%$ Resources: WebDataMenu,MenuInIFrame_ScrollingLabel_Text %>" runat="server" />
                                </div>
                                <div style="width: 140px; float: right; border-left: 1px solid #89bd37;
                                    background: white">
                                    <ul class="formItemsHolder">
                                        <li class="bgTdDark">
                                            <asp:CheckBox Text="<%$ Resources: WebDataMenu, MenuInFrame_EnableScrolling %>"
                                                Checked="true" ID="EnableScrollingCheckBox" runat="server" AutoPostBack="true" />
                                        </li>
                                        <li class="bgTdLight">
                                            <label class="lbl" for="">
                                                <%=this.GetGlobalResourceObject("WebDataMenu","MenuInIFrame_HeightWidth")%></label>
                                            <asp:DropDownList ID="DDList1" Width="100px" runat="server" AutoPostBack="true">
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Auto%>" Selected="True" />
                                                <asp:ListItem Text="200px" />
                                                <asp:ListItem Text="250px" />
                                                <asp:ListItem Text="300px" />
                                            </asp:DropDownList>
                                        </li>
                                        <li class="bgTdDark">
                                            <label class="lbl" for="">
                                                <%=this.GetGlobalResourceObject("WebDataMenu","MenuInIFrame_Orientation")%></label>
                                            <asp:DropDownList ID="OrientationDropDownList" Width="100px" runat="server" AutoPostBack="true">
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Horizontal%>" Selected="True" Value="1" />
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Vertical%>" Value="2"/>
                                            </asp:DropDownList>
                                        </li>
                                        <li class="bgTdLight">
                                            <label class="lbl" for="">
                                                <%=this.GetGlobalResourceObject("WebDataMenu","MenuInIFrame_FrameSize")%></label>
                                            <asp:DropDownList ID="FrameSizeDropDownList" Width="100px" runat="server" AutoPostBack="true">
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Small%>" Value="1" />
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Normal%>" Value="2" Selected="True" />
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Big%>" Value="3"/>
                                            </asp:DropDownList>
                                        </li>
                                        <li class="bgTdDark">
                                            <label class="lbl" for="">
                                                <%=this.GetGlobalResourceObject("WebDataMenu","MenuInIFrame_ScrollingSpeed")%></label>
                                            <asp:DropDownList ID="ScrollingSpeedList" Width="100px" runat="server" AutoPostBack="true">
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Speed_VerySlow%>" Value="1"/>
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Speed_Slow%>" Value="2"/>
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Speed_Normal%>" Value="3" Selected="True" />
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Speed_Fast%>" Value="4"/>
                                                <asp:ListItem Text="<%$ Resources: WebDataMenu, MenuInIFrame_Speed_VeryFast%>" Value="5"/>
                                            </asp:DropDownList>
                                        </li>
                                    </ul>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <br />
                        </Template>
                    </ContentPane>
                </ig:WebDialogWindow>
            </asp:Panel>
            </ContentTemplate>
    </asp:UpdatePanel>
    <div style="margin-bottom: 20px">
    </div>
</asp:Content>
