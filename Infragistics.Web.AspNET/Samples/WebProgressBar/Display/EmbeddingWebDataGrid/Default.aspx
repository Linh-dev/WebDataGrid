<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<div id="DataGridWrapper">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" DataKeyFields="AccountTypeID" AutoGenerateColumns="False" 
        Width="100%" EnableRelativeLayout="true">
        <Columns>
        
            <ig:BoundDataField DataFieldName="AccountType" Key="AccountType" >
                <Header Text="Account Type" />
            </ig:BoundDataField>
            
            <ig:BoundDataField DataFieldName="Balance" Key="Type_Total" DataFormatString="${0:#,###.##}">
                <Header Text="Account Total" />
            </ig:BoundDataField>
            
             <ig:TemplateDataField Key="AccountTypeID">
                <ItemTemplate>
                    
                    <ig:WebProgressBar ID="wpbOne" runat="server" Minimum="0" StyleSetName="RedPlanet" Height="23px" />
                        
                </ItemTemplate>
                <Header Text="% of Pool" />
            </ig:TemplateDataField>
           
        </Columns>
        
    </ig:WebDataGrid>
</div>  
</asp:Content>