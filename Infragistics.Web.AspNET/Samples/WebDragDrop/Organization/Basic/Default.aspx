<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
			<asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.SharedScripts.igDragDrop.js" />
			<asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.Scripts.5_igObjects.js" />
			<asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.SharedScripts.igAnimation.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <div style="height: 500px;">
        <div style="width: 700px; height: 147px; text-align: center;">
            <div style="width: 100%; height: 45px; background-image: url(<%= this.GetGlobalResourceObject("WebDragDrop","BasicDDImageHeader") %>)"></div>
            <div id="bg" style="position: relative; top: 45px; height: 73px; width: 100%; background-image: url( /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Basic/DD_basic_body.png)">
                <div id="imageList" style="position: relative; top: 15px; width: 100%; height: 260px;
                    overflow: auto; white-space: nowrap;">
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image1.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image2.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image3.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image4.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image5.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image6.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image7.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image8.jpg"
                        width="70px" height="52px" />
                    <img class="imageStyle" src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/Basic/image9.jpg"
                        width="70px" height="52px" />
                </div>
            </div>
            <div style="position: relative; top: 45px; width: 100%; height: 14px; background-image: url('/SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Basic/DD_footer.png');" ></div>
        </div>
        <div style="position: relative; top: 100px; width: 700px; height: 325px; text-align: center;">
            <div style="width: 100%; height: 45px; background-image: url(<%= this.GetGlobalResourceObject("WebDragDrop","BasicDropHereHeader") %>);">
            </div>
            <div id="Div1" style="position: relative; height: 266px; width: 100%; background-image: url( /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Basic/DD_drop_body.png);
                text-align: center">
                <div id="imgPanel" style="position: absolute; top: 5px; height: 252px; width: 336px;
                    border: solid 1px #666666; background-image: url( /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Basic/DD_drop_fpo.png);
                    margin-left: 181px; background-repeat: no-repeat">
                </div>
            </div>
            <div style="position: relative; top: 266px; width: 100%; height: 14px; background-image: url( /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Basic/DD_footer.png);"></div>
        </div>
    </div>
    <script type="text/javascript">
        Sys.Application.add_load(appLoaded);
        function appLoaded() {
            var ddb = new $IG.DragDropBehavior();
            var list = $get("imageList");
            var count = list.childNodes.length;
            for (var i = 0; i < count; i++) {
                var child = list.childNodes[i];
                if (child.getAttribute)
                    ddb.addSourceElement(child);
            }
            ddb.addTargetElement($get("imgPanel"), true);
            ddb.get_events().addDropHandler(dropHandler)
        }

        function dropHandler(source, evntArgs) {
            var panel = $get("imgPanel");
            if (panel.childNodes.length > 0)
                panel.removeChild(panel.childNodes[0]);
            var img = document.createElement("img");
            img.src = evntArgs.get_manager().get_source().element.src;
            panel.appendChild(img);
            img.style.width = "100%";
            panel.style.height = "auto";
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" Runat="Server">
</asp:Content>

