<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr class="persistence-container">
            <td><asp:Label runat="server" ID="NumericInputLbl" Text="<%$ Resources:PersistenceFramework, txt_enter_numbers %>"></asp:Label></td>
            <td>
                <ig:WebNumericEditor ID="wneExpirience" HorizontalAlign="Left" runat="server" CssClass="persistence-input">
                </ig:WebNumericEditor>
            </td>
        </tr>
        <tr class="persistence-container">
            <td><asp:Label runat="server" ID="TextInputLbl" Text="<%$ Resources:PersistenceFramework, txt_enter_text %>"></asp:Label></td>
            <td>
                <asp:TextBox ID="tb1" runat="server" CssClass="persistence-input"></asp:TextBox>
            </td>
        </tr>
        <tr class="persistence-container">
            <td><asp:Button ID="btnSubmit" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_submit_changes %>" /></td>
        </tr>
    </table>
</asp:Content>