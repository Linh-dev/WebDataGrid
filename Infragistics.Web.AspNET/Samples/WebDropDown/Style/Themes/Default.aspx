<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="width: 100%; padding-top: 10px; padding-left: 1px;" title="Select a different theme from the drop down to see other styles.">
        <div style="padding-bottom: 5px;">
            <img src="<%= string.Format("/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/{0}.png", this.WebDropDown1.StyleSetName) %>" alt="<%= this.GetGlobalResourceObject("Strings", string.Format("{0}Style", this.WebDropDown1.StyleSetName)) %>" />
        </div>
        <ig:WebDropDown ID="WebDropDown1" EnableDropDownAsChild="false" runat="server" Width="200px"
            DropDownContainerWidth="200px" DropDownContainerHeight="200px" StyleSetName="Appletini">
            <AutoPostBackFlags SelectionChanged="On" />
            <Items>
                <ig:DropDownItem Text="Appletini">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Caribbean">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Claymation">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Default">
                </ig:DropDownItem>
                <ig:DropDownItem Text="ElectricBlue">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Harvest">
                </ig:DropDownItem>
                <ig:DropDownItem Text="LucidDream">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Nautilus">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Office2007Black">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Office2007Blue">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Office2007Silver">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Pear">
                </ig:DropDownItem>
                <ig:DropDownItem Text="RedPlanet">
                </ig:DropDownItem>
                <ig:DropDownItem Text="RubberBlack">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Trendy">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Windows7">
                </ig:DropDownItem>
                <ig:DropDownItem Text="Office2010Blue">
                </ig:DropDownItem>
            </Items>
        </ig:WebDropDown>
    </div>
</asp:Content>
