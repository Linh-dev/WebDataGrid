<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebDialogFrame.aspx.cs" 
    Inherits="WebDialogFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script type="text/javascript">

        // Called when the user clicks the Reset timer button
        // The clientID of the DialogWindow is passed in as a parameter
        function PromptReset(sControlID) {
            oWebDialogWindow1 = $find(sControlID);
            oWebDialogWindow1.set_windowState($IG.DialogWindowState.Normal);
        }

        // Called when the user selects yes from the confirmation dialog
        function Confirm() {
            oWebDialogWindow1.set_windowState($IG.DialogWindowState.Hidden);
            ResetTime();
        }

        // Called when the user selects no from the confirmation dialog
        function Cancel() {
            oWebDialogWindow1.set_windowState($IG.DialogWindowState.Hidden);
        }

        // sets the current time in the TimeTextBox element
        function ResetTime() {
            d = new Date();
            var seconds = d.getSeconds();
            if (seconds < 10) {
                seconds = "0" + seconds;
            }

            var minutes = d.getMinutes();
            if (minutes < 10) {
                minutes = "0" + minutes;
            }

            oTimeLabel = document.getElementById("TimeLabel");
            oTimeLabel.innerHTML = d.getHours() + ":" + minutes + ":" + seconds;
        }

    </script>

    <ig:WebScriptManager ID="ScriptManager1" runat="server"></ig:WebScriptManager>
    <div id="wrapper" class="dwConfirmationDialog">
        <div id="container">
            <div id="TimeIcon">
                <img src="/samplesbrowser/samplescommon/aspnet/WebDialogWindow/Display/ConfirmationDialog/Clock.jpg" alt="<%= this.GetGlobalResourceObject("WebDialogWindow","Confirmation_Dialog_Tooltip_1") %>"
                    width="101" height="120" /></div>
            <div id="lblCurrentTime">
                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebDialogWindow,Confirmation_Dialog_Description_4 %>"></asp:Label>
            </div>
            <div id="TimeLabel">
                11:20</div>
            <div id="ResetButton">
                <input type="button" onclick="PromptReset('<%= WebDialogWindow1.ClientID %>')" value='<%= this.GetGlobalResourceObject("WebDialogWindow","Confirmation_Dialog_Tooltip_2") %>'/>
            </div>
        </div>
    </div>
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" InitialLocation="Centered" 
        Height="150px" Width="286px" Modal="true" WindowState="Hidden" Style="line-height: normal">
        <Header CaptionAlignment="Left" CaptionText="<%$ Resources:WebDialogWindow,Confirmation_Dialog_Reset_Title %>">
            <CloseBox Visible="False" />
        </Header>
        <ContentPane BackColor="White">
            <Template>
                <div style="text-align: center; position: relative; padding: 20px;">
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebDialogWindow,Confirmation_Dialog_Description_5 %>"></asp:Label>
                    <div style="position: absolute; right: 5px; top: 75px; height: 23px">
                        <input type="button" onclick="Confirm()" value='<%= this.GetGlobalResourceObject("WebDialogWindow","Confirmation_Dialog_Yes") %>'/>
                        <input type="button" onclick="Cancel()" value='<%= this.GetGlobalResourceObject("WebDialogWindow","Confirmation_Dialog_No") %>'/>
                    </div>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>

    <script type="text/javascript">
        ResetTime();
    </script>
    </div>
    </form>
</body>
</html>
