<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function isNullorUndefined(val) {
            var u;
            return ((u === val) || (val == null));
        }
        function onDragEnter(sender, args) {
            if (args.get_destNode().get_valueString() == '<%= this.GetGlobalResourceObject("WebDataTree","File") %>') {
                args.set_cancel(true);
            }
        }



        function onClientNodeDropping(sender, args) {
            if (!isNullorUndefined(args.get_destNode())) {
                if (args.get_destNode().get_valueString() == '<%= this.GetGlobalResourceObject("WebDataTree","File") %>') {
                    args.set_cancel(true);
                }
            }
        }
    </script>
    <br />
    <div id="Center" class="TreeTopBackgroundImage"></div>
    <div class="BackgroundImage" >
        <div id="Left" style="display: inline; float: left; padding-left: 30px; height: auto;"
            class="TreeBackgroundImage">
            <b><%= this.GetGlobalResourceObject("WebDataTree","WebDataTree1") %></b>
            <ig:WebDataTree ID="DDWebDataTree1" runat="server" CheckBoxMode="BiState" Font-Size="Small"
                EnableConnectorLines="true" SelectionType="Single" Width="300px" OnDataBound="DDWebDataTree1_DataBound">
                <ClientEvents DragEnter="onDragEnter" NodeDropping="onClientNodeDropping" />
                <DragDropSettings AllowDrop="true" DragDropMode="Default" EnableDragDrop="true" />
                <DataBindings>
                    <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
                    <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
                </DataBindings>
            </ig:WebDataTree>
                      <div class="boxBackground2">
                <asp:CheckBox Text="<%$ Resources:WebDataTree,ConnectorLines %>" ID="WebDataTree1ConnLinesCheckBox" runat="server"
                    AutoPostBack="true" OnCheckedChanged="dataTreeConnLinesChecked" Checked="true" />
                <br />
                <asp:CheckBox Text="<%$ Resources:WebDataTree,CheckBox %>" ID="WebDataTree1CheckBox" runat="server" AutoPostBack="true"
                    Checked="true" OnCheckedChanged="dataTree1checkBoxChecked" />
                <br />
                <asp:CheckBox Text="<%$ Resources:WebDataTree,ClearImages %>" ID="LeftTreeClearImagesCheckBox" AutoPostBack="true"
                    Checked="false" OnCheckedChanged="onLeftTreeClearImages" runat="server" />
            </div>
        </div>
        <div id="right" style="display: inline; float: left; height: auto; padding-left: 30px;"
            class="TreeBackgroundImage">
            <b><%= this.GetGlobalResourceObject("WebDataTree","WebDataTree2") %></b>
            <ig:WebDataTree ID="DDWebDataTree2" runat="server" EnableConnectorLines="true" Font-Size="Small"
                Width="300px" SelectionType="Single" OnDataBound="DDWebDataTree1_DataBound">
                <ClientEvents DragEnter="onDragEnter" NodeDropping="onClientNodeDropping" />
                <DragDropSettings AllowDrop="true" DragDropMode="Default" EnableDragDrop="True" />
                <DataBindings>
                    <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
                    <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
                </DataBindings>
            </ig:WebDataTree>
            <div class="boxBackground2">
                <asp:CheckBox Text='<%$ Resources:WebDataTree,ConnectorLines %>' ID="WebDataTree2ConnLinesCheckBox" runat="server"
                    AutoPostBack="true" OnCheckedChanged="dataTreeConnLinesChecked" Checked="true" />
                <br />
                <asp:CheckBox Text="<%$ Resources:WebDataTree,CheckBox %>" ID="WebDataTree2CheckBox" runat="server" AutoPostBack="true"
                    Checked="false" OnCheckedChanged="dataTree2checkBoxChecked" />
                <br />
                <asp:CheckBox Text="<%$ Resources:WebDataTree,ClearImages %>" ID="RightTreeClearImagesCheckBox" AutoPostBack="true"
                    Checked="false" OnCheckedChanged="onRightTreeClearImages" runat="server" />
            </div>
        </div>
        <br />
        <br />
        <div class="boxBackground">
        <asp:CheckBox ID="AllowDropCheckBox" runat="server" Checked="true" AutoPostBack="true" OnCheckedChanged="allowDropCheckChanged"/><%= this.GetGlobalResourceObject("WebDataTree","AllowDrop") %> &nbsp
            <asp:CheckBox ID="EnableDragDropCheckBox" runat="server" Checked="true" AutoPostBack="true" OnCheckedChanged="enableDragDropChanged" /><%= this.GetGlobalResourceObject("WebDataTree","EnableDragDrop") %> &nbsp
        </div>
    </div>
</asp:Content>
