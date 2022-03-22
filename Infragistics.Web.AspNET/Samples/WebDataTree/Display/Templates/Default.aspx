<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="380px" Width="640px"
        Modal="false" WindowState="Normal" Resizer-Enabled="true" Moveable="False" Top="100px"
        BackColor="Transparent" Left="25px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataTree, CaptionProductFamily %>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="True"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden" CssClass="BackgroundImage">
            <Template>
                <div style="text-align: left; overflow-y: visible; height:100%; width:99.5%;">
                    <ig:WebDataTree ID="WebDataTree1" runat="server" DataSourceID="TreeDataSource" OnNodeBound="WebDataTree1_NodeBound"
                        Height="100%" Width="100%" Style="float: left; margin-left: 2px" InitialExpandDepth="0"
                        EnableConnectorLines="false">
                        <DataBindings>
                            <ig:DataTreeNodeBinding DataMember="Product" />
                        </DataBindings>
                        <Templates>
                            <ig:ItemTemplate ID="WebDataTree1Template" runat="server" TemplateID="Template1">
                                <Template>
                                    <span style="display: inline; height: 58px; padding-bottom: 10px;">
                                        <asp:Image ID="Image1" runat="server" Style="margin-bottom: 10px;" ImageUrl='<%# (Eval("ImageUrl")) %>' />
                                        <span style="padding-left: 5px; font-size: 14px; font-weight: bold; font-family: Segoe UI, Verdana, Arial, Sans-Serif">
                                            <%# (Eval("Text")) %>
                                        </span></span>
                                </Template>
                            </ig:ItemTemplate>
                        </Templates>
                    </ig:WebDataTree>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/ProductList/Product" />
</asp:Content>