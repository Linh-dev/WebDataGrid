<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
<div style="height: 430px; position: relative;">
   <div id="LiveMapContainer" style="width: 500px; height: 300px; display: block; position: absolute; top: 0px;"></div>
   <div style="height: 100px; position: absolute; top: 330px;">
       <asp:Label ID="ZoomControl" runat="server" Text="<%$ Resources:WebSlider, Map_ZoomControl %>"></asp:Label><br />
       <ig:WebSlider ID="WebSlider1" runat="server" Width="500px" ValueAsString="19" MinValueAsString="1"
            MaxValueAsString="19" SnapToSmallChange="true" SmallChangeAsString="1" ContentAlignment="Center"
            Tickmarks-NumberOfMinorTickmarks="0" Tickmarks-NumberOfMajorTickmarks="19" ValueType="Int">
            <ClientEvents ValueChanged="valueChanged" Initialize="InitMap" />
            <ValueLabel Location="FloatTopOrLeft" />
            <Tickmarks LabelLocation="Both"></Tickmarks>
       </ig:WebSlider>
    </div>
</div>
    <script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1"></script>
    <script type="text/javascript">
        // Init the Live.com map control
        var map = null;
        function InitMap() {
            try {
                map = new VEMap('LiveMapContainer');

                // Need interval to fix bug in FireFox 4 without which map will not be loaded due to lazy loading
                var interval = setInterval(function () {
                    if (eval("typeof VEMap") != "undefined" &&
                        document.getElementById("LiveMapContainer").attachEvent != undefined) {
                        clearInterval(interval);
                        map.LoadMap(); 
                        map.HideDashboard();
                        map.SetMapStyle(VEMapStyle.Aerial);
                        map.SetCenterAndZoom(
                   new VELatLong('<%= this.GetGlobalResourceObject("WebSlider","Map_Latitude") %>',
		   '<%= this.GetGlobalResourceObject("WebSlider","Map_Longitude") %>'),
		   '<%= this.GetGlobalResourceObject("WebSlider","Map_Zoom") %>');
                map.AttachEvent("ondoubleclick", CustomDoubleClick);
                        //53.006753021546814 , 7.191967964172347
                    }
                }, 10);

            } catch (e) {
            }
        }
        function CustomDoubleClick(e) {
            //Get the current zoom level
            currentZoomLevel = map.GetZoomLevel();
            //Set the zoom level to the new zoom level by adding 1 to the current zoom level
            // And center the map where the user just clicked...
            //Get the x pixel
            var x = e.mapX;
            //Get the y pixel
            var y = e.mapY;
            //Create a VEPixel object
            pixel = new VEPixel(x, y);
            //Convert the pixel to a lat/long
            var LL = map.PixelToLatLong(pixel);
            //Set the new center (based on where user clicked) and zoom level (two levels
            //down from where the user was previously)
            map.SetCenterAndZoom(LL, currentZoomLevel + 1);
            // Then update the slider to match
            var slider = $find("<%= WebSlider1.ClientID %>");
            slider.set_value(currentZoomLevel + 1);
            //Return true to override the Virtual Earth default double-click event
            return true;
        }


        function valueChanged(slider, args) {
            var newVal = args.get_newValue();
            map.SetZoomLevel(newVal);
        }
    </script> 
</asp:Content>
