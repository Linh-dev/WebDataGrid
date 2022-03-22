<%@ Page Title="" Language="C#" MasterPageFile="~/OverviewPage.master" AutoEventWireup="true"
    Inherits="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ComponentPage" %>

<%@ Import Namespace="Infragistics.Web.SampleBrowser.Core.Framework" %>
<%@ Import Namespace="Infragistics.Web.SampleBrowser.Core.Framework.Repository" %>
<%@ Register Assembly="Infragistics.Web.SampleBrowser.Core.Framework" Namespace="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.Controls"
    TagPrefix="IGCustom" %>
<asp:Content ContentPlaceHolderID="title" runat="server">
<%= this.ComponentName %>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="rightPodContentPlaceHolder" runat="server">
    <% this.contentControl.InnerHtml = RepositoryFactory.FrameworkRepository.GetComponentKeyFeatures(AppSettings.ProductFamilyName, this.Component.RouteName); %>
    <div class="sb-content">
        <IGCustom:HtmlControl ID="contentControl" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBody" runat="server">
</asp:Content>
