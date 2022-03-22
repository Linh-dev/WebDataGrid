<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .divcont 
        {
            float: left;
            overflow: auto;
            padding: 5px;
        }
        
        .border
        {
            border-color: #808080;
            border-left: solid;
            border-width: 1px;
        }
        
        .tree-label
        {
            margin-left: 30px;   
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="divcont">
        <asp:Label ID="TreeHeader1" runat="server" CssClass="tree-label" Text="<%$ Resources:WebHierarchicalDataSource,WebDataTreeHeader %>"></asp:Label>
        <ig:WebDataTree ID="WebDataTree1" Width="300" Height="300" runat="server" DataSourceID="WebHierarchicalDataSource1"
            OnInit="OnInit" Font-Size="Small">
            <DataBindings>
                <ig:DataTreeNodeBinding DataMember="AccessDataSource1_DefaultView" TextField="CategoryName"
                    ValueField="CategoryName" />
                <ig:DataTreeNodeBinding DataMember="AccessDataSource2_DefaultView" TextField="ProductName"
                    ValueField="ProductName" ImageUrlField="ImageUrl" />
            </DataBindings>
        </ig:WebDataTree>
    </div>
    <div class="divcont" style="width: 310px">
        <center style="margin-bottom: 5px;">
            <asp:Label ID="TreeHeader2" runat="server" Text="<%$ Resources:WebHierarchicalDataSource,WebDataMenuHeader %>"></asp:Label>
        </center>
        <ig:WebDataMenu ID="WebDataMenu1" Width="300px" runat="server" DataSourceID="WebHierarchicalDataSource1" OnItemBound="WebDataMenu1_ItemBound">
            <GroupSettings Width="300px" ExpandDirection="Down" Orientation="Horizontal" />
            <DataBindings>
                <ig:DataMenuItemBinding DataMember="AccessDataSource1_DefaultView" TextField="CategoryName"
                    ValueField="CategoryName" />
                <ig:DataMenuItemBinding DataMember="AccessDataSource2_DefaultView" TextField="ProductName"
                    ValueField="ProductName" />
            </DataBindings>
        </ig:WebDataMenu>
    </div>
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
    <asp:AccessDataSource ID="AccessDataSource1" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        runat="server" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        runat="server" SelectCommand="SELECT [ProductID], [ProductName], [CategoryID] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>
