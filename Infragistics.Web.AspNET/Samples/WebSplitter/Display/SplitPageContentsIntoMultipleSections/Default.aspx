<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSplitter_Display_Split_Page_Contents_Into_Multiple_Sections_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebSplitter runat="server" ID="WebSplitter1" Orientation="Vertical" Height="150px"
        Width="715px" DynamicResize="true">
        <Panes>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Left_Pane %>" Size="25%" CollapsedDirection="PreviousPane">
                <Template>
                    <ig:WebSplitter runat="server" ID="WebSplitter2" Orientation="Horizontal" Height="100%"
                        Width="100%" DynamicResize="true">
                        <Panes>
                            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Eliminating_Top_Pane %>" Size="50%">
                                <Template>
                                    <center>
                                        <p>
                                            <%= this.GetGlobalResourceObject("WebSplitter", "Eliminating_Template_Content")%> 1
                                        </p>
                                    </center>
                                </Template>
                            </ig:SplitterPane>
                            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Eliminating_Bottom_Pane %>" Size="50%">
                                <Template>
                                    <center>
                                        <p>
                                            <%= this.GetGlobalResourceObject("WebSplitter", "Eliminating_Template_Content")%> 2
                                        </p>
                                    </center>
                                </Template>
                            </ig:SplitterPane>
                        </Panes>
                    </ig:WebSplitter>
                </Template>
            </ig:SplitterPane>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Content_Pane %>" Size="50%" CollapsedDirection="none">
                <Template>
                    <center>
                        <p>
                            <%= this.GetGlobalResourceObject("WebSplitter", "Eliminating_Template_Content")%> 3
                        </p>
                    </center>
                </Template>
            </ig:SplitterPane>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Right_Pane %>" Size="25%" CollapsedDirection="NextPane">
                <Template>
                    <center>
                        <p>
                            <%= this.GetGlobalResourceObject("WebSplitter", "Eliminating_Template_Content")%> 4
                        </p>
                    </center>
                </Template>
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
</asp:Content>
