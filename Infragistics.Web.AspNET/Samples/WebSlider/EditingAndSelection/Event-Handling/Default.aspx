<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSlider_Performance_Event_Handling_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                var webSlider2_ClientId = '<%=WebSlider2.ClientID %>';
                var autoPostBack_ClientId = '<%=autoPostBack.ClientID %>';
                var keepRange_ClientId = '<%=keepRange.ClientID %>';
            </script>
            <div style="height: 100%; line-height: normal;">
                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td valign="top" style="width: 50%">
                            <div class="webslider_1">
                                <ig:WebSlider ID="WebSlider1" runat="server" Width="90%" ContentAlignment="Center"
                                    OnValueChanged="WebSlider1_ValueChanged">
                                    <ClientEvents ValueChanged="valueChanged" ValueChanging="valueChanging" />
                                    <ValueLabel Location="FloatTopOrLeft" />
                                    <Tickmarks LabelLocation="Both">
                                    </Tickmarks>
                                </ig:WebSlider>
                            </div>
                            <asp:Label ID="Label1" runat="server" Text="<%$Resources:WebSlider, Events_TargetSlider %>" Font-Bold="True"></asp:Label>
                            <div class="webslider_2">
                                <ig:WebSlider ID="WebSlider2" runat="server" Width="205px" ContentAlignment="BottomOrRight"
                                    ShowPlusMinusButtons="False" OnValueChanged="WebSlider2_ValueChanged" Height="42px"
                                    ThumbsHolderCssClass="width148">
                                    <Tickmarks LabelLocation="TwoLabelsInMargins" Location="None">
                                        <CssClasses LabelEdgeHorizCssClass="blackColor" />
                                    </Tickmarks>
                                    <Thumb CssClass="thumb1" FocusImageUrl="/samplesbrowser/samplescommon/aspnet/WebSlider/handRectFocus.gif"
                                        HoverImageUrl="/samplesbrowser/samplescommon/aspnet/WebSlider/handRectHover.gif" ImageUrl="/samplesbrowser/samplescommon/aspnet/WebSlider/handRect.gif"
                                        PressedImageUrl="/samplesbrowser/samplescommon/aspnet/WebSlider/handRectPress.gif" />
                                    <Track>
                                        <CssClasses CssClass="trackR" ValueFillCssClass="trackRValue1" LeftOrTopEdgeCssClass="width0"
                                            RightOrBottomEdgeCssClass="width0" />
                                    </Track>
                                    <ValueLabel Location="FloatTopOrLeft" FloatCssClass="halfTransparent" FloatHoverCssClass="opaque" />
                                </ig:WebSlider>
                            </div>
                            <table width="400" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="30" bgcolor="#F4F4F4" style="padding-left: 8px;">
                                        <strong>
                                            <asp:Label ID="Options" runat="server" Text="<%$Resources:WebSlider, Events_Options %>"></asp:Label>
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" bgcolor="#F9F9F9">
                                        <asp:CheckBox ID="keepRange" runat="server" Text="<%$Resources:WebSlider, Events_CheckBox_1 %>"
                                            Style="white-space: nowrap;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" bgcolor="#F9F9F9">
                                        <asp:CheckBox ID="autoPostBack" runat="server" Text="<%$Resources:WebSlider, Events_CheckBox_2 %>"
                                            Style="white-space: nowrap;" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <input type="button" value='<%=this.GetGlobalResourceObject("WebSlider","Button_SetValueTo40") %>' onclick="setValue()" style="margin-top: 5px;
                                margin-bottom: 10px;" />
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="<%$Resources:WebSlider, Events_Postback %>" />
                            <br />
                        </td>
                        <td valign="top">
                            <div style="margin-bottom: 30px; margin-top: 20px; padding: 5px; white-space: nowrap;
                                width: 220px; border: 0px solid #DFDFDF; background: #F9F9F9;">
                                <div style="white-space: nowrap; margin-bottom: 4px; font-weight: bold;">
                                    <asp:Label ID="ClientEvents" runat="server" Text="<%$Resources:WebSlider, Events_ClientEvents %>"></asp:Label>
                                </div>
                                <div id="outputChanging" style="white-space: nowrap;">
                                    &nbsp;</div>
                                <div id="outputChanged" style="white-space: nowrap;">
                                    &nbsp;</div>
                            </div>
                            <div style="padding: 5px; white-space: nowrap; width: 220px; border: 0px solid #DFDFDF0;
                                background: #F9F9F9;">
                                <div style="white-space: nowrap; margin-bottom: 4px; font-weight: bold;">
                                    <asp:Label ID="ValueChanged" runat="server" Text="<%$Resources:WebSlider, Events_ValueChanged %>"></asp:Label>
                                </div>
                                <asp:Label ID="ServerOutput" runat="server" Text=""></asp:Label>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
    <ig:HtmlScript ID="ClientScript" runat="server" Src="Script.js" />
</asp:Content>
