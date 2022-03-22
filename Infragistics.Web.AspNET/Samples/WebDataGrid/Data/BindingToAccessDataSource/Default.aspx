<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Binding_to_AccessDataSource_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataSourceID="AccessDataSource1" runat="server"
                    AutoGenerateColumns="True" Width="100%" Height="425">
                </ig:WebDataGrid>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
                    SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [City], [Country] FROM [Employees]">
                </asp:AccessDataSource>
            </div>
        </div>
    </div>
</asp:Content>
