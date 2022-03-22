<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<ig:WebDialogWindow runat="server" ID="WebDialogWindow1"
         Width="720px" Height="360px" Modal="false" WindowState="Normal" 
         Moveable="false"
         MaintainLocationOnScroll="false" Top="80px" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false">
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
    <Template>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
        RenderMode="Inline">
        <ContentTemplate>
           
            <div id="container">
                <table id="propertyList" style="width: 700px;" cellspacing="0">                   
                    <tr>
                        <td style="background: #fff url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg) no-repeat; border-right:solid 1px #89BD37">
                            <div style="width: 200px; height: 150px; margin: 80px auto;">
                                <ig:WebDatePicker runat="server" ID="webDatePicker" DropDownCalendarID="WebMonthCalendar1"
                                    Width="225px" CalendarAnimation-SlideOpenDirection="Vertical" CalendarAnimation-SlideOpenDuration="300"
                                    EditMode="KeyboardAndCalendar" StyleSetName="Appletini"/>
                                <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar1" EnableWeekNumbers="true" StyleSetName="Appletini">
                                </ig:WebMonthCalendar>
                        </td>
                    
                  
                        <td class="propertyPanel">
                            <table style="position:absolute; top: 0; width: 350px;" border="0">
                                <tr class="altRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","FirstDayOfWeekLabel") %>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddFirstDayOfWeek" runat="server" AutoPostBack="true" />
                                    </td>
                                </tr>
                                
                                <tr class="itemRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","EditModeLabel")%>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddEditMode" runat="server" AutoPostBack="true" />
                                    </td>
                                   
                                </tr>
                                <tr class="altRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_CalendarPropertyExplorer_CustomButtonDisplay") %>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddCustomButtonDisplay" runat="server" AutoPostBack="true" />
                                    </td>
                                </tr>
                               
                                <tr class="itemRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_CalendarPropertyExplorer_EditModeFormat") %>
                                    </td>
                                    <td>
                                        <ig:WebTextEditor runat="server" ID="wteDisplayModeFormat" AutoPostBackFlags-ValueChanged="On"
                                            Text="<%$ Resources:WebDatePicker, WebDatePicker_CalendarPropertyExplorer_DateFormat %>">
                                        </ig:WebTextEditor>
                                    </td>
                                    
                                </tr>
                                 <tr class="altRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","PromptCharLabel") %>
                                    </td>
                                    <td>
                                      <ig:WebTextEditor runat="server" ID="wtePromptChar" AutoPostBackFlags-ValueChanged="On"
                                            Text="_" MaxLength="1" Width="30px" HorizontalAlign="Center">
                                        </ig:WebTextEditor>
                                    </td>
                                   
                                </tr>
                                 <tr class="itemRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","NullTextLabel")%>
                                    </td>
                                    <td>
                                        <ig:WebTextEditor runat="server" ID="wteNullText" AutoPostBackFlags-ValueChanged="On"
                                            Text="<%$ Resources:WebDatePicker, WebDatePicker_CalendarPropertyExplorer_NullTextDefault %>">
                                        </ig:WebTextEditor>
                                    </td>
                                    
                                </tr>
                                <tr class="altRow">
                                <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","EnableWeekNumbersLabel")%>
                                    </td>
                                    <td width="25%">
                                        <asp:CheckBox ID="chkEnableWeekNumbers" runat="server" Checked="true" Text="" AutoPostBack="true"
                                            TextAlign="Right" />
                                    </td>
                                </tr>
                                <tr class="itemRow">
                                 <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","ChangeMonthToDateClickedLabel") %>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkChangeMonthToDateClicked" runat="server" Checked="true" Text=""
                                            AutoPostBack="true" TextAlign="Right" />
                                    </td>
                                </tr>
                                <tr class="altRow">
                                <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","EnableMonthDropDownLabel")%>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkEnableMonthDropDown" runat="server" Checked="true" Text="" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr class="itemRow">
                                <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","EnableYearDropDownLabel")%>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkEnableYearDropDown" runat="server" Checked="true" Text="" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr class="altRow">
                                <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","HideOtherMonthDaysLabel")%>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkHideOtherMonthDays" runat="server" Checked="false" Text="" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr class="itemRow">
                                 <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","OpenCalendarOnFocusLabel")%>
                                    </td>
                                    <td>
                                    <asp:CheckBox ID="chkOpenCalendarOnFocus" runat="server" Checked="false" Text="" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr class="altRow">
                                <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebDatePicker","NullableLabel") %>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbNullable" runat="server" Checked="false" Text="" AutoPostBack="true" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </Template>
    </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
