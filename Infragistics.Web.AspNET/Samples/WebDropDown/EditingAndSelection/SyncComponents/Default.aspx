<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="padding-bottom: 10px;">
                    <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" DisplayMode="DropDownList"
                        TextField="Company" DropDownAnimationDuration="1000" ValueField="Id" DropDownAnimationType="EaseOut">
                        <AutoPostBackFlags SelectionChanged="On" />
                        <ClientEvents />
                    </ig:WebDropDown>
                </div>
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" DataKeyFields="AccountID" AutoGenerateColumns="False"
                    Width="675" Height="500" StyleSetName="RedPlanet">
                    <Columns>
                        <ig:BoundDataField DataFieldName="AccountID" Key="AccountID">
                            <Header Text="<%$ Resources:WebDropDown, SyncColumnAccountID %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="AccountType" Key="AccountType">
                            <Header Text="<%$ Resources:WebDropDown, SyncColumnAccountType %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="FirstName" Key="FirstName">
                            <Header Text="<%$ Resources:WebDropDown, SyncColumnFirstName %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="LastName" Key="LastName">
                            <Header Text="<%$ Resources:WebDropDown, SyncColumnLastName %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Balance" Key="Balance" DataFormatString="${0:#,###.##}">
                            <Header Text="<%$ Resources:WebDropDown, SyncColumnBalance %>" />
                        </ig:BoundDataField>
                    </Columns>
                </ig:WebDataGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
