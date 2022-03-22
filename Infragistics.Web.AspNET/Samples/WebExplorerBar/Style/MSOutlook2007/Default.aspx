<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="ExplorerBarMargin">
    <ig:WebExplorerBar EnableExpandButton="false" Width="280px" ItemIndent="10" ID="WebExplorerBar1"
        runat="server" ExpandMode="HeaderClick" GroupExpandBehavior="SingleExpanded" StyleSetName="Office2007Blue" >
        <Groups>
            <ig:ExplorerBarGroup  Selected="true" Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_Mail %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/imgMail.png">
                <Items>
                    <ig:ExplorerBarItem  Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_DeletedItems %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/imgTrash.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_Drafts %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/imgDrafts.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_Inbox %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/inbox.gif" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_JunkEmail %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/junk.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_Outbox %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/folderSent.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_RssFeeds %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/imgRSS.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_SentItems %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/sentItems.gif" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_SearchFolders %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/folderSearch.png" />
                </Items>
            </ig:ExplorerBarGroup>
            <ig:ExplorerBarGroup Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_Calendar %>" GroupContentsHeight="235px" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/Calendar.png">
                <Items>
                    <ig:ExplorerBarItem SelectedCssClass="TempCssClass" HoverCssClass="TempCssClass" TemplateId="CalendarTemplate" />
                </Items>
            </ig:ExplorerBarGroup>
            <ig:ExplorerBarGroup Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_Contacts %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/VCard24.png">
                <Items>
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_AddressCards %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/VCard16.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_BusinessCards %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/VCard16.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_PhoneList %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/VCard16.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_MyContacts %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/VCard16.png" />
                </Items>
            </ig:ExplorerBarGroup>
            <ig:ExplorerBarGroup Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_Tasks %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/Task24.png">
                <Items>
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_ActiveTasks %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/TaskRun16.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_OverdueTasks %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/TaskWarning16.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_CompletedTasks %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/TaskCheck16.png" />
                    <ig:ExplorerBarItem Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Outlook_DetailedList %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebExplorerBar/Style/MSOutlook2007/TaskInfo16.png" />
                </Items>
            </ig:ExplorerBarGroup>
        </Groups>
        <Templates>
            <ig:ItemTemplate TemplateID="CalendarTemplate">
                <Template>
                    <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar3" StyleSetName="Office2007Blue"
                        EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
                        EnableYearDropDown="True" CssClass="CalendarMargin">
                    </ig:WebMonthCalendar>
                </Template>
            </ig:ItemTemplate>
        </Templates>
    </ig:WebExplorerBar>
    </div>
</asp:Content>
