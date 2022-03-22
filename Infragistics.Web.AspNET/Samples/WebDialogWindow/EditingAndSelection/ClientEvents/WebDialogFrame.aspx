<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebDialogFrame.aspx.cs" 
    Inherits="WebDialogFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" />
</head>
<body>
    <form id="form1" runat="server" style="margin: 0;">
    <div>
    <script type="text/javascript">
        //-------------------
        // function called on Initialize event
        function initializeEvt(sender, args) {
            showClosedState();
        }
        function windowStateChangedEvt(sender, args) {
            addLine('<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_9 %>" />');
            var postBack = $getPart('PostBackOnButtonEvents');
            if (postBack && postBack.checked)
                args.set_postBack(1);
            showClosedState();
        }
        //-------------------
        // function called before Minimized button event
        function windowStateChangingEvt(sender, args) {
            var str = '<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_1 %>" />';
            var cancel = $getPart('CancelButtonEvents');
            if (cancel && cancel.checked) {
                str += '<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_2 %>" />';
                args.set_cancel(true);
            }
            else
                str += ' <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_8 %>" />';
            addLine(str);
        }
        //-------------------
        // function called at the end of move event
        function movedEvt(sender, args) {
            addLine('<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_6 %>" /> Left/top <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_4 %>" />:' + args.get_x() + ',' + args.get_y() + ', <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_5 %>" />:' + args.get_oldX() + ',' + args.get_oldY() + '. <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_7 %>" />');

            var modify = $getPart('ModifyMovedEvents');
            if (modify && modify.checked) {
                if (args.get_x() > 300)
                    args.set_x(300);
                if (args.get_x() < 10)
                    args.set_x(10);
            }
        }
        //-------------------
        // function called while moving event
        function movingEvt(sender, args) {
            var target = $getPart('MovingEvents');
            if (target && target.checked)
                addLine('<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_3 %>" /> Left/top <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_4 %>" />:' + args.get_x() + ',' + args.get_y() + ', <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_5 %>" />:' + args.get_oldX() + ',' + args.get_oldY() + '. <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_8 %>" />');
            var cancel = $getPart('CancelMovingEvents');
            if (cancel && cancel.checked && (args.get_y() > 400 || args.get_y() < 50))
                args.set_cancel(true);
        }
        //-------------------
        // function called at the end of resize event
        function resizedEvt(sender, args) {
            addLine('<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_12 %>" /> <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_11 %>" />' + args.get_width() + ',' + args.get_height() + ', <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_5 %>" />:' + args.get_oldWidth() + ',' + args.get_oldHeight() + '. <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_7 %>" />');

            var modify = $getPart('ModifyResizedEvents');
            if (modify && modify.checked) {
                if (args.get_height() > 300)
                    args.set_height(300);
                if (args.get_height() < 100)
                    args.set_height(100);
            }
        }
        //-------------------
        // function called while resizing event
        function resizingEvt(sender, args) {
            var target = $getPart('ResizingEvents');
            if (target && target.checked)
                addLine('<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_10 %>" /> <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_11 %>" />' + args.get_width() + ',' + args.get_height() + ', <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_5 %>" />:' + args.get_oldWidth() + ',' + args.get_oldHeight() + '. <asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_8 %>" />');
            var cancel = $getPart('CancelResizingEvents');
            if (cancel && cancel.checked && (args.get_width() > 400 || args.get_width() < 150))
                args.set_cancel(true);
        }
        //-----------------------
        // output events
        // counter of displayed events
        var listCount = 0;
        function addLine(str) {
            var target = $getPart('eventList', true);
            if (target)
                target.innerHTML += '<br />' + ++listCount + '. ' + str;
        }
        //-----------------------
        // clear list of events
        function clearList() {
            var target = $getPart('eventList', true);
            if (target)
                target.innerHTML = '<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Status_4 %>" />';
            listCount = 0;
        }
        //-----------------------
        // adjust state of "Show Dialog" button
        function showClosedState() {
            var target = $getPart('ShowDialog');
            var dialog = $find('<%=WebDialogWindow1.ClientID%>');
            if (target)
                target.disabled = (dialog.get_windowState() != $IG.DialogWindowState.Hidden);
        }
        //------------------
        // find INPUT or DIV element by partial match of its id
        // id: value of id
        // div: true-request to find DIV, otherwise, INPUT
        function $getPart(id, div) {
            var elems = document.getElementsByTagName(div ? 'DIV' : 'INPUT');
            var i = elems.length;
            while (i-- > 0)
                if (elems[i].id && elems[i].id.indexOf(id) >= 0)
                    return elems[i];
            return null;
        }
    </script>
    <ig:WebScriptManager ID="ScriptManager1" runat="server"></ig:WebScriptManager>
    <div class="wdwClientEvents">
        <ig:WebDialogWindow ID="WebDialogWindow1" runat="server" Width="300px" 
            Height="185px" Left="0" Top="10px" Style="z-index: 30; line-height: normal;">
            <ContentPane BackColor="#FAFAFA">
                <Template>
                    <div style="padding: 5px;">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Description_3 %>"
                            Style="line-height: 20px"></asp:Label>
                        <br />
                    </div>
                </Template>
            </ContentPane>
            <Header CaptionText="<%$ Resources:WebDialogWindow,Client_Side_Events_Dialog %>">
                <MaximizeBox Visible="True" />
                <MinimizeBox Visible="True" />
            </Header>
            <ClientEvents WindowStateChanging="windowStateChangingEvt" WindowStateChanged="windowStateChangedEvt"
                Initialize="initializeEvt" Moved="movedEvt" Moving="movingEvt" Resized="resizedEvt"
                Resizing="resizingEvt" />
            <Resizer Enabled="True" />
        </ig:WebDialogWindow>
        <div style="left:0px;top:250px;position:absolute;">
            <div style="width:204px;float:left;">
                <asp:CheckBox ID="CancelButtonEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_1 %>" /><br />
                <asp:CheckBox ID="PostBackOnButtonEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_2 %>" /><br />
                <asp:CheckBox ID="CancelMovingEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_3 %>" /><br />
                <asp:CheckBox ID="ModifyMovedEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_4 %>" />
            </div>
            <div style="width:215px;margin-left:307px;">
                <asp:CheckBox ID="CancelResizingEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_5 %>" /><br />
                <asp:CheckBox ID="ModifyResizedEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_6 %>" /><br />
                <asp:CheckBox ID="ResizingEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_7 %>" /><br />
                <asp:CheckBox ID="MovingEvents" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_CheckBox_8 %>" />
            </div>
        </div>
       
        <input type="button" id="ShowDialogButton" onclick="$find('<%=WebDialogWindow1.ClientID%>').set_windowState($IG.DialogWindowState.Normal);showClosedState();" value='<%= this.GetGlobalResourceObject("WebDialogWindow","Client_Side_Events_Tooltip_1") %>'/>
        <input type="button" id="ClearEventsButton" onclick="clearList()" value='<%= this.GetGlobalResourceObject("WebDialogWindow","Client_Side_Events_Tooltip_2") %>'/>
            
        <div id="eventListWrapper">
            <div id="eventList" nowrap="nowrap">
			<asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebDialogWindow,Client_Side_Events_Description_4 %>" ></asp:Label>
            </div>
        </div>
    </div>
    <h1>&nbsp;</h1>
    </div>
    </form>
</body>
</html>
