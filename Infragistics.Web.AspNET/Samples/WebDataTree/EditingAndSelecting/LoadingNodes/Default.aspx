<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
        <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataTree/sampleWebtreeMenu.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <div style="background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebDataTree/EditingAndSelection/LoadingNodes/AddNodeBG.png); width:675px; height:96px;">
       <div style="font-weight:bold; margin-left:100px; padding-top:40px;font-size: small; color:#333;"> 
        <%= this.GetGlobalResourceObject("WebDataTree","AddingNodeCaption") %> 
    </div>
    <div style="margin-left:100px; padding-top:10px;" >
    
    <table>
    <tr>
    <td><%= this.GetGlobalResourceObject("WebDataTree","EnterInRSSFeedCaption") %> </td>
    <td><asp:DropDownList ID="GroupList" runat="server">
            <asp:ListItem Text="<%$ Resources:WebDataTree, LoadingNodesProgramming %>" Value="<%$ Resources:WebDataTree, LoadingNodesProgramming %>" />
            <asp:ListItem Text="<%$ Resources:WebDataTree, LoadingNodesNews %>" Value="<%$ Resources:WebDataTree, LoadingNodesNews %>" />
            <asp:ListItem Text="<%$ Resources:WebDataTree, LoadingNodesTechnology %>" Value="<%$ Resources:WebDataTree, LoadingNodesTechnology %>" />
        </asp:DropDownList></td>
    <td><asp:TextBox runat="server" ID="NewFeedName"></asp:TextBox></td>
    <td><asp:Button runat="server" Text="<%$ Resources:WebDataTree, AddCaption %>" ID="AddNewFeed" /></td>
    
    </tr>
    </table>
    </div>
    </div>
    <br />
    <div  class="controlPanel" style="background-color:#ffffff; background-image:url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg); background-repeat:no-repeat; border:1px solid #EEEEEE;width:643px; padding-left:20px; padding-top:18px;">
		<ig:WebDataTree ID="WebDataTreeSample" runat="server"
	        DataSourceID = "TreeDataSource" Font-Size="Small"
	        EnableHotTracking = "true" 
            Height="422px" 
            Width="56%" 
	        InitialExpandDepth="1"
            EnableConnectorLines="False" >
            <DataBindings>
               <ig:DataTreeNodeBinding DataMember="Group" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
               <ig:DataTreeNodeBinding DataMember="Feed" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
            </DataBindings>
        </ig:WebDataTree>
	</div>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/RssFeeds/Group" />	
</asp:Content>
