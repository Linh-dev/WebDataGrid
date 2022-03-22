<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
   <ContentTemplate>
       <div style="padding: 15px;">
           <div>
               <asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebSchedule, TimeZoneLanding_Label1 %>"></asp:Label>
               <br />
               <asp:DropDownList ID="ResourceList" runat="server" AutoPostBack="true" Width="311px">
               </asp:DropDownList>
               <br />
               <asp:Label ID="Label10" runat="server" Text="<%$ Resources:WebSchedule, TimeZoneLanding_Label2 %>"></asp:Label>
               <br />
               <asp:DropDownList ID="GMTList" Style="z-index: 101; left: 209px; top: 30px" runat="server"
                   AutoPostBack="true">
                   <asp:ListItem Value="-12">(GMT - 12) International Date Line West</asp:ListItem>
                   <asp:ListItem Value="-11">(GMT - 11) Midway Island, Samoa</asp:ListItem>
                   <asp:ListItem Value="-10">(GMT - 10) Hawaii</asp:ListItem>
                   <asp:ListItem Value="-9">(GMT - 09) Alaska</asp:ListItem>
                   <asp:ListItem Value="-9">(GMT - 09) Hawaii (DST)</asp:ListItem>
                   <asp:ListItem Value="-8">(GMT - 08) Pacific Time (US &amp; Canada); Tijuana</asp:ListItem>
                   <asp:ListItem Value="-8">(GMT - 08) Yukon Time (DST)</asp:ListItem>
                   <asp:ListItem Value="-7">(GMT - 07) Pacific Time (DST)</asp:ListItem>
                   <asp:ListItem Value="-7">(GMT - 07) Arizona</asp:ListItem>
                   <asp:ListItem Value="-7">(GMT - 07) Chihuahua, La Paz, Mazatlan</asp:ListItem>
                   <asp:ListItem Value="-7">(GMT - 07) Mountain Time (US &amp; Canada)</asp:ListItem>
                   <asp:ListItem Value="-6">(GMT - 06) Mountain Time (DST)</asp:ListItem>
                   <asp:ListItem Value="-6">(GMT - 06) Central Time(US &amp; Canada)</asp:ListItem>
                   <asp:ListItem Value="-6">(GMT - 06) Guadalajara, Mexico City, Monterrey</asp:ListItem>
                   <asp:ListItem Value="-6">(GMT - 06) Saskatchewan</asp:ListItem>
                   <asp:ListItem Value="-5">(GMT - 05) Central Time (DST)</asp:ListItem>
                   <asp:ListItem Value="-5">(GMT - 05) Bogota, Lima, Quito</asp:ListItem>
                   <asp:ListItem Value="-5">(GMT - 05) Eastern Time(US &amp; Canada)</asp:ListItem>
                   <asp:ListItem Value="-5">(GMT - 05) Indiana (East) </asp:ListItem>
                   <asp:ListItem Value="-4">(GMT - 04) Eastern Time (DST)</asp:ListItem>
                   <asp:ListItem Value="-4">(GMT - 04) Atlantic Time(Canada)</asp:ListItem>
                   <asp:ListItem Value="-4">(GMT - 04) Caracas, La Paz, Santiago</asp:ListItem>
                   <asp:ListItem Value="-3.5">(GMT - 3.5) Newfoundland</asp:ListItem>
                   <asp:ListItem Value="-3">(GMT - 03) Atlantic Time (DST)</asp:ListItem>
                   <asp:ListItem Value="-3">(GMT - 03) Brasillia</asp:ListItem>
                   <asp:ListItem Value="-3">(GMT - 03)  Buenos Aires, Georgetown</asp:ListItem>
                   <asp:ListItem Value="-3">(GMT - 03)  Greenland</asp:ListItem>
                   <asp:ListItem Value="-2">(GMT - 02) Mid-Atlantic</asp:ListItem>
                   <asp:ListItem Value="-1">(GMT - 01) Azores</asp:ListItem>
                   <asp:ListItem Value="-1">(GMT - 01) Cape Verde Is.</asp:ListItem>
                   <asp:ListItem Value="0">(GMT) Casablanca, Monrovia</asp:ListItem>
                   <asp:ListItem Value="0">(GMT) Greenwich Mean Time: Dublin, Edinburgh, Lisbon, London</asp:ListItem>
                   <asp:ListItem Value="1">(GMT + 01) Belgrade, Bratislava, Budapest, Ljubljana, Prague</asp:ListItem>
                   <asp:ListItem Value="1">(GMT + 01) Brussels, Copenhagen, Madrid, Paris</asp:ListItem>
                   <asp:ListItem Value="1">(GMT + 01) Sarajevo, Skopje, Warsaw, Zagreb</asp:ListItem>
                   <asp:ListItem Value="1">(GMT + 01) West Central Africa</asp:ListItem>
                   <asp:ListItem Value="2">(GMT + 02) Athens, Beirut, Istanbul, Minsk</asp:ListItem>
                   <asp:ListItem Value="2">(GMT + 02) Bucharest</asp:ListItem>
                   <asp:ListItem Value="2">(GMT + 02) Cairo</asp:ListItem>
                   <asp:ListItem Value="2">(GMT + 02) Harare, Pretoria</asp:ListItem>
                   <asp:ListItem Value="2">(GMT + 02) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius</asp:ListItem>
                   <asp:ListItem Value="2">(GMT + 02) Jerusalem</asp:ListItem>
                   <asp:ListItem Value="3">(GMT + 03) Baghdad</asp:ListItem>
                   <asp:ListItem Value="3">(GMT + 03) Kuwait, Riyadh</asp:ListItem>
                   <asp:ListItem Value="3">(GMT + 03) Moscow, St. Petersburg, Volgograd</asp:ListItem>
                   <asp:ListItem Value="3">(GMT + 03) Nairobi</asp:ListItem>
                   <asp:ListItem Value="3.5">(GMT + 3.5) Tehran</asp:ListItem>
                   <asp:ListItem Value="4">(GMT + 04) Abu Dhabi, Muscat</asp:ListItem>
                   <asp:ListItem Value="4">(GMT + 04) Baku, Tbilisi, Yerevan</asp:ListItem>
                   <asp:ListItem Value="4.5">(GMT + 4.5) Kabul</asp:ListItem>
                   <asp:ListItem Value="5">(GMT + 05) Ekaterinburg</asp:ListItem>
                   <asp:ListItem Value="5">(GMT + 05) Islamabad, Karachi, Tashkent</asp:ListItem>
                   <asp:ListItem Value="5.5">(GMT + 5.5) Chennai, Kolkata, Mumbai, New Delhi</asp:ListItem>
                   <asp:ListItem Value="5.75">(GMT + 5.75) Kathmandu</asp:ListItem>
                   <asp:ListItem Value="6">(GMT + 06) Almaty, Novosibirsk</asp:ListItem>
                   <asp:ListItem Value="6">(GMT + 06) Astana, Dhaka</asp:ListItem>
                   <asp:ListItem Value="6">(GMT + 06) Sri Jayawardenepura</asp:ListItem>
                   <asp:ListItem Value="6.5">(GMT + 6.5) Rangoon</asp:ListItem>
                   <asp:ListItem Value="7">(GMT + 07) Bangkok, Hanoi, Jakarta</asp:ListItem>
                   <asp:ListItem Value="7">(GMT + 07) Krasnoyarsk</asp:ListItem>
                   <asp:ListItem Value="8">(GMT + 08) Beijing, Chongqing, Hong Kong, Urumqi</asp:ListItem>
                   <asp:ListItem Value="8">(GMT + 08) Irkutsk, Ulaan Bataar</asp:ListItem>
                   <asp:ListItem Value="8">(GMT + 08) Kuala Lumpur, Singapore</asp:ListItem>
                   <asp:ListItem Value="8">(GMT + 08) Perth</asp:ListItem>
                   <asp:ListItem Value="8">(GMT + 08) Taipei</asp:ListItem>
                   <asp:ListItem Value="9">(GMT + 9) Osaka, Sapporo, Tokyo</asp:ListItem>
                   <asp:ListItem Value="9">(GMT + 09) Seoul</asp:ListItem>
                   <asp:ListItem Value="9">(GMT + 09) Yakutsk</asp:ListItem>
                   <asp:ListItem Value="9.5">(GMT + 9.5) Adelaide</asp:ListItem>
                   <asp:ListItem Value="9.5">(GMT + 9.5) Darwin</asp:ListItem>
                   <asp:ListItem Value="10">(GMT + 10) Brisbane</asp:ListItem>
                   <asp:ListItem Value="10">(GMT + 10) Canberra, Melbourne, Sydney</asp:ListItem>
                   <asp:ListItem Value="10">(GMT + 10) Guam, Port Moresby</asp:ListItem>
                   <asp:ListItem Value="10">(GMT + 10) Hobart</asp:ListItem>
                   <asp:ListItem Value="10">(GMT + 10) Vladivostok</asp:ListItem>
                   <asp:ListItem Value="11">(GMT + 11) Magadan, Solomon Is., New Caledonia</asp:ListItem>
                   <asp:ListItem Value="12">(GMT + 12) Auckland, Wellington</asp:ListItem>
                   <asp:ListItem Value="12">(GMT + 12) Fiji, Kamchatka, Marshall Is. </asp:ListItem>
                   <asp:ListItem Value="13">(GMT + 13) Nuku'alofa</asp:ListItem>
               </asp:DropDownList>
           </div>
           <br />
           <asp:Literal ID="Literal1" runat="server" EnableViewState="False"></asp:Literal>
           <br />
           <div style="width: 25%; float: left; margin-right: 15px; margin-top:2px;">
               <ig_sched:WebCalendarView ID="WebCalendarView1" runat="server" Width="100%" 
                   WebScheduleInfoID="WebScheduleInfo1" NavigationAnimation="Linear">
               </ig_sched:WebCalendarView>
           </div>
           <div style="width: 100%; max-width: 43%; float: left">
