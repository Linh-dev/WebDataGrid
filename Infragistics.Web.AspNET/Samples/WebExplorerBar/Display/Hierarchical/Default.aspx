<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br />
    <ig:WebExplorerBar Width="300px" DataSourceID="ExplorerBarDataSource" GroupExpandBehavior="SingleExpanded" ID="WebExplorerBar1" runat="server">
        <DataBindings>
            <ig:ExplorerBarItemBinding DataMember="Item" TextField="Text" ImageUrlField="ImageUrl" />
        </DataBindings>
    </ig:WebExplorerBar>
    <asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="/Data/HelpTopicsExplorerBar/Item" />
</asp:Content>

