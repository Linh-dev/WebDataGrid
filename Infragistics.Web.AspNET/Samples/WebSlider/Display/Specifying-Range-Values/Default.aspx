<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSlider_Display_Specifying_Range_Values_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <center>
        <div class="webslider">
            <ig:WebSlider ID="WebSlider1" runat="server" MaxValueAsString="200" MinValueAsString="0"
                ValueAsString="20">
                <ValueLabel Location="FloatTopOrLeft" />
            </ig:WebSlider>
        </div>
        <div class="webslider-vertical">
            <ig:WebSlider ID="WebSlider2" runat="server" Height="200px" MaxValueAsString="200"
                MinValueAsString="0" ValueAsString="20" Orientation="Vertical" Width="100px">
                <ValueLabel Location="FloatTopOrLeft" />
            </ig:WebSlider>
        </div>
    </center>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
