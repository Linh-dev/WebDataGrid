<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Summaries_Custom_Summary_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <asp:CheckBox ID="chkCustomSummaries" Checked="true" runat="server" Text="<%$ Resources:WebDataGrid, WebDataGrid_CustomSummaries_Show %>"
            AutoPostBack="true" OnCheckedChanged="chkCustomSummaries_CheckedChanged" />
    </p>
    <ig:WebDataGrid ID="WebDataGrid1" DataSourceID="ProductsDataSource" DataKeyFields="ProductID"
        runat="server" Width="600px" Height="500px" AutoGenerateColumns="False" OnCalculateCustomSummary="WebDataGrid1_CalculateCustomSummary">
        <Columns>
            <ig:BoundDataField DataFieldName="ProductID" DataType="System.Int32" Key="ProductID">
                <Header Text="ProductID" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ProductName" DataType="System.String" Key="ProductName">
                <Header Text="ProductName" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UnitPrice" DataType="System.Decimal" Key="UnitPrice">
                <Header Text="UnitPrice" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UnitsInStock" DataType="System.Int32" Key="UnitsInStock">
                <Header Text="UnitsInStock" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UnitsOnOrder" DataType="System.Int32" Key="UnitsOnOrder">
                <Header Text="UnitsOnOrder" />
            </ig:BoundDataField>
        </Columns>
        <Behaviors>
            <ig:SummaryRow>
                <ColumnSettings>
                    <ig:SummaryRowSetting ColumnKey="ProductID">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitPrice">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsInStock">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsOnOrder">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                </ColumnSettings>
            </ig:SummaryRow>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="ProductsDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>
