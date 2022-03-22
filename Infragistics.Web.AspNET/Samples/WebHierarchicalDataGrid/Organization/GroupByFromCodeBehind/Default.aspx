<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
 <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <div class="MainContent">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_GroupByFromCodeBehind_Columns%> "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Text="CategoryID" Value="-1" />
                <asp:ListItem Text="CategoryName" Value="-2" />
                <asp:ListItem Text="Description" Value="-3" />
                <asp:ListItem Text="ProductID" Value="0" />
                <asp:ListItem Text="ProductName" Value="1" />
                <asp:ListItem Text="QuantityPerUnit" Value="2" />
                <asp:ListItem Text="UnitPrice" Value="3" />
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_GroupByFromCodeBehind_Group%>"
            OnClick="Button1_Click" />
            
        <asp:Button ID="Button2" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_GroupByFromCodeBehind_UnGroup%>"
            OnClick="Button2_Click" />
    </div>

    <br />
    <div>
        <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            Height="350px" Width="99%" AutoGenerateBands="true" AutoGenerateColumns="true"
            DataMember="CategoriesView" Key="CategoriesView"
            DataKeyFields="CategoryID">
            <GroupingSettings EnableColumnGrouping="True" GroupAreaVisibility="Hidden" />
        </ig:WebHierarchicalDataGrid>
    </div>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ParentColumns="CategoryID" ParentDataViewID="CategoriesView"
                ChildColumns="CategoryID" ChildDataViewID="ProductsView" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="CategoriesView" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="ProductsView" DataSourceID="AccessDataSource2" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>' 
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>' 
        SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice] FROM [Products]">
    </asp:AccessDataSource>  
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>