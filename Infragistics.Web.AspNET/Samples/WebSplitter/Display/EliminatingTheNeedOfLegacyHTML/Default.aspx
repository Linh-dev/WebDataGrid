<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSplitter_Display_Eliminating_the_Need_of_Legacy_Html_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <iframe src="<%= this.ResolveUrl("Frameset.htm") %>" width="100%" height="150px" style="border-style: solid; border-color: #CCCCCC; border-width: 1px;">
    </iframe>
    <ig:WebSplitter runat="server" ID="WebSplitter2" Orientation="Vertical" Height="150px" Width="715px" DynamicResize="true">
        <Panes>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Left_Pane %>" Size="25%" CollapsedDirection="PreviousPane" BackColor="#F4F4F4">
            </ig:SplitterPane>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Content_Pane %>" Size="50%" CollapsedDirection="none">
                <Template>
                    <center>
                        <p>
                            ASP.NET Splitter™
                        </p>
                    </center>
                </Template>
            </ig:SplitterPane>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Right_Pane %>" Size="25%" CollapsedDirection="NextPane" BackColor="#F4F4F4">
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>

</asp:Content>