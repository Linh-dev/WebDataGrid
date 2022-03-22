<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultiPanelResourceView.ascx.cs"
    Inherits="MultiPanelResourceView" %>
<%@ Register Src="ResourceCaptionUserControl.ascx"
    TagName="ResourceCaptionUserControl" TagPrefix="uc1" %>
<%@ Register TagPrefix="aspHtml" Namespace="System.Web.UI.HtmlControls" Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<input type="hidden" id="scrollPos" name="scrollPos" value="0" runat="server" />
<style>
    .btnNormal
    {
        display:block;
        background: url(/samplesbrowser/samplescommon/aspnet/webschedule/style/webschedulesidebyside/images/normal.png);
        background-repeat: repeat;
        border-style: none;
        height: 26px;
        width: 90px;
        font-size: small;
        font-family: Arial;
    }
    .btnOver
    {
        background: url(/samplesbrowser/samplescommon/aspnet/webschedule/style/webschedulesidebyside/images/hover.png);
        background-repeat: repeat;
        border-style: none;
        height: 26px;
        width: 90px;
        font-size: small;
        font-family: Arial;
    }
    .btnPressed
    {
        background: url(/samplesbrowser/samplescommon/aspnet/webschedule/style/webschedulesidebyside/images/pressed.png);
        background-repeat: repeat;
        border-style: none;
        height: 26px;
        width: 90px;
        font-size: small;
        font-family: Arial;
    }
</style>
<div style="position: relative; width: auto; border: 1px solid #81BEF7; height: auto;
    background-color: #D3E9FF" runat="server" id="borderDiv">
    <div id="ViewModesMenuDiv" style="background-color: #B2D8FE; border-bottom: 1px solid #81BEF7;"
        runat="server">
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td style="background-color: #B2D8FE; border-right: 1px solid #81BEF7;">
                    <asp:Button ID="btnDay" runat="server" Text="DayLabel"
                        CssClass="btnNormal" OnClick="viewModesButtons_Click"  EnableViewState="false" />
                </td>
                <td style="background-color: #B2D8FE; border-right: 1px solid #81BEF7;">
                    <asp:Button ID="btnWeek" runat="server" Text="DaysLabel"
                        CssClass="btnNormal" OnClick="viewModesButtons_Click"  EnableViewState="false" />
                </td>
                <td style="background-color: #B2D8FE; border-right: 1px solid #81BEF7;">
                    <asp:Button ID="btnMonth" runat="server" Text="MonthLabel"
                        CssClass="btnNormal" OnClick="viewModesButtons_Click"  EnableViewState="false" />
                </td>
                <td style="padding-left: 20px; font-size: small; font-family: Arial;">
                    VisibleDaysLabel
                </td>
                <td style="padding-left: 5px;">
                    <asp:DropDownList runat="server" ID="ddlVisibleDaysCount" AutoPostBack="true" OnSelectedIndexChanged="ddlVisibleDaysCount_SelectedIndexChanged">
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <table style="padding: 5px 5px 5px 10px;">
        <tr>
            <td>
                <asp:ImageButton runat="server" ID="prevButton" Height="20" Width="20" EnableViewState="false" />
            </td>
            <td>
                <asp:ImageButton runat="server" ID="nextButton" Height="20" Width="20" EnableViewState="false" />
            </td>
            <td>
                <asp:Label runat="server" ID="lPeriod" Font-Size="Medium" Font-Names="Arial"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="scrollableDiv" style="overflow: auto;" runat="server">
        <asp:PlaceHolder ID="mainHolder" runat="server"></asp:PlaceHolder>
    </div>
</div>
