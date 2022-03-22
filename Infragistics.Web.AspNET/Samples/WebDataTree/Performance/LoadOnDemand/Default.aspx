<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataTree/sampleWebtreeMenu.css" />
    <style>
    .ig_NautilusControl  {font-size:12px!important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       <div style="background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/LoadOnDemand.png); width:675px; height:96px;">
       <div style="font-weight:bold; margin-left:110px; padding-top:40px;font-size: small; color:#333;"> 
        <%= this.GetGlobalResourceObject("WebDataTree","LoadOnDemandCaption") %>
    </div>
    <div style="margin-left:105px; padding-top:10px;" >
        <asp:CheckBox ID="EnabledLoadOnDemand" runat="server" Text="<%$ Resources:WebDataTree, EnableCaption %>" Checked="True" AutoPostBack="True" />
    </div></div>
    <br />

    <div class="controlPanel" style="background-color:#ffffff; background-image:url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg); background-repeat:no-repeat; border:1px solid #EEEEEE;width:643px; padding-left:20px; padding-top:18px;">
        <ig:WebDataTree ID="WebDataTreeSample" runat="server" 
            DataSourceID="whds"
            Height="95%" 
            InitialExpandDepth="0" 
            InitialDataBindDepth="0"
            OnNodeBound="WebDataTree1_NodeBound" 
            EnableAjax="true"
            EnableConnectorLines="False" StyleSetName="Nautilus"
            >
            <DataBindings>
                <ig:DataTreeNodeBinding DataMember="Categories" TextField="CategoryName" ValueField="CategoryID" />
                <ig:DataTreeNodeBinding DataMember="Products" TextField="ProductName" ValueField="ProductID"  />
            </DataBindings>
            <Templates>
                <ig:ItemTemplate ID="WebDataTree1Template" runat="server" TemplateID="ChildTemplate">
                    <Template>
                        <asp:Image ID="Image1" runat="server" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/SilDVSampleIcons/Generic.gif" />
                        <span style="font-weight: normal; ">
                            <%# Eval("ProductName")%>
                        </span>
                    </Template>
                </ig:ItemTemplate>
            </Templates>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="/samplesbrowser/samplescommon/aspnet/WebDataTree/Performance/LoadOndemand/FoodBag.png" />
                <%# Eval("CategoryName")%>
            </ItemTemplate>                                   
        </ig:WebDataTree>
	</div>
	
    <asp:AccessDataSource ID="CategoriesDS" runat="server" 
        SelectCommand="SELECT Categories.CategoryID, Categories.CategoryName FROM Categories ">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="ProductsDS" runat="server" 
        SelectCommand="SELECT Products.ProductID, Products.ProductName, Products.CategoryID FROM Products ">
    </asp:AccessDataSource>

    <ig:WebHierarchicalDataSource ID="whds" runat="server">
         <DataViews>
            <ig:DataView DataSourceID="CategoriesDS" ID="Categories" />
            <ig:DataView DataSourceID="ProductsDS" ID="Products" />
         </DataViews>
         <DataRelations>
            <ig:DataRelation ParentDataViewID="Categories" ParentColumns="CategoryID" ChildDataViewID="Products" ChildColumns="CategoryID" />
         </DataRelations>
    </ig:WebHierarchicalDataSource>	
</asp:Content>

