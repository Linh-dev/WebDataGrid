<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <!--This is used because we want the maximized WebDialogWindow to fill the iframe, not the body-->
    <iframe id="webDialogWindow" name="webDialogWindow" frameborder="0"
            src="<%= this.ResolveUrl("WebDialogFrame.aspx") %>" width="100%" height="500px">
    </iframe>
</asp:Content>
