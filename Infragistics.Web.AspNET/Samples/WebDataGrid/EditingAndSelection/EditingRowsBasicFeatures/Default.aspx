<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" Inherits="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="DataGridWrapper">
        <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 20px;">
            <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true" UpdateMode="Conditional">
		        <ContentTemplate>
                       <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425" width="100%" 
                            DataKeyFields="CustomerID" AutoGenerateColumns="false" DataSourceID="ObjectDataSource1" >
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
                                <ig:Activation />
                                <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
                                <ig:EditingCore>
	                                <Behaviors>
	                                    <ig:CellEditing Enabled="true" >
	                                        <EditModeActions EnableF2="true" EnableOnActive="true" MouseClick="Single" />
	                                        <ColumnSettings>
	                                            <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
	                                        </ColumnSettings>	                           
	                                    </ig:CellEditing>
	                                </Behaviors>
                                </ig:EditingCore>
                            </Behaviors>
                            <EditorProviders>
                                <ig:TextEditorProvider ID="WebTextEditProvider1" />
                            </EditorProviders>                  
                        </ig:WebDataGrid>
                        <br /><asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:WebDataGrid, SaveButton %>" />
		        </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        UpdateMethod="UpdateCustomer"
        SelectMethod="GetCustomerDataSource"  
        EnableCaching="false"
        TypeName="NorthwindDataSource" >
		<UpdateParameters>
			<asp:Parameter Name="CustomerID" Type="String" />
			<asp:Parameter Name="CompanyName" Type="String" />
			<asp:Parameter Name="ContactName" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
			<asp:Parameter Name="City" Type="String" />
			<asp:Parameter Name="PostalCode" Type="String" />
			<asp:Parameter Name="Country" Type="String" />
		</UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
        </SelectParameters>		
    </asp:ObjectDataSource>
</asp:Content>
