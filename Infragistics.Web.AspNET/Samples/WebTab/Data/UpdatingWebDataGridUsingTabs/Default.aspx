<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <ig:WebTab ID="WebTab1" runat="server" Height="400px" Width="600px" EnableActivation="true">
            
            <Tabs>
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_Customers %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Data/UpdatingWebDataGridUsingTabs/Users.png" ScrollBars="Hidden">
                <Template>
                
                    <ig:WebDataGrid ID="WebDataGrid1" runat="server"
                        Height="100%" Width="100%"
                        
                        DataKeyFields="CustomerID"
                        OnRowAdding="WebDataGrid1_RowAdding"
                        OnRowsDeleting="WebDataGrid1_RowsDeleting"
                        >
                        <Behaviors>
                            <ig:Selection CellClickAction="Row" Enabled="true" RowSelectType="Single" SelectionClientEvents-RowSelectionChanged="RowSelectionChangedHandler"></ig:Selection>
                            <ig:Activation Enabled="true" />
                            
                            <ig:EditingCore Enabled="true" AutoCRUD="false">
                                <EditingClientEvents RowAdded="RowAddedHandler" />
                                <Behaviors>
                                
                                
                                </Behaviors>
                            </ig:EditingCore>
                        </Behaviors>
                        
                        </ig:WebDataGrid>
                    
                </Template>
                </ig:ContentTabItem>
                
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_AddCustomer %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Data/UpdatingWebDataGridUsingTabs/UsersAdd.png">
                <Template>
                <div class="ProductDetailTab_Content">
                <div>
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_CustomerID %> " />
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="tabsInput"></asp:TextBox>
                    </div>
                    
                    <div>
                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_CompanyName %> " />
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="tabsInput"></asp:TextBox>
                    </div>
                    
                    <div>
                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_ContactName %> " />
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="tabsInput"></asp:TextBox>
                    </div>
                    
                    <div>
                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_ContactTitle %> " />
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="tabsInput"></asp:TextBox>
                    </div>
                    <div>
                    <input id="Button1" type="button" value="<%= this.GetGlobalResourceObject("WebTab","WebTab_UpdatingWebDataGridUsingTabs_Add")%>" onclick="return AddRow()" />
                    </div></div>
                </Template>
                </ig:ContentTabItem>
                
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_RemoveCustomer %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Data/UpdatingWebDataGridUsingTabs/UsersDelete.png">
                <Template>
                <div class="ProductDetailTab_Content">
                <div>
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_CustomerID %> " />
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="tabsInput"></asp:TextBox>
                    </div>
                    
                    <div>
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_CompanyName %> " />
                    <asp:TextBox ID="TextBox2" runat="server"  CssClass="tabsInput"></asp:TextBox>
                    </div>
                    
                    <div>
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_ContactName %> " />
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="tabsInput"></asp:TextBox>
                    </div>
                    
                    <div>
                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_ContactTitle %> " />
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="tabsInput"></asp:TextBox>
                    </div>
                    
                    <div>
                    <input id="Button2" type="button" value="<%= this.GetGlobalResourceObject("WebTab","WebTab_UpdatingWebDataGridUsingTabs_Remove")%>" onclick="return DeleteRow()" />
                    </div>
                    </div>
                </Template>
                </ig:ContentTabItem>
                
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_FindCustomer %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Data/UpdatingWebDataGridUsingTabs/UserFind.png">
                <Template>
                <div class="ProductDetailTab_Content">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_CustomerID %> " />
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="tabsInput"></asp:TextBox>
                    <div id="ErrorLabelContainer" class="LabelHidden">
                        <img src="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Data/UpdatingWebDataGridUsingTabs/Alert.png" alt="Alert image" />
                        <asp:Label ID="ErrorLabel1" runat="server" Text="<%$ Resources:WebTab, WebTab_UpdatingWebDataGridUsingTabs_AlertMessage %>"></asp:Label>
                    </div>
                    </div>
                    <div>
                    <input id="Button3" type="button" value="<%= this.GetGlobalResourceObject("WebTab","WebTab_UpdatingWebDataGridUsingTabs_Find")%>" onclick="return FindRow()" />
                    </div>
                    
                    </div>
                    </Template>
                </ig:ContentTabItem>
            </Tabs>
        </ig:WebTab>    
            
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetCustomers" TypeName="WebTabBusinessLayer.CustomerList" 
            DeleteMethod="DeleteCustomer" 
            InsertMethod="AddCustomer">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </DeleteParameters>
           
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="ContactTitle" Type="String" />
            </InsertParameters>
           
        </asp:ObjectDataSource>
            <script type="text/javascript">


                // Set values for textboxes in Remove tab when a row is selected
                function RowSelectionChangedHandler(sender, args) {
                    var textBox1 = $get('<%=TextBox1.ClientID%>');
                    var textBox2 = $get('<%=TextBox2.ClientID%>');
                    var textBox3 = $get('<%=TextBox3.ClientID%>');
                    var textBox4 = $get('<%=TextBox4.ClientID%>');

                    var row = args.getSelectedRows().getItem(0);

                    textBox1.value = row.get_cell(0).get_value();
                    textBox2.value = row.get_cell(1).get_value();
                    textBox3.value = row.get_cell(2).get_value();
                    textBox4.value = row.get_cell(3).get_value();
                }

                function DeleteRow() {
                    var tab = $find("<%=WebTab1.ClientID%>");
                    var gridId = tab.getTabAt(0).findChild("WebDataGrid1").id;

                    var grid = $find(gridId);

                    var textBox = $get('<%=TextBox1.ClientID%>');

                    // Find row
                    var row = grid.get_rows().get_rowFromKey([textBox.value]);

                    // Delete row
                    if (row) {
                        grid.get_rows().remove(row);
                        tab.set_selectedIndex(0);
                    }
                }

                function AddRow() {
                    var tab = $find("<%=WebTab1.ClientID%>");
                    var gridId = tab.getTabAt(0).findChild("WebDataGrid1").id;

                    var grid = $find(gridId);

                    // Get values for row
                    var textBox1 = $get('<%=TextBox6.ClientID%>');
                    var textBox2 = $get('<%=TextBox7.ClientID%>');
                    var textBox3 = $get('<%=TextBox8.ClientID%>');
                    var textBox4 = $get('<%=TextBox9.ClientID%>');

                    // Add row if it doesn't exist
                    if (textBox1.value && !grid.get_rows().get_rowFromKey([textBox1.value])) {
                        var row = new Array(textBox1.value, textBox2.value, textBox3.value, textBox4.value);

                        grid.get_rows().add(row);

                        tab.set_selectedIndex(0);
                    }
                }

                function FindRow() {
                    var tab = $find("<%=WebTab1.ClientID%>");
                    var gridId = tab.getTabAt(0).findChild("WebDataGrid1").id;

                    var grid = $find(gridId);

                    var textBox = $get('<%=TextBox5.ClientID%>');
                    var key = textBox.value.toUpperCase();

                    var errorLabel = $get('ErrorLabelContainer');

                    // Find Row
                    var row = grid.get_rows().get_rowFromKey([key]);

                    // Select and put focus on row
                    if (row) {
                        grid.get_behaviors().get_selection().get_selectedRows().clear();
                        grid.get_behaviors().get_selection().get_selectedRows().add(row);

                        tab.set_selectedIndex(0);
                        errorLabel.className = "LabelHidden";
                        grid.get_behaviors().get_activation().set_activeCell(row.get_cell(0), true);
                    }
                    else {
                        errorLabel.className = "LabelShow";
                    }
                }

                function RowAddedHandler(sender, args) {
                    setTimeout(ScrollToRow, 10);
                }

                function ScrollToRow() {
                    var tab = $find("<%=WebTab1.ClientID%>");
                    var gridId = tab.getTabAt(0).findChild("WebDataGrid1").id;

                    var grid = $find(gridId);

                    // Activate row
                    grid.get_behaviors().get_activation().set_activeCell(grid.get_rows().get_row(grid.get_rows().get_length() - 1).get_cell(0), true);
                }
    
    </script>
</asp:Content>
