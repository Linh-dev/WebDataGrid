<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="titles" > <%=this.GetGlobalResourceObject("WebRating","CustomRatingItems_RatingSpeed") %> </div>
    <div style=" margin-bottom:20px; width:420px; height:100px; background: url('/SamplesBrowser/SamplesCommon/aspnet/WebRating/EditingAndSelection/CustomRatingItems/BgItem.jpg') no-repeat; ">
        <div style="float:left;  margin-top:40px; width:Auto; ">
            <div style="float: none; margin-left:70px;"><%=this.GetGlobalResourceObject("WebRating","CustomRatingItems_CustomRating") %></div>
        </div>
        <div style="float:right; margin-top:30px; width:Auto; " >
            <ig:webrating ID="WebRating1" runat="server" 
                EnableContinuousSelection="false"
                Precision="Whole" 
                EnableShowSelectionOnHover="true"
                ImageHeight="38"
                ImageWidth="64"
                MinimumValue="0"        
            >
                <CustomImages>
                    <ig:ratingimageitem ToolTipFormat="<%$Resources:WebRating, CustomRatingItems_Slow %>" ImageCssClass="badRatingEmpty" HoveredImageCssClass="badRating" SelectedImageCssClass="badRating" />
                    <ig:ratingimageitem ToolTipFormat="<%$Resources:WebRating, CustomRatingItems_Normal %>" ImageCssClass="mediumRatingEmpty" HoveredImageCssClass="mediumRating" SelectedImageCssClass="mediumRating" />
                    <ig:ratingimageitem Value="10" ToolTipFormat="<%$Resources:WebRating, CustomRatingItems_Fast %>" ImageCssClass="goodRatingEmpty" HoveredImageCssClass="goodRating" SelectedImageCssClass="goodRating" />
                </CustomImages>        
            </ig:webrating>
        </div>
    </div>
    
    <div class="titles" > <%=this.GetGlobalResourceObject("WebRating","CustomRatingItems_RatingSatisfaction") %> </div>
    <div style=" margin-bottom:20px; width:420px; height:100px; background: url('/SamplesBrowser/SamplesCommon/aspnet/WebRating/EditingAndSelection/CustomRatingItems/BgItem.jpg') no-repeat; ">
        <div style="float:left;  margin-top:40px; width:Auto; ">
            <div style="float: none; margin-left:70px;"><%=this.GetGlobalResourceObject("WebRating","CustomRatingItems_CustomRating") %></div>
        </div>
        <div style="float:right; margin-top:30px; width:Auto; " >
            <ig:webrating ID="WebRating2" runat="server" 
                EnableContinuousSelection="false"
                Precision="Whole" 
                EnableShowSelectionOnHover="true"
                ImageHeight="32"
                ImageWidth="60"
                MinimumValue="0"          
                 >
        
                    <CustomImages>
                          <ig:ratingimageitem ToolTipFormat="<%$Resources:WebRating, CustomRatingItems_Neutral %>" ImageCssClass="thumbsNeutralEmpty" HoveredImageCssClass="thumbsNeutral" SelectedImageCssClass="thumbsNeutral" />
                           <ig:ratingimageitem ToolTipFormat="<%$Resources:WebRating, CustomRatingItems_Like %>" ImageCssClass="thumbsUpEmpty" HoveredImageCssClass="thumbsUp" SelectedImageCssClass="thumbsUp" />
                        <ig:ratingimageitem ToolTipFormat="<%$Resources:WebRating, CustomRatingItems_DontLike %>" ImageCssClass="thumbsDownEmpty" HoveredImageCssClass="thumbsDown" SelectedImageCssClass="thumbsDown" />
                    </CustomImages>
        
            </ig:webrating>
         </div>
     </div>


    <div class="titles" > <%=this.GetGlobalResourceObject("WebRating","CustomRatingItems_RatingBar") %> </div>
    <div style=" margin-bottom:20px; width:420px; height:100px; background: url('/SamplesBrowser/SamplesCommon/aspnet/WebRating/EditingAndSelection/CustomRatingItems/BgItem.jpg') no-repeat; ">
        <div style="float:left;  margin-top:40px; width:Auto; ">
            <div style="float: none; margin-left:70px;"><%=this.GetGlobalResourceObject("WebRating","CustomRatingItems_CustomRating") %></div>
        </div>
        <div style="float:right; margin-top:16px; margin-right:23px; width:Auto;">
            <ig:webrating ID="WebRating3" runat="server" 
                EnableContinuousSelection="true"
                Precision="Exact" 
                EnableShowSelectionOnHover="true"
                ImageHeight="62"
                ImageWidth="162"
                MinimumValue="0"          
            >        
                <CustomImages>
                    <ig:ratingimageitem ToolTipFormat="<%$Resources:WebRating, CustomRatingItems_BarsTooltip %>" Value="100" ImageCssClass="bars" HoveredImageCssClass="barsSelected" SelectedImageCssClass="barsSelected" />
                </CustomImages>
            </ig:webrating>
        </div>
    </div>  
</asp:Content>
