<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <div id="parentcontainer">
        <div id="div1" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image1.jpg" alt="Image" id="Image1" runat="server"
                width="320" height="240" />
        </div>
        <div id="div2" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image2.jpg" alt="Image" id="Img3" runat="server"
                width="320" height="240" />
        </div>
        <div id="div3" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image3.jpg" alt="Image" id="Img4" runat="server"
                width="320" height="240" />
        </div>
        <div id="div4" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image4.jpg" alt="Image" id="Img5" runat="server"
                width="320" height="240" />
        </div>
        <div id="div5" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image5.jpg" alt="Image" id="Img6" runat="server"
                width="320" height="240" />
        </div>
        <div id="div6" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image6.jpg" alt="Image" id="Img7" runat="server"
                width="320" height="240" />
        </div>
        <div id="div7" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image7.jpg" alt="Image" id="Img8" runat="server"
                width="320" height="240" />
        </div>
        <div id="div8" class="itemcontainer">
            <img src="/samplesbrowser/samplescommon/aspnet/WebresizingExtender/Navigation/ResizeHTMLElements/image8.jpg" alt="Image" id="Img2" runat="server"
                width="320" height="240" />
        </div>
    </div>
    
    <span id="Span0" runat="server"></span>
    <span id="Span1" runat="server"></span>
    <span id="Span2" runat="server"></span>
    <span id="Span3" runat="server"></span>
    <span id="Span4" runat="server"></span>
    <span id="Span5" runat="server"></span>
    <span id="Span6" runat="server"></span>
    <span id="Span7" runat="server"></span>
    <span id="Span8" runat="server"></span>
            
    <igtk:WebResizingExtender ID="WebResizingExtender0" TargetControlID="Span0" TargetHtmlElementID="div1"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender1" TargetControlID="Span1" TargetHtmlElementID="div2"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender2" TargetControlID="Span2" TargetHtmlElementID="div3"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender3" TargetControlID="Span3" TargetHtmlElementID="div4"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender4" TargetControlID="Span4" TargetHtmlElementID="div5"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender5" TargetControlID="Span5" TargetHtmlElementID="div6"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender6" TargetControlID="Span6" TargetHtmlElementID="div7"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender7" TargetControlID="Span7" TargetHtmlElementID="div8"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
    <igtk:WebResizingExtender ID="WebResizingExtender8" TargetControlID="Span8" TargetHtmlElementID="div9"
        MaximumHeight="240" MaximumWidth="320" MinimumHeight="150" MinimumWidth="150"
        runat="server" />
</asp:Content>