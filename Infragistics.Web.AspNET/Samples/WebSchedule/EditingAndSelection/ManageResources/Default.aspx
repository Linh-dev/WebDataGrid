<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <div>
        <ig:WebDataGrid ID="WebDataGrid1" runat="server" Width="100%" Height="400px" OnRowAdding="WebDataGrid1_RowAdding"
            OnRowsDeleting="WebDataGrid1_RowsDeleting" OnRowUpdating="WebDataGrid1_RowUpdating"
            DataKeyFields="DataKey" AutoGenerateColumns="false">
            <Columns>
                <ig:BoundDataField Key="DataKey" Hidden="true" />
                <ig:BoundDataField Key="Name" Header-Text="Name" />
                <ig:BoundDataField Key="EmailAddress" Header-Text="EmailAddress" />
                <ig:BoundDataField Key="Description" Header-Text="Description" />
                <ig:BoundCheckBoxField Key="EnableEmailReminders" Header-Text="EnableEmailReminders" />
            </Columns>
            <Behaviors>
                <ig:Sorting SortingMode="Multi" />
                <ig:Selection RowSelectType="Multiple" />
                <ig:RowSelectors />
                <ig:EditingCore AutoCRUD="false" BatchUpdating="false">
                    <Behaviors>
                        <ig:CellEditing />
                        <ig:RowAdding>
							<EditModeActions MouseClick="Single" />
						</ig:RowAdding>
                        <ig:RowDeleting />
                    </Behaviors>
                </ig:EditingCore>
            </Behaviors>
        </ig:WebDataGrid>
    </div>
    <ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
        ConnectionID="oleDbConnection1">
    </ig_scheduledata:WebScheduleOleDbProvider>
    <ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server">
    </ig_sched:WebScheduleInfo>
</asp:Content>
