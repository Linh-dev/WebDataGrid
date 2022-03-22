<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="nestedSplitterClass">
    <h4>
        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebSplitter,Nested_Panes_Description_3 %>"></asp:Label>
    </h4>
    <ig:WebSplitter runat="server" ID="TraditionalLeftNav" Orientation="Vertical" Height="300px"
        Width="600px">
        <ClientEvents Loaded="load_splitterUrl" />
        <Panes>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Navigation_Pane %>"
                Size="30%">
                <Template>
                    <div id="splitter_header">
                        <igsb:LocalizedImage alt='<%= this.GetGlobalResourceObject("WebSplitter","Nested_Panes_Header_Image") %>'
                            ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSplitter/Display/NestedPanesAndMore/eng/header.jpg"
                            ID="imgHeader" runat="server" Width="199" Height="54" />
                    </div>
                    <ul class="splitterMenuList">
                        <li><a href="<%= this.GetGlobalResourceObject("WebSplitter","URL_Bing") %>"
                            target="_view">Bing.com</a></li>
                        <li><a href="<%= this.GetGlobalResourceObject("WebSplitter","URL_AOL") %>"
                            target="_view">Aol.com</a></li>
                        <li><a href="<%= this.GetGlobalResourceObject("WebSplitter","URL_DogPile") %>"
                            target="_view">Dogpile.com</a></li>
                    </ul>
                </Template>
            </ig:SplitterPane>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Content_Pane %>"
                Size="70%" ScrollBars="Hidden">
                <Template>
                    <iframe name="_view" id="_view" style="width: 100%; height: 100%; border: none 0px;
                        margin: 0px; padding: 0px;" frameborder="0" src="javascript:''"></iframe>
                </Template>
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
    <h4>
        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebSplitter,Nested_Panes_Description_4 %>"></asp:Label>
    </h4>
    <ig:WebSplitter runat="server" ID="WebSplitter1" Orientation="Vertical" Height="300px"
        Width="600px" DynamicResize="false">
        <SplitterBar CssClass="Locked">
        </SplitterBar>
        <Panes>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Navigation_Pane %>"
                Size="30%" CollapsedDirection="PreviousPane" Locked="true">
            </ig:SplitterPane>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Content_Pane %>"
                Size="70%" BackColor="#F4F4F4">
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
    <h4>
        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebSplitter,Nested_Panes_Description_5 %>"></asp:Label>
    </h4>
    <ig:WebSplitter runat="server" ID="WebSplitter2" Orientation="Vertical" Height="300px"
        Width="600px" DynamicResize="true">
        <Panes>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Left_Pane %>" Size="20%"
                CollapsedDirection="PreviousPane" BackColor="#F4F4F4">
            </ig:SplitterPane>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Content_Pane %>"
                Size="60%" CollapsedDirection="none">
            </ig:SplitterPane>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Right_Pane %>" Size="20%"
                CollapsedDirection="NextPane" BackColor="#F4F4F4">
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
    <h4>
        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebSplitter,Nested_Panes_Description_6 %>"></asp:Label>
    </h4>
    <ig:WebSplitter runat="server" ID="WebSplitter3" Orientation="Vertical" Height="300px"
        Width="600px" DynamicResize="true">
        <Panes>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Left_Pane %>" Size="20%"
                CollapsedDirection="PreviousPane">
                <Template>
                    <ig:WebSplitter runat="server" ID="NestedMultiPane" Orientation="horizontal">
                        <Panes>
                            <ig:SplitterPane Size="50%" BackColor="#F4F4F4">
                            </ig:SplitterPane>
                            <ig:SplitterPane Size="25%">
                            </ig:SplitterPane>
                            <ig:SplitterPane Size="25%" BackColor="#F4F4F4">
                            </ig:SplitterPane>
                        </Panes>
                    </ig:WebSplitter>
                </Template>
            </ig:SplitterPane>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Content_Pane %>"
                Size="60%" CollapsedDirection="none">
            </ig:SplitterPane>
            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Right_Pane %>" Size="20%"
                CollapsedDirection="NextPane">
                <Template>
                    <ig:WebSplitter runat="server" ID="WebSplitter4" Orientation="horizontal">
                        <Panes>
                            <ig:SplitterPane Size="50%" BackColor="#F4F4F4">
                            </ig:SplitterPane>
                            <ig:SplitterPane Size="25%">
                            </ig:SplitterPane>
                            <ig:SplitterPane Size="25%" BackColor="#F4F4F4">
                            </ig:SplitterPane>
                        </Panes>
                    </ig:WebSplitter>
                </Template>
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
    <h4>
        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebSplitter,Nested_Panes_Description_7 %>"></asp:Label>
    </h4>
    <ig:WebSplitter runat="server" ID="HorizontalSplitter" Orientation="horizontal" Height="300px"
        Width="600px" DynamicResize="true">
        <Panes>
            <ig:SplitterPane Size="80%">
                <Template>
                    <ig:WebSplitter runat="server" ID="WebSplitter5" Orientation="Vertical" DynamicResize="true">
                        <Panes>
                            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Left_Pane %>" Size="20%"
                                CollapsedDirection="PreviousPane">
                                <Template>
                                    <ig:WebSplitter runat="server" ID="WebSplitter6" Orientation="horizontal" DynamicResize="true">
                                        <Panes>
                                            <ig:SplitterPane Size="50%" BackColor="#F4F4F4">
                                            </ig:SplitterPane>
                                            <ig:SplitterPane Size="25%">
                                            </ig:SplitterPane>
                                            <ig:SplitterPane Size="25%" BackColor="#F4F4F4">
                                            </ig:SplitterPane>
                                        </Panes>
                                    </ig:WebSplitter>
                                </Template>
                            </ig:SplitterPane>
                            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Content_Pane %>"
                                Size="60%" CollapsedDirection="none">
                            </ig:SplitterPane>
                            <ig:SplitterPane ToolTip="<%$ Resources:WebSplitter,Nested_Panes_Right_Pane %>" Size="20%"
                                CollapsedDirection="NextPane">
                                <Template>
                                    <ig:WebSplitter runat="server" ID="WebSplitter7" Orientation="horizontal" DynamicResize="true">
                                        <Panes>
                                            <ig:SplitterPane Size="50%" BackColor="#F4F4F4">
                                            </ig:SplitterPane>
                                            <ig:SplitterPane Size="25%">
                                            </ig:SplitterPane>
                                            <ig:SplitterPane Size="25%" BackColor="#F4F4F4">
                                            </ig:SplitterPane>
                                        </Panes>
                                    </ig:WebSplitter>
                                </Template>
                            </ig:SplitterPane>
                        </Panes>
                    </ig:WebSplitter>
                </Template>
            </ig:SplitterPane>
            <ig:SplitterPane Size="20%" BackColor="#F4F4F4">
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
    </div>
    <script type="text/javascript">
        function load_splitterUrl(splitter) {
            var elem = splitter.get_panes()[1];
            if (elem)
                elem = elem.get_iframe();
            if (elem && elem.offsetWidth > 10 && elem.src.indexOf('http:') < 0)
                elem.src = '<%= this.GetGlobalResourceObject("WebSplitter","URL_Bing") %>';
        }
    </script>
</asp:Content>
