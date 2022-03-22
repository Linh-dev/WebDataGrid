<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
 <img src="/samplesbrowser/samplescommon/aspnet/WebResizingExtender/Display/ResizingImages/image9.jpg" alt="Image" id="Image1" runat="server" width="320" height="240" />

    <igtk:WebResizingExtender ID="wreOne" TargetControlID="Image1"     
    MaximumHeight="640"
    MaximumWidth="480"
    MinimumHeight="120"
    MinimumWidth="160"
    runat="server" /> 
</asp:Content>