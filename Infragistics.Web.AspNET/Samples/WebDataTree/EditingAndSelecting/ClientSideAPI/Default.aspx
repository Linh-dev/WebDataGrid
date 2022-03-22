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

        var textBoxNewNode;
        var nodeArray;
        var indexTextBox;
        var selectIndexLabel;
        var insertTextBox;

        var currentTree;

        function pageLoad() {
            nodeArray = new Array();
            textBoxNewNode = document.getElementById('<%= newNodeTextBox.ClientID %>');
            arrayTextBox = document.getElementById('<%= arrayTextBox.ClientID %>');
            indexTextBox = document.getElementById('<%= indexTextBox.ClientID %>');
            selectIndexLabel = document.getElementById("selectIndexLabel");
            insertTextBox = document.getElementById('<%= insertTextBox.ClientID %>');
            if (!currentTree)
                currentTree = $find("ctl00_ContentLive_DDWebDataTree");
        }
        function clearNodes() {
            var target = $getPart('eventList', true);
            if (target)
                target.innerHTML = '<%= this.GetGlobalResourceObject("WebDataTree","NodeCollection") %> <br />';
            listCount = 0;
        }
        function isNullorUndefined(val) {
            var u;
            return ((u === val) || (val == null));
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
            } else {
                currentTree.add(node, null);
            }

        }
        function deleteNode() {
            var checkedNodes = currentTree.get_checkedNodes();
            var selectedNodes = currentTree.get_selectedNodes();
            if ((selectedNodes.length == 0) && (checkedNodes.length == 0)) {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertSelectNodeToBeRemoved") %>');

            }
            else {
                if (selectedNodes.length != 0) {
                    var selectedNode = selectedNodes[0];
                    currentTree.remove(selectedNode);
                }
                else {

                    for (var i = 0; i < (checkedNodes.length); i++) {

                        currentTree.remove(checkedNodes[i]);
                    }

                }
            }
        }
        function addNodeArray() {
            var nodeText = arrayTextBox.value;
            if ((isNullorUndefined(nodeText)) || (nodeText == "")) {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertSpecifyNodeName") %>');
                return false;
            }
            var node = currentTree.createNode(nodeText);
            nodeArray.push(node);
            arrayTextBox.value = "";
            addLine(nodeText);
        }
        function addArrayToTree() {
            var parent = currentTree.get_selectedNodes();
            var location;
            if ((!isNullorUndefined(parent)) && (parent.length > 0)) {
                location = $adrutil.getLocationFromDomElement(parent[0].get_element());
            }
            else {
                location = null;
            }

            if (nodeArray.length == 0) {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertAddNodesToArray") %>');
            }
            else {
                currentTree.addRange(nodeArray, location, -1);
            }
            nodeArray = new Array();
            clearNodes();
        }
        function insertNode() {
            var parent = currentTree.get_selectedNodes();
            var location;
            if (!parent || parent.length < 1)
            {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertSelectNode") %>');
                return false;
            }
            if ((!isNullorUndefined(parent)) && (parent.length > 0)) {
                location = $adrutil.getLocationFromDomElement(parent[0].get_element());
            }
            var index = parseInt(indexTextBox.value);
            var nodeText = insertTextBox.value;

            if (!nodeText) {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertEnterNodeText") %>');
                return false;
            }
            var node = currentTree.createNode(nodeText);
            var parent = currentTree.get_selectedNodes();
            var childrenCount = parent[0].get_childrenCount();
            if ((index != "NaN") && (index >= -1) && (index <= childrenCount)) {
                currentTree.insert(node, location, index);
            }

            else {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertEnterCorrectIndex") %>');
                return false;

            }
            indexTextBox.value = "";
            insertTextBox.value = "";
        }

        function DDWebDataTreeNodeSelected(sender, args) {
            currentTree = sender;
            NodeSelected();
        }


        function NodeSelected() {
            var parent = currentTree.get_selectedNodes();
            if (!parent || parent.length < 1)
            {
                alert('<%= this.GetGlobalResourceObject("WebDataTree","AlertSelectNode") %>');
                return false;
            }
            var childrenCount = parent[0].get_childrenCount();
            var str;
            if (childrenCount == 0) {
                str = '<%= this.GetGlobalResourceObject("WebDataTree","PleaseFillInIndex0") %>';
            }
            else {
                str = String.format('<%= this.GetGlobalResourceObject("WebDataTree","PleaseFillInIndexBetween0and") %>', childrenCount);
            }
            selectIndexLabel.value = str;
        }

        function initTree(tree) {
            currentTree = tree;
        }

    </script>

    <div style="padding-top:30px;">
        <div id="Left" style="display: inline; float: left; width: 220px; padding-left: 70px; height:auto;">
        <h2><b> <%= this.GetGlobalResourceObject("WebDataTree","ControlName") %> </b></h2>
        <ig:WebDataTree id="DDWebDataTree" runat="server"
        NodeSettings-ParentNodeImageUrl ="/SamplesBrowser/SamplesCommon/aspnet/WebDataTree/EditingAndSelection/ClientSideAPI/folder.gif" 
        NodeSettings-LeafNodeImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataTree/EditingAndSelection/ClientSideAPI/folder_images.gif" 
        SelectionType="Single" Font-Size="Small"
        EnableConnectorLines="true" 
        CheckBoxMode="BiState">
        <DragDropSettings AllowDrop="false" EnableDragDrop="false"></DragDropSettings>
        <ClientEvents SelectionChanged="DDWebDataTreeNodeSelected" Initialize="initTree" />
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
        <br />
                <asp:CheckBox Text="<%$ Resources:WebDataTree,ConnectorLines %>" ID="WebDataTree1ConnLinesCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="dataTreeConnLinesChecked" Checked="true"/>
                <br />
                <asp:CheckBox Text="<%$ Resources:WebDataTree,CheckBox %>" ID="WebDataTree1CheckBox" runat="server" AutoPostBack="true" Checked="true" OnCheckedChanged="dataTreecheckBoxChecked" /> 
                <br />

        </div>

            <div id="Center" class="rightPanel">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Panel ID="Panel11" runat="server" Width="340px" CssClass="panelBackground">
                        <p > <%= this.GetGlobalResourceObject("WebDataTree","AddNewNode") %> </p>
                        <fieldset>
                         <div class="labe">      
                            <label for="<%= newNodeTextBox.ClientID %>"><%= this.GetGlobalResourceObject("WebDataTree","NodeName") %></label></div>
                            <asp:TextBox ID="newNodeTextBox" runat="server"></asp:TextBox>
                            <div class="buttonsHolder" style="width:328px">
                                <button type="button"  id="newNodeButton" onclick="addNode()"><img src="/samplesbrowser/samplescommon/aspnet/WebDataTree/EditingAndSelection/ClientSideAPI/add.png" /><%= this.GetGlobalResourceObject("WebDataTree","AddNode") %></button>
                                <button type="button"  id="deleteButton" onclick="deleteNode()"><img src="/samplesbrowser/samplescommon/aspnet/WebDataTree/EditingAndSelection/ClientSideAPI/bin_empty.png" /><%= this.GetGlobalResourceObject("WebDataTree","DelSelectedNode") %></button>
                            </div>                        
                        </fieldset>                   
                    </asp:Panel>

                    <div id="countContainer" class="controlPanel" style="width:340px;">
                        <asp:Panel ID="Panel3" runat="server">
                            <p ><%= this.GetGlobalResourceObject("WebDataTree","ClientAPISampleDescription3") %></p>

                            <fieldset>   
                            <div class="labe">                              
                                <label for="<%= arrayTextBox.ClientID %>"><%= this.GetGlobalResourceObject("WebDataTree","NodeName") %></label></div>
                                <asp:TextBox ID="arrayTextBox" runat="server"></asp:TextBox>
                            
                                <div class="buttonsHolder">
                                    <button type="button" id="addToArrayButton" onclick="addNodeArray()"><img src="/samplesbrowser/samplescommon/aspnet/WebDataTree/EditingAndSelection/ClientSideAPI/add.png" /><%= this.GetGlobalResourceObject("WebDataTree","AddNodeToCollection") %></button>
                                </div>
                                <div id="eventList" class="controlPanelEvent" style="height:35px;margin-left:100px;margin-top:7px;">
                                    <%= this.GetGlobalResourceObject("WebDataTree","NodeCollection") %>
                                    <br />
                                </div>

                                <div class="buttonsHolder">
                                    <button type="button" id="addArrayToTreeButton" onclick="addArrayToTree()"><img src="/samplesbrowser/samplescommon/aspnet/WebDataTree/EditingAndSelection/ClientSideAPI/add.png" /><%= this.GetGlobalResourceObject("WebDataTree","AddCollectionToTree") %></button>
                                </div>                            
                            </fieldset>
                        </asp:Panel>
                    </div>

                    <asp:Panel ID="BottomPanel" CssClass="panelBackground" Width="340px" runat="server">                
                        <label for="selectIndexLabel"><%= this.GetGlobalResourceObject("WebDataTree","ClientAPISampleDescription4") %></label>
                        <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Left">
                            <fieldset>                            
                                <input type="text" id="selectIndexLabel"  />
                                <div class="labe">                             
                                <label for="<%= insertTextBox.ClientID %>"><%= this.GetGlobalResourceObject("WebDataTree","NodeName") %></label></div>
                                <asp:TextBox ID="insertTextBox" runat="server"></asp:TextBox>
                           
                                <br />
                             <div class="labe">     
                                <label for="<%= indexTextBox.ClientID %>"><%= this.GetGlobalResourceObject("WebDataTree","Index") %></label></div>     
                                <asp:TextBox ID="indexTextBox" runat="server"></asp:TextBox>
                                <br />

                                <div class="buttonsHolder">
                                    <button type="button" id="insertButton" onclick="insertNode()"><img src="/samplesbrowser/samplescommon/aspnet/WebDataTree/EditingAndSelection/ClientSideAPI/add.png" /><%= this.GetGlobalResourceObject("WebDataTree","Insert") %></button>
                                </div>                            
                             </fieldset>
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>
            </div>
        </div>
</asp:Content>
