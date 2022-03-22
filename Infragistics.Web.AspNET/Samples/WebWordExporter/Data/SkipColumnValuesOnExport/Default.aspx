<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_SkipColumnValuesOnExport_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet"
        type="text/css" />
        <link href="<%= this.ResolveUrl("Style.css")%>" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<ig:WebWordExporter ID="wExporter" ExportMode="Download" runat="server" />
<div>
           <fieldset class="fldOptions" style="width:680px">
            <legend class="icoExporter">
                <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_ExportOptions") %></legend>
                <asp:Label runat="server" ID="lblFileName" Text="<%$ Resources:WebDataGrid, DocumentExporter_FileName %> "
                    CssClass="lblFileName" />
                <asp:TextBox runat="server" ID="tbFileName" Text="<%$ Resources:WebDataGrid, WordExporter_WebDataGridExportDefaultFileName %>" CssClass="txtFileName" />
             <br />
                <asp:Button runat="server" CssClass="props" ID="btnExport" Text="<%$ Resources:WebDataGrid, DocumentExporter_Export %>" />

        </fieldset>
        <div style="clear:both" ></div>
<fieldset style="width: auto; padding: 15px;">
                    <legend class="icoWebDataGrids">
                        <%= this.GetGlobalResourceObject("WebDataGrid","DocumentExporter_WebDataGrids") %></legend>
                    <h5>
                        <%= this.GetGlobalResourceObject("WebDataGrid", "WordExporter_EmployeesGrid")%></h5>
                    <ig:WebDataGrid runat="server" ID="wdgEmplyees" DataSourceID="AccessDsEmployees" DataKeyFields="EmployeeID"
                        AutoGenerateColumns="false" Width="100%" Height="367px" >
                        <AjaxIndicator Enabled="False" />
                        <Columns>
                            <ig:BoundDataField DataFieldName="EmployeeID" Key="EmployeeID" Hidden="true">   
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="FirstName" Key="FirstName">
                                <Header Text="<%$ Resources:WebDataGrid, WordExporter_FirstName %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="LastName" Key="LastName">
                                <Header Text="<%$ Resources:WebDataGrid, WordExporter_LastName %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="City" Key="City">
                                <Header Text="<%$ Resources:WebDataGrid, WordExporter_City %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="HomePhone" Key="HomePhone">
                                <Header Text="<%$ Resources:WebDataGrid, WordExporter_HomePhone %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="Salary" Key="Salary">
                                <Header Text="<%$ Resources:WebDataGrid, WordExporter_Salary %>" />
                            </ig:BoundDataField>
                        </Columns>

                    </ig:WebDataGrid>
    </fieldset>
    </div>
            <asp:AccessDataSource ID="AccessDsEmployees" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [City], [HomePhone], [Extension] as Salary FROM Employees">
        </asp:AccessDataSource>
</asp:Content>


