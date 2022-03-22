<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Binding_to_BindingList_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="ProductID" runat="server" AutoGenerateColumns="False"
                    Width="100%">
                    <Columns>
                        <ig:BoundDataField DataFieldName="ProductID" Key="ProductID">
                            <Header Text="<%$ Resources:WebDataGrid, ProductID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ProductName" Key="ProductName">
                            <Header Text="<%$ Resources:WebDataGrid, ProductName  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit">
                            <Header Text="<%$ Resources:WebDataGrid, QuantityPerUnit  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice">
                            <Header Text="<%$ Resources:WebDataGrid, UnitPrice  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ReorderLevel" Key="ReorderLevel">
                            <Header Text="<%$ Resources:WebDataGrid, ReorderLevel  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="UnitsInStock" Key="UnitsInStock">
                            <Header Text="<%$ Resources:WebDataGrid, UnitsInStock %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder">
                            <Header Text="<%$ Resources:WebDataGrid, UnitsOnOrder  %>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Paging PagerAppearance="Bottom" PageSize="7" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
</asp:Content>
