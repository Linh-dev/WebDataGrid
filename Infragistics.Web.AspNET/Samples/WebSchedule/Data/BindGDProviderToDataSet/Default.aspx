<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <ig_sched:WebMonthView ID="WebMonthView1" WebScheduleInfoID="wsInfo" runat="server"
                Height="500px" Width="100%" CaptionHeaderText="<%$ Resources:WebSchedule,  WebSchedule_CaptionHeaderText %>"
                NavigationAnimation="Linear" WeekendDisplayFormat="Full" EnableAppStyling="True" >
            </ig_sched:WebMonthView>
            <ig_scheduledata:WebScheduleGenericDataProvider runat="server" ID="WebScheduleGenericProvider1"
                WebScheduleInfoID="wsInfo" StyleSetName="" StyleSetPath="" StyleSheetDirectory="">
                <AppointmentBinding DataKeyMember="ID" ResourceKeyMember="ResourceKey" />
                <ResourceBinding DataKeyMember="ID" />
                <VarianceBinding DataKeyMember="ID" ResourceKeyMember="ResourceKey" />
            </ig_scheduledata:WebScheduleGenericDataProvider>
            <ig_sched:WebScheduleInfo ID="wsInfo" runat="server" 
                EnableRecurringActivities="True" EnableSmartCallbacks="false"
                EnableAppStyling="True" EnableMultiResourceView="True" OnActivityAdding="WebScheduleInfo1_ActivityAdding"
                OnVarianceAdding="wsInfo_VarianceAdding">
            </ig_sched:WebScheduleInfo>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>