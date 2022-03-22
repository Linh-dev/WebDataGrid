<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="lbl1" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_sel_authentication %>"></asp:Label>
    <br/>
    <br/>
    <ig:WebDropDown ID="wddAuth" runat="server" Width="300px"
        DropDownAnimationDuration="500" DropDownContainerHeight="100px"
        DropDownContainerWidth="300px" DropDownAnimationType="EaseOut" EnableDropDownAsChild="false"
        AutoPostBack="true"> 
        <Items>
            <ig:DropDownItem Key="0" Value="0" Text="<%$ Resources:PersistenceFramework, lbl_user_ip %>"></ig:DropDownItem>
            <ig:DropDownItem Key="1" Value="1" Text="<%$ Resources:PersistenceFramework, lbl_cookies %>"></ig:DropDownItem>
        </Items>
    </ig:WebDropDown>
</asp:Content>