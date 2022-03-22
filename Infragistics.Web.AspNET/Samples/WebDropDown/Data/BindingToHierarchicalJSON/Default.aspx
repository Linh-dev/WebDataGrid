<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">

        var data = [{
                        RootData: [
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Food")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Beverages")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Tech")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Literature")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Accessories")%>" }
                        ],
                        Food: [
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_UpOneLevel")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Food_Sandwich")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Food_Fish")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Food_Hamburger")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Food_Sushi")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Food_Steak")%>" }],
                        Beverages: [
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_UpOneLevel")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Beverages_Coke")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Beverages_Pepsi")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Beverages_MountainDew")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Beverages_Wine")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Beverages_Beer")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Beverages_Lemonade")%>" }
                        ],
                        Tech: [
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_UpOneLevel")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Tech_Laptop")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Tech_Desktop")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Tech_Tablet")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Tech_Smartphone")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Tech_Mainframe")%>" }],
                        Literature: [
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_UpOneLevel")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Literature_Dostoevsky")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Literature_Vazov")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Literature_Tolstoy")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Literature_Goethe")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Literature_Stainbeck")%>" }],
                        Accessories: [
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_UpOneLevel")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Accessories_Mouse")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Accessories_Keyboard")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Accessories_Microphone")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Accessories_Camera")%>" },
                            { Text: "<%= this.GetGlobalResourceObject("WebDropDown", "HierarchicalJSON_Accessories_Mousepad")%>" }]}
                    ];

        function BindToLocalData(sender, eventArgs) 
        {
            eventArgs.set_cancel(true);
            sender._pi.show(sender);
            var dataSource = data[0]["RootData"];
            sender.set_dataSource(dataSource);
            setTimeout(function () {
                sender.dataBind();
                sender._pi.hide(sender);
                sender.set_currentValue("");
            }, 500);
        }

        function WDD1_SelectionChanged(sender, eventArgs)
        {
            eventArgs.set_cancel(true);
            sender._pi.show(sender);
            var selection = eventArgs.getNewSelection();
            var text = selection && selection[0] ? selection[0].get_text() : "";
            var dataSource;
            if(!text || text == 'Up one level')
            {
                dataSource = data[0]["RootData"];
                sender.set_dataSource(dataSource);
                sender.dataBind();
                sender.set_currentValue("");
                sender.set_selectedItemIndex(-1);
            }
            else
            {
                dataSource = data[0][text];
                if(dataSource && dataSource.length > 0)
                {
                    sender.set_dataSource(dataSource);
                    sender.dataBind();
                }
            }
            sender._pi.hide(sender);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDropDown ID="WebDropDown1" runat="server" Width="400" EnableClientRendering="true"
            ClientEvents-DataBinding="BindToLocalData" CurrentValue="" EnableDropDownAsChild="false" EnableRenderingAnchors="false"
            ClientEvents-SelectionChanged="WDD1_SelectionChanged">

    </ig:WebDropDown>
</asp:Content>