<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Src="~/SamplesCommon/aspnet/Common/UserControls/DataSourceControl/DataSourceControl.ascx" TagName="DataSourceControl"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.DomainServices.WebControls" Assembly="System.Web.DomainServices.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:DomainDataSource ID="dataSourceCategories" runat="server" DomainServiceTypeName="DomainDataSourceSample.LinqToSqlNorthwindDomainService"
		SelectMethod="GetCategories" EnableDelete="true" EnableInsert="true"
		EnableUpdate="true">
	</asp:DomainDataSource>
	<asp:DomainDataSource ID="dataSource" runat="server" DomainServiceTypeName="DomainDataSourceSample.LinqToSqlNorthwindDomainService"
		SelectMethod="GetProducts" EnableDelete="true" EnableInsert="true"
		EnableUpdate="true">
	</asp:DomainDataSource>
	<ig:WebHierarchicalDataSource ID="whdsData" runat="server">
		<DataViews>
			<ig:DataView ID="dataSourceCategoriesView" DataSourceID="dataSourceCategories" />
			<ig:DataView ID="dataSourceView" DataSourceID="dataSource" />
		</DataViews>
		<DataRelations>
			<ig:DataRelation ParentDataViewID="dataSourceCategoriesView" ParentColumns="CategoryID"
				ChildDataViewID="dataSourceView" ChildColumns="CategoryID" />
		</DataRelations>
	</ig:WebHierarchicalDataSource>
	<ig:WebDataTree ID="wdtTest" runat="server" DataSourceID="whdsData" AnimationEquationType="Linear" AnimationDuration="150" Width="400px">
        <DataBindings>
			<ig:DataTreeNodeBinding DataMember="dataSourceCategoriesView" ValueField="CategoryID" TextField="CategoryName" />
			<ig:DataTreeNodeBinding DataMember="dataSourceView" ValueField="ProductID" TextField="ProductName" />
		</DataBindings>
	</ig:WebDataTree>
</asp:Content>