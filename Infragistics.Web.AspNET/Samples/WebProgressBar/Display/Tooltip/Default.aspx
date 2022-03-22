<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebProgressBar_Display_Tooltip_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div style="margin-bottom: 20px;">
        <div style="float: left; padding-top: 2px;">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:WebProgressBar, txt_tooltip_preset %>"></asp:Literal>: 
        </div>
        <div style="float: left; margin-left: 20px;">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />
        </div>
        <div style="clear: both;">
        </div>
    </div>
    <ig:WebProgressBar id="wpbOne" runat="server" filldirection="FromLeftOrTop" fillmode="Advance"
        stylesetname="IG" maximum="500" minimum="0" orientation="Horizontal" value="122"
        width="400" height="20" animationduration="100" animationtype="EaseIn" labelalignment="Running">
    </ig:WebProgressBar>

</asp:Content>