<%--               <ig_sched:WebWeekView ID="WebWeekView1" runat="server" Width="100%" Height="230px"
                   WebScheduleInfoID="WebScheduleInfo1" OnInit="WebWeekView1_Init" NavigationAnimation="Linear">
               </ig_sched:WebWeekView>--%>
               <div style="clear:both"></div>
           </div>
           <div style="width: 29%; height: 500px; float: right; margin-top:2px;">
               <ig_sched:WebDayView ID="WebDayView1" runat="server" Width="100%" Height="736px"
                   WebScheduleInfoID="WebScheduleInfo1" NavigationAnimation="Linear">
               </ig_sched:WebDayView>
           </div>
           <div>
               <ig_sched:WebScheduleInfo ID="WebScheduleInfo1" Style="z-index: 101" runat="server"
                   EnableRecurringActivities="True" EnableSmartCallbacks="True" EnableProgressIndicator="False"
                   EnableReminders="True">
               </ig_sched:WebScheduleInfo>
           </div>
           <div style="width: 70%; float: left; max-width: 70%; width:649px; margin-top: 15px;">
               <ig_sched:WebMonthView ID="WebMonthView1" runat="server" Width="100%" Height="100%"
                   WebScheduleInfoID="WebScheduleInfo1" WeekendDisplayFormat="Compressed" NavigationAnimation="Linear">
               </ig_sched:WebMonthView>
           </div>
           <ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" Style="z-index: 102"
               runat="server" Width="136px" Height="53px" WebScheduleInfoID="WebScheduleInfo1"
               ConnectionID="oleDbConnection1">
           </ig_scheduledata:WebScheduleOleDbProvider>
           <ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider2" Style="z-index: 101;
               left: -10px; top: -8px" runat="server" ConnectionID="oleDbConnection1">
           </ig_scheduledata:WebScheduleOleDbProvider>
           <div style="clear: both">
           </div>
       </div>
    </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>