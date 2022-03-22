<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="480px" Width="650px"
        Modal="false" WindowState="Normal" Resizer-Enabled="False" Moveable="False" Top="100px"
        BackColor="Transparent" Left="25px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataTree, DataVisualizationCaption %>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <div>
                    <ig:WebDataTree ID="WebDataTreeSample" runat="server" 
                        Height="99.5%" Width="99.5%" Style="float: left"
                        DataSourceID="TreeDataSource" Font-Size="Small"
                        InitialExpandDepth="1"
                        EnableConnectorLines="True" 
                        EnableHotTracking = "true" 
                        SelectionType="Single"
                        StyleSetName="LucidDream" >
                        <NodeEditing Enabled="true" EnableOnDoubleClick="true" EnableOnF2="true" />
                        <DataBindings>
                            <ig:DataTreeNodeBinding DataMember="Product" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
                            <ig:DataTreeNodeBinding DataMember="Control" TextField="Text" ValueField="Text" ImageUrlField="ImageUrl" />
                            <ig:DataTreeNodeBinding DataMember="Sample" TextField="Text" ValueField="Text" ImageUrlField="ImageUrl" />                            
                        </DataBindings>
                    </ig:WebDataTree>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/SampleList/Product"/>
</asp:Content>
