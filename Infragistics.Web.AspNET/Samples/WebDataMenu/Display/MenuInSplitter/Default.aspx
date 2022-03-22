<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebSplitter runat="server" ID="WebSplitter1" Orientation="Horizontal" Width="900px"
        Height="500px">
        <Panes>
            <ig:SplitterPane Size="60%" BackColor="#F4F4F4" ScrollBars="Hidden" ContentUrl="VerticalWebDataMenu.aspx"/>
            <ig:SplitterPane ScrollBars="Hidden">
                <Template>
                    <ig:WebSplitter ID="WebSplitter2" runat="server" Orientation="Vertical" Width="100%" Height="100%">
                        <Panes>
                            <ig:SplitterPane Size="70%" ScrollBars="Hidden" ContentUrl="HorizontalWebDataMenu.aspx"/>
                            <ig:SplitterPane BackColor="#F4F4F4">
                                <Template>
                                    <div id="resultDiv" style="font-size: large; margin-top: 10px; margin-left: 10px; text-align: center; background-image:url(/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/ScrollingImages/arrow.gif); background-repeat:no-repeat; background-position:top-left; height:48px; width:52px;" >
                                    </div>
                                </Template>
                            </ig:SplitterPane>
                        </Panes>
                    </ig:WebSplitter>
                </Template>
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
</asp:Content>

