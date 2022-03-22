<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar1" 
        EnableWeekNumbers="true"
        ChangeMonthToDateClicked="true" 
        EnableMonthDropDown="true" 
        EnableYearDropDown="true"
        HideOtherMonthDays="false"
        SelectionType="Single">
    </ig:WebMonthCalendar>


<igtk:WebResizingExtender ID="wreOne" TargetControlID="WebMonthCalendar1" MinimumWidth="225" MinimumHeight="225"   
    runat="server" />
</asp:Content>