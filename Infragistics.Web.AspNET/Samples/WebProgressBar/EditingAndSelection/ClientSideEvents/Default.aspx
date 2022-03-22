<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
 <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" /> 
  <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
    <ig:HtmlScript runat="server" Type="text/javascript" Src="ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div id="Div1" class="wgDataBind">
        <div id="Div1" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
            </div>
        </div>
    </div>
    <div id="wrapper" class="wgDataBind">
        <div class="controlPanel" style="background-color: #ffffff; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
            background-repeat: no-repeat; border: 1px solid #EEEEEE;  padding-left: 90px;">
            <div style="margin-left: 0px; width: 800px; margin-top: 60px; padding-bottom: 30px;">
                <a id="lnkMinusTen" title="-10">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebProgressBar/EditingAndSelection/ClientEvents/LargeDecrement.png" alt="<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsMinusImage") %>"
                        title="<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsMinusImage") %>" style="float: left;
                        padding-right: 10px;" /></a>
                <div style="float: left;">
                    <ig:WebProgressBar ID="wpbOne" runat="server" FillDirection="FromLeftOrTop" FillMode="Advance"
                        StyleSetName="Office2007Black" Maximum="100" Minimum="0" Value="0" Orientation="Horizontal"
                        Width="400" Height="20" AnimationDuration="100" AnimationType="EaseIn" LabelAlignment="Running">
                        <ClientEvents Click="single_click" ProgressChanged="changed" ProgressChanging="about_to_change"
                            Initialize="initialize" />
                    </ig:WebProgressBar>
                </div>
                <a id="lnkPlusTen" title="+10">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebProgressBar/EditingAndSelection/ClientEvents/LargeIncrement.png" alt="<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsAddImage") %>"
                        title="<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsAddImage") %>" style="float: left;
                        padding-left: 10px;" /></a>
            </div>
            <br style="clear: both;" />
            <br />
        </div>
    </div>

    <script type="text/javascript">

        function advance() {
            bar = $find('<%= wpbOne.ClientID %>');
            i = bar.get_progressValue();
            i = i + 10;
            if (i < bar.get_maximum()) {
                bar.set_progressValue(i);
            }
            else {
                bar.set_progressValue(100);
            }
            addLine('<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsButtonPlus10") %>');
        }
        function reduce() {
            bar = $find('<%= wpbOne.ClientID %>');
            i = bar.get_progressValue();
            i = i - 10;

            if (i > bar.get_minimum()) {
                bar.set_progressValue(i);
            } else {
                bar.set_progressValue(0);
            }
            addLine('<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsButtonMinus10") %>');
        }

        function single_click() {
            bar = $find('<%= wpbOne.ClientID %>');
            i = bar.get_progressValue();
            i = i + 10;
            if (i < bar.get_maximum()) {
                bar.set_progressValue(i);
            }
            else {
                bar.set_progressValue(100);
            }
            addLine('<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsSingleClick") %>');
        }

        function changed() {
            addLine('<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsProgressChange") %>');
        }

        function about_to_change() {
            addLine('<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsProgressChanging") %>');
        }

        function initialize() {
            addLine('<%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsControlInitialized") %>');
        }

        
    </script>

    <script type="text/javascript">
        Sys.UI.DomEvent.addHandler($get("lnkMinusTen"), "click", reduce);
        Sys.UI.DomEvent.addHandler($get("lnkPlusTen"), "click", advance);
    </script>
</asp:Content>
