<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function indexChanging1(sender, eventArgs) {
            var combo2 = $find('<%= WebDropDown2.ClientID %>');
            combo2.loadItems(eventArgs.getNewSelection()[0].get_text());
        }

        function indexChanging2(sender, eventArgs) {
            var combo3 = $find('<%= WebDropDown3.ClientID %>');
            combo3.loadItems(eventArgs.getNewSelection()[0].get_text());

        }
    </script>
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div>
                    <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/EditingAndSelection/Cascade/eng/CascadeHeaderBig.png" ID="imgCascadeHeaderBig"
                        AlternateText="<%$ Resources:WebDropDown, CascadeImgAlt %>" runat="server">
                    </igsb:LocalizedImage>
                </div>
            </td>
        </tr>
        <tr>
            <td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; padding: 20px;">
                <div style="border: 1px solid #EEEEEE; background-color: #fafafa; padding: 10px;
                    padding-left: 150px;">
                    <table width="100%" cellspacing="0" border="0">
                        <tr style="height: 30px;">
                            <td>
                                <%= this.GetGlobalResourceObject("WebDropDown","CascadeCountryLabel") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" TextField="Text" ValueField="Value"
                                    EnableAutoCompleteFirstMatch="false" EnableDropDownAsChild="false" EnableAnimations="false" DropDownContainerWidth="200px" DropDownContainerHeight="200px">
                                    <ClientEvents SelectionChanged="indexChanging1" />
                                </ig:WebDropDown>
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td>
                                <%= this.GetGlobalResourceObject("WebDropDown","CascadeStateLabel") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ig:WebDropDown ID="WebDropDown2" runat="server" Width="200px" TextField="Text" ValueField="Value"
                                    EnableAutoCompleteFirstMatch="false" EnableDropDownAsChild="false" EnableAnimations="false" DropDownContainerWidth="200px" DropDownContainerHeight="200px">
                                    <ClientEvents SelectionChanged="indexChanging2" />
                                </ig:WebDropDown>
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td>
                                <%= this.GetGlobalResourceObject("WebDropDown","CascadeCityLabel") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ig:WebDropDown ID="WebDropDown3" runat="server" Width="200px" TextField="Text" ValueField="Value"
                                    EnableAutoCompleteFirstMatch="false" EnableDropDownAsChild="false" EnableAnimations="false" DropDownContainerWidth="200px" DropDownContainerHeight="200px">
                                </ig:WebDropDown>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/EditingAndSelection/Cascade/wdd_AdvSearchFooter.png" alt="" />
            </td>
        </tr>
    </table>
</asp:Content>

