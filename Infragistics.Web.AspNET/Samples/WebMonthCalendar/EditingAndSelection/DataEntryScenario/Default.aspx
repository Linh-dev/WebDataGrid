<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <div class="calendar_container">
        <div class="calender_header">
            <%=this.GetGlobalResourceObject("WebMonthCalendar","DataEntryStartLabel") %>
        </div>
        <br />
        <asp:TextBox ID="txtStartDate" runat="server" CssClass="calender_date" />
        <br>
        <ig:WebMonthCalendar runat="server" ID="CalendarView" Width="250px"
            EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
            EnableYearDropDown="True">
            <ClientEvents SelectionChanged="set_str_date" />
        </ig:WebMonthCalendar>
       <br />
    </div>
    <div class="calendar_container">
        <div class="calender_header">
            <%=this.GetGlobalResourceObject("WebMonthCalendar","DataEntryEndLabel") %>
        </div>
        <br />
        <asp:TextBox ID="txtEndDate" runat="server" CssClass="calender_date" />
        <br>
        <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar1" Width="250px"
            EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
            EnableYearDropDown="True">
            <ClientEvents SelectionChanged="set_end_date" />
        </ig:WebMonthCalendar>
        <br />
    </div>

    <script type="text/javascript">

        function set_str_date(sender, args) {
            if (document.getElementById("<%=txtEndDate.ClientID %>").value != "" &&
                $find("<%= WebMonthCalendar1.ClientID %>").get_selectedDate() < args.get_dates()[0]) {
                alert('<%=this.GetGlobalResourceObject("WebMonthCalendar","DataEntryStartErrMsg") %>');
            }
            else {
                document.getElementById('<%=txtStartDate.ClientID %>').value = args.get_dates()[0].format('<%= this.GetGlobalResourceObject("WebMonthCalendar","DataEntry_DisplayModeFormat") %>');
            }
        }

        function set_end_date(sender, args) {
            if (document.getElementById("<%=txtStartDate.ClientID %>").value != "" &&
                $find("<%= CalendarView.ClientID %>").get_selectedDate() > args.get_dates()[0]) {
                alert('<%=this.GetGlobalResourceObject("WebMonthCalendar","DataEntryEndErrMsg") %>');
            }
            else {
                document.getElementById('<%=txtEndDate.ClientID %>').value = args.get_dates()[0].format('<%= this.GetGlobalResourceObject("WebMonthCalendar","DataEntry_DisplayModeFormat") %>');
            }
        }
        
    </script> 
</asp:Content>
