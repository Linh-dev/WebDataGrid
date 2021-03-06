<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>
<%@ Register TagPrefix="aspHtml" Namespace="System.Web.UI.HtmlControls" Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
  <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <table cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <aspHtml:HtmlButton runat="server" ID="buttonDay" class="btnNormal">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebSchedule/Display/MultipleResources/OneDayView.png" alt="" />
                    <%= this.GetGlobalResourceObject("WebSchedule","WebSchedule_MultiDayEvtBanner_OneDayLabel") %>
                </aspHtml:HtmlButton>
            </td>
            <td class="td">
                <aspHtml:HtmlButton runat="server" ID="buttonDays" class="btnNormal">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebSchedule/Display/MultipleResources/FiveDayView.png" alt="" />
                    <%= this.GetGlobalResourceObject("WebSchedule","WebSchedule_MultiDayEvtBanner_FiveDayLabel")%>
                </aspHtml:HtmlButton>
            </td>
            <td class="td">
                <aspHtml:HtmlButton runat="server" ID="buttonMonth" class="btnNormal">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebSchedule/Display/MultipleResources/MonthView.png" alt="" />
                    <%= this.GetGlobalResourceObject("WebSchedule","WebSchedule_MultiDayEvtBanner_MonthLabel")%>
                </aspHtml:HtmlButton>
            </td>
        </tr>
    </table>
    <div style="height: 10px;">
    </div>
    <asp:PlaceHolder runat="server" ID="viewHolder" />
    <br />
    <asp:CheckBox ID="chkSmartCallbacks" AutoPostBack="True" runat="server" Style="vertical-align: top;"
        OnCheckedChanged="chkSmartCallbacks_CheckChanged" Checked="false"></asp:CheckBox>
    <asp:Label ID="lblSmartCallbacks" Text="<%$ Resources:WebSchedule,WebSchedule_MultipleResources_EnableSmartCallbacksLabel %>"
        runat="server" Width="250px"></asp:Label>
    <ig_sched:WebScheduleInfo ID="wsInfo" runat="server" EnableRecurringActivities="True"
        EnableMultiDayEventArrows="True" EnableMultiResourceView="true" EnableAppStyling="True"
        EnableMultiResourceCaption="true" EnableUnassignedResource="False">
    </ig_sched:WebScheduleInfo>
</asp:Content>
