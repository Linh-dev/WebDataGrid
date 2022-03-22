<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Width="100%" Modal="false" CssClass="PositionRelative"
        WindowState="Normal" Moveable="false" MaintainLocationOnScroll="false" Top="120px"
        Left="20px">
        <Header CloseBox-Visible="false">
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden" Font-Size="12px">
            <Template>
                <asp:UpdatePanel ID="upOne" runat="server">
                    <ContentTemplate>
                        <div id="container">
                            <table id="propertyList" style="width: 100%;" cellspacing="0">
                                <td style="width: 35%; background-color: White; border-right: 1px solid #89bd37;
                                    padding: 20px; padding-top: 40px;" valign="top">
                                    <ig:WebProgressBar ID="wpbOne" runat="server" Width="230px" Height="40px">
                                        <ClientEvents Click="animate" />
                                    </ig:WebProgressBar>
                                    <br />
                                    <%= this.GetGlobalResourceObject("WebProgressBar","ClickDescription") %>
                                    <div style="width: 200px; margin: 80px auto;">
                                        <div style="height: 16px">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upOne">
                                                <ProgressTemplate>
                                                    <img src="/samplesbrowser/samplescommon/aspnet/Common/ajax-loader.gif" alt="Loading..." />
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </div>
                                    </div>
                                </td>
                                <td class="propertyPanel">
                                    <div>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <font style="font-size: small;"><b>
                                                        <%= this.GetGlobalResourceObject("WebProgressBar","AnimationLabel") %></b></font>
                                                </td>
                                            </tr>
                                            <tr class="altRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","AnimateToLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAnimationValue" runat="server" Width="150px" Height="17px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <font style="font-size: small;"><b>
                                                        <%= this.GetGlobalResourceObject("WebProgressBar","PropertiesLabel") %></b></font>
                                                </td>
                                            </tr>
                                            <tr class="altRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","StartValueLabel") %>:
                                                </td>
                                                <td>                                                    
                                                    <ig:WebNumericEditor ID="txtStartValue" runat="server" Width="150px" Height="17px">
                                                        <AutoPostBackFlags ValueChanged="On" />
                                                    </ig:WebNumericEditor>
                                                </td>
                                            </tr>
                                            <tr class="itemRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","AnimateTypeLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddAnimationType" runat="server" AutoPostBack="true" Width="155px" Height="17px"/>
                                                </td>
                                            </tr>
                                            <tr class="altRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","AnimationDurationLabel") %>:
                                                </td>
                                                <td>
                                                    <ig:WebNumericEditor ID="txtAnimationDuration" runat="server" Width="150px" Height="17px">
                                                        <AutoPostBackFlags ValueChanged="On" />
                                                    </ig:WebNumericEditor>
                                                </td>
                                            </tr>
                                            <tr class="itemRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","AnimationThresholdLabel") %>:
                                                </td>
                                                <td>
                                                    <ig:WebNumericEditor ID="txtAnimationThreshold" runat="server" Width="150px" Height="17px">
                                                        <AutoPostBackFlags ValueChanged="On" />
                                                    </ig:WebNumericEditor>
                                                </td>
                                            </tr>
                                            <tr class="altRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","FillDirectionLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddFillDirection" runat="server" AutoPostBack="true" Width="155px" Height="17px"/>
                                                </td>
                                            </tr>
                                            <tr class="itemRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","FillModeLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddFillMode" runat="server" AutoPostBack="true" Width="155px" Height="17px"/>
                                                </td>
                                            </tr>
                                            <tr class="altRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","LabelAllignmentLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddLabelAlignment" runat="server" AutoPostBack="true" Width="155px" Height="17px"/>
                                                </td>
                                            </tr>
                                            <tr class="itemRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","LabelFormatLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLabelFormat" runat="server" AutoPostBack="true" Width="150px" Height="17px"/>
                                                </td>
                                            </tr>
                                            <tr class="altRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","MaximumLabel") %>:
                                                </td>
                                                <td>
                                                    <ig:WebNumericEditor ID="txtMaximum" runat="server" Width="150px" Height="17px">
                                                        <AutoPostBackFlags ValueChanged="On" />
                                                    </ig:WebNumericEditor>
                                                </td>
                                            </tr>
                                            <tr class="itemRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","MinimumLabel") %>:
                                                </td>
                                                <td>
                                                    <ig:WebNumericEditor ID="txtMinimum" runat="server" Width="150px" Height="17px">
                                                        <AutoPostBackFlags ValueChanged="On" />
                                                    </ig:WebNumericEditor>
                                                </td>
                                            </tr>
                                            <tr class="altRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","OrientationLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddOrientation" runat="server" AutoPostBack="true" Width="155px" Height="17px"/>
                                                </td>
                                            </tr>
                                            <tr class="itemRow">
                                                <td class="textAlignR">
                                                    <%= this.GetGlobalResourceObject("WebProgressBar","SnapIntervalLabel") %>:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSnapInterval" runat="server" AutoPostBack="true" Width="150px" Height="17px"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </table>
                        </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>

    <script type="text/javascript">

        function animate() {
            bar = $find('<%= wpbOne.ClientID %>');
            tBox = $get('<%=txtAnimationValue.ClientID %>');
            if (tBox.value != "") {
                bar.set_progressValue(parseInt(tBox.value));
            }
            else {
                alert('<%= this.GetGlobalResourceObject("WebProgressBar","PropertyExplorerErrorMessage") %>');
            }
        }
    </script> 
</asp:Content>
