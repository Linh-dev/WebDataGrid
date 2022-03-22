<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Error_and_Empty_Data_Row_Template_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet"
        type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div1" class="wgDataBind">
        <div id="Div2">
            <div id="headerContainer" class="ControlPanelHeader">
                <img alt="Configuration" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
                <%= this.GetGlobalResourceObject("WebDataGrid","Activation_Basic_HeaderTitle") %></div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEvent">
                    <asp:RadioButton ID="ShowEmptyTemplate" runat="server" Text="<%$ Resources:WebDataGrid, Templates_Empty_Show  %>"
                        GroupName="TemplateType" AutoPostBack="true" Checked="true" /><br />
                    <asp:RadioButton ID="ShowErrorTemplate" runat="server" Text="<%$ Resources:WebDataGrid,  Templates_Error_Show  %>"
                        GroupName="TemplateType" AutoPostBack="true" />
                </div>
            </div>
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGridView" runat="server" DataKeyFields="CustomerID" AutoGenerateColumns="False"
                    Width="100%" Height="425">
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ContactName" Key="Contact">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Address" Key="Address">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="City" Key="City">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Country" Key="Country">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Paging PagerAppearance="Bottom" PageSize="20" Enabled="true" />
                    </Behaviors>
                    <EmptyRowsTemplate>
                        <div style="text-align: center;">
                            <br />
                            <br />
                            <img alt="Attention" src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Display/ErrorAndEmptyDataRowTemplate/attention.png" align="absmiddle" />
                            <%= this.GetGlobalResourceObject("WebDataGrid","EmptyRowTemplateMessage") %>
                        </div>
                    </EmptyRowsTemplate>
                    <ErrorTemplate>
                        <div style="text-align: center; width: 800px;">
                            <img alt="Error" src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Display/ErrorAndEmptyDataRowTemplate/error.png" align="absmiddle" />
                            <%= this.GetGlobalResourceObject("WebDataGrid","ErrorTemplateMessage") %>
                    </ErrorTemplate>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
</asp:Content>
