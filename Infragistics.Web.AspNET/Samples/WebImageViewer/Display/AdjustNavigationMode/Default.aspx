<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        #sampleContainer .igiv_IGControl { padding-bottom: 0; }
        table tbody tr { vertical-align: middle; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  	<ig:WebImageViewer ID="WebImageViewer1" Height="240px" Width="100%" runat="server">
	</ig:WebImageViewer>
	<table style="margin-top: 30px;">
		<tr>
			<td style="width: 150px;">
				<b>
					<asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebImageViewer,Navigation_Mode_Description_3 %>"></asp:Label>
				</b>
			</td>
			<td id="scrollAlignmentColumn" style="visibility: hidden;">
				<b>
					<asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebImageViewer,Navigation_Mode_Description_4 %>"></asp:Label>
				</b>
			</td>
		</tr>
		<tr>
			<td>
				<select multiple="multiple" id="scrollAnimationBox">
					<option selected="selected">Continuous</option>
					<option>NextItem</option>
					<option>Page</option>
				</select>
			</td>
			<td>
				<select multiple="multiple" id="scrollToAlignmentBox" style="visibility: hidden;">
					<option selected="selected">Near</option>
					<option>Center</option>
					<option>Far</option>
				</select>
			</td>
		</tr>
	</table>

	<script type="text/javascript">

	    function scrollAnimationChanged(evnt) {
	        var index = this.selectedIndex;

	        if (index == $IG.ScrollAnimation.NextItem) {
	            document.getElementById("scrollAlignmentColumn").style.visibility = "visible";
	            document.getElementById("scrollToAlignmentBox").style.visibility = "visible";
	        }
	        else {
	            document.getElementById("scrollAlignmentColumn").style.visibility = "hidden";
	            document.getElementById("scrollToAlignmentBox").style.visibility = "hidden";
	        }

	        var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
	        imageViewer.get_scrollAnimations().set_type(index);
	    }

	    function scrollAlignmentChanged(evnt) {
	        var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
	        imageViewer.get_scrollAnimations().get_nextItemAnimation().set_alignment(this.selectedIndex);
	    }

	    var scrollAnimationBox = document.getElementById("scrollAnimationBox");
	    var scrollToAlignmentBox = document.getElementById("scrollToAlignmentBox");

	    $addHandler(scrollAnimationBox, "change", Function.createDelegate(scrollAnimationBox, scrollAnimationChanged));
	    $addHandler(scrollToAlignmentBox, "change", Function.createDelegate(scrollToAlignmentBox, scrollAlignmentChanged));  

	</script>
</asp:Content>