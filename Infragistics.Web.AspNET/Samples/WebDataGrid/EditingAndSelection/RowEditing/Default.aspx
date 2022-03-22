<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Row_Editing_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Width="100%"
        DataKeyFields="CityID" OnRowUpdated="WebDataGrid1_RowUpdated">
        <Behaviors>
            <ig:Activation />
            <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
            <ig:EditingCore>
                <Behaviors>
                    <ig:RowEditing Enabled="true">
                        <ColumnSettings>
                            <ig:EditingColumnSetting ColumnKey="CityID" ReadOnly="true" />
                        </ColumnSettings>
                    </ig:RowEditing>
                </Behaviors>
            </ig:EditingCore>
        </Behaviors>
    </ig:WebDataGrid>
</asp:Content>
