<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="MainContent">
                   <div style="margin-bottom:10px;"> <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged"
                        Checked="true" AutoPostBack="true" />
                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_EnableGroupBy_EnableOrders")%></div>
                    
                    <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged"
                        Checked="true" AutoPostBack="true" />
                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_EnableGroupBy_EnableDetails")%>
                </div>
                <br />
                <div>
                    <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" DataSourceID="WebHierarchicalDataSource1"
                        Height="600px" Width="100%" AutoGenerateBands="true" AutoGenerateColumns="true"
                        DataMember="OrdersView" Key="OrdersView" DataKeyFields="OrderID">
                        <Bands>
                            <ig:Band DataMember="OrderDetailsView">
                                <GroupingSettings EnableColumnGrouping="True" />
                            </ig:Band>
                        </Bands>
                        <GroupingSettings EnableColumnGrouping="True" GroupAreaVisibility="Visible" GroupAreaCssClass="GroupArea"/>
                    </ig:WebHierarchicalDataGrid>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="OrderID" ParentDataViewID="OrdersView"
                    ChildColumns="OrderID" ChildDataViewID="OrderDetailsView" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="OrdersView" DataSourceID="AccessDataSource1" />
                <ig:DataView ID="OrderDetailsView" DataSourceID="AccessDataSource2" />
            </DataViews>
        </ig:WebHierarchicalDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>' 
            SelectCommand="SELECT TOP 20 [OrderID], [CustomerID], [EmployeeID], [ShipVia], [ShipName] FROM [Orders]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT * FROM [Order Details]"></asp:AccessDataSource>
    </div>
</asp:Content>
