﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
 <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <div>
            <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="600px"
                Width="100%" AutoGenerateBands="true" AutoGenerateColumns="true"  MaxDataBindDepth="0"
                DataKeyFields="OrderID">
                
                <GroupingSettings EnableColumnGrouping="True" GroupAreaVisibility="Visible" />

            </ig:WebHierarchicalDataGrid>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        
        <DataViews>
            <ig:DataView ID="AccessDataSource1_Orders" DataSourceID="AccessDataSource1" />
            
        </DataViews>
    </ig:WebHierarchicalDataSource>
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile='<%# this.GetMdbLocation("NWind.mdb")%>' 
            
            SelectCommand="SELECT TOP 200 [OrderID], [OrderDate], [RequiredDate], [ShipVia], [ShipName] FROM [Orders]"></asp:AccessDataSource>
        
    </div>  
</asp:Content>