<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSplitter_Display_Automatically_Resizeable_Panes_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebSplitter runat="server" ID="WebSplitter2" Orientation="Vertical" Height="300px" Width="600px" DynamicResize="true">
        <Panes>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Left_Pane %>" Size="20%" CollapsedDirection="PreviousPane" BackColor="#F4F4F4">
            </ig:SplitterPane>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Content_Pane %>" Size="60%" CollapsedDirection="none">
            </ig:SplitterPane>
            <ig:SplitterPane runat="server" ToolTip="<%$Resources:WebSplitter, Nested_Panes_Right_Pane %>" Size="20%" CollapsedDirection="NextPane" BackColor="#F4F4F4">
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
</asp:Content>