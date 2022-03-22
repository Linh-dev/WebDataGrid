<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Auto_CRUD_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="CustomerID" runat="server" AutoGenerateColumns="False"
                    AutoCRUD="true" Height="425" Width="100%">
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ContactName" Key="Contact">
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
                        <ig:Selection RowSelectType="Multiple" CellClickAction="Row" Enabled="true" />
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
