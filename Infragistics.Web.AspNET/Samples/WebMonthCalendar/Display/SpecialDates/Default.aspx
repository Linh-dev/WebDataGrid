<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <ig:WebMonthCalendar runat="server" ID="CalendarView" EnableWeekNumbers="true"
        ChangeMonthToDateClicked="true" EnableMonthDropDown="True" EnableYearDropDown="True"> 
         </ig:WebMonthCalendar>
</asp:Content>