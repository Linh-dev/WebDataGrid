<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Sorting_Cell_Merging_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <script type="text/javascript">
        function WebDataGrid1_Sorting_ColumnSorting(grid, args)
        {
        	var sorting = grid.get_behaviors().get_sorting();
        	var col = args.get_column();
        	var sortedCols = sorting.get_sortedColumns();
        	for (var x = 0; x < sortedCols.length; ++x) {
        		if (col.get_key() == sortedCols[x].get_key()) {
        			args.set_clear(false);
        			break;
        		}
        	}
        }

    </script>
	<style type="text/css">
	    
		tbody>tr>td.selectedCell
		{
			background-color:#3AB4E8;
		}
		
        .cell-merging-options { color: #656565; font-size: 12px; margin: 5px 0; padding: 5px; border: 1px solid #000000; font-weight:bold; width: 99%;}        
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <%--<asp:UpdatePanel ID="up1" runat="server">
    <ContentTemplate>--%>
        <div class="cell-merging-options">
            <asp:CheckBox ID="ClientRenderCheckbox" runat="server" 
			        Text="<%$ Resources:WebDataGrid, ClientRenderingOn %>" AutoPostBack="True" 
			        oncheckedchanged="ClientRenderCheckbox_CheckedChanged">
           </asp:CheckBox>
        </div>
        <ig:WebDataGrid ID="WebDataGrid1" runat="server"
                AutoGenerateColumns="False" ShowFooter="false" 
                DataSourceID="DefaultDataSource" EnableAjax="true"
                DefaultColumnWidth="150px" Height="500px" Width="100%" 
                oncolumnmoved="WebDataGrid1_ColumnMoved" 
                oncolumnsorted="WebDataGrid1_ColumnSorted" 
                onfixedstatechanged="WebDataGrid1_FixedStateChanged"
                EnableClientRendering="true">
                <Columns>
                    <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" >
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" 
                        HtmlEncode="true">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="ContactName" Key="ContactName" 
                        HtmlEncode="true">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="ContactTitle" Key="ContactTitle" 
                        HtmlEncode="true">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContactTitle %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="Address" Key="Address" >
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="City" Key="City">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="Region" Key="Region">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="Country" Key="Country">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="Phone" Key="Phone">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPhone %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="Fax" Key="Fax">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderFax %>" />
                    </ig:BoundDataField>
                </Columns>
                <Behaviors>
                    <ig:Activation ActiveCellCssClass="active">
                    </ig:Activation>
                    <ig:ColumnFixing Enabled="true" AutoAdjustCells="true" ShowFixButtons="False">
                        <ColumnSettings>
                            <ig:ColumnFixingSetting ColumnKey="CustomerID" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="CompanyName" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="ContactName" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="ContactTitle" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="Address" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="City" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="Region" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="PostalCode" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="Country" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="Phone" ShowFixButton="false" />
                            <ig:ColumnFixingSetting ColumnKey="Fax" ShowFixButton="false" />
                        </ColumnSettings>
					    <UnpinButton AltText="<%$ Resources:WebDataGrid, UnsortButtonTooltip %>" ImageUrl="ighg_Remove.gif" HoverImageUrl="ighg_RemoveHover.gif" PressedImageUrl="ighg_RemovePressed.gif" />
                    </ig:ColumnFixing>
                    <ig:ColumnMoving>
                        <ColumnSettings>
                            <ig:ColumnMoveSetting ColumnKey="CustomerID" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="CompanyName" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="ContactName" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="ContactTitle" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="Address" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="City" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="Region" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="PostalCode" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="Country" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="Phone" EnableMove="false" />
                            <ig:ColumnMoveSetting ColumnKey="Fax" EnableMove="false" />
                        </ColumnSettings>
                    </ig:ColumnMoving>
                
                    <ig:RowSelectors Enabled="false" RowNumbering="true">
                    </ig:RowSelectors>
                    <ig:Selection Enabled="true" CellClickAction="Row" RowSelectType="Multiple" 
                        ColumnSelectType="None" SelectedCellCssClass="selectedCell">
                    </ig:Selection>
                    <ig:Sorting Enabled="true" SortingMode="Multi" EnableCellMerging="true">
                        <SortingClientEvents ColumnSorting="WebDataGrid1_Sorting_ColumnSorting" />
                    </ig:Sorting>
                </Behaviors>
            </ig:WebDataGrid>
        <asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax] FROM [Customers]">
        </asp:AccessDataSource>
     <%--/ContentTemplate>
  </asp:UpdatePanel>--%>
</asp:Content>
