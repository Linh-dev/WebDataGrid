<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  	<script type="text/javascript">
  	    function startScroll(cell, dir) {
  	        var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
  	        imageViewer.get_scrollAnimations().set_type($IG.ScrollAnimation.Continuous);
  	        if (dir == "next")
  	            imageViewer.navigateNext();
  	        else
  	            imageViewer.navigatePrev();
  	    }

  	    function endScroll(cell) {
  	        var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
  	        imageViewer.endNavigation();
  	        imageViewer.get_scrollAnimations().set_type($IG.ScrollAnimation.NextItem);
  	    }

  	    function nextImage(cell) {
  	        var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
  	        imageViewer.get_scrollAnimations().set_type($IG.ScrollAnimation.NextItem);
  	        imageViewer.navigateNext();
  	    }

  	    function previousImage(cell) {
  	        var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
  	        imageViewer.get_scrollAnimations().set_type($IG.ScrollAnimation.NextItem);
  	        imageViewer.navigatePrev();
  	    }

  	    function scrollToView(radioBtn) {
  	        var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
  	        imageViewer.get_scrollAnimations().get_nextItemAnimation().moveItemIntoFocus(imageViewer.get_items().getItem(parseInt(radioBtn.value)));
  	    }
	</script>

	<table width="720">
		<tr>
			<td>
				<ig:WebImageViewer ID="WebImageViewer1" runat="server" Height="215px" Width="595px"
					Header-Text="<%$ Resources:WebImageViewer,Client_Side_Events_Description_3 %>">
					<ScrollAnimations>
						<NextItem Alignment="Near" />
					</ScrollAnimations>
					<PreviousButton Visible="False" />
					<NextButton Visible="False" />
					<Header Text="<%$ Resources:WebImageViewer,Client_Side_Events_Description_3 %>">
					</Header>
				</ig:WebImageViewer>
			</td>
			<td>
				<input name="Radio1" type="radio" value="0" onclick="scrollToView(this)" checked="checked" /><asp:Label
					ID="Radio1" runat="server" Text="<%$ Resources:WebImageViewer,Client_Side_Events_Radio_1 %>"></asp:Label><br />
				<input name="Radio1" type="radio" value="1" onclick="scrollToView(this)" /><asp:Label
					ID="Radio2" runat="server" Text="<%$ Resources:WebImageViewer,Client_Side_Events_Radio_2 %>"></asp:Label><br />
				<input name="Radio1" type="radio" value="2" onclick="scrollToView(this)" /><asp:Label
					ID="Radio3" runat="server" Text="<%$ Resources:WebImageViewer,Client_Side_Events_Radio_3 %>"></asp:Label><br />
				<input name="Radio1" type="radio" value="3" onclick="scrollToView(this)" /><asp:Label
					ID="Radio4" runat="server" Text="<%$ Resources:WebImageViewer,Client_Side_Events_Radio_4 %>"></asp:Label><br />
				<input name="Radio1" type="radio" value="4" onclick="scrollToView(this)" /><asp:Label
					ID="Radio5" runat="server" Text="<%$ Resources:WebImageViewer,Client_Side_Events_Radio_5 %>"></asp:Label><br />
				<input name="Radio1" type="radio" value="5" onclick="scrollToView(this)" /><asp:Label
					ID="Radio6" runat="server" Text="<%$ Resources:WebImageViewer,Client_Side_Events_Radio_6 %>"></asp:Label><br />
				<input name="Radio1" type="radio" value="6" onclick="scrollToView(this)" /><asp:Label
					ID="Radio7" runat="server" Text="<%$ Resources:WebImageViewer,Client_Side_Events_Radio_7 %>"></asp:Label><br />
			</td>
			<tr>
				<td>
					<center>
						<table style="width: 200px" border="0">
							<tr>
								<td onmouseover="startScroll(this, 'prev')" onmouseout="endScroll(this)" align="center"
									valign="bottom" style="cursor: pointer;">
									<img src="/samplesbrowser/samplescommon/aspnet/WebImageViewer/NavigationUsingClientSide/ContPrevBtn.jpg" title="<%= this.GetGlobalResourceObject("WebImageViewer","BtnHover") %>" />
								</td>
								<td onclick="previousImage(this)" align="center" valign="bottom" style="cursor: pointer;">
									<img src="/samplesbrowser/samplescommon/aspnet/WebImageViewer/NavigationUsingClientSide/PrevBtn.jpg" title="<%= this.GetGlobalResourceObject("WebImageViewer","BtnClick") %>" />
								</td>
								<td onclick="nextImage(this)" align="center" valign="bottom" style="cursor: pointer;">
									<img src="/samplesbrowser/samplescommon/aspnet/WebImageViewer/NavigationUsingClientSide/NextBtn.jpg" title="<%= this.GetGlobalResourceObject("WebImageViewer","BtnClick") %>" />
								</td>
								<td onmouseover="startScroll(this, 'next')" onmouseout="endScroll(this)" align="center"
									valign="bottom" style="cursor: pointer;">
									<img src="/samplesbrowser/samplescommon/aspnet/WebImageViewer/NavigationUsingClientSide/ContBtn.jpg" title="<%= this.GetGlobalResourceObject("WebImageViewer","BtnHover") %>" />
								</td>
							</tr>
						</table>
					</center>
				</td>
			</tr>
		</tr>
	</table>
</asp:Content>
