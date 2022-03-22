<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="margin: 45px; margin-left:0px; position: relative; min-height: 300px;">
        <ig:WebExplorerBar EnableViewState="false" ID="WebExplorerBar1" Width="300px" GroupContentsHeight="150px"
            runat="server">
            <ClientEvents ItemClick="explorerBar_ItemClick" />
            <DataBindings>
                <ig:ExplorerBarItemBinding DataMember="Country" TextField="Name" />
                <ig:ExplorerBarItemBinding DataMember="State" TextField="Name" />
                <ig:ExplorerBarItemBinding DataMember="City" TextField="Name" />
            </DataBindings>
        </ig:WebExplorerBar>
        <table style="position: absolute; left: 350px; top: 0; border: 1px solid #EEEEEE;
            padding: 10px; background-color: #f7f7f7; width: 350px;">
            <tr class="itemRow">
                <td class="textAlignR">
                    <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ClientSide_ChooseGroup")%>
                </td>
                <td>
                    <ig:WebDropDown ID="WebDropDown1" runat="server"
                        Width="200px" TextField="Text"  ValueField="Value" EnableDropDownAsChild="true"
                        EnableAutoCompleteFirstMatch="false" EnableAnimations="false" DropDownContainerWidth="200px"
                        DropDownContainerHeight="200px">
                        <ClientEvents SelectionChanged="indexChanging1" />
                    </ig:WebDropDown>
                </td>
            </tr>
            <tr class="altRow">
                <td class="textAlignR">
                    <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ClientSide_ChooseItems")%>
                </td>
                <td>
                    <ig:WebDropDown EnableViewState="false" ID="WebDropDown2"
                        runat="server" Width="200px" TextField="Text" ValueField="Value" EnableAutoCompleteFirstMatch="false"
                        EnableAnimations="false" DropDownContainerWidth="200px" EnableDropDownAsChild="true"
                        DropDownContainerHeight="200px">
                        <ClientEvents SelectionChanged="indexChanging2" />
                    </ig:WebDropDown>
                </td>
            </tr>
            <tr class="itemRow">
                <td class="textAlignR">
                    <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ClientSide_ChooseSubItems")%>
                </td>
                <td>
                    <ig:WebDropDown EnableViewState="false" ID="WebDropDown3"
                        EnableDropDownAsChild="true" runat="server" Width="200px" TextField="Text" ValueField="Value"
                        EnableAutoCompleteFirstMatch="false" EnableAnimations="false" DropDownContainerWidth="200px"
                        DropDownContainerHeight="200px">
                        <ClientEvents SelectionChanged="indexChanging3" />
                    </ig:WebDropDown>
                </td>
            </tr>
            <tr class="altRow">
                <td class="textAlignR">
                    <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_PropertyExplorer_ChooseAction")%>
                </td>
                <td>
                    <ig:WebDropDown ID="WebDropDown4" runat="server" Width="200px" TextField="Text" ValueField="Value"
                        DisplayMode="DropDownList" DropDownContainerWidth="200px" DropDownContainerHeight="200px">
                        <ClientEvents SelectionChanged="indexChanging4" />
                        <Items>
                            <ig:DropDownItem Text="<%$ Resources: WebExplorerBar, Select %>">
                            </ig:DropDownItem>
                            <ig:DropDownItem Text="<%$ Resources: WebExplorerBar, Toggle%>">
                            </ig:DropDownItem>
                            <ig:DropDownItem Text="<%$ Resources: WebExplorerBar, Enabele_Disable%>">
                            </ig:DropDownItem>
                            <ig:DropDownItem Text="<%$ Resources: WebExplorerBar, Change_Text%>">
                            </ig:DropDownItem>
                        </Items>
                    </ig:WebDropDown>
                </td>
            </tr>
            <tr class="itemRow">
                <td class="textAlignR">
                    <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ClientSide_InputText")%>
                </td>
                <td>
                    <asp:TextBox Width="195px" runat="server" ID="TextBox1" Text="<%$ Resources:WebExplorerBar, WebExplorerBar_ClientSide_SampleText %>"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="clear"></div>
    </div>
    <asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="countries/country" />

    <script type="text/javascript">

        var countryIndex = 0;
        var cityIndex = -1;
        var stateIndex = -1;
        var actionIndex = 0;
        var isExplorerBar = false;




        function explorerBar_ItemClick(sender, eventArgs) {
            isExplorerBar = true;
        }

        function indexChanging1(sender, eventArgs) {
            var combo2 = $find('<%= WebDropDown2.ClientID %>');
            combo2.loadItems(eventArgs.getNewSelection()[0].get_text());
            combo2.set_currentValue("", true);

            combo3 = $find('<%= WebDropDown3.ClientID %>');
            combo3._elements["List"].innerHTML = "";
            combo3.set_currentValue("", true);

            isExplorerBar = false;
            countryIndex = eventArgs.getNewSelection()[0].get_index();
            doSelectedAction(getActiveItemObject("group"));
        }

        function indexChanging2(sender, eventArgs) {
            var combo3 = $find('<%= WebDropDown3.ClientID %>');
            combo3.loadItems(eventArgs.getNewSelection()[0].get_text());

            isExplorerBar = false;
            stateIndex = eventArgs.getNewSelection()[0].get_index();
            doSelectedAction(getActiveItemObject("item"));
        }
        function indexChanging3(sender, eventArgs) {
            isExplorerBar = false;
            cityIndex = eventArgs.getNewSelection()[0].get_index();
            doSelectedAction(getActiveItemObject("subItem"));
        }
        function indexChanging4(sender, eventArgs) {
            actionIndex = eventArgs.getNewSelection()[0].get_index();
            var explorerBar = $find('<%= WebExplorerBar1.ClientID %>');

            if (isExplorerBar)
                doSelectedAction(explorerBar.get_selectedItem());
            else {
                if (stateIndex < 0 && cityIndex < 0)
                    doSelectedAction(getActiveItemObject("group"));
                else if (stateIndex >= 0 && cityIndex < 0)
                    doSelectedAction(getActiveItemObject("item"));
                else
                    doSelectedAction(getActiveItemObject("subItem"));
            }
        }



        function getActiveItemObject(itemType) {
            var explorerBar = $find('<%= WebExplorerBar1.ClientID %>');
            var groupCollection = explorerBar.getExplorerBarItems();
            var group = groupCollection.getItem(countryIndex);
            expand(group);

            switch (itemType) {
                case "group":
                    var activeItem = group;
                    break;
                case "item":
                    activeItem = group.get_childItem(stateIndex);
                    expand(activeItem);
                    break;
                case "subItem":
                    activeItem = group.get_childItem(stateIndex).get_childItem(cityIndex);
                    break;
            }
            scrollToSelected(groupCollection, countryIndex, group, activeItem._node._element.offsetTop, explorerBar._element.offsetTop);

            return activeItem;
        }

        function doSelectedAction(activeItem) {

            switch (actionIndex) {
                case 0: //select
                    if (!activeItem.get_selected())
                        activeItem.set_selected(true);
                    break;
                case 1: //toggle
                    activeItem.toggle(true);
                    break;
                case 2: //enable
                    if (activeItem.get_enabled()) {
                        activeItem.set_selected(false);
                        activeItem.set_enabled(false);
                    }
                    else
                        activeItem.set_enabled(true);
                    break;
                case 3: //change text
                    var text = document.getElementById('<%= TextBox1.ClientID %>').value;
                    activeItem.set_text(text);
            }
        }

        function expand(item) {
            if (item.get_expanded())
                return;
            else
                item.toggle(true);
        }

        function scrollToSelected(groupCollection, index, group, activeItemOffsetTop, controlOffsetTop) {
            var scrollHeighValue = controlOffsetTop + group._node._element.children[0].offsetHeight;
            for (var i = 0; i < index; i++) {
                scrollHeighValue += groupCollection.getItem(i)._node._element.offsetHeight;
            }
            group._node._element.children[1].scrollTop = activeItemOffsetTop - scrollHeighValue;
        }
    </script>
</asp:Content>

