<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function WebImageViewer1_ImageSelected(imageViewer, evntArgs) {
            var item = evntArgs.getImageItem();
            var key = item.get_key();

            // Resolve the javascript array that we stored on the server, 
            // and used that to populate fields from the client.
            key = Sys.Serialization.JavaScriptSerializer.deserialize(key);
            document.getElementById("productImage").src = key[0];

        }

        function WebImageViewer1_Initialize(imageViewer, evntArgs) {
            var key = imageViewer.get_items().getItem(0).get_key();
            key = Sys.Serialization.JavaScriptSerializer.deserialize(key);
            document.getElementById("productImage").src = key[0];
        }

    </script>
    <div class="masterContainer">
        <div class="carImage">
            <img id="productImage" />
        </div>

        <div class="carSelection">
            <ig:WebImageViewer ID="WebImageViewer1" Height="120px" Width="400px" ScrollAnimations-Type="NextItem"
                runat="server" StyleSetName="Nautilus">
                <ClientEvents ImageSelected="WebImageViewer1_ImageSelected" Initialize="WebImageViewer1_Initialize" />
                <Header Visible="true" Text="<%$Resources:WebImageViewer, SelectColor %>">
                </Header>
                <Footer Visible="true">
                </Footer>
            </ig:WebImageViewer>

        </div>
    </div>

</asp:Content>