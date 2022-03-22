<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Databinding_Expressions_Templates_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanel.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" DataSourceID="AccessDataSource1"
                    DataKeyFields="CustomerID" AutoGenerateColumns="False" Width="100%" Height="425">
                    <Columns>
                        <ig:TemplateDataField Key="CustomerID">
                            <ItemTemplate>
                                <asp:Label ID="CustomerIDLabel" runat="server"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "CustomerID") %></asp:Label>
                            </ItemTemplate>
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID %>" />
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="CompanyName">
                            <ItemTemplate>
                                <asp:Label ID="CompanyNameLabel" runat="server"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "CompanyName") %></asp:Label>
                            </ItemTemplate>
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="ContactName">
                            <ItemTemplate>
                                <div>
                                    <img src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Data/DatabindingExpressionsTemplates/contactIcon.jpg" />
                                    <asp:Label ID="ContactNameLabel" runat="server"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "ContactName") %></asp:Label>
                                </div>
                            </ItemTemplate>
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="Address">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                            <ItemTemplate>
                                <div>
                                    <div style="float: left">
                                        <img src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Data/DatabindingExpressionsTemplates/mailbox.jpg" /></div>
                                    <div style="margin-left: 33px">
                                        <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Address") %>
                                        <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "City")%>
                                        <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "PostalCode")%>
                                        <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Country")%>
                                    </div>
                                </div>
                            </ItemTemplate>
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
        SelectCommand="<%$ Resources:WebDataGrid, WebDataGrid1_Select_Statement %>">
    </asp:AccessDataSource>
</asp:Content>
