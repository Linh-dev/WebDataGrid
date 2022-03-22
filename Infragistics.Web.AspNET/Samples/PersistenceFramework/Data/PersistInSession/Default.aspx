<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="persistence-container">
        <asp:Literal runat="server" Text="<%$ Resources:PersistenceFramework, txt_will_be_persisted_in_session %>"></asp:Literal>:
    </div>

    <table>
        <tr class="persistence-container">          
            <td><asp:Label runat="server" ID="NumericInputLbl" Text="<%$ Resources:PersistenceFramework, txt_enter_numbers %>"></asp:Label></td>
            <td>
                <ig:WebNumericEditor ID="wneExpirience" Width="180px" HorizontalAlign="Left" runat="server">
                </ig:WebNumericEditor>
            </td>
        </tr>
        <tr class="persistence-container">  
            <td><asp:Label runat="server" ID="Label1" Text="<%$ Resources:PersistenceFramework, txt_enter_text %>"></asp:Label></td>
            <td><asp:TextBox ID="tb1" runat="server" Width="178px"></asp:TextBox></td>
        </tr>
        <tr class="persistence-container">  
            <td><asp:Button ID="btnSubmit" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_submit_changes %>" /></td>
        </tr>
    </table>
</asp:Content>