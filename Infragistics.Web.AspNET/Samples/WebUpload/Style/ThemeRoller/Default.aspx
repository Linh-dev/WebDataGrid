<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css" />

    <ig:HtmlScript ID="HtmlScript3" runat="server" Type="text/javascript" Src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js" />
    <ig:HtmlScript ID="HtmlScript4" runat="server" Type="text/javascript" Src="/SamplesBrowser/SamplesCommon/aspnet/Common/ThemeSwitcher/themeswitchertool.js" />

    <script type="text/javascript" language="javascript">
        $(window).load(function () {
            $('#ThemeRoller').themeswitcher();
        });

        function onErrorHandler(e, args) {
            $("#error-message").html(args.errorMessage).stop(true, true).fadeIn(500).delay(3000).fadeOut(500);
        }
        var siteLanguage = "<%= this.GetSiteLanguage() %>";
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="sampleContents">
        <igjq:WebUpload ID="webUpload1" runat="server"
            AutoStartUpload="true">
                <ClientEvents OnError="onErrorHandler" />
        </igjq:WebUpload>
        <div style="clear: both;"></div>
        <div style="margin-top: 10px;">
		    <label><%= this.GetGlobalResourceObject("WebUpload", "txt_select_theme")%></label>
		    <div id="ThemeRoller"></div>
	    </div>
        <div id="error-message" style="color: #FF0000; font-weight: bold;"></div>
    </div>
</asp:Content>