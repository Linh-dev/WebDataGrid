<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
        <table style="width: 700px;">
        <tr valign="top" style="width: 250px;">
            <td style="height: 30px; width: 231px;">
                <b>
                    <img align="bottom" alt="" hspace="0" src="/samplesbrowser/samplescommon/aspnet/WebHieararchicalDataSource/Data/BindingToAspNetControls/bullet_blue.png" style="width: 16px;
                        height: 16px" vspace="0" /><asp:Label ID="TreeHeader1" runat="server" Text="<%$ Resources:WebHierarchicalDataSource,Navigation_TreeHeader_1 %>"></asp:Label>
                </b>
            </td>
            <td>
                <b>
                    <img alt="" src="/samplesbrowser/samplescommon/aspnet/WebHieararchicalDataSource/Data/BindingToAspNetControls/bullet_blue.png" style="width: 16px; height: 16px" /><asp:Label
                        ID="TreeHeader2" runat="server" Text="<%$ Resources:WebHierarchicalDataSource,Navigation_TreeHeader_2 %>"></asp:Label>
                </b>
            </td>
        </tr>
        <tr valign="top">
            <td style="width: 300px;">
                <asp:TreeView ID="TreeView1" runat="server" DataSourceID="WebHierarchicalDataSource1"
                    ExpandDepth="0" NodeIndent="0" Width="250px" BackColor="#FCFCFC" BorderColor="#E2F2FC"
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="10px" ForeColor="#74B8E4">
                    <DataBindings>
                        <asp:TreeNodeBinding DataMember="AccessDataSource1_DefaultView" TextField="CategoryName" />
                        <asp:TreeNodeBinding DataMember="AccessDataSource2_DefaultView" TextField="ProductName" />
                    </DataBindings>
                </asp:TreeView>
            </td>
            <td style="line-height: 20px;">
                <asp:Menu ID="Menu1" runat="server" DataSourceID="WebHierarchicalDataSource1" BackColor="#FCFCFC"
                    BorderColor="#E2F2FC" BorderStyle="Solid" BorderWidth="1px" Width="150px" Font-Bold="True"
                    Font-Size="10px" ForeColor="#74B8E4" DynamicPopOutImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebHieararchicalDataSource/Data/BindingToAspNetControls/Popout.png"
                    StaticPopOutImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebHieararchicalDataSource/Data/BindingToAspNetControls/Popout.png" CssClass="MenuPadding">
                    <DynamicMenuStyle BackColor="#FCFCFC" BorderColor="#E2F2FC" BorderStyle="Solid" BorderWidth="1px"
                        CssClass="MenuPadding" />
                    <DataBindings>
                        <asp:MenuItemBinding DataMember="AccessDataSource1_DefaultView" TextField="CategoryName" />
                        <asp:MenuItemBinding DataMember="AccessDataSource2_DefaultView" TextField="ProductName" />
                    </DataBindings>
                </asp:Menu>
            </td>
        </tr>
    </table>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ChildColumns="CategoryID" ChildDataViewID="AccessDataSource2_DefaultView"
                ParentColumns="CategoryID" ParentDataViewID="AccessDataSource1_DefaultView" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_DefaultView" DataMember="DefaultView" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="AccessDataSource2_DefaultView" DataMember="DefaultView" DataSourceID="AccessDataSource2" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        SelectCommand="SELECT [ProductID], [ProductName], [CategoryID] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>