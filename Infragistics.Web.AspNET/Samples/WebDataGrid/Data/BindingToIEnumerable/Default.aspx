<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Binding_to_IEnumerable_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
      <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="wrapper" class="wgDataBind">
        <div id="container">
        <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="EmployeeID" runat="server" AutoGenerateColumns="False"
                    Width="100%">     
                </ig:WebDataGrid>
           </div>               
        </div>
        </div>
</asp:Content>