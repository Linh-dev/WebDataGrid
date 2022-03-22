<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataTree/sampleWebtreeMenu.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function onEvent(sender, args) {
            var text = args._name;
            addLine(text);
        }
        function isNullorUndefined(val) {
            var u;
            return ((u === val) || (val == null));
        }
        function onDragEnter(sender, args) {
            if (args.get_destNode().get_valueString() == '<%= this.GetGlobalResourceObject("WebDataTree","File") %>') {
                args.set_cancel(true);
            }
            var text = args._name;
            addLine(text);
        }


        function onClientNodeDropping(sender, args) {
            if (!isNullorUndefined(args.get_destNode())) {
                if (args.get_destNode().get_valueString() == '<%= this.GetGlobalResourceObject("WebDataTree","File") %>') {
                    args.set_cancel(true);
                }
            }
            var text = args._name;
            addLine(text);
        }
        function clearNodes() {
            var target = $getPart('eventList', true);
            if (target)
                target.innerHTML = '<%= this.GetGlobalResourceObject("WebDataTree","OutPutOfClientEvents") %> <br />';
        }
    </script>
    <asp:Panel ID="Panel1" runat="server">
    <div id="div1" class="wgDataBind" >
        <div id="div2" class="ControlPanelHeader" style="height:40px">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataTree","ClientEvents") %></div>
        <div id="Div2" class="controlPanel" >
            <div id="eventList" class="controlPanelEvent" >
                    
            </div>
        </div>
    </div>
    </asp:Panel>
    <input type="button" id="clearButton" value="<%= this.GetGlobalResourceObject("WebDataTree","Clear") %>" onclick="clearNodes()" />
    <br />
            <b><%= this.GetGlobalResourceObject("WebDataTree","ClientEventsSampleDescription1") %></b>
    <br /> 
    <br />
    <div class="controlPanel BackgroundImage" style="display:inline; float:left" >       
    <div id="tree" style="display:inline; float:left;padding-left:30px;" class="TreeBackgroundImage">
        <ig:WebDataTree id="DDWebDataTree" Width="300px" Height="500px"
        runat="server" StyleSetName="Default" Font-Size="Small"
        SelectionType="Single"
        EnableAjax ="true"
        EnableConnectorLines="true" 
        ClientEvents-DragCancel="onEvent"
        ClientEvents-DragStart="onEvent"
        ClientEvents-DragEnd="onEvent"
        ClientEvents-DragEnter="onDragEnter"
        ClientEvents-DragLeave="onEvent"
        ClientEvents-NodeAdded="onEvent"
        ClientEvents-NodeAdding="onEvent"
        ClientEvents-NodeDropped="onEvent"
        ClientEvents-NodeDropping="onClientNodeDropping"
        ClientEvents-NodeRemoved="onEvent"
        ClientEvents-NodeRemoving="onEvent" >
   
        <DragDropSettings AllowDrop="true" EnableDragDrop="true"></DragDropSettings>
            <DataBindings>
                <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
                <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
            </DataBindings>
        </ig:WebDataTree>
    </div>
    </div>
</asp:Content>
