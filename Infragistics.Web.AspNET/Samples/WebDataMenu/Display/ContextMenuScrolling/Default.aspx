<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        a
        {
            font-size : 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDataMenu runat="server" ID="ContextMenu" IsContextMenu="true" EnableScrolling="true"
        StyleSetName="IG" BorderWidth="1" BorderColor="#CCCCCC" DataSourceID="ContexMenuDataSource">
        <GroupSettings Height="150px" EnableAnimation="false" Orientation="Vertical"/>
        <DataBindings>
            <ig:DataMenuItemBinding DataMember="Menu" TextField="Value" ImageUrlField="ImageUrl" />
        </DataBindings>
    </ig:WebDataMenu>
    <div style="background-color: #ffffff; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
        margin-top: 50px; background-repeat: no-repeat; border: 1px solid #EEEEEE; width: 573px;
        height: 300px; padding: 10px;">
        <ig:WebDataTree ID="dtWithContext" runat="server" EnableConnectorLines="true" Width="300px"
            EnableWordWrapping="false" DataSourceID="MenuScrollingSimpleDataSource" InitialExpandDepth="1" StyleSetName="IG">
            <ClientEvents NodeClick="Node_Click" />
            <DataBindings>
                <ig:DataTreeNodeBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value"
                    ImageUrlField="ImageUrl" />
            </DataBindings>
        </ig:WebDataTree>
    </div>
    <asp:XmlDataSource runat="server" ID="MenuScrollingSimpleDataSource" XPath="/MenuData/MyComputer/Menu" />
    <asp:XmlDataSource runat="server" ID="ContexMenuDataSource" XPath="/MenuData/ContextMenu/Menu" />
    <script language="javascript" type="text/javascript">
        function Node_Click(sender, args) {
            var menu = $find("<%= ContextMenu.ClientID %>");

            if (menu != null && args.get_browserEvent() != null && args.get_browserEvent().button == 2) {
                menu.showAt(null, null, args.get_browserEvent());
            }
        }
    </script>
</asp:Content>

