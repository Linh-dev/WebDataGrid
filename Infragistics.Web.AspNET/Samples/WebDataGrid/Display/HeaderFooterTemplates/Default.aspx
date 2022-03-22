<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Header_Footer_Templates_Default" %>

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
    <div id="Div1" class="wgDataBind">
        <div id="Div2">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="AccessDataSource1"
                    DataKeyFields="CustomerID" AutoGenerateColumns="False" Width="100%" ShowFooter="true">
                    <Columns>
                        <ig:TemplateDataField Key="checkField" Width="50px">
                            <HeaderTemplate>
                                <div>
                                    <input type="checkbox" onclick="selectFirstColumn(event);" style="margin-left: 10px;" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div>
                                    <asp:CheckBox runat="server" ID="key_" style="margin-left: 10px;" />
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","FooterText") %>
                            </FooterTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="CustomerID">
                            <HeaderTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnHeaderId") %>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container, "DataItem.CustomerID") %>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="CompanyName">
                            <ItemTemplate>
                                <asp:Label ID="CompanyNameLabel" runat="server"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "CompanyName") %></asp:Label>
                            </ItemTemplate>
                            <Header Text="" />
                            <HeaderTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnHeaderCompany") %>
                            </HeaderTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="ContactName">
                            <ItemTemplate>
                                <asp:Label ID="ContactNameLabel" runat="server"><%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "ContactName") %></asp:Label>
                            </ItemTemplate>
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="Address" Width="350">
                            <Header Text="" />
                            <HeaderTemplate>
                                <%= this.GetGlobalResourceObject("WebDataGrid","ColumnHeaderAddress")%>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Address") %>
                                <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "City")%>
                                <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "PostalCode")%>
                                <%# DataBinder.Eval(((Infragistics.Web.UI.TemplateContainer)Container).DataItem, "Country")%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Selection ColumnSelectType="Single" Enabled="true" />
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                    </Behaviors>
                    <ClientEvents Initialize="intializeGrid" />
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
