<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataTree/sampleWebtreeMenu.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="400px" Width="650px"
        Modal="false" WindowState="Normal" Resizer-Enabled="False" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="" MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <div><br>
                    <ig:WebDataTree ID="WebDataTreeSample" runat="server" InitialExpandDepth="0" EnableExpandOnClick="true"
                        InitialDataBindDepth="0" EnableAjax="true" EnableConnectorLines="False" StyleSetName="LucidDream"
                        CssClass="Treepadding" Font-Size="Small">
                        <DataBindings>
                            <ig:DataTreeNodeBinding DataMember="Book" TextField="Title" ValueField="Title" ImageUrlField="ImageUrl" />
                        </DataBindings>
                    </ig:WebDataTree>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
