<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="width: 100%; height: 650px; padding-top: 30px; padding-left: 1px;">
        <div style="float: left;">
            <table>
                <tr>
                    <td>
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Appletini.png" alt="<%= this.GetGlobalResourceObject("Strings","AppletiniStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu1" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Appletini" Width="250px">
                                <GroupSettings Orientation="Horizontal" Width="250px" Height="100px" EnableAnimation="false" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                    <td class="separation">
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/ElectricBlue.png" alt="<%= this.GetGlobalResourceObject("Strings","ElectricBlueStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu2" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="ElectricBlue" EnableAnimation="false" Width="250px"
                                EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" Height="100px" Width="250px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                    <br />
                    <br />
                    <br />
                    <br />
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Caribbean.png" alt="<%= this.GetGlobalResourceObject("Strings","CaribbeanStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu3" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Caribbean" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" EnableAnimation="false" Height="100px" Width="250px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                    <td class="separation">
                     <br />
                     <br />
                     <br />
                     <br />
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Harvest.png" alt="<%= this.GetGlobalResourceObject("Strings","HarvestStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu4" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Harvest" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" EnableAnimation="false" Height="100px" Width="250px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                    <br />
                    <br />
                    <br />
                    <br />
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Claymation.png" alt="<%= this.GetGlobalResourceObject("Strings","ClaymationStyle") %>" />
                            <div>
                                <ig:WebDataMenu runat="server" ID="WebDataMenu5" DataSourceID="MenuScrollingSimpleDataSource"
                                    MaxDataBindDepth="1" StyleSetName="Claymation" Width="250px" EnableScrolling="true">
                                    <GroupSettings Orientation="Horizontal" EnableAnimation="false" Height="100px" Width="250px" />
                                    <DataBindings>
                                        <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                    </DataBindings>
                                </ig:WebDataMenu>
                            </div>
                    </td>
                    <td class="separation">
                    <br />
                    <br />
                    <br />
                    <br />
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Trendy.png" alt="<%= this.GetGlobalResourceObject("Strings","TrendyStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu6" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Trendy" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" EnableAnimation="false" Height="100px" Width="250px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                    <br />
                    <br />
                    <br />
                    <br />
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Default.png" alt="<%= this.GetGlobalResourceObject("Strings","DefaultStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu7" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Default" Width="250px">
                                <GroupSettings Orientation="Horizontal" EnableAnimation="false" Width="250px" Height="100px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                    <td class="separation">
                    <br />
                    <br />
                    <br />
                    <br />
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Windows7.png" alt="<%= this.GetGlobalResourceObject("Strings","Windows7Style") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu8" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Windows7" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" EnableAnimation="false" Height="100px" Width="250px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:XmlDataSource runat="server" ID="MenuScrollingSimpleDataSource" XPath="/MenuData/Scrolling/Menu" />
</asp:Content>

