<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 999px; padding: 20px;">
        <div id="WinMenuDiv" style="margin-top: 30px; width: 100%; height: 250px; position:relative; z-index:10;">
            <h2><%=this.GetGlobalResourceObject("WebDataMenu","WinMenu_WinMenu")%></h2>
            <br />
            <ig:WebDataMenu ID="WinMenu" runat="server" StyleSetName="Windows7" EnableScrolling="true"
                DataSourceID="MenuDataSource" ActivateOnHover="false" >
                <GroupSettings Orientation="Horizontal" Width="300px" />
                <DataBindings>
                    <ig:DataMenuItemBinding DataMember="Menu" TextField="ID" ValueField="Value"> </ig:DataMenuItemBinding >
                </DataBindings>
            </ig:WebDataMenu>
        </div>
        <div id="webMenuDiv" style="margin-top: 30px; width: 100%; height: 250px; position:relative; z-index:0;">
            <h2><%=this.GetGlobalResourceObject("WebDataMenu","WinMenu_WebMenu")%></h2>
            <br />
            <ig:WebDataMenu ID="WebDataMenu" runat="server" StyleSetName="Appletini" EnableScrolling="true"  
                DataSourceID="WebMenuDataSource" ActivateOnHover="true">
                <GroupSettings Orientation="Horizontal" Width="500px" Height="300px"/>
                <DataBindings>
                    <ig:DataMenuItemBinding DataMember="Menu" TextField="ID" ValueField="Value" />
                </DataBindings>
            </ig:WebDataMenu>
        </div>
    </div>
    <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/WinMenu/Menu" />
    <asp:XmlDataSource runat="server" ID="WebMenuDataSource" XPath="/MenuData/WebMenu/Menu" />
</asp:Content>

