<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="persistence-container">
        <div class="persistence-label">
            <asp:Label ID="lblName" Text="<%$ Resources:PersistenceFramework, lbl_name %>" runat="server"></asp:Label>
        </div>
        <div class="persistence-editor">
            <ig:WebTextEditor ID="wteName" runat="server">
            </ig:WebTextEditor>
        </div>
        <div class="clear"></div>

        <div class="persistence-label">
            <asp:Label ID="lblBirthday" Text="<%$ Resources:PersistenceFramework, lbl_birthday %>" runat="server"></asp:Label>
        </div>
        <div class="persistence-editor">
            <ig:WebDateTimeEditor ID="wdeBirthday" HorizontalAlign="Left" runat="server">
            </ig:WebDateTimeEditor>
        </div>
        <div class="clear"></div>

        <div class="persistence-label">
            <asp:Label ID="lblExpirience" Text="<%$ Resources:PersistenceFramework, lbl_years_expirience %>" runat="server"></asp:Label>
        </div>
        <div class="persistence-editor">
            <ig:WebNumericEditor ID="wneExpirience" HorizontalAlign="Left" runat="server">
            </ig:WebNumericEditor>
        </div>
        <div class="clear"></div>

        <div class="persistence-label">
            <asp:Label ID="lblSallary" Text="<%$ Resources:PersistenceFramework, lbl_desired_sallary %>" runat="server"></asp:Label>
        </div>
        <div class="persistence-editor">
            <ig:WebCurrencyEditor ID="wceSallary" HorizontalAlign="Left" runat="server">
            </ig:WebCurrencyEditor>
        </div>
        <div class="clear"></div>

        <div class="persistence-label">
            <asp:Label ID="lblUser" Text="<%$ Resources:PersistenceFramework, lbl_user_name %>" runat="server"></asp:Label>
        </div>
        <div class="persistence-editor">
            <ig:WebTextEditor ID="wteUser" runat="server">
            </ig:WebTextEditor>
        </div>
        <div class="clear"></div>

        <div class="persistence-label">
            <asp:Label ID="lblPass" Text="<%$ Resources:PersistenceFramework, lbl_password %>" runat="server"></asp:Label>
        </div>
        <div class="persistence-editor">
            <ig:WebTextEditor ID="wtePass" runat="server" TextMode="Password">
            </ig:WebTextEditor>
        </div>
        <div class="clear"></div>

        <div class="persistence-label">
            <asp:Label ID="lblConfPass" Text="<%$ Resources:PersistenceFramework, lbl_confirm_password %>" runat="server"></asp:Label>
        </div>
        <div class="persistence-editor">
            <ig:WebTextEditor ID="wteConfPass" runat="server" TextMode="Password">
            </ig:WebTextEditor>
        </div>
        <div class="clear"></div>

        <div>
            <asp:Button ID="btnSearchJob" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_search_job %>" OnClick="btnSearchJob_Click"/>
        </div>
        <asp:Label ID="lblWrongPass" runat="server" Text="<%$ Resources:PersistenceFramework, txt_wrong_passwords %>" Visible="false"></asp:Label>
        <a href="http://www.infragistics.com/careers">
            <asp:Label ID="lblJob" runat="server" Text="<%$ Resources:PersistenceFramework, txt_perfect_job %>" Visible="false"></asp:Label>
        </a>
    </div>
</asp:Content>