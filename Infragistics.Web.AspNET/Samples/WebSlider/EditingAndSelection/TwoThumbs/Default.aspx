<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
  <br />
  <br />
    <table style="width:600px;line-height:normal;" >
		<tr >
			<td colspan=3 style="height:100%;width:50%;" valign="top">
				 <b>
                <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/EditingAndSelection/TwoThumbs/bullet_blue.png" 
                    style="width: 16px; height: 16px" vspace="0" /></b><asp:Label ID="Label3" 
                     runat="server" Text="<%$ Resources:WebSlider, Thumbs_Slider_1 %>" Font-Bold="True"></asp:Label><br /><br />
				<ig:WebSlider ID="WebSlider1" runat="server" EnableSecondaryValue="true" 
					 Width="100%" MaxValueAsString="10" MinValueAsString="-10.00" 
					 SecondaryValueAsString="8.00" ThumbsInteractionMode="Lock" 
					 ValueAsString="-5.00" StyleSetName="Claymation" BackColor="#F9F9F9" >
					 <Track FillValueMode="Range">
					 </Track>
					 <ValueLabel Location="FloatTopOrLeft" />
				 	<Tickmarks LabelLocation="TwoLabelsInMargins">
					 </Tickmarks>
				 </ig:WebSlider><br><br>
				 <b>
                <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/EditingAndSelection/TwoThumbs/bullet_blue.png" 
                    style="width: 16px; height: 16px" vspace="0" /></b><asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebSlider, Thumbs_Slider_2 %>" Font-Bold="True"></asp:Label><br /><br />
				<ig:WebSlider ID="WebSlider2" runat="server" EnableSecondaryValue="true" 
					 Width="100%" ThumbsInteractionMode="Push" SnapToSmallChange="True" 
                     StyleSetName="Claymation" BackColor="#F9F9F9" >
					<ValueLabel CssClass="staticWidth70" Format="{0}%..{1}%" Location="LeftOrTop" />
					<Tickmarks NumberOfLabels="3">
					</Tickmarks>
				 </ig:WebSlider><br /><br />
				 <b>
                <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/EditingAndSelection/TwoThumbs/bullet_blue.png" 
                    style="width: 16px; height: 16px" vspace="0" /></b><asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebSlider, Thumbs_Slider_3 %>" Font-Bold="True" ></asp:Label><br /><br />
				<ig:WebSlider ID="WebSlider6" runat="server" EnableSecondaryValue="true" 
					 Width="100%" StyleSetName="Claymation" BackColor="#F9F9F9" MaxValueAsString="250" 
                     MinValueAsString="20" >
					<Track FillValueMode="None">
					</Track>
				   <ValueLabel  Location="FloatTopOrLeft" />
					<Tickmarks NumberOfLabels="3" NumberOfMajorTickmarks="5" 
						NumberOfMinorTickmarks="2">
						
					</Tickmarks>
				 </ig:WebSlider>
			</td>
			</tr>
			<tr>
			
			
			<td style="height:100%;" valign="top" align="center"><br /><br />
			    <b>
                <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/EditingAndSelection/TwoThumbs/bullet_blue.png" 
                    style="width: 16px; height: 16px" vspace="0" /></b><asp:Label ID="Label2" 
                    runat="server" Text="<%$ Resources:WebSlider, Thumbs_Slider_1 %>" Font-Bold="True"></asp:Label><br /><br />
				<ig:WebSlider ID="WebSlider3" runat="server" Orientation="Vertical" 
					EnableSecondaryValue="true"  ThumbsInteractionMode="Lock" 
					MaxValueAsString="5.00" MinValueAsString="-5.00" StyleSetName="Claymation" 
                    BackColor="#F9F9F9" >
					<ValueLabel Location="LeftOrTop" />
					<Tickmarks LabelLocation="TwoLabelsInMargins">
					</Tickmarks>
				 </ig:WebSlider>
			</td>
			<td style="height:100%;" valign="top" align="center"><br><br>
			    <b>
                <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/EditingAndSelection/TwoThumbs/bullet_blue.png" 
                    style="width: 16px; height: 16px" vspace="0" /></b><asp:Label ID="Label4" 
                    runat="server" Text="<%$ Resources:WebSlider, Thumbs_Slider_2 %>" Font-Bold="True"></asp:Label><br /><br />
				<ig:WebSlider ID="WebSlider4" runat="server" Orientation="Vertical" Width="125px" 
					EnableSecondaryValue="true"  ThumbsInteractionMode="Push" 
					MaxValueAsString="1000.00" MinValueAsString="0.00" StyleSetName="Claymation" BackColor="#F9F9F9"
					>
					<ValueLabel Format="${0}" Location="FloatBottomOrRight" />
				 </ig:WebSlider>
			</td>
			<td style="height:100%;" valign="top" align="center"><br /><br />
			    <b>
                <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebSlider/EditingAndSelection/TwoThumbs/bullet_blue.png" 
                    style="width: 16px; height: 16px" vspace="0" /></b><asp:Label ID="Label5" 
                    runat="server" Text="<%$ Resources:WebSlider, Thumbs_Slider_3 %>" Font-Bold="True"></asp:Label><br /><br />
				<ig:WebSlider ID="WebSlider5" runat="server" Orientation="Vertical" 
                    EnableSecondaryValue="true" StyleSetName="Claymation" ThumbsInteractionMode="Free" 
                    BackColor="#F9F9F9"  >
                    <ValueLabel Location="FloatTopOrLeft" />
				 </ig:WebSlider>
			</td>
		</tr>
    </table>
</asp:Content>