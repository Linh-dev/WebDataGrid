<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Binding_to_LinqDataSource_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="true" Width="100%"
                    DataSourceID="Linqdatasource1">
                    <Behaviors>
                        <ig:Paging PageSize="5">
                        </ig:Paging>
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:LinqDataSource ID="Linqdatasource1" runat="server" Select="new(SupplierID,CompanyName,ContactName,ContactTitle,City,Country)"
        ContextTypeName="Infragistics.Web.SamplesBrowser.AspNET.AppCode.CLR35.Models.NorthwindDataContext" TableName="Suppliers">
    </asp:LinqDataSource>
</asp:Content>
