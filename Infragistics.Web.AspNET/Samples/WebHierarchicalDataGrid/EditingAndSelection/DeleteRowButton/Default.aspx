<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_EditingAndSelection_DeleteRowButton_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="450" Width="100%"
				DataKeyFields="ID">
            <Behaviors>
                <ig:EditingCore EnableInheritance="true">
                    <Behaviors>
                        <ig:RowDeleting EnableInheritance="true" ShowDeleteButton="true" />
                    </Behaviors>
                </ig:EditingCore>
            </Behaviors>
        </ig:WebHierarchicalDataGrid>
    </div>
</asp:Content>