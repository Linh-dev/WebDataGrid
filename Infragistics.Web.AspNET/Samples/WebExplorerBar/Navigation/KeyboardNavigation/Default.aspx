<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div style="margin-top: 45px;">
       <ig:WebExplorerBar GroupExpandBehavior="AnyExpandable" DataSourceID="ExplorerBarDataSource" 
                Width="300px" ID="WebExplorerBar1" runat="server">
                <DataBindings>
                    <ig:ExplorerBarItemBinding DataMember="Group" TextField="Name" />
                    <ig:ExplorerBarItemBinding DataMember="Feed" TextField="Name" ImageUrlField="ImageUrl" TargetField="TargetBlank" NavigateUrlField="URL" />
                </DataBindings>
            </ig:WebExplorerBar>
    </div>
      <asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="/Data/RssFeeds/Group"/>
</asp:Content>
 