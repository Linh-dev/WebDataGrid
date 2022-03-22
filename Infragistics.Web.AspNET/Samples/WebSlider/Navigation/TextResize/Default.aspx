<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
   <div style="height: 100%;">
        <br />
        <table style="width: 100%; height: 100%">
            <tr>
                <td valign="top" style="width: 50%">
                    <b>
                        <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/TextResize/bullet_blue.png" style="width: 16px;
                            height: 16px" vspace="0" /></b><asp:Label ID="Label1" runat="server" Font-Bold="True">
                                <asp:Label ID="SliderLabel" runat="server" Text="<%$ Resources:WebSlider, Font_SliderLabel %>"></asp:Label>
                            </asp:Label><br />
                    <ig:WebSlider ID="WebSlider1" runat="server" Width="265px" ContentAlignment="BottomOrRight"
                        Height="50px" ThumbsHolderCssClass="width200" MaxValueAsString="60" MinValueAsString="8"
                        ValueAsString="12">
                        <Tickmarks LabelLocation="None" Location="None">
                            <CssClasses LabelEdgeHorizCssClass="blackColor" />
                        </Tickmarks>
                        <MinusButton DisabledImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_small.jpg"
                         FocusImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_small.jpg"
                         HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_small_hover.jpg" 
                         ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_small.jpg"
                         PressedImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_small.jpg" />
                        <PlusButton DisabledImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_large.jpg" 
                        FocusImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_large.jpg"
                        HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_large_hover.jpg" 
                        ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_large.jpg"
                        PressedImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/fontSize_large.jpg" />
                        <Thumb CssClass="thumb1" FocusImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/handRectFocus.gif" 
                        HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/handRectFocus.gif"
                        ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/handRectFocus.gif" 
                        PressedImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/TextResize/handRectFocus.gif" />
                        <Track>
                            <CssClasses CssClass="trackR" ValueFillCssClass="trackRValue1" LeftOrTopEdgeCssClass="width0"
                                RightOrBottomEdgeCssClass="width0" />
                        </Track>
                        <ClientEvents ValueChanging="updateFontSize" />
                    </ig:WebSlider>
                    <br />
                    <div id="dummyText" style="width: 100%;">
                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vivamus tempor scelerisque
                            arcu. Integer varius. Quisque euismod mauris vel nulla. Etiam tempus sodales sapien.
                            Aliquam justo dolor, ullamcorper commodo, convallis vitae, ultrices placerat, pede.
                            Donec dapibus. Vestibulum vitae justo. Sed ultricies rutrum odio. Etiam laoreet.
                            Donec nulla ante, pulvinar non, pellentesque sed, pulvinar at, pede. Praesent pulvinar,
                            mi vel tempor hendrerit, neque nisi posuere dui, eget tempor ante justo id nunc.
                            Proin sed ante eu massa pretium condimentum. Vestibulum fermentum placerat nulla.
                            Aenean nulla eros, tincidunt vel, auctor quis, posuere sit amet, metus.
                        </p>
                        <p>
                            Sed et erat vel mi dignissim varius. Nulla sed justo in nibh adipiscing pulvinar.
                            Integer in sem ut nisl consequat mattis. Cras id lorem. Nulla pede. Sed dictum.
                            Nulla ornare eros at nisl. Mauris arcu. Phasellus justo. Phasellus eu tortor non
                            mi vulputate placerat. Curabitur imperdiet eros sed metus sodales luctus. Donec
                            molestie, augue ac cursus porta, nibh felis mattis risus, sed dignissim purus velit
                            in lacus. Donec vehicula sapien pulvinar arcu. Mauris lectus ligula, accumsan vitae,
                            pellentesque in, venenatis ac, nibh.
                        </p>
                        <p>
                            Pellentesque ante quam, lacinia nec, lacinia sit amet, bibendum eu, diam. Nam hendrerit
                            urna molestie quam. Nam eu eros. Aliquam ornare, metus sit amet rutrum viverra,
                            lorem est egestas augue, a malesuada massa nulla nec massa. In hac habitasse platea
                            dictumst. Pellentesque habitant morbi tristique senectus et netus et malesuada fames
                            ac turpis egestas. Maecenas orci mauris, interdum ut, rhoncus a, malesuada ut, odio.
                            Ut ut pede eu felis elementum imperdiet. Nulla ut tellus id lectus elementum egestas.
                            Nunc id mauris a tellus pulvinar vulputate. Morbi malesuada. Quisque metus. Nulla
                            auctor sapien vitae diam.
                        </p>
                    </div>
                </td>
            </tr>
        </table>
    </div>
        <script type="text/javascript">
            function updateFontSize(slider, args) {
                var max = 60;
                var val = args.get_newValue();
                var p = document.getElementById("dummyText").getElementsByTagName('p');
                for (i = 0; i < p.length; i++) {
                    if (p[i].style.fontSize) {
                        var s = parseInt(p[i].style.fontSize.replace("px", ""));
                    } else {
                        var s = 12;
                    }
                    if (s != max) {
                        s = val;
                    } else {
                        s = val;
                    }

                    p[i].style.fontSize = s + "px";
                    p[i].style.lineHeight = s + "px";

                }
            }
    </script>
</asp:Content>