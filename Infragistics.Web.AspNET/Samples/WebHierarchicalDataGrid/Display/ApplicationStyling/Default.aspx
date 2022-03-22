<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
  <div id="Icon2" style="position: relative; float: left; padding-right: 10px; margin-bottom: 10px;">

            <img src="/samplesbrowser/samplescommon/aspnet/WebHierarchicalDataGrid/Display/ApplicationStyling/StyleSet.png" alt="Style Set" title="Style Set" width="60" height="61" />
  </div>
        <div id="DropDown" style="padding-top: 20px; margin-bottom: 10px;">
            <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Styles_Theme_SelectATheme")%>
            <asp:DropDownList ID="DDList1" runat="server" AutoPostBack="True" CssClass="CSSform">
                <asp:ListItem>Appletini</asp:ListItem>
                <asp:ListItem>Caribbean</asp:ListItem>
                <asp:ListItem>Claymation</asp:ListItem>
                <asp:ListItem Selected="True">Default</asp:ListItem>
                <asp:ListItem>ElectricBlue</asp:ListItem>
                <asp:ListItem>Harvest</asp:ListItem>
                <asp:ListItem>LucidDream</asp:ListItem>
                <asp:ListItem>Nautilus</asp:ListItem>
                <asp:ListItem>Office2007Black</asp:ListItem>
                <asp:ListItem>Office2007Blue</asp:ListItem>
                <asp:ListItem>Office2007Silver</asp:ListItem>
                <asp:ListItem>Pear</asp:ListItem>
                <asp:ListItem>RedPlanet</asp:ListItem>
                <asp:ListItem>RubberBlack</asp:ListItem>
                <asp:ListItem>Trendy</asp:ListItem> 
                <asp:ListItem>Office2010Blue</asp:ListItem>
            </asp:DropDownList>
        </div>
    
    <br />
    <br />
        
    <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0" DataKeyFields="SupplierID"
            InitialDataBindDepth="0" Height="400px" Width="100%">
            <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
                SlideCloseDuration="300" />
            <Behaviors>
                <ig:Paging PagerAppearance="Bottom" PageSize="15" Enabled="true" />
            </Behaviors>
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
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
        </asp:AccessDataSource>
    </div>
     </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
