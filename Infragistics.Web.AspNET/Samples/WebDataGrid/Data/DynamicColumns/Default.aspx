<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Dynamic_Columns_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  	<div id="wrapper" class="wgDataBind">
	    <div id="DataGridWrapper">
 		    <div id="container">
                <ig:WebDataGrid ID="WebDataGridView" runat="server" DataKeyFields="CustomerID" AutoGenerateColumns="false" Width="100%" Height="425">
                <Behaviors>
                    <ig:Paging PageSize="10" PagerAppearance="Bottom" Enabled="true" />
                </Behaviors>                
                </ig:WebDataGrid>
            </div>	
	    </div>
	</div>
</asp:Content>