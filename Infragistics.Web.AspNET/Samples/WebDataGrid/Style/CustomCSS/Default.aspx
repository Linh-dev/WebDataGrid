<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Style_Custom_CSS_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">

        var webDataGrid1;

        function intializeGrid(grid) {
            webDataGrid1 = grid;
        }

        function selectFirstColumn(evnt) {
            var chkBox = evnt.target ? evnt.target : evnt.srcElement;
            var column1 = webDataGrid1.get_columns().get_column(0);
            var selCols = webDataGrid1.get_behaviors().get_selection().get_selectedColumns();
            var inputArray = document.getElementsByTagName('input');

            // Check all the checkboxes in the document //
            for (i = 0; i < inputArray.length; i++) {
                if (inputArray[i].type == "checkbox") {
                    if (inputArray[i].name != "") {
                        if (chkBox.checked) {
                            inputArray[i].checked = true;
                        } else {
                            inputArray[i].checked = false;
                        }
                    }
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div1" style="position: relative; top: 5px; height: auto;">
        <div id="Div2">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="ItemViewer" runat="server" DataKeyNames="Id" AutoGenerateColumns="false"
                    Width="100%" Height="425" StyleSetName="Default">
                    <Columns>
                        <ig:TemplateDataField Key="ItemSelector" Width="35px">
                            <HeaderTemplate>
                                <div>
                                    <input type="checkbox" onclick="selectFirstColumn(event);" style="margin-left: 5px;" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div>
                                    <asp:CheckBox runat="server" ID="key_" style="margin-left: 5px;" />
                                </div>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="MessagePriority" Width="25px">
                            <HeaderTemplate>
                                <div style="text-align: left;">
                                    <%# GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "info.gif") %>
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div style="text-align: center;">
                                    <%# GetPriorityImage(DataBinder.Eval(Container, "DataItem.Priority"))%>
                                </div>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="MessageStatus" Width="25px">
                            <HeaderTemplate>
                                <div style="text-align: center;">
                                    <%# GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "messageStatus.png") %>
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div style="text-align: center;">
                                    <%# GetStatusImage(DataBinder.Eval(Container, "DataItem.Status"))%>
                                </div>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="Sender">
                            <HeaderTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnEmailFrom") %></HeaderTemplate>
                            <ItemTemplate>
                                <%# FormatMessage(DataBinder.Eval(Container, "DataItem.IsNew"), DataBinder.Eval(Container, "DataItem.Sender"))%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="Subject" Width="300px">
                            <HeaderTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnEmailSubject") %></HeaderTemplate>
                            <ItemTemplate>
                                <%# FormatMessage(DataBinder.Eval(Container, "DataItem.IsNew"), DataBinder.Eval(Container, "DataItem.Subject"))%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="FormatedSentDate">
                            <HeaderTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnEmailDate") %></HeaderTemplate>
                            <ItemTemplate>
                                <%# FormatMessage(DataBinder.Eval(Container, "DataItem.IsNew"), DataBinder.Eval(Container, "DataItem.FormatedSentDate"))%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="Size">
                            <HeaderTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnEmailSize") %></HeaderTemplate>
                            <ItemTemplate>
                                <%# FormatMessage(DataBinder.Eval(Container, "DataItem.IsNew"), DataBinder.Eval(Container, "DataItem.Size"))%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="HasAttachment" Width="25px">
                            <HeaderTemplate>
                                <div style="text-align: center;">
                                    <%# GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "attach.gif") %>
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div style="text-align: center;">
                                    <%# GetAttachmentImage(DataBinder.Eval(Container, "DataItem.HasAttachment"))%>
                                </div>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="IsFlagedImportant" Width="25px">
                            <HeaderTemplate>
                                <div style="text-align: center;">
                                    <%# GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "FlagOn.png") %>
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div style="text-align: center;">
                                    <%# GetFlagImage(DataBinder.Eval(Container, "DataItem.IsFlagedImportant"))%>
                                </div>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                    </Columns>
                    <ClientEvents Initialize="intializeGrid" />
                    <Behaviors>
                        <ig:Activation Enabled="true" />
                        <ig:Sorting Enabled="true" SortingMode="Single">
                            <ColumnSettings>
                                <ig:SortingColumnSetting ColumnKey="ItemSelector" Sortable="false"/>
                                <ig:SortingColumnSetting ColumnKey="MessagePriority" Sortable="false"/>
                                <ig:SortingColumnSetting ColumnKey="MessageStatus" Sortable="false"/>
                            </ColumnSettings>
                        </ig:Sorting>
                        <ig:Paging PageSize="10" Enabled="true" />
                        <ig:Selection Enabled="true" RowSelectType="Single" CellClickAction="Row" ColumnSelectType="Single" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
</asp:Content>
