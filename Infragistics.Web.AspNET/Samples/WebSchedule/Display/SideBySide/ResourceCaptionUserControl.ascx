<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceCaptionUserControl.ascx.cs"
    Inherits="SideBySide_ResourceCaptionUserControl" %>
<style type="text/css">
    .table
    {
        table-layout: fixed;
    }
    .td
    {
        overflow: hidden;
        white-space: nowrap;
    }
</style>
<div style="float: left; height: 31px; display:block; clear:none;" id="mainDiv" runat="server">
    <table cellspacing="0" style="width: 100%; height: 100%; table-layout: fixed; overflow: hidden;">
        <tr>
            <td style="background: url(<%= ImageHeaderLeftUrl %>); height: 31px; width: 3px;">
            </td>
            <td style="background: url(<%= ImageHeaderMiddleUrl %>);">
                <table>
                    <tr>
                        <td>
                            <asp:ImageButton runat="server" ID="button" OnClick="button_Click" EnableViewState="false" />
                        </td>
                        <td class="td">
                            <asp:LinkButton runat="server" ID="resourceButton" Font-Underline="false" ForeColor="Black"
                                Font-Size="8" Font-Names="Arial" OnClick="resourceButton_Click" EnableViewState="false" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="background: url(<%= ImageHeaderRightUrl %>); height: 31px;" width="<%= (this.Request.Browser.IsBrowser("Safari"))?"5px":"3px" %>">
            </td>
        </tr>
    </table>
</div>
