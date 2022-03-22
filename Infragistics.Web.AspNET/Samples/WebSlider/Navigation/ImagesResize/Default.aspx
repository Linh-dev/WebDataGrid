<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
  <div style="height:100%;">
    <br />
    <table style="width:100%;height:100%">
		<tr>
			<td valign="top" style="width:50%">				
				 <b>
                <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/bullet_blue.png" 
                    style="width: 16px; height: 16px" vspace="0" /></b><asp:Label ID="Label1" 
                    runat="server" Font-Bold="True">
                    <asp:Label ID="ImageResize" runat="server" Text="<%$ Resources:WebSlider, Image_ImageResize %>"></asp:Label>
                    </asp:Label><br />			
				<ig:WebSlider ID="WebSlider1" runat="server" Width="215px" 
					ContentAlignment="BottomOrRight" ShowPlusMinusButtons="False"	Height="50px" 
					ThumbsHolderCssClass="width200" MaxValueAsString="320" MinValueAsString="46" 
					ValueAsString="320">
					 <Tickmarks LabelLocation="None" Location="None">
				 		<CssClasses LabelEdgeHorizCssClass="blackColor" />
					 </Tickmarks>
					 <Thumb CssClass="thumb1" FocusImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/ImagesResize/handRectFocus.gif" 
                         HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/ImagesResize/handRectFocus.gif"
						 ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/ImagesResize/handRectFocus.gif" 
                         PressedImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSlider/Navigation/ImagesResize/handRectFocus.gif" />
					 <Track>
			 			<CssClasses CssClass="trackR" ValueFillCssClass="trackRValue1" 
							 LeftOrTopEdgeCssClass="width0" RightOrBottomEdgeCssClass="width0" />
					 </Track>
					 <ClientEvents ValueChanging="resizeImage" />
				 </ig:WebSlider>
				 <div id="imageDIV" style="width: 680px;">
					<div id="image1div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image1.jpg" id="image1" class="imageClass" /></div>
					<div id="image2div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image2.jpg" id="image2" class="imageClass" /></div> 
					<div id="image3div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image3.jpg" id="image3" class="imageClass" /></div> 
					<div id="image4div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image4.jpg" id="image4" class="imageClass" /></div> 
					<div id="image5div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image5.jpg" id="image5" class="imageClass" /></div> 
					<div id="image6div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image6.jpg" id="image6" class="imageClass" /></div> 
					<div id="image7div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image7.jpg" id="image7" class="imageClass" /></div> 
					<div id="image8div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image8.jpg" id="image8" class="imageClass" /></div> 
					<div id="image9div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image9.jpg" id="image9" class="imageClass" /></div> 
					<div id="image10div" class="resizableImage" ><img src="/samplesbrowser/samplescommon/aspnet/WebSlider/Navigation/ImagesResize/image10.jpg" id="image10" class="imageClass" /></div> 
				 </div>			 
			</td>			
		</tr>
    </table>
    </div>
        <script type="text/javascript">
            function resizeImage(slider, args) {
                var val = args.get_newValue();
                var scalePhotos = Array('image1', 'image2', 'image3', 'image4', 'image5', 'image6', 'image7', 'image8', 'image9', 'image10');
                for (i = 0; i < scalePhotos.length; i++) {
                    document.getElementById(scalePhotos[i]).style.width = (val) + 'px';
                }
            }
	</script>
</asp:Content>