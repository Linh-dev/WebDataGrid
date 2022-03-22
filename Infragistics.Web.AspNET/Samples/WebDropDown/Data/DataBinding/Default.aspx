<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Src="~/SamplesCommon/aspnet/Common/UserControls/DataSourceControl/DataSourceControl.ascx" TagName="DataSourceControl"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true"
        UpdateMode="Conditional">
        <ContentTemplate>            
            <div class="controlPanel" style="background-color: #ffffff; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
                background-repeat: no-repeat; border: 1px solid #EEEEEE; width: 673px; height: 190px;
                padding-left: 15px; padding-top: 30px;">
                <uc1:DataSourceControl ID="SelectedDataSource" runat="server" ExcludedDataSource="XML|BL|DS" />
                <br />
                <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" TextField="Contact"
                    DropDownAnimationDuration="1000" DropDownContainerHeight="300px" DropDownContainerWidth="200px"
                    ValueField="Id" EnableDropDownAsChild="false" DropDownAnimationType="EaseOut" EnablePaging="False" PageSize="12">
                    <AutoPostBackFlags SelectionChanged="Off" />
                    <ClientEvents />
                </ig:WebDropDown>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:AccessDataSource ID="DropDownDataSource" runat="server"
        SelectCommand="SELECT CustomerID, ContactName FROM [Customers] ORDER BY ContactName">
    </asp:AccessDataSource>
</asp:Content>
