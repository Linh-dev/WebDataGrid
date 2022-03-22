<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        table tbody tr { vertical-align: middle; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <ig:WebImageViewer ID="WebImageViewer1" runat="server" DataSourceID="SQLDataSource1"
        Height="240px" Width="720px" ScrollAnimations-Type="NextItem" OnDataBound="WebImageViewer1_DataBound">
        <Header Visible="true" Text="<%$ Resources:WebImageViewer,DataBinding_Description_3 %>" />
        <ImageItemBinding AltTextField="AltText" ImageUrlField="ImageUrl" 
            NavigateUrlFields="NavigateUrl" ToolTipField="ToolTip" />
    </ig:WebImageViewer>

    <asp:SqlDataSource ID="SQLDataSource1" runat="server" />
        
</asp:Content>