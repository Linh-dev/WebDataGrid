<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="persistence-container" style="margin: 10px 20px 0 0; float: left; height: 230px;">
    <div style="float:left">
        <asp:Label ID="lblAnime" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_select_anime %>"></asp:Label>
        <ig:WebDropDown ID="wddAnime" runat="server" Width="200px"
            TextField="Company" DropDownAnimationDuration="500" DropDownContainerMaxHeight="110px"
            DropDownContainerWidth="200px" ValueField="Id" DropDownAnimationType="EaseOut"
            OnSelectionChanged="wddAnime_SelectionChanged" AutoPostBack="true"> 
            <Items>
                <ig:DropDownItem Key="Linear" Value="Linear" Text="<%$ Resources:PersistenceFramework, li_linear %>"></ig:DropDownItem>
                <ig:DropDownItem Key="Bounce" Value="Bounce" Text="<%$ Resources:PersistenceFramework, li_bounce %>"></ig:DropDownItem>
                <ig:DropDownItem Key="EasyIn" Value="EaseIn" Text="<%$ Resources:PersistenceFramework, li_easeIn %>"></ig:DropDownItem>
                <ig:DropDownItem Key="EasyOut" Value="EaseOut" Text="<%$ Resources:PersistenceFramework, li_easeOut %>"></ig:DropDownItem>
                <ig:DropDownItem Key="EasyInOut" Value="EaseInOut" Text="<%$ Resources:PersistenceFramework, li_easeOut %>"></ig:DropDownItem>
            </Items>
        </ig:WebDropDown>
        <asp:Label ID="lblPageSize" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_select_page_size %>"></asp:Label>
        <ig:WebDropDown ID="wddPageSize" runat="server" Width="200px"
            TextField="Company" DropDownAnimationDuration="500" DropDownContainerMaxHeight="65px"
            DropDownContainerWidth="200px" ValueField="Id" DropDownAnimationType="EaseOut"
            EnablePaging="True" PageSize="12" 
            onselectionchanged="wddPageSize_SelectionChanged" AutoPostBack="true">
            <Items>
                <ig:DropDownItem Value="5" Text="<%$ Resources:PersistenceFramework, li_5perPage %>"></ig:DropDownItem>
                <ig:DropDownItem Value="10" Text="<%$ Resources:PersistenceFramework, li_10perPage %>"></ig:DropDownItem>
                <ig:DropDownItem Value="15" Text="<%$ Resources:PersistenceFramework, li_14perPage %>"></ig:DropDownItem>
            </Items>
        </ig:WebDropDown>
        </div>
        <div style="float:left; margin-left:50px;">
        <asp:Label ID="lblPersisted" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_persisted_properties %>"></asp:Label>
        <ig:WebDropDown ID="wddPersisted" runat="server" Width="200px" DataSourceID="adsProduct"
            TextField="Company" DropDownAnimationDuration="500" DropDownContainerMaxHeight="110px"
            DropDownContainerWidth="200px" ValueField="Id" DropDownAnimationType="Linear"
            EnablePaging="True" PageSize="5" > 
            <AutoPostBackFlags SelectionChanged="On" />
        </ig:WebDropDown>
        <asp:Label ID="lblNotPersisted" runat="server" Text="<%$ Resources:PersistenceFramework, lbl_excluded_properties %>"></asp:Label>
        <ig:WebDropDown ID="wddNotPersisted" runat="server" Width="200px" DataSourceID="adsProduct"
            TextField="Company" DropDownAnimationDuration="500" DropDownContainerMaxHeight="110px"
            DropDownContainerWidth="200px" ValueField="Id" DropDownAnimationType="Linear"
            EnablePaging="True" PageSize="5"> 
            <AutoPostBackFlags SelectionChanged="On"  />
        </ig:WebDropDown>
        </div>
        <div class="clear">
        </div>
        <asp:AccessDataSource ID="adsProduct" runat="server"
            SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
                [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
        </asp:AccessDataSource>
    </div>
</asp:Content>