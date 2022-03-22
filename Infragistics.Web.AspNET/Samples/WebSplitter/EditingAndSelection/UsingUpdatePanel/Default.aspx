<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebSplitter runat="server" ID="WebSplitter1" Orientation="Vertical" Height="200px" Width="600px">
        <Panes>
            <ig:SplitterPane Size="50%">
                <Template>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebSplitter,UpdatePanel_Description_2 %>"></asp:Label>
                </Template>
            </ig:SplitterPane>
            <ig:SplitterPane Size="50%" BackColor="#F4F4F4">
                <Template>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <br />
                            <asp:Label runat="server" ID="ServerTimeLabel"></asp:Label>
                            <br />
                            <br />
                            <asp:Button runat="server" ID="Button1" Text="<%$ Resources:WebSplitter,UpdatePanel_Button_1 %>" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </Template>
            </ig:SplitterPane>
        </Panes>
    </ig:WebSplitter>
    
</asp:Content>