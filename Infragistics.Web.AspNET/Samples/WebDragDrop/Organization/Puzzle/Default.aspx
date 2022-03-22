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
    <style>
      	.dragPhoto
      	{
      		width: 80px;
      		height: 60px;
      		border: 1px solid #000000;
      	}
      	
      	.droppedPhoto
      	{
      		position: relative;
      		left: 0px;
      		top: 0px;
      		width: 160px;
      		height: 120px;
      		border: none;	
      	}
      </style>
      <br>
    <div align="center" style="position: relative; width: 520px; height:400px; background-image: url( /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uc_body.png);">
        <table cellspacing="0px" cellpadding="0px" style="width: 480px; height: 360px; position: relative; top: 20px; left: 1px;">
		<tr>
			<td style="width: 160px; height: 120px;"><div id="drop1" class="dropElem" style="position: relative; background-color: #AEAEAE; width: 160px; height: 120px;"></div></td>
			<td style="width: 160px; height: 120px;"><div id="drop2" class="dropElem" style="position: relative;  background-color: #DEDEDE; width: 160px; height: 120px;"></div></td>
			<td style="width: 160px; height: 120px;"><div id="drop3" class="dropElem" style="position: relative;  background-color: #FEFEFE;width: 160px; height: 120px;"></div></td>
		</tr>
		<tr>
			<td style="width: 160px; height: 120px;"><div id="drop4" class="dropElem" style="position: relative; background-color: #DEDEDE; width: 160px; height: 120px;"></div></td>
			<td style="width: 160px; height: 120px;"><div id="drop5" class="dropElem" style="position: relative; background-color: #FEFEFE; width: 160px; height: 120px;"></div></td>
			<td style="width: 160px; height: 120px;"><div id="drop6" class="dropElem" style="position: relative; background-color: #AEAEAE; width: 160px; height: 120px;"></div></td>
		</tr>
		<tr>
			<td style="width: 160px; height: 120px;"><div id="drop7" class="dropElem" style="position: relative; background-color: #FEFEFE; width: 160px; height: 120px;"></div></td>
			<td style="width: 160px; height: 120px;"><div id="drop8" class="dropElem" style="position: relative; background-color: #AEAEAE; width: 160px; height: 120px;"></div></td>
			<td style="width: 160px; height: 120px;"><div id="drop9" class="dropElem" style="position: relative; background-color: #DEDEDE; width: 160px; height: 120px;"></div></td>
		</tr>
        </table>
        <br />
        <br />
    </div>   
    
	
	<div id="drag2" class="dragPhoto" 
		 style="position: absolute; left: 570px; top: 322px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile05.png');"></div>
	<div id="drag3" class="dragPhoto" style="position: absolute; left: 580px; top: 125px; background-image: url( /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile04.png);"></div>
	<div id="drag4" class="dragPhoto" 
		 style="position: absolute; left: 524px; top: 54px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile03.png');"></div>
	<div id="drag5" class="dragPhoto" 
		 style="position: absolute; left: 549px; top: 105px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile09.png');"></div>
	<div id="drag6" class="dragPhoto" 
		 style="position: absolute; left: 530px; top: 271px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile08.png');"></div>
	<div id="drag7" class="dragPhoto" 
		 style="position: absolute; left: 592px; top: 26px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile06.png');"></div>
	<div id="drag8" class="dragPhoto" 
		 style="position: absolute; left: 577px; top: 215px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile01.png');"></div>
	<div id="drag9" class="dragPhoto" 
		 style="position: absolute; left: 591px; top: 142px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile07.png');"></div>
	<div id="drag1" class="dragPhoto" 
		 style="position: absolute; left: 532px; top: 170px; background-image: url(' /SamplesBrowser/SamplesCommon/aspnet/WebDragDrop/Display/Puzzle/uctile02.png');"></div>
    
	
    <script type="text/javascript">
        Sys.Application.add_load(appLoaded);
        function appLoaded() {
            var ddb1 = new $IG.DragDropBehavior();
            ddb1.addTargetElement($get("drop1"));
            ddb1.addSourceElement($get("drag8"));
            ddb1.get_events().addDropHandler(dropped);
            ddb1.addDropChannels(["d1"]);
            ddb1.addDragChannels(["d1"]);

            var ddb2 = new $IG.DragDropBehavior();
            ddb2.addTargetElement($get("drop2"));
            ddb2.addSourceElement($get("drag1"));
            ddb2.get_events().addDropHandler(dropped);
            ddb2.addDropChannels(["d2"]);
            ddb2.addDragChannels(["d2"]);

            var ddb3 = new $IG.DragDropBehavior();
            ddb3.addTargetElement($get("drop3"));
            ddb3.addSourceElement($get("drag4"));
            ddb3.get_events().addDropHandler(dropped);
            ddb3.addDropChannels(["d3"]);
            ddb3.addDragChannels(["d3"]);

            var ddb4 = new $IG.DragDropBehavior();
            ddb4.addTargetElement($get("drop4"));
            ddb4.addSourceElement($get("drag3"));
            ddb4.get_events().addDropHandler(dropped);
            ddb4.addDropChannels(["d4"]);
            ddb4.addDragChannels(["d4"]);

            var ddb4 = new $IG.DragDropBehavior();
            ddb4.addTargetElement($get("drop5"));
            ddb4.addSourceElement($get("drag2"));
            ddb4.get_events().addDropHandler(dropped);
            ddb4.addDropChannels(["d5"]);
            ddb4.addDragChannels(["d5"]);

            var ddb4 = new $IG.DragDropBehavior();
            ddb4.addTargetElement($get("drop6"));
            ddb4.addSourceElement($get("drag7"));
            ddb4.get_events().addDropHandler(dropped);
            ddb4.addDropChannels(["d6"]);
            ddb4.addDragChannels(["d6"]);

            var ddb4 = new $IG.DragDropBehavior();
            ddb4.addTargetElement($get("drop7"));
            ddb4.addSourceElement($get("drag9"));
            ddb4.get_events().addDropHandler(dropped);
            ddb4.addDropChannels(["d7"]);
            ddb4.addDragChannels(["d7"]);

            var ddb4 = new $IG.DragDropBehavior();
            ddb4.addTargetElement($get("drop8"));
            ddb4.addSourceElement($get("drag6"));
            ddb4.get_events().addDropHandler(dropped);
            ddb4.addDropChannels(["d8"]);
            ddb4.addDragChannels(["d8"]);

            var ddb4 = new $IG.DragDropBehavior();
            ddb4.addTargetElement($get("drop9"));
            ddb4.addSourceElement($get("drag5"));
            ddb4.get_events().addDropHandler(dropped);
            ddb4.addDropChannels(["d9"]);
            ddb4.addDragChannels(["d9"]);
        }


        function dropped(sender, args) {
            var manager = args.get_manager();
            var target = manager.get_targetElement();
            if (target.childNodes.length < 2) {
                var sourceElement = manager.get_source().element;
                sourceElement.style.position = "relative";
                sourceElement.style.width = "160px";
                sourceElement.style.height = "120px";
                sourceElement.style.top = "0px";
                sourceElement.style.left = "0px";
                sourceElement.style.borderWidth = "0px";
                target.appendChild(sourceElement);
            }
        }
            
            
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" Runat="Server">
</asp:Content>

