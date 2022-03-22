<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
 <div>
<br />
<br />
<br />
<ig:WebTab ID="WebTab1" runat="server" Height="502px" 
        Width="721px">
        <tabs>
            <ig:ContentTabItem runat="server" ScrollBars="Hidden" 
                ContentUrl="<%$ Resources:WebTab, WebTab_ContentTemplateAndUrl_AspNetUrl %>"
                Text="ASP.NET">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" ScrollBars="Hidden" 
                ContentUrl="<%$ Resources:WebTab, WebTab_ContentTemplateAndUrl_WinFormsUrl %>" 
                Text="Windows Forms">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" ScrollBars="Hidden" 
                ContentUrl="<%$ Resources:WebTab, WebTab_ContentTemplateAndUrl_SlDvUrl %>" 
                Text="Silverlight DV">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" ScrollBars="Hidden" 
                ContentUrl="<%$ Resources:WebTab, WebTab_ContentTemplateAndUrl_SlLobUrl %>" 
                Text="Silverlight LOB">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" ScrollBars="Hidden" 
                ContentUrl="<%$ Resources:WebTab, WebTab_ContentTemplateAndUrl_WpfUrl %>" 
                Text="WPF">
            </ig:ContentTabItem>
                    <ig:ContentTabItem runat="server" Text="WebDataGrid"  >
                        <Template>
                            <ig:WebDataGrid ID="WebDataGrid1" runat="server" style="margin-top:3px; margin-left:3px;" 
                                DataSourceID="AccessDataSource1" Height="465px" Width="99%">
                            </ig:WebDataGrid>
                             
                            </Template>
            </ig:ContentTabItem>
                    </tabs>
        <PostBackOptions  EnableLoadOnDemandUrl="True" EnableLoadOnDemand="true" EnableAjax="true"  />
        <AjaxIndicator Enabled="True" Location="MiddleCenter" />
    </ig:WebTab>
     <asp:AccessDataSource ID="AccessDataSource1" runat="server"            
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice] FROM [Products]"></asp:AccessDataSource>
                       
   
</div> 
</asp:Content>