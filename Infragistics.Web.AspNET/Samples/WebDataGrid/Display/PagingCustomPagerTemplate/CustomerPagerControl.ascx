<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerPagerControl.ascx.cs"
    Inherits="CustomerPagerControl" %>
<style type="text/css">
    .DropDownClass
    {
        font-size: 11px;
        vertical-align: middle !important;
    }
    .CustPageLabelClass
    {
        vertical-align: middle !important;        
    }
</style>
<asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" CommandName="Page" CssClass="CustPageLabelClass"
    ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/PagingCustomPagerTemplate/pagerFirst.gif" align="absmiddle" />
<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" CommandName="Page" CssClass="CustPageLabelClass"
    ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/PagingCustomPagerTemplate/pagerPrev.gif" align="absmiddle" />
<asp:Label ID="Label2" runat="server" CssClass="CustPageLabelClass"><%= this.GetGlobalResourceObject("WebDataGrid","Paging_Page") %></asp:Label>

<asp:DropDownList ID="PagerPageList" runat="server" OnSelectedIndexChanged="PagerPageList_SelectedIndexChanged"
    AutoPostBack="True" CssClass="DropDownClass" />
<asp:Label ID="Label1" runat="server" CssClass="CustPageLabelClass"><%= this.GetGlobalResourceObject("WebDataGrid","Paging_of") %></asp:Label>
<asp:Label ID="PageText" runat="server" CssClass="CustPageLabelClass" />
<asp:ImageButton ID="ImageButton3" runat="server" CssClass="CustPageLabelClass" CommandArgument="Next" CommandName="Page"
    ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/PagingCustomPagerTemplate/pagerNext.gif" align="absmiddle" />
<asp:ImageButton ID="ImageButton4" runat="server" CssClass="CustPageLabelClass" CommandArgument="Last" CommandName="Page"
    ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/PagingCustomPagerTemplate/pagerLast.gif" align="absmiddle" />
