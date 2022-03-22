<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Custom_Edit_Row_Template_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        tbody tr td.activeCellClass
        {
            border-color: Black;
            border-width: 1px;
            border-style: dashed;
        }
        .customEditRowTable td, tr
        {
            font-family: Verdana;
            font-size: 10px;
            color: #000000;
        }
        .customEditRowTable input
        {
            background-color: #696969;
            font-size: 10px;
            font-family: Verdana;
            color: #FFFFFF;
            border: 1px solid #CCCCCC;
            padding: 2px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="Icon">
            </div>
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="400px" Width="100%" DataKeyFields="CustomerID"
                    AutoGenerateColumns="False">
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
                        <ig:Activation ActiveCellCssClass="activeCellClass" Enabled="true" />
                        <ig:EditingCore>
                            <Behaviors>
                                <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                                    <EditModeActions MouseClick="Double" />
                                    <ClientBindings>
                                        <ig:RowEditingClientBinding ColumnKey="CompanyName" ControlID="control1" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Contact" ControlID="control2" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Address" ControlID="control3" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="City" ControlID="control4" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="PostalCode" ControlID="control5" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                        <ig:RowEditingClientBinding ColumnKey="Country" ControlID="control6" GetValueJavaScript="$get({ClientID}).value"
                                            SetValueJavaScript="$get({ClientID}).value={value}" />
                                    </ClientBindings>
                                    <Template>
                                        <div style="background-color: white; border: 1px solid black;">
                                            <table border="0" class="customEditRowTable">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="CompanyLabel" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control1" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control2" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control3" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control4" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control5" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="control6" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="buttonOK" runat="server" OnClientClick="return" Text="<%$ Resources:WebDataGrid, ButtonOK %>"
                                                            UseSubmitBehavior="False" />&nbsp;
                                                        <asp:Button ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return"
                                                            Text="<%$ Resources:WebDataGrid, ButtonCancel %>" UseSubmitBehavior="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </Template>
                                </ig:RowEditingTemplate>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Selection CellClickAction="Row" RowSelectType="Single" Enabled="true" />
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]"
        DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country]) VALUES (?, ?, ?, ?, ?, ?, ?)"
        UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [Address] = ?, [City] = ?, [PostalCode] = ?, [Country] = ? WHERE [CustomerID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="CustomerID" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
</asp:Content>
