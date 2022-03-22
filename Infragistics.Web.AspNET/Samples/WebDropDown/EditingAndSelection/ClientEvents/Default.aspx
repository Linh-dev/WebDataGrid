<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="div1" class="wgDataBind">
        <div id="div2" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
            </div>
        </div>
    </div>
    <div id="wrapper" class="wgDataBind">        
            <table>
                <tr valign="middle">
                    <td align="left" style="height:26px;padding:2px;">
                        <ig:WebDropDown ID="myDropDown" runat="server" Width="200px" DropDownContainerWidth="200px"
                            DropDownAnimationDuration="2000" EnableDropDownAsChild="false" LoadingItemsMessageText="Loading items..." AccessKey="j" StyleSetName="IG">
                            <ClientEvents Initialize="Initialize" AutoFilterStarted="autoFilterStarted" AutoFilterStarting="autoFilterStarting"
                                ItemAdded="itemAdded" ItemsRequested="itemsRequested" DropDownOpening="dropDownOpening"
                                DropDownOpened="dropDownOpened" DropDownClosing="dropDownClosing" DropDownClosed="dropDownClosed"
                                SelectionChanged="selectedIndexChanged" SelectionChanging="selectedIndexChanging"
                                ValueChanged="valueChanged" ValueChanging="valueChanging" />
                            <Items>
                                <ig:DropDownItem Text="A.M.">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="Being There">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="Mermaid Avenue">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="Summerteeth">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="Mermaid Avenue Vol. II">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="Yankee Hotel Foxtrot">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="A Ghost Is Born">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="Kicking Television">
                                </ig:DropDownItem>
                                <ig:DropDownItem Text="Sky Blue Sky ">
                                </ig:DropDownItem>
                            </Items>
                        </ig:WebDropDown>
                    </td>
                    <td valign="middle" style="height:26px;padding:2px;">
                        <asp:TextBox ID="txtNewItem" Height="22px" runat="server" />
                    </td>
                    <td style="height:26px;padding:2px;">
                        <asp:ImageButton ID="btnAdd" ImageUrl="/samplesbrowser/samplescommon/aspnet/WebDropDown/EditingAndSelection/ClientEvents/Plus.png" AlternateText="Add Item"
                            OnClientClick="addItem(); return false;" runat="server" />
                    </td>
                </tr>
            </table>
    </div>

    <script type="text/javascript">

        function Initialize(sender, eventArgs) {
            addLine("Initialize");
        }

        function autoFilterStarting(sender, eventArgs) {
            addLine("AutoFilterStarting");
        }

        function autoFilterStarted(sender, eventArgs) {
            addLine("AutoFilterStarted");
        }

        function itemsRequested(sender, eventArgs) {
            addLine("ItemsRequested");
        }

        function dropDownClosing(sender, eventArgs) {
            addLine("DropDownClosing");
        }

        function dropDownOpening(sender, eventArgs) {
            addLine("DropDownOpening");
        }

        function dropDownClosed(sender, eventArgs) {
            addLine("DropDownClosed");
        }

        function dropDownOpened(sender, eventArgs) {
            addLine("DropDownOpened");
        }

        function selectedIndexChanging(sender, eventArgs) {
            addLine("SelectedIndexChanging");
        }

        function selectedIndexChanged(sender, eventArgs) {
            addLine("SelectedIndexChanged");
        }

        function valueChanged(sender, eventArgs) {
            addLine("ValueChanged");
        }

        function valueChanging(sender, eventArgs) {
            addLine("ValueChanging");
        }

        function itemAdded(sender, eventArgs) {
            addLine("ItemAdded");
        }

        function addItem(e) {
            var combo = $find('<%= myDropDown.ClientID %>');
            var textbox = $get("<%=txtNewItem.ClientID %>");

            if (textbox.value != "") {
                var item = combo.get_items().createItem();
                item.set_text(textbox.value);
                item.set_value(textbox.value);
                combo.get_items().add(item);
            }
        }
     
    </script>
</asp:Content>
