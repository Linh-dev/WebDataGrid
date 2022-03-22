<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="persistence-container">
        <asp:DropDownList ID="ddl" runat="server" 
            AutoPostBack="true"
            OnSelectedIndexChanged="ddl_OnSelectedIndexChanged">
            <asp:ListItem Value="" Text="<%$ Resources:PersistenceFramework, lbl_select_math_constant %>"></asp:ListItem>
            <asp:ListItem Value="3.14159" Text="&pi;"></asp:ListItem>
            <asp:ListItem Value="2.71828" Text="e"></asp:ListItem>
            <asp:ListItem Value="0.5772" Text="&gamma;"></asp:ListItem>
            <asp:ListItem Value="1.61803" Text="&Phi;"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="persistence-container">
        <input ID="inpHTML" type="text" runat="server" />
    </div>
    <div class="clear"></div>
    <div class="persistence-container">
        <asp:CheckBox ID="chkIsPersisted" Checked="false" runat="server" 
            AutoPostBack="true" OnCheckedChanged="chkIsPersisted_OnCheckedChanged"/>
        <asp:Literal ID="Literal1" Text="<%$ Resources:PersistenceFramework, lbl_enable_persistence %>" runat="server"></asp:Literal>
    </div>
    <div class="clear"></div>
</asp:Content>