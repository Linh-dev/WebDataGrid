<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<div>
    
        <ig:WebTab ID="WebTab1" runat="server" Height="500px" Width="100%" TabOrientation="Horizontal" TabLocation="TopLeft" SelectedIndex="0">
        <PostBackOptions EnableLoadOnDemandUrl="true" />
            <Tabs>
                <ig:ContentTabItem runat="server"  ScrollBars="Hidden">
                <Template>
                
                    <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="false"
                        Height="100%" Width="100%" DataSourceID="ObjectDataSource1">
                        
                        <Columns>
                        <ig:BoundDataField DataFieldName="ProductID" Key="ProductID" Hidden="true">
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$ Resources:WebTab, WebTab_ContentTemplateAndUrl_Products %>">
                            </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ProductDescription" Key="ProductDescription" Hidden="true">
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="SuiteName" Key="SuiteName" Hidden="true">
                            </ig:BoundDataField>
                        </Columns>
                        <Behaviors>
                            <ig:Selection CellClickAction="Row" Enabled="true" RowSelectType="Single" SelectionClientEvents-RowSelectionChanged="RowSelectionChangedHandler"></ig:Selection>
                        </Behaviors>
                        
                        </ig:WebDataGrid>
                    
                </Template>
                </ig:ContentTabItem>
                <ig:ContentTabItem runat="server" >
                <Template>
                <div class="ProductDetailTab_Content">
                <div>
                    <%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_Label1") %>:
                    
                    <asp:Label class="ProductInfo" ID="TextBox1" runat="server"  CssClass="tabsInput"></asp:Label>
                    </div>
                    
                    <div>
                    <%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_Label2") %>:
                    
                    <asp:Label class="ProductInfo" ID="TextBox2" runat="server"  CssClass="tabsInput"></asp:Label>
                    </div>
                    
                    <div>
                    <%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_Label3") %>:
                    
                    <asp:Label class="ProductInfo" ID="TextBox3" runat="server" CssClass="tabsInput"></asp:Label>
                    </div>
                    
                    <div>
                    <%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_Label4") %>:
                    
                    <asp:Label class="ProductInfo" ID="TextBox4" runat="server" CssClass="tabsInput"></asp:Label>
                    </div>
                    <div>
                    <input id="Button1" type="button" value="<%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_Button1") %>" onclick="return NewTab()" />
                    </div></div>
                </Template>
                
                </ig:ContentTabItem>
            </Tabs>
        </ig:WebTab>
        
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice] FROM [Products]"></asp:AccessDataSource>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    SelectMethod="GetProducts" TypeName="IG.Product" ></asp:ObjectDataSource>
</div>

<script type="text/javascript">

    function RowSelectionChangedHandler(sender, args) {
        var textBox1 = $get('<%=TextBox1.ClientID%>');
        var textBox2 = $get('<%=TextBox2.ClientID%>');
        var textBox3 = $get('<%=TextBox3.ClientID%>');
        var textBox4 = $get('<%=TextBox4.ClientID%>');

        var row = args.getSelectedRows().getItem(0);

        textBox1.innerHTML = row.get_cell(0).get_value();
        textBox2.innerHTML = row.get_cell(1).get_value();
        textBox3.innerHTML = row.get_cell(2).get_value();
        textBox4.innerHTML = row.get_cell(3).get_value();
    }

    function NewTab() {
        var webTab = $find("<%=WebTab1.ClientID%>");
        var textBox1 = $get('<%=TextBox1.ClientID%>');

        if (textBox1) {
            if (textBox1.innerHTML == "0") {
                webTab.addTab('<%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_ProductInformation").ToString() %>', '<%= this.GetGlobalResourceObject("WebTab", "WebTab_ContentTemplateAndUrl_AspNetUrl").ToString() %>', false);
                webTab.set_selectedIndex(webTab.get_tabs().length - 1);
            }
            else if (textBox1.innerHTML == "1") {
                webTab.addTab('<%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_ProductInformation").ToString() %>', '<%= this.GetGlobalResourceObject("WebTab", "WebTab_ContentTemplateAndUrl_WinFormsUrl").ToString() %>', false);
                webTab.set_selectedIndex(webTab.get_tabs().length - 1);
            }
            else if (textBox1.innerHTML == "2") {
                webTab.addTab('<%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_ProductInformation").ToString() %>', '<%= this.GetGlobalResourceObject("WebTab", "WebTab_ContentTemplateAndUrl_WpfUrl").ToString() %>', false);
                webTab.set_selectedIndex(webTab.get_tabs().length - 1);
            }
            else if (textBox1.innerHTML == "3") {
                webTab.addTab('<%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_ProductInformation").ToString() %>', '<%= this.GetGlobalResourceObject("WebTab", "WebTab_ContentTemplateAndUrl_SlLobUrl").ToString() %>', false);
                webTab.set_selectedIndex(webTab.get_tabs().length - 1);
            }
            else if (textBox1.innerHTML == "4") {
                webTab.addTab('<%= this.GetGlobalResourceObject("WebTab","WebTab_ContentTemplateAndUrl_ProductInformation").ToString() %>', '<%= this.GetGlobalResourceObject("WebTab", "WebTab_ContentTemplateAndUrl_SlDvUrl").ToString() %>', false);
                webTab.set_selectedIndex(webTab.get_tabs().length - 1);
            }
        }
    }
    
    </script>  
</asp:Content>
