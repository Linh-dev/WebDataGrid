<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Width="600" Modal="false"
        WindowState="Normal" Moveable="false" MaintainLocationOnScroll="false" Top="100px"
        Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false">
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <div class="OptionPanel">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
                        RenderMode="Inline">
                        <ContentTemplate>
                            <div id="container">
                                <table id="propertyList" style="width: 100%;" cellspacing="0" border="0">
                                    <td style="background-color: White; border-right: 1px solid #89bd37; vertical-align: top;">
                                        <div style="width: 300px; margin-top: 5px;">
                                            <div style="height: 0px">
                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" >
                                                    <ProgressTemplate>
                                                        <img src="/samplesbrowser/samplescommon/aspnet/Common/ajax-loader.gif" alt="Loading..." />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </div>
                                        </div>
                                        <ig:WebDataTree ID="WebDataTreeSample" runat="server" DataSourceID="TreeDataSource"
                                            SelectionType="None" Height="400px" Width="300px" Style="float: left" EnableAutoChecking="true" Font-Size="Small"
                                            InitialExpandDepth="0" EnableConnectorLines="False" StyleSetName="IG">
                                            <ClientEvents NodeChecking="webdatatree_NodeChecking" />
                                            <DataBindings>
                                                <ig:DataTreeNodeBinding DataMember="Group" TextField="Name" ValueField="Name" />
                                                <ig:DataTreeNodeBinding DataMember="Feed" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
                                            </DataBindings>
                                        </ig:WebDataTree>
                                        <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/RssFeeds/Group" />
                                    </td>
                                    <td class="propertyPanel">
                                        <div>
                                            <table style="width: 100%;">
                                                <tr class="itemRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataTree","EnableConnectorCaption") %>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="EnableConnectorLines" runat="server" AutoPostBack="true" />
                                                    </td>
                                                </tr>
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataTree","AnimationDuration")%>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="AnimationDuration" AutoPostBack="true" runat="server">
                                                            <asp:ListItem Selected="True" Text="0"></asp:ListItem>
                                                            <asp:ListItem Text="50"></asp:ListItem>
                                                            <asp:ListItem Text="100"></asp:ListItem>
                                                            <asp:ListItem Text="250"></asp:ListItem>
                                                            <asp:ListItem Text="500"></asp:ListItem>
                                                            <asp:ListItem Text="1000"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr class="itemRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataTree","AnimationEquation")%>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="AnimationEquation" AutoPostBack="true" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataTree","CheckboxMode") %>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="CheckBoxMode" AutoPostBack="true" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="itemRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataTree","SelectionType") %>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="SelectionType" AutoPostBack="true" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="altRow">
                                                    <td class="textAlignR">
                                                        <%= this.GetGlobalResourceObject("WebDataTree","EnableAutoChecking") %>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkEnableAutoChecking" runat="server" AutoPostBack="true" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>

    <script type="text/javascript">
        function webdatatree_NodeChecking(sender, e) {

            var CheckBoxMode = document.getElementById("<%= CheckBoxMode.ClientID %>");
            var chkEnableAutoChecking = document.getElementById("<%= chkEnableAutoChecking.ClientID %>");

            if (CheckBoxMode.value != "TriState" || chkEnableAutoChecking.checked)
                return;

            var state = e.getNode().get_checkState();
            if (state == 2)
                state = -1;

            state++;
            e.getNode().set_checkState(state);
            e.set_cancel(true);

        }
    </script>

</asp:Content>
