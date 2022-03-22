<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_All_Behaviors_Enabled_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<style>
    #sampleContainer 
    {
        overflow: visible;
    }
</style>
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="CustomerID" runat="server" AutoGenerateColumns="False"
                    AutoCRUD="true" Height="470px" Width="100%" DefaultColumnWidth="100px">
                    <AjaxIndicator Enabled="False" />
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Address" Key="Address">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="City" Key="City">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Country" Key="Country">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Activation Enabled="true" />
                        <ig:Selection RowSelectType="Multiple" Enabled="true" />
                        <ig:Paging PagerAppearance="Bottom" PageSize="9" Enabled="true" />
                        <ig:RowSelectors Enabled="true" RowNumbering="false" />
                        <ig:Sorting SortingMode="Single" Enabled="true" />
                        <ig:ColumnMoving Enabled="true" />
                        <ig:ColumnResizing Enabled="true" />
                        <ig:EditingCore>
                            <Behaviors>
                                <ig:CellEditing EditModeActions-EnableF2="true" EditModeActions-MouseClick="Single"
                                    Enabled="true">
                                    <ColumnSettings>
                                        <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
                                    </ColumnSettings>
                                </ig:CellEditing>
                                <ig:RowAdding Alignment="Top" EditModeActions-EnableF2="true" EditModeActions-EnableOnActive="true"
                                    EditModeActions-MouseClick="Single" Enabled="true" />
                                <ig:RowDeleting Enabled="true" />
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:ColumnFixing ShowLeftSeparator="true" ShowRightSeparator="true" AutoAdjustCells="true">
                            <ColumnSettings>
                                <ig:ColumnFixingSetting FixButtonAlignment="Left" ColumnKey="CompanyName" EnableFixing="True"
                                    FixLocation="Left" />
                            </ColumnSettings>
                        </ig:ColumnFixing>
                        <ig:Filtering Alignment="Top" Visibility="Visible" Enabled="true" AnimationEnabled="true" />
                        <ig:SummaryRow Enabled="true" />
                    </Behaviors>
                    <EditorProviders>
                        <ig:TextEditorProvider ID="WebTextEditProvider1" />
                    </EditorProviders>
                </ig:WebDataGrid>
                <br />
                <asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:WebDataGrid, SaveButton %>" />
            </div>
        </div>
    </div>
</asp:Content>
