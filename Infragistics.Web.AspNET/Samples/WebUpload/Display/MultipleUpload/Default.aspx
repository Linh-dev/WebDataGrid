<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css" />

    <ig:HtmlScript ID="HtmlScript3" runat="server" Type="text/javascript" Src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js" />
    <script type="text/javascript" language="javascript">
        function onErrorHandler(e, args) {
            $("#error-message").html(args.errorMessage).stop(true, true).fadeIn(500).delay(3000).fadeOut(500);
        }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igjq:WebUpload ID="webUpload1" runat="server" 
        Mode="Multiple" MaxSimultaneousFilesUploads="2">
            <ClientEvents OnError="onErrorHandler" />
    </igjq:WebUpload>
    <div id="error-message" style="color: #FF0000; font-weight: bold;"></div>
</asp:Content>