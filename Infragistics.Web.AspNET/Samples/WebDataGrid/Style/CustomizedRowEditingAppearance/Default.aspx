<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Customized_Row_Editing_Appearance_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .ig-smp-done-btn {
            background-color: #A3D144;
        }

        .ig-smp-cancel-btn {            
            background-color: #D44942;
        }
    </style>

    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Width="100%"
        DataKeyFields="CityID" OnRowUpdated="WebDataGrid1_RowUpdated">
        <EditorProviders>
           <ig:NumericEditorProvider ID="NumericEditorProvider1" EditorControl-Buttons-SpinButtonsDisplay="OnRight" EditorControl-SpinDelta="100" EditorControl-MinValue="0"></ig:NumericEditorProvider>
        </EditorProviders>
		  <Behaviors>
            <ig:Activation />
            <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
            <ig:EditingCore>
                <Behaviors>
                    <ig:RowEditing Enabled="true" DoneButtonHtml="<%$ Resources:WebDataGrid, DoneButton_Html %>"
                        CancelButtonHtml="<%$ Resources:WebDataGrid, CancelButton_Html %>"
                        DoneButtonCssClass="ig-smp-done-btn" CancelButtonCssClass="ig-smp-cancel-btn" ButtonHoverCssClass="ig-smp-btn-hover">
                        <ColumnSettings>
                            <ig:EditingColumnSetting ColumnKey="CityID" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="CityPopulation" EditorID="NumericEditorProvider1" />
                        </ColumnSettings>
                    </ig:RowEditing>
                </Behaviors>
            </ig:EditingCore>
        </Behaviors>
    </ig:WebDataGrid>
</asp:Content>
