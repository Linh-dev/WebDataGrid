<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" TextField="ContactName"
        DropDownContainerHeight="300px" EnableDropDownAsChild="false"
        DropDownContainerWidth="200px" DropDownAnimationType="EaseOut" EnablePaging="True"
        PageSize="12">
    </ig:WebDropDown>
</asp:Content>

