<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <!--#BEGIN SNIPPET#-->
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" DataKeyFields="CustomerID" Width="100%"
        Height="400px" DefaultColumnWidth="90px" OnCustomDataBinding="WebDataGrid1_CustomDataBinding">
        <Behaviors>
            <ig:Paging PageSize="12" />
        </Behaviors>
    </ig:WebDataGrid>
    <!--#END SNIPPET#-->
</asp:Content>
