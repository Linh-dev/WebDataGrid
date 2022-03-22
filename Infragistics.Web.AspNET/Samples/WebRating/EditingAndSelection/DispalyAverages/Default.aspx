<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <h3><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_Header") %></h3>
      <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupA") %></h4>
        <ig:WebDataGrid ID="WebDataGrid_CountriesA" AutoGenerateColumns="False" runat="server" Width="588px" 
        OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedA" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid>

  <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupB") %></h4>
    <ig:WebDataGrid ID="WebDataGrid_CountriesB" AutoGenerateColumns="False" runat="server" Width="588px" OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedB" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid>


  <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupC") %></h4>
    <ig:WebDataGrid ID="WebDataGrid_CountriesC" AutoGenerateColumns="False" runat="server" Width="588px" OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedC" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid>

  <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupD") %></h4>
    <ig:WebDataGrid ID="WebDataGrid_CountriesD" AutoGenerateColumns="False" runat="server" Width="588px" OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedD" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid>

  <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupE") %></h4>
    <ig:WebDataGrid ID="WebDataGrid_CountriesE" AutoGenerateColumns="False" runat="server" Width="588px" OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedE" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid>

 <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupF") %></h4>
    <ig:WebDataGrid ID="WebDataGrid_CountriesF" AutoGenerateColumns="False" runat="server" Width="588px" OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedF" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid>


 <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupG") %></h4>
    <ig:WebDataGrid ID="WebDataGrid_CountriesG" AutoGenerateColumns="False" runat="server" Width="588px" OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedG" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid>

 <h4><%=this.GetGlobalResourceObject("WebRating","DisplayAverages_GroupH") %></h4>
    <ig:WebDataGrid ID="WebDataGrid_CountriesH" AutoGenerateColumns="False" runat="server" Width="588px" OnInitializeRow="WebDataGrid_Countries_InitializeRow" AltItemCssClass="alternatingRowBg">
        <Columns>
            
            <ig:TemplateDataField Header-Text="Country" Key="CountryName" Width="120">
                <ItemTemplate>
                    <asp:HiddenField ID="hf_CountryID" Value='<%# Eval("CountryID")%>' runat="server" />
                    <asp:Image ID="img_CountryID" runat="server" />
                    <asp:Label ID="lbl_CountryName" Text='<%# Eval("CountryName")%>' runat="server"> </asp:Label>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Country %>"></Header>
            </ig:TemplateDataField>

            <ig:TemplateDataField Header-Text="Would you like this country to win?" Key="Rating" Width="180">
                <ItemTemplate>
                    <ig:WebRating ID="countryWebRating" runat="server" ImageHeight="31" ImageWidth="24" >
                        <AutoPostBackFlags Rated="Async" />
                        <ClientEvents Rated="countryWebRating_RatedH" />
                        <CustomImages>
                            <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                   <ig:RatingImageItem ToolTipFormat="<%$Resources:WebRating, DisplayAverages_Tooltip %>" ImageCssClass="cupRatingEmpty"
                                HoveredImageCssClass="cupRatingEmpty2" SelectedImageCssClass="cupRating" />
                                 </CustomImages>
                    </ig:WebRating>
                </ItemTemplate>
                <Header Text="<%$Resources:WebRating, DisplayAverages_Champion %>"></Header>
            </ig:TemplateDataField>
            
            <ig:BoundDataField Header-Text="Times Rated" Key="TimesRated" Width="110">
                <Header Text="<%$Resources:WebRating, DisplayAverages_TimesRated %>"></Header>
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$Resources:WebRating, DisplayAverages_AverageRating %>" Key="AverageRating" DataFormatString="{0:n}" Width="110">
            </ig:BoundDataField>

        </Columns>
    </ig:WebDataGrid> 
     <script type="text/javascript">
         function wrapperRated(gridName, sender) {
             var grid = $find(gridName);
             var cell = grid._gridUtil.getCellFromElem(sender.get_element().parentNode);
             var cellRated = cell.get_row().get_cell(cell.get_index() + 1);
             var cellAverage = cell.get_row().get_cell(cell.get_index() + 2);

             cellRated.set_value(sender.get_voteCount());
             cellAverage.set_value(sender.get_average()); /**/
         }

         function countryWebRating_RatedA(sender, args) {
             var grid = "<%=WebDataGrid_CountriesA.ClientID %>";
             wrapperRated(grid, sender);
         }

         function countryWebRating_RatedB(sender, args) {
             var grid = "<%=WebDataGrid_CountriesB.ClientID %>";
             wrapperRated(grid, sender);
         }

         function countryWebRating_RatedC(sender, args) {
             var grid = "<%=WebDataGrid_CountriesC.ClientID %>";
             wrapperRated(grid, sender);
         }

         function countryWebRating_RatedD(sender, args) {
             var grid = "<%=WebDataGrid_CountriesD.ClientID %>";
             wrapperRated(grid, sender);
         }

         function countryWebRating_RatedE(sender, args) {
             var grid = "<%=WebDataGrid_CountriesE.ClientID %>";
             wrapperRated(grid, sender);
         }

         function countryWebRating_RatedF(sender, args) {
             var grid = "<%=WebDataGrid_CountriesF.ClientID %>";
             wrapperRated(grid, sender);
         }

         function countryWebRating_RatedG(sender, args) {
             var grid = "<%=WebDataGrid_CountriesG.ClientID %>";
             wrapperRated(grid, sender);
         }

         function countryWebRating_RatedH(sender, args) {
             var grid = "<%=WebDataGrid_CountriesH.ClientID %>";
             wrapperRated(grid, sender);
         }

  </script>
</asp:Content>
