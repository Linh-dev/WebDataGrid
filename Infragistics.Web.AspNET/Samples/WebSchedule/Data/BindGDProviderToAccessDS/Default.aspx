<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSchedule_Data_WebSchedule_GDProvider_DS_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
  <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
        <ContentTemplate>
            <ig_sched:WebMonthView ID="WebMonthView1" WebScheduleInfoID="wsInfo" runat="server"
                Height="500px" Width="100%" CaptionHeaderText="Development Team" NavigationAnimation="Linear"
                WeekendDisplayFormat="Full" EnableAppStyling="True" >
            </ig_sched:WebMonthView>
            <ig_scheduledata:WebScheduleGenericDataProvider runat="server" ID="WebScheduleGenericProvider1"
                WebScheduleInfoID="wsInfo" ActivityDataSourceID="activityDataSource" ResourceDataSourceID="resourceDataSource"
                VarianceDataSourceID="varianceDataSource" StyleSetName="Default">
                <AppointmentBinding DataKeyMember="ID" ResourceKeyMember="ResourceID" VarianceKeyMember="VarianceID"
                    RecurrencePatternMember="RecurrencePattern" />
                <ResourceBinding DataKeyMember="ID" />
                <VarianceBinding DataKeyMember="ID" ResourceKeyMember="ResourceID" VarianceKeyMember="VarianceID"
                    RecurrencePatternMember="RecurrencePattern" />
            </ig_scheduledata:WebScheduleGenericDataProvider>
            <ig_sched:WebScheduleInfo ID="wsInfo" runat="server" EnableRecurringActivities="True" EnableSmartCallbacks="false"
                EnableMultiResourceView="True" EnableReminders="false" EnableAppStyling="True"
                EnableUnassignedResource="False">
            </ig_sched:WebScheduleInfo>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:AccessDataSource ID="activityDataSource" runat="server"
        DeleteCommand="DELETE FROM [Activities] WHERE [VarianceID] = ?" InsertCommand="INSERT INTO [Activities] ([StartDateTimeUtc], [Duration], [Subject], [AllDayEvent], [Location], [Status], [EnableReminder], [ReminderInterval], [ShowTimeAs], [Importance], [RecurrenceID], [OriginalStartDateTimeUtc], [RecurrencePattern], [ResourceID], [VarianceID], [ActivityDescription]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        SelectCommand="SELECT * FROM [Activities]" UpdateCommand="UPDATE [Activities] SET [StartDateTimeUtc] = ?, [Duration] = ?, [Subject] = ?, [AllDayEvent] = ?, [Location] = ?, [Status] = ?, [EnableReminder] = ?, [ReminderInterval] = ?, [ShowTimeAs] = ?, [Importance] = ?, [RecurrenceID] = ?, [OriginalStartDateTimeUtc] = ?, [RecurrencePattern] = ?, [ResourceID] = ?, [VarianceID] = ?, [ActivityDescription] = ? WHERE [ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="VarianceID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="StartDateTimeUtc" Type="DateTime" />
            <asp:Parameter Name="Duration" Type="Int32" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="AllDayEvent" Type="Boolean" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="EnableReminder" Type="Boolean" />
            <asp:Parameter Name="ReminderInterval" Type="Int32" />
            <asp:Parameter Name="ShowTimeAs" Type="Int32" />
            <asp:Parameter Name="Importance" Type="Int32" />
            <asp:Parameter Name="RecurrenceID" Type="Int32" />
            <asp:Parameter Name="OriginalStartDateTimeUtc" Type="DateTime" />
            <asp:Parameter Name="RecurrencePattern" Type="String" />
            <asp:Parameter Name="ResourceID" Type="Int32" />
            <asp:Parameter Name="VarianceID" Type="String" />
            <asp:Parameter Name="ActivityDescription" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="StartDateTimeUtc" Type="DateTime" />
            <asp:Parameter Name="Duration" Type="Int32" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="AllDayEvent" Type="Boolean" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="EnableReminder" Type="Boolean" />
            <asp:Parameter Name="ReminderInterval" Type="Int32" />
            <asp:Parameter Name="ShowTimeAs" Type="Int32" />
            <asp:Parameter Name="Importance" Type="Int32" />
            <asp:Parameter Name="RecurrenceID" Type="Int32" />
            <asp:Parameter Name="OriginalStartDateTimeUtc" Type="DateTime" />
            <asp:Parameter Name="RecurrencePattern" Type="String" />
            <asp:Parameter Name="ResourceID" Type="Int32" />
            <asp:Parameter Name="VarianceID" Type="String" />
            <asp:Parameter Name="ActivityDescription" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="resourceDataSource" runat="server" 
        SelectCommand="SELECT * FROM [Resources]"></asp:AccessDataSource>
    <asp:AccessDataSource ID="varianceDataSource" runat="server" 
        DeleteCommand="DELETE FROM [Activities] WHERE ([OriginalStartDateTimeUtc] IS NOT NULL) AND [VarianceID] = ?"
        InsertCommand="INSERT INTO [Activities] ([StartDateTimeUtc], [Duration], [Subject], [AllDayEvent], [Location], [Status], [EnableReminder], [ReminderInterval], [ShowTimeAs], [Importance], [RecurrenceID], [OriginalStartDateTimeUtc], [RecurrencePattern], [ResourceID], [VarianceID], [ActivityDescription]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        SelectCommand="SELECT * FROM [Activities]" UpdateCommand="UPDATE [Activities] SET [Status] = ? WHERE [ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="VarianceID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="StartDateTimeUtc" Type="DateTime" />
            <asp:Parameter Name="Duration" Type="Int32" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="AllDayEvent" Type="Boolean" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="EnableReminder" Type="Boolean" />
            <asp:Parameter Name="ReminderInterval" Type="Int32" />
            <asp:Parameter Name="ShowTimeAs" Type="Int32" />
            <asp:Parameter Name="Importance" Type="Int32" />
            <asp:Parameter Name="RecurrenceID" Type="Int32" />
            <asp:Parameter Name="OriginalStartDateTimeUtc" Type="DateTime" />
            <asp:Parameter Name="RecurrencePattern" Type="String" />
            <asp:Parameter Name="ResourceID" Type="Int32" />
            <asp:Parameter Name="VarianceID" Type="String" />
            <asp:Parameter Name="ActivityDescription" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
</asp:Content>
