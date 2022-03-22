<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 650px;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="Div2" class="wgDataBind">
                <div style="background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/EditingAndSelection/MultiSelection/MultiSelection.png); width: 675px; height: 178px;">
                    <div style="font-weight: bold; margin-left: 150px; padding-top: 50px;">
                        <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %>
                    </div>
                    <div>
                        <div id="eventList" class="controlPanelEvent" style="background-color: Transparent;
                            height: 80px; border: 0px; margin-left: 90px; margin-top: 5px; margin-right: 10px;
                            line-height: 18px;">
                            <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %>
                            <br />
                        </div>
                    </div>
                </div>
                <br>
                <div class="controlPanel" style="background-color: #ffffff; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
                    background-repeat: no-repeat; border: 1px solid #EEEEEE; width: 565px; height: 300px;
                    padding-left: 100px; padding-top: 30px;">
                    <table>
                        <tr>
                            <td>
                                <%= this.GetGlobalResourceObject("WebDropDown","MultiSelectionCheckbox") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ig:WebDropDown runat="server" ID="WebDropDown_Checkbox" DataSourceID="DefaultDataSource"
                                    EnableClosingDropDownOnSelect="false" TextField="Company" EnablePaging="false"
                                    Width="200px" DropDownContainerHeight="300px" EnableMultipleSelection="true"
                                    MultipleSelectionType="Checkbox">
                                    <ClientEvents SelectionChanged="selectedIndexChanged" SelectionChanging="selectedIndexChanging" />
                                </ig:WebDropDown>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%= this.GetGlobalResourceObject("WebDropDown","MultiSelectionKeyboard") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ig:WebDropDown runat="server" ID="WebDropDown_Keyboard" DataSourceID="DefaultDataSource"
                                    TextField="Company" EnableClosingDropDownOnSelect="false" EnablePaging="false"
                                    Width="200px" DropDownContainerHeight="300px" EnableMultipleSelection="true"
                                    MultipleSelectionType="Keyboard">
                                    <ClientEvents SelectionChanged="selectedIndexChanged" SelectionChanging="selectedIndexChanging" />
                                </ig:WebDropDown>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%= this.GetGlobalResourceObject("WebDropDown","MultiSelectionBasic") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ig:WebDropDown runat="server" ID="WebDropDown_Basic" DataSourceID="DefaultDataSource"
                                    TextField="Company" EnablePaging="false" EnableClosingDropDownOnSelect="false"
                                    DropDownContainerWidth="200px" Width="200px" DropDownContainerHeight="200px"
                                    EnableMultipleSelection="true" MultipleSelectionType="Keyboard" OnSelectionChanged="WebDropDown2_SelectionChanged">
                                    <ClientEvents SelectionChanged="selectedIndexChanged" SelectionChanging="selectedIndexChanging" />
                                </ig:WebDropDown>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server"
        SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
        [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
    </asp:AccessDataSource>

    <script type="text/javascript">

        function selectedIndexChanging(sender, eventArgs) {
            var oldItems = eventArgs.getOldSelection();
            var newItems = eventArgs.getNewSelection();

            var oldItemsString = "";
            var newItemsString = "";

            for (i = 0; i < oldItems.length; i++) {
                if (oldItems[i] != null)
                    oldItemsString += oldItems[i].get_index() + ", ";
            }

            for (i = 0; i < newItems.length; i++)
                newItemsString += newItems[i].get_index() + ", ";

            addLine('<%= this.GetGlobalResourceObject("WebDropDown","MultiSelectionSelectionChanging") %>' + "(" + sender.get_name() + "): " + '<%= this.GetGlobalResourceObject("WebDropDown", "MultiSelectionOldItems") %>' + " = [ " + oldItemsString + "  ] ; " + '<%=  this.GetGlobalResourceObject("WebDropDown", "MultiSelectionNewItems") %>' + " = [ " + newItemsString + "  ]; ");
        }

        function selectedIndexChanged(sender, eventArgs) {
            var oldItems = eventArgs.getOldSelection();
            var newItems = eventArgs.getNewSelection();

            var oldItemsString = "";
            var newItemsString = "";

            for (i = 0; i < oldItems.length; i++) {
                if (oldItems[i] != null)
                    oldItemsString += oldItems[i].get_index() + ", ";
            }

            for (i = 0; i < newItems.length; i++)
                newItemsString += newItems[i].get_index() + ", ";

            addLine('<%= this.GetGlobalResourceObject("WebDropDown","MultiSelectionSelectionChanged") %>'+
              "(" + sender.get_name() + "): " + '<%= this.GetGlobalResourceObject("WebDropDown", "MultiSelectionOldItems") %>' +
             " = [ " + oldItemsString + "  ] ; " + '<%= this.GetGlobalResourceObject("WebDropDown", "MultiSelectionNewItems") %>' + 
             " = [ " + newItemsString + "  ]; ");
        }
        
    </script>

</asp:Content>
