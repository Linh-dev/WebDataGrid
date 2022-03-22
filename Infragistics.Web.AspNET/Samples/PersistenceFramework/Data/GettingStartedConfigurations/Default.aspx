<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .sample-container { padding: 5px 0; }
        .sample-editors { margin-right: 5px; }
        .fake-button { float: right; }
        .clear-floating { clear: both; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    
    <div class="sample-container">
        <ig:WebTextEditor ID="wteName" runat="server" CssClass="sample-editors">
        </ig:WebTextEditor>

        <ig:WebDateTimeEditor ID="wdeBirthday" HorizontalAlign="Left" runat="server" CssClass="sample-editors">
        </ig:WebDateTimeEditor>

        <asp:Button ID="fakePostBack" runat="server" 
            Text="<%$ Resources:PersistenceFramework, lbl_save_state %>" CssClass="fake-button"/>
        <div class="clear-floating"></div>
    </div>             
    <ig:WebDataGrid ID="wdg1" runat="server" DataSourceID="adsProduct" 
        Height="100%" Width="100%" OnInit="wdg1_Init">
        <Behaviors>
            <ig:Paging Enabled="true"></ig:Paging>
        </Behaviors>
    </ig:WebDataGrid> 

    <asp:AccessDataSource ID="adsProduct" runat="server" 
        SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>