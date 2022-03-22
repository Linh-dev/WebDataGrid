<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Literal ID="Literal1" Text="<%$ Resources:PersistenceFramework, lbl_persist %>" runat="server"></asp:Literal>
    <asp:CheckBox ID="chkIsPersisted" runat="server" Checked="true" AutoPostBack="true" OnCheckedChanged="chkIsPersisted_CheckedChanged"/>
    <br/>
    <br/>
    <ig:WebDropDown ID="wddAnime" runat="server" Width="250px"
        DropDownAnimationDuration="500" DropDownContainerHeight="200px"
        DropDownContainerWidth="250px" DropDownAnimationType="EaseOut" EnableDropDownAsChild="false"
        AutoPostBack="true"> 
        <Items>
            <ig:DropDownItem Key="0" Value="0" Text="<%$ Resources:PersistenceFramework, lbl_sel_net_advantage %>"></ig:DropDownItem>
            <ig:DropDownItem Key="1" Value="1" Text="ASP.NET"></ig:DropDownItem>
            <ig:DropDownItem Key="2" Value="2" Text="Silverlight"></ig:DropDownItem>
            <ig:DropDownItem Key="3" Value="3" Text="Mobile"></ig:DropDownItem>
            <ig:DropDownItem Key="4" Value="4" Text="jQuery"></ig:DropDownItem>
        </Items>
    </ig:WebDropDown>
</asp:Content>