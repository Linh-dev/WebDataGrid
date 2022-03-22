<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSlider_Navigation_Interacting_with_the_WebImageViewer_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <script type="text/javascript">
        var webImageViewer_ClientId = '<%= WebImageViewer1.ClientID %>';
    </script>
    <div class="imageViewer">
        <ig:WebImageViewer ID="WebImageViewer1" runat="server" Width="500px" Height="200px" ScrollAnimations-Type="NextItem">
            <Items>
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image1.jpg" Selected="true" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image2.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image3.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image4.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image5.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image6.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image7.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image8.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image9.jpg" />
                <ig:ImageItem ImageUrl="/samplesbrowser/samplescommon/aspnet/WebImageViewer/image10.jpg" />
            </Items>
        </ig:WebImageViewer>
    </div>
    <asp:Label ID="Label1" runat="server" Text="<%$Resources:WebSlider, Scrolling_ImageScroll %>"></asp:Label>
    <div class="webslider">
        <ig:WebSlider ID="WebSlider1" runat="server" Width="500px" ValueAsString="1" MinValueAsString="1"
            MaxValueAsString="10" SnapToSmallChange="true" SmallChangeAsString="1" ContentAlignment="Center"
            Tickmarks-NumberOfMinorTickmarks="0" Tickmarks-NumberOfMajorTickmarks="10" ValueType="Int">
            <ClientEvents ValueChanged="valueChanged" />
            <%--Initialize="initializeMap"--%>
            <ValueLabel Location="FloatTopOrLeft" />
            <Tickmarks LabelLocation="Both">
            </Tickmarks>
        </ig:WebSlider>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
    <ig:HtmlScript ID="ClientScript" runat="server" Src="Script.js" />
</asp:Content>
