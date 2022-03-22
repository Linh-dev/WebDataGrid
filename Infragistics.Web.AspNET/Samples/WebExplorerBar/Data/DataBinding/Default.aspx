<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Src="~/SamplesCommon/aspnet/Common/UserControls/DataSourceControl/DataSourceControl.ascx" TagName="DataSourceControl"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <br />
        <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" UpdateMode="Always">
            <ContentTemplate>
                <uc1:DataSourceControl ID="SelectedDataSource" runat="server" ExcludedDataSource="AC|DT|DS" />
                
                    <ig:WebExplorerBar Width="300px" GroupContentsHeight="300px"
                    GroupExpandBehavior="SingleExpanded"  StyleSetName="Trendy"
                    ID="WebExplorerBar1" runat="server">
                        <DataBindings>
                            <ig:ExplorerBarItemBinding DataMember="Book" TextField="Title" />
                            <ig:ExplorerBarItemBinding DataMember="Chapter" TextField="Title" />
                        </DataBindings>                     
                    </ig:WebExplorerBar>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="SelectedDataSource" EventName="DataSourceChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="/books/book"/>
    </div>
</asp:Content>