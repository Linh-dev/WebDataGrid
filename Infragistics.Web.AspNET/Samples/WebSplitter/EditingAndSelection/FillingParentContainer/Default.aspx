<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  	

	<asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebSplitter,Fill_Parent_Description_3 %>"></asp:Label>
    <asp:Label Text="200px" ID="SizeLabel" runat="server" />
	<br />
	<br />
	<div id="splitterDIV" style="height: 200px;">
		<ig:WebSplitter runat="server" ID="WebSplitter1" Width="600px" Height="100%" CssClass="Visible">
			<Panes>
				<ig:SplitterPane Size="50%">
				</ig:SplitterPane>
				<ig:SplitterPane Size="50%">
				</ig:SplitterPane>
			</Panes>
		</ig:WebSplitter>
	</div>
	<br />
	<br />
	<asp:Label ID="Label4" Text="<%$ Resources:WebSplitter,Fill_Parent_Description_4 %>"
		runat="server" /><br />
	<input type="text" id="heightDIV" name="heightDIV" value="200" onchange="resizeDIV(this.value);" />
    <script type="text/javascript">
        function resizeDIV(size) {
            document.getElementById('splitterDIV').style.height = size + "px";

            // Force splitter to redraw itself (necessary in some browsers)
            var splitter = $util.findControl("WebSplitter1");
            if (splitter)
                splitter.layout();
            document.getElementById('<%= SizeLabel.ClientID %>').innerHTML = size + "px";
        }
	</script>
</asp:Content>