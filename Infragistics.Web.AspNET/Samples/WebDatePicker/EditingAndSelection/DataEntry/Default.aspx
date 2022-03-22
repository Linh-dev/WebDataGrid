<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="calendar_container" style="height: 300px;">
        <div class="calender_header">
            <%=this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_DataEntry_StartLabel")%>
        </div>
        <br />
         <asp:TextBox ID="txtStartDate" runat="server" CssClass="calender_date" />
        <br />
        <ig:WebDatePicker runat="server" ID="webDatePicker1" Width="253px"
            EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
            EnableYearDropDown="True">
            <ClientSideEvents ValueChanging="set_str_date" CalendarClosed="set_str_date" TextChanged="set_str_change" />
        </ig:WebDatePicker>
        <br />
       
    </div>
    <div class="calendar_container" style="height: 300px;">
        <div class="calender_header">
            <%=this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_DataEntry_EndLabel")%>
        </div>
        <br />
        <asp:TextBox ID="txtEndDate" runat="server" CssClass="calender_date" />
        <br />
        <ig:WebDatePicker runat="server" ID="webDatePicker2" Width="253px"
            EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
            EnableYearDropDown="True">
            <ClientSideEvents ValueChanging="set_end_date" CalendarClosed="set_end_date" TextChanged="set_end_change" />
        </ig:WebDatePicker>
        <br />
    </div> 

    <script type="text/javascript">
        function set_str_date(sender, args) {
				var dateStart = args.get_value(), dateEnd = $find("<%= webDatePicker2.ClientID %>").get_value();
            if (dateStart && dateEnd && dateEnd < dateStart) {
                args.set_cancel(true);
                alert('<%=this.GetGlobalResourceObject("WebMonthCalendar","DataEntryStartErrMsg") %>');
					 dateStart = args.get_oldValue();
            }
				var text = "";
				if (dateStart) {
					 text = dateStart.format('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_DataEntry_DisplayModeFormat") %>');
            }
            document.getElementById('<%=txtStartDate.ClientID %>').value = text;
        }

        function set_end_date(sender, args) {
				var dateEnd = args.get_value(), dateStart = $find("<%= webDatePicker1.ClientID %>").get_value();
            if (dateStart && dateEnd && dateEnd < dateStart) {
                args.set_cancel(true);
                alert('<%=this.GetGlobalResourceObject("WebMonthCalendar","DataEntryStartErrMsg") %>');
					 dateEnd = args.get_oldValue();
            }
				var text = "";
				if (dateEnd) {
					 text = dateEnd.format('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_DataEntry_DisplayModeFormat") %>');
            }
            document.getElementById('<%=txtEndDate.ClientID %>').value = text;
        }        

        function set_str_change(sender, args) {
            var date = sender.get_value();
				if (date && date.getFullYear && date.getFullYear() > 1900) {
	             document.getElementById('<%=txtStartDate.ClientID %>').value = date.format('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_DataEntry_DisplayModeFormat") %>');
				}
        }

        function set_end_change(sender, args) {
            var date = sender.get_value();
				if (date && date.getFullYear && date.getFullYear() > 1900) {
					 document.getElementById('<%=txtEndDate.ClientID %>').value = date.format('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_DataEntry_DisplayModeFormat") %>');
				}
        }
    </script>

</asp:Content>
