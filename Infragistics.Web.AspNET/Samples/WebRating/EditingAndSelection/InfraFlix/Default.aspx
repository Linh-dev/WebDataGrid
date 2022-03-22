<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
        <input runat="server" id="Hidden1" type="hidden" />
        <ig:webdatagrid ID="WebDataGrid1" 
            CssClass="dataGridHeader" 
            HeaderCaptionCssClass="gridHeaderCaption" 
            ItemCssClass="item" runat="server" 
            AutoGenerateColumns="False"
            OnInitializeRow="WebDataGrid1_InitializeRow"
            DataKeyFields="MovieID">
            <Columns>
                <ig:templatedatafield Key="TemplateField3" Width="70px">
                    <Header Text="<%$ Resources:WebRating, InfraFlix_ListOrder_Header %>" />
                    <ItemTemplate>
                        <ig:WebNumericEditor ID="WebNumericEditor1" runat="server" Width="25px" Enabled="false" HorizontalAlign="Left">
                            
                        </ig:WebNumericEditor>
                    </ItemTemplate>
                </ig:templatedatafield>
            
                <ig:bounddatafield DataFieldName="MovieID" Key="MovieID" Hidden="true">
                    
                </ig:bounddatafield>
                
                <ig:templatedatafield Key="TemplateField4" Width="140px">
                    <Header Text="<%$ Resources:WebRating, InfraFlix_MovieTitle_Header %>" />
                    <ItemTemplate><asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return false;"
                            Text='<%# Eval("Title") %>'></asp:LinkButton></ItemTemplate>
                </ig:templatedatafield>
                
                <ig:templatedatafield Key="TemplateField1" Width="110px">
                    <Header Text="<%$ Resources:WebRating, InfraFlix_StarRating_Header %>" />
                    <ItemTemplate>
                        <ig:webrating ID="WebRating1" runat="server" 
                            EnableContinuousSelection="true"
                            Precision="Half" 
                            AutoPostBackFlags-Rated="Async" 
                            EnableShowSelectionOnHover="true"
                            OnRated="WebRating1_Rated"
                            ImageHeight="18"
                            ImageWidth="18"
                             >
                            <ClientEvents Rating="WebRating_RatingEventHandler" />
                            
                            <%-- Set custom css classes --%>
                            <RatingImage HoveredImageCssClass="hoveredRating" ImageCssClass="emptyRating" SelectedImageCssClass="selectedRating" />
                        </ig:webrating>
                    </ItemTemplate>
                </ig:templatedatafield>
                
                <ig:templatedatafield Key="TemplateField5" Width="90px">
                    <Header Text="<%$ Resources:WebRating, InfraFlix_Genre_Header %>" />
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return false;"
                            Text='<%# Eval("Genre") %>'></asp:LinkButton>
                            
                    </ItemTemplate>
                </ig:templatedatafield>
                
                <ig:templatedatafield Key="TemplateField2" Width="68px">
                    <Header Text="<%$ Resources:WebRating, InfraFlix_Remove_Header %>" />
                    <ItemTemplate>
                        <a href="#" ><img id="closeButtonImage" alt="close button" src="/samplesbrowser/samplescommon/aspnet/WebRating/EditingAndSelection/InfraFlix/close.png" border="0" /></a>                        
                    </ItemTemplate>
                </ig:templatedatafield>
            </Columns>
        </ig:webdatagrid>
    <script type="text/javascript">
        function WebRating_RatingEventHandler(sender, args) {
            var title = sender.get_element().parentNode.parentNode.childNodes[2].childNodes[0].innerHTML;

            var hiddenField = document.getElementById("<%= Hidden1.ClientID %>");

            hiddenField.value = title;

            sender.get_ratingImage().set_selectedImageCss("hoveredRating");
        }

    </script>
</asp:Content>