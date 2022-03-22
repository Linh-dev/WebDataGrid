<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div>
                <div id="Icon">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebHierarchicalDataGrid/Navigation/PagingOnChildLevel/PagingIcon.png" alt="Clock" width="47" height="55" /></div>
                <div id="ComboBox">
                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Paging_PagerPositionText")%>
                    <asp:DropDownList ID="PagerLocation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PagerLocation_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_Paging_PagerPosition_Item1 %>"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_Paging_PagerPosition_Item2 %>"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_Paging_PagerPosition_Item3 %>"></asp:ListItem>
                    </asp:DropDownList>
                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Paging_NumberOfItemsText") %><asp:DropDownList
                        ID="NumberofItems" runat="server" AutoPostBack="True" OnSelectedIndexChanged="NumberofItems_SelectedIndexChanged">
                        <asp:ListItem Text="2" Value="2" />
                        <asp:ListItem Text="5" Value="5" />
                        <asp:ListItem Text="10" Value="10" />
                    </asp:DropDownList>
                </div>
                <br style="clear: both;" />
            </div>
        </div>
    </div>
    <br />
    <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="1" DataKeyFields="SupplierID"
            InitialDataBindDepth="1" Height="380px" Width="100%">           
            <Columns>
                <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
                <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>"
                    Width="230px" />
                <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>"
                    Width="150px" />
                <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>"
                    Width="80px" />
            </Columns>
            <Bands>            
                <ig:Band DataMember="AccessDataSource2_Products" Key="Products" AutoGenerateColumns="false" DataKeyFields="ProductID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                        <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                        <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    </Columns>
                     <Behaviors>
                        <ig:Paging PagerAppearance="Bottom" PageSize="2" Enabled="true" />
                    </Behaviors>
                </ig:Band>
            </Bands>
        </ig:WebHierarchicalDataGrid>
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="AccessDataSource1_Suppliers"
                    ChildColumns="SupplierID" ChildDataViewID="AccessDataSource2_Products" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="AccessDataSource1_Suppliers" DataSourceID="AccessDataSource1" />
                <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
            </DataViews>
        </ig:WebHierarchicalDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            SelectCommand="SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
        </asp:AccessDataSource>
    </div>  
</asp:Content>
