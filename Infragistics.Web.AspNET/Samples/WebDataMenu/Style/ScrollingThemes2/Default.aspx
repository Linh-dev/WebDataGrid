<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="width: 100%; padding-top: 30px; padding-left: 1px; height: 500px">
        <div style="float: left;">
            <table>
                <tr>
                    <td>
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Nautilus.png" alt="<%= this.GetGlobalResourceObject("Strings","NautilusStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu1" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Nautilus" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" EnableAnimation="false" Width="250px" Height="100px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                    <td class="separation">
                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Office2007Black.png" alt="<%= this.GetGlobalResourceObject("Strings","Office2007BlackStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu2" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Office2007Black" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" Height="100px" EnableAnimation="false" Width="250px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                     <td class="separation">

                        <p>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/RedPlanet.png" alt="<%= this.GetGlobalResourceObject("Strings","RedPlanetStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu9" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="RedPlanet" Width="250px" EnableScrolling="true">
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
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Office2007Blue.png" alt="<%= this.GetGlobalResourceObject("Strings","Office2007BlueStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu3" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Office2007Blue" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" Height="100px" EnableAnimation="false" Width="250px" />
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
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/LucidDream.png" alt="<%= this.GetGlobalResourceObject("Strings","LucidDreamStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu4" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="LucidDream" Width="250px" EnableScrolling="true">
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
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Pear.png" alt="<%= this.GetGlobalResourceObject("Strings","PearStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu8" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Pear" Width="250px" EnableScrolling="true">
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
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Office2007Silver.png" alt="<%= this.GetGlobalResourceObject("Strings","Office2007SilverStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu5" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Office2007Silver" Width="250px" EnableScrolling="true">
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
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Office2010Blue.png" alt="<%= this.GetGlobalResourceObject("Strings","Office2010BlueStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu6" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="Office2010Blue" Width="250px" EnableScrolling="true">
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
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/RubberBlack.png" alt="<%= this.GetGlobalResourceObject("Strings","RubberBlackStyle") %>" /></p>
                        <div>
                            <ig:WebDataMenu runat="server" ID="WebDataMenu7" DataSourceID="MenuScrollingSimpleDataSource"
                                MaxDataBindDepth="1" StyleSetName="RubberBlack" Width="250px" EnableScrolling="true">
                                <GroupSettings Orientation="Horizontal" EnableAnimation="false" Width="250px" Height="100px" />
                                <DataBindings>
                                    <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="Value" ToolTipField="Value" />
                                </DataBindings>
                            </ig:WebDataMenu>
                        </div>
                    </td>
                </tr>
                <tr>


                </tr>
            </table>
        </div>
    </div>
    <asp:XmlDataSource runat="server" ID="MenuScrollingSimpleDataSource" XPath="/MenuData/Scrolling/Menu" />
</asp:Content>
