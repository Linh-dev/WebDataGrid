<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <!--This is used, because we want the maximized WebDialogWindow to fill the iframe, not the body-->
    <iframe id="webDialogWindow" name="webDialogWindow" frameborder="0" width="100%" height="300px" src="<%= this.ResolveUrl("WebDialogFrame.aspx") %>">
    </iframe>
</asp:Content>

