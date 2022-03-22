<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <asp:UpdatePanel runat="server" ID="up1" ChildrenAsTriggers="true">
        <ContentTemplate>
            <br>
            <table style="margin-bottom: 10px;">
                <tr>
                    <td>
                        <img src="/samplesbrowser/samplescommon/aspnet/WebSplitter/Organization/DynamicOrientation/SplitterIcon.jpg" />
                    </td>
                    <td>
                        <asp:RadioButtonList OnSelectedIndexChanged="ChangeOrientation" AutoPostBack="true"
                            runat="server" ID="orientationList" RepeatDirection="Horizontal">
                            <asp:ListItem Text="<%$ Resources:WebSplitter,DynOrientation_Horizontal %>" Value="0"
                                Selected="true"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:WebSplitter,DynOrientation_Vertical %>" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <ig:WebSplitter runat="server" ID="WebSplitter1" Orientation="Horizontal" Width="300px"
                Height="290px">
                <Panes>
                    <ig:SplitterPane Size="50%">
                    </ig:SplitterPane>
                    <ig:SplitterPane Size="50%" BackColor="#F4F4F4">
                    </ig:SplitterPane>
                </Panes>
            </ig:WebSplitter>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>