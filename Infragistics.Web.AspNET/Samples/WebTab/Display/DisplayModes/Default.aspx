<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           
            <ContentTemplate>
            
                <div class="MainContent">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebTab, WebTab_DisplayModes_DisplayModes %>"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                        >
                        <asp:ListItem Text="MultiRow" />
                        <asp:ListItem Text="MultiRowAuto" />
                        <asp:ListItem Text="Scrollable" Selected="True" />
                        <asp:ListItem Text="SingleRow" />
                    </asp:DropDownList>
                    
                </div>

                <ig:WebTab ID="WebTab1" runat="server" DisplayMode="Scrollable" Height="300px" Width="500px">
                    <ScrollButtons StartSpeed="500" EndSpeed="2000" />        
                    <Tabs>
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab1 %>" TabSize="100px">
                        
                        </ig:ContentTabItem>
                        
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab2 %>" TabSize="100px">
                        
                        </ig:ContentTabItem>
                        
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab3 %>" TabSize="100px">
                        
                        </ig:ContentTabItem>
                        
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab4 %>" TabSize="100px">
                        
                        </ig:ContentTabItem>
                        
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab5 %>" TabSize="100px">
                        
                        </ig:ContentTabItem>
                        
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab6 %>" TabSize="100px" NextRow="true">
                        
                        </ig:ContentTabItem>
                        
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab7 %>" TabSize="100px">
                        
                        </ig:ContentTabItem>
                        
                        <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab8 %>" TabSize="100px">
                        
                        </ig:ContentTabItem>
                    </Tabs>
                </ig:WebTab>
                
            </ContentTemplate>
            
        </asp:UpdatePanel>
</asp:Content>