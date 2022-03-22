<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
   <div style="height: 100%; margin-top: 35px;">
        <div style="float: left; text-align: center;">
            <b>
                <asp:Label ID="SliderLabel1" runat="server" Text="<%$ Resources:WebSlider, Appearance_Slider_1 %>"></asp:Label>
            </b>
            <br />
            <br />
            <div style="margin-left: 20px;">
                <ig:WebSlider ID="WebSlider1" runat="server" Height="250px" MaxValueAsString="10000"
                    MinValueAsString="0" ValueAsString="20" Orientation="Vertical" Width="150px">
                    <ValueLabel Location="FloatTopOrLeft" CssClass="igsli_ValueLabelFloatLShowAll" />
                </ig:WebSlider>
            </div>
        </div>
        <div style="float: left; margin-left: 100px; text-align: Center;">
            <b>
                <asp:Label ID="SliderLabel2" runat="server" Text="<%$ Resources:WebSlider, Appearance_Slider_2 %>"></asp:Label>
            </b>
            <br />
            <br />
            <div style="margin-left: 70px;">
                <ig:WebSlider ID="WebSlider2" runat="server" Height="250px" MaxValueAsString="10000"
                    MinValueAsString="0" ValueAsString="20" Orientation="Vertical" Width="150px">
                    <ValueLabel Location="FloatTopOrLeft" CssClass="igsli_ValueLabelFloatLClipped" />
                </ig:WebSlider>
            </div>
        </div>
        <div style="clear: both;">
        </div>
    </div>
</asp:Content>