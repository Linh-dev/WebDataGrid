<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div style=" margin-top:30px; ">
    <ig:webdatagrid ID="WebDataGrid1" 
            runat="server" 
             Width="100%" 
            DataKeyFields="MovieID"
            DataSourceID="SqlDataSource1"
            >
            
            <Behaviors>
                <ig:editingcore Enabled="true" BatchUpdating="true">
                    <Behaviors>
                    
                    <%-- Use WebRating as editor provider --%>
                    <ig:CellEditing Enabled="true">
                            <ColumnSettings>
                                <ig:EditingColumnSetting ColumnKey="Rating" EditorID="WebDataGrid1_RatingProvider1" />
                            </ColumnSettings>
                        </ig:CellEditing>
                        
                    </Behaviors>
                </ig:editingcore>
            </Behaviors>
            <%-- Add a rating editor provider --%>
            <EditorProviders>
                <ig:RatingEditorProvider ID="WebDataGrid1_RatingProvider1">
                    <EditorControl ID="EditorControl1" runat="server" EnableContinuousSelection="true" Precision="Half">
                        
                    </EditorControl>
                </ig:RatingEditorProvider>
            </EditorProviders>
        </ig:webdatagrid>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString='<%# this.GetConnectionString() %>' 
        SelectCommand="SELECT MovieID,Title,Genre,Rating FROM [mov].[Movies]"></asp:SqlDataSource>
        </div>
</asp:Content>