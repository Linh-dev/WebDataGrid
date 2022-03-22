<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" TextField="Contact"
        DataSourceID="DropDownDataSource" DropDownAnimationDuration="1000" DropDownContainerHeight="300px"
        DropDownContainerWidth="200px" DropDownAnimationType="EaseOut" EnablePaging="False"
        PageSize="12" EnableDropDownAsChild="false">
        <AutoPostBackFlags SelectionChanged="Off" />
        <DropDownItemBinding TextField="ContactName" />
    </ig:WebDropDown>

    <asp:AccessDataSource ID="DropDownDataSource" runat="server"
        SelectCommand="SELECT CustomerID, ContactName FROM [Customers] ORDER BY ContactName">
    </asp:AccessDataSource>
</asp:Content>
