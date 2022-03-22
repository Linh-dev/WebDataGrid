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
        var currentTree;
        var textBoxNewNode;

        function pageLoad() {
            textBoxNewNode = document.getElementById('<%= newNodeTextBox.ClientID %>');
            currentTree = $find("<%=DDWebDataTree.ClientID %>");
        }

        function isNullorUndefined(val) {
            var u;
            return ((u === val) || (val == null));
        }

        function deleteNode() {
            var selectedNodes = currentTree.get_selectedNodes();
            if (selectedNodes.length == 0) {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertSelectNodeToBeRemoved") %>');
            }
            else {
                var selectedNode = selectedNodes[0];
                currentTree.remove(selectedNode);
            }
        }

        function addNode() {
            var nodeText = textBoxNewNode.value;
            textBoxNewNode.value = "";
            if (isNullorUndefined(nodeText) || (nodeText == "")) {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertSpecifyNodeName") %>');
                return false;
            }
            var parent = currentTree.get_selectedNodes();
            var location;
            if ((!isNullorUndefined(parent)) && (parent.length > 0)) {
                location = $adrutil.getLocationFromDomElement(parent[0].get_element());
            }

            var node = currentTree.createNode(nodeText);
            if (!isNullorUndefined(location)) {
                currentTree.add(node, location);
            }
            else {
                currentTree.add(node, null);
            }
        }
    </script>
    <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true" UpdateMode="Conditional">
        
        <ContentTemplate>
            <div id="div1" class="wgDataBind">
                <div id="div2" class="ControlPanelHeader" style="height:33px">
                    <img src="/samplesbrowser/samplescommon/aspnet/Common/serverSideEvent.png" />
                    <%= this.GetGlobalResourceObject("WebDataTree","ServerEvents") %></div>
                <div id="Div2" class="controlPanel">
                    <div id="Div3" class="controlPanelEventServer" runat="server">
                    <asp:Label ID="ServerMessage" style="overflow:scroll"
                     runat="server"></asp:Label>
                    </div>
                </div>
            </div>
    <div class="controlPanel" style="display:inline; float:left">       
    <div id="tree" style="display:inline; float:left;">
    <ig:WebDataTree id="DDWebDataTree" Width="230px" Height="330px"
    runat="server"
    NodeSettings-ParentNodeImageUrl ="/SamplesBrowser/SamplesCommon/aspnet/WebDataTree/Organization/ServerEventsDragDrop/folder.gif" 
    NodeSettings-LeafNodeImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataTree/Organization/ServerEventsDragDrop/folder_images.gif" Font-Size="Small"
    SelectionType="Single"
    EnableAjax ="true"
    CheckBoxMode="Off"
    EnableConnectorLines="true"
    OnNodeAdded="serverNodeAdded"
    OnNodeDropped = "serverNodeDropped"
    OnNodeRemoved= "serverNodeRemoved">

    <DragDropSettings AllowDrop="true" EnableDragDrop="true"></DragDropSettings>
    <AutoPostBackFlags NodeDropped="On" NodeAdded="On" NodeRemoved="On" />
   <Nodes>            
            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Computer %>"  Expanded="true">
                <Nodes>
                    <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Music %>" Expanded="true">
                        <Nodes>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,YMalmsteen %>"></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,WhiteSnake %>"></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,ACDC %>"></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Rock %>"></ig:DataTreeNode>
                        </Nodes>
                    </ig:DataTreeNode>
                    <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Pictures %>" Expanded="true">
                        <Nodes>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,BirthDay2009 %>" ></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree, BirthDay2010 %>"></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Formula1 %>" ></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,WRC %>" ></ig:DataTreeNode>
                        </Nodes>
                    </ig:DataTreeNode>
                    <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Network %>" Expanded="true">
                        <Nodes>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Archive %>"></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,BackUp %>"></ig:DataTreeNode>
                            <ig:DataTreeNode Text="<%$ Resources:WebDataTree,FTP %>"></ig:DataTreeNode>
                         </Nodes>
                    </ig:DataTreeNode>
                    <ig:DataTreeNode Text="<%$ Resources:WebDataTree,Deleted %>" Expanded="true">
                    
                    </ig:DataTreeNode>
                </Nodes>
            </ig:DataTreeNode>
    </Nodes>
    </ig:WebDataTree>
    </div>
    <div id="add" style="display:inline; float:left;padding-top:15px; width: 293px;">
        <asp:Panel ID="panel1" runat="server" HorizontalAlign="center" Width="293px" CssClass="addPanel">
           <%= this.GetGlobalResourceObject("WebDataTree","EnterNodeName") %>
            <br />
            <label for="<%= newNodeTextBox.ClientID %>"><%= this.GetGlobalResourceObject("WebDataTree","NodeName") %></label>
            <asp:TextBox ID="newNodeTextBox" Style="margin: 5px 0 5px 0;width:185px" runat="server"></asp:TextBox>
             <button type="button" id="newNodeButton" onclick="addNode()"><img src="/samplesbrowser/samplescommon/aspnet/WebDataTree/Organization/ServerEventsDragDrop/add.png" /><%= this.GetGlobalResourceObject("WebDataTree","AddNode") %></button>
             <button type="button" id="deleteButton" onclick="deleteNode()"><img src="/samplesbrowser/samplescommon/aspnet/WebDataTree/Organization/ServerEventsDragDrop/bin_empty.png" /><%= this.GetGlobalResourceObject("WebDataTree","DelSelectedNode") %></button>
            </asp:Panel>
     </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

