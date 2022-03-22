<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Alternating_Row_Templates_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanel.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div1" class="wgDataBind">
        <div id="Div2">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="AccessDataSource1"
                    DataKeyFields="CustomerID" AutoGenerateColumns="False" Width="90%">
                    <Columns>
                        <ig:TemplateDataField Key="CustomerID">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID %>" />
                            <ItemTemplate>
                                <asp:Label ID="CustomerIDLabel" runat="server" CssClass="NormalTemplate"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "CustomerID") %></asp:Label>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <asp:Label ID="CustomerIDLabel" runat="server" CssClass="AlternateTemplate"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "CustomerID") %></asp:Label>
                            </AlternatingItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                            <ItemTemplate>
                                <asp:Label ID="CompanyNameLabel" runat="server" CssClass="NormalTemplate"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "CompanyName") %></asp:Label>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <asp:Label ID="CompanyNameLabel" runat="server" CssClass="AlternateTemplate"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "CompanyName") %></asp:Label>
                            </AlternatingItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="ContactName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                            <ItemTemplate>
                                <asp:Label ID="ContactNameLabel" runat="server" CssClass="NormalTemplate"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "ContactName") %></asp:Label>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <asp:Label ID="ContactNameLabel" runat="server" CssClass="AlternateTemplate"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "ContactName") %></asp:Label>
                            </AlternatingItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="Address">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                            <ItemTemplate>
                                <div id="AddressContainer" class="NormalTemplate">
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Address") %>
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "City")%>
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "PostalCode")%>
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Country")%>
                                </div>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <div id="AddressContainer" class="AlternateTemplate">
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Address") %>
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "City")%>
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "PostalCode")%>
                                    <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Country")%>
                                </div>
                            </AlternatingItemTemplate>
                        </ig:TemplateDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers] ">
    </asp:AccessDataSource>
</asp:Content>
