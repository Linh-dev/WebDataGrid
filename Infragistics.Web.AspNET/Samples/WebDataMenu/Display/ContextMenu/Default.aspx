<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataMenu_Display_Context_Menu_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .FontSmall
        {
            font-size: 10px;
        }
        a
        {
            font-size : 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataMenu runat="server" ID="ContextMenu" IsContextMenu="true" 
        BorderWidth="1" BorderColor="#CCCCCC" EnableScrolling="false">
        <ClientEvents ItemClick="MenuItem_Click" />
        <Items>
            <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, ContextMenuEdit %>" Key="edit"
                ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/edit.png" />
            <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, ContextMenuExpand %>"
                Key="expand" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/expand.png" />
            <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, ContextMenuExplore %>"
                Key="Explore" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/explore.png" />
            <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, ContextMenuNew %>" Key="New"
                ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/new.png" />
            <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, ContextMenuDelete %>"
                Key="Delete" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/stop.png" />
            <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, ContextMenuSendTo %>"
                Key="Sento" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/sendto.png" />
        </Items>
    </ig:WebDataMenu>
    <div style="width: 540px; height: 360px; padding-top: 30px; padding-left: 1px;">
        <div class="controlPanel" style="background-color: #ffffff; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/Display/VerticalMenu/TreeBg.jpg);
            background-repeat: no-repeat; border: 1px solid #EEEEEE; width: 573px; height: 300px;
            padding: 10px; font-size: 12px;">
            <ig:WebDataTree ID="dtWithContext" runat="server" Width="300px" Height="300px"
                DataSourceID="TreeDataSource" InitialExpandDepth="1">
                <ClientEvents NodeClick="Node_Click" />
                <DataBindings>
                    <ig:DataTreeNodeBinding DataMember="Group" TextField="Text" ValueField="Text" />
                    <ig:DataTreeNodeBinding DataMember="Fund" TextField="Text" ValueField="Text" />
                </DataBindings>
            </ig:WebDataTree>
        </div>
    </div>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/FinancialRisks/Group"
        DataFile='<%# this.GetXmlLocation("SampleData.xml") %>' />
    <script language="javascript" type="text/javascript">

        var lastNode = null;

        function MenuItem_Click(menu, eventArgs) {
            switch (eventArgs.getItem().get_key()) {
                case "edit":
                    if (lastNode != null) {
                        var tree = $find("<%= dtWithContext.ClientID %>");
                        if (tree != null)
                            tree._enterNodeEditing(lastNode);
                    }
                    break;
                case "expand":
                    if (lastNode != null)
                        lastNode.toggle(true, true);
                    break;
            }
        }

        function Node_Click(tree, eventArgs) {
            lastNode = eventArgs.getNode();
            var menu = $find("<%= ContextMenu.ClientID %>");

            if (menu != null && eventArgs.get_browserEvent() != null && eventArgs.get_browserEvent().button == 2) {
                menu.showAt(null, null, eventArgs.get_browserEvent());
            }

        }
    </script>
</asp:Content>
