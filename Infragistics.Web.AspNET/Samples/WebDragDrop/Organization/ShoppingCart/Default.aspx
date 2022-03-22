<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
 <style type="text/css" >
    	.floatDIV 
    	{
    		float: left;
    		padding-right: 10px;
    	}
    	</style>
    <div style="display:none">
        <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/PacManCursor.png" />
        <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/CutCursor.png" />
        <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/FootStepCursor.png" />
    </div>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.SharedScripts.igDragDrop.js" />
            <asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.Scripts.5_igObjects.js" />
            <asp:ScriptReference Assembly="Infragistics4.Web.v21.2" Name="Infragistics.Web.UI.SharedScripts.igAnimation.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <div style="height: 30px">
     <%= this.GetGlobalResourceObject("WebDragDrop","ChooseCursor")%>
     <asp:DropDownList ID="ddCursor" runat="server" AutoPostBack="false">
             <asp:ListItem Text="<%$ Resources:WebDragDrop, CursorMove %>" Value="move"/>
             <asp:ListItem Text="<%$ Resources:WebDragDrop, CursorCrosshair %>" Value="crosshair" />
             <asp:ListItem Text="<%$ Resources:WebDragDrop, CursorPacMan %>" Value="/SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/ShoppingCart/PacManCursor.cur" />
             <asp:ListItem Text="<%$ Resources:WebDragDrop, CursorScissors %>" Value="/SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/ShoppingCart/CutCursor.cur" />
             <asp:ListItem Text="<%$ Resources:WebDragDrop, CursorFootStep %>" Value="/SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/ShoppingCart/FootStepCursor.cur" />
 </asp:DropDownList>
 </div>
    <div style="position: relative; width: 701px; height: 202px;
        text-align: center; background-image: url(<%= this.GetGlobalResourceObject("WebDragDrop","ShoppingCartProductAreaImage") %>);
        background-repeat: no-repeat;">
        <div style="position: relative; top: 58px; margin-left: 20px; text-align: left; color: #666666">
            <%= this.GetGlobalResourceObject("WebDragDrop","ShoppingCartSelectImage") %>
        </div>
        <div id="imageList" style="height: 70px; width: 695px; top: 65px; position: relative;">
  
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/8ball.gif"
                id="8-ball" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/bell.gif" id="Bell" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/CD.gif" id="CD" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/duckie.gif"
                id="Duckie" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/flashlight.gif"
                id="Flash Light" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/glove.gif"
                id="Glove" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/hardhat.gif"
                id="Hard Hat" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/mug.gif" id="Mug" />
            <img src="/samplesbrowser/samplescommon/aspnet/WebDragDrop/Display/ShoppingCart/scissors.gif"
                id="Scissors" />
        </div>
    </div>
    <div id="cartContainerDIV" style="position: relative; width: 701px;
        height: auto;">
        <div id="trashAreaDIV" style="position: relative; top: 0px; left: 567px; z-index: 1; top: 55px;
            width: 129px; height: 53px;">
        </div>
        <div id="cartDIV" style="position: relative; background-image: url(<%= this.GetGlobalResourceObject("WebDragDrop","ShoppingCartCartImage") %>);
            background-repeat: no-repeat; width: 701px; height: 207px;">
            <div id="cartAreaDIV" style="position: relative; left: 17px; top: 65px; width: 691px;
                height: 125px;">
            </div>
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
            ddb.addTargetElement($get("cartAreaDIV"), true);
            ddb.addDragChannels(["cart"]);
            ddb.addDropChannels(["cart"]);
            ddb.get_events().addDropHandler(dropHandler);
            ddb.get_events().addDragMoveHandler(dragMove);
          //  ddb.get_events().addDragStartHandler(dragStart)
        }

        var removeBehavior = null;
        function dropHandler(source, evntArgs) {
            var panel = $get("cartAreaDIV");
            var eleID = evntArgs.get_manager().get_source().element.id;
            var ddb = removeBehavior;
            if (!ddb) {
                removeBehavior = ddb = new $IG.DragDropBehavior();
                ddb.addTargetElement($get("trashAreaDIV"), true);
                ddb.addDragChannels(["trash"]);
                ddb.addDropChannels(["trash"]);
                ddb.get_events().addDropHandler(removeHandler);
            }

            if (document.getElementById(eleID + "_div")) {
                var spanSource = document.getElementById(eleID + "_span").innerHTML;
                document.getElementById(eleID + "_span").innerHTML = parseInt(spanSource) + 1;
            } else {
                var div = document.createElement("div");
                div.id = eleID + "_div";
                div.className = "floatDIV";
                var spanpre = document.createElement("span");
                spanpre.innerHTML = eleID + " (";
                var span = document.createElement("span");
                span.innerHTML = "1";
                span.id = eleID + "_span";
                var spanend = document.createElement("span");
                spanend.innerHTML = ")";
                var img = document.createElement("img");
                img.src = evntArgs.get_manager().get_source().element.src;
                img.style.width = "45px";
                img.style.height = "44px";
                img.align = "middle";
                div.appendChild(img);
                div.appendChild(spanpre);
                div.appendChild(span);
                div.appendChild(spanend);
                panel.appendChild(div);
                ddb.addSourceElement(div);
            }
        }


        function dragMove(sender, evntArgs) {
            setCursor(sender);
        }

        function removeHandler(source, evntArgs) {
            var panel = $get("cartAreaDIV");
            var eleID = evntArgs.get_manager().get_source().element.id;
            eleIDshort = eleID.replace("_div", "");
            var panel = $get("cartAreaDIV");

            var spanSource = document.getElementById(eleIDshort + "_span").innerHTML;
            if (parseInt(spanSource) == 1) {
                panel.removeChild(document.getElementById(eleID));
            } else {
                document.getElementById(eleIDshort + "_span").innerHTML = parseInt(spanSource) - 1;
            }
        }

        function setCursor(ddb) {
            var dd = $get("<%=ddCursor.ClientID %>");
            var isUrl = (dd.selectedIndex > 1) ? true : false;
            ddb.set_moveCursor(dd.value, isUrl);
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
