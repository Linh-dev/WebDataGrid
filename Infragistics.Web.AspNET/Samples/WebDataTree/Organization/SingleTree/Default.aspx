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
    <div  class="BackgroundImage">
    <div style=" padding-left:60px; " class="TreeBackgroundImage">
    <br /> 
    <b> <%= this.GetGlobalResourceObject("WebDataTree","ControlName") %> </b>
    <ig:WebDataTree id="DDWebDataTree" Visible="true" runat="server"  Width="320px" Font-Size="Small" SelectionType="Single" EnableConnectorLines="true" OnDataBound="DDWebDataTree1_DataBound">
    <DragDropSettings AllowDrop="true" DragDropMode="Default" EnableDragDrop="True" />
    <ClientEvents DragEnter="onDragEnter"
                  NodeDropping="onClientNodeDropping"
                  />
        <DataBindings>
            <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
            <ig:DataTreeNodeBinding DataMember="Folder" ValueField="Value" TextField="Text" ImageUrlField="ImageUrl" />
        </DataBindings>
    </ig:WebDataTree>
    <br />
    <div  class="boxBackground">
        <asp:CheckBox Text="<%$ Resources:WebDataTree,ConnectorLines %>" ID="WebDataTree1ConnLinesCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="dataTreeConnLinesChecked" Checked="true"/><br />
        <asp:CheckBox Text="<%$ Resources:WebDataTree,CheckBox %>" ID="WebDataTree1CheckBox" runat="server" AutoPostBack="true" Checked="false" OnCheckedChanged="dataTreecheckBoxChecked" /><br />
        <asp:CheckBox Text="<%$ Resources:WebDataTree,ClearImages %>" ID="ClearImageCheckBox" runat="server" AutoPostBack="true" Checked="false" OnCheckedChanged="onClearImages"  />
     </div>

    </div>
   </div>
</asp:Content>
