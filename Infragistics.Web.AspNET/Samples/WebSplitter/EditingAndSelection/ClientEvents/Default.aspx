<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div style="height: 400px;">
        <div class="EventConsole">
            <h4 class="Sampleh4">
                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebSplitter, WebSplitter_ClientSide_EventConsole %>"></asp:Label>
            </h4>
            <div id="eventList" class="LogWindow">
            </div>
            <br />
            <a href="#" id="ClearEvents" onclick="clearList()">
                <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSplitter/EditingAndSelection/ClientEvents/eng/clearLogBtn.jpg" ID="imgClearLog"
                    runat="server" border="0">
                </igsb:LocalizedImage>
            </a>
            <br />
            <br />
            <asp:CheckBox ID="ShowPositionChangeEvents" runat="server" Text="<%$ Resources:WebSplitter,WebSplitter_ClientSide_LogPositionChange %>"
                Checked="True" /><br />
            <asp:CheckBox ID="ShowCollapseExpandEvents" runat="server" Text="<%$ Resources:WebSplitter,WebSplitter_ClientSide_LogCollapse %>"
                Checked="True" /><br />
            <asp:CheckBox ID="ShowMovingEvents" runat="server" Text="<%$ Resources:WebSplitter,WebSplitter_ClientSide_LogMoving %>"
                Checked="true" /><br />
            <asp:CheckBox ID="CancelCollapseEvents" runat="server" Text="<%$ Resources:WebSplitter,WebSplitter_ClientSide_CancelCollapse %>" /><br />
        </div>
        <div class="Splitters">
            <ig:WebSplitter ID="VerticalSplitter" runat="server" Height="200px" Width="300px"
                Orientation="Vertical" DynamicResize="True">
                <Panes>
                    <ig:SplitterPane runat="server" CollapsedDirection="NextPane" BackColor="#FFFFFF">
                        <Template>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing eli.<br>
                            <br>
                            Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit.
                        </Template>
                    </ig:SplitterPane>
                    <ig:SplitterPane runat="server" CollapsedDirection="NextPane">
                        <Template>
                            <ig:WebSplitter ID="HorizontalSplitter" Orientation="Horizontal" runat="server">
                                <Panes>
                                    <ig:SplitterPane runat="server" CollapsedDirection="NextPane" BackColor="#FFFFFF">
                                        <Template>
                                        </Template>
                                    </ig:SplitterPane>
                                    <ig:SplitterPane runat="server" BackColor="#F4F4F4">
                                        <Template>
                                        </Template>
                                    </ig:SplitterPane>
                                </Panes>
                                <ClientEvents Collapsed="collapsedEvent" Collapsing="collapsingEvent" Expanded="expandedEvent"
                                    Expanding="expandingEvent" SplitterBarMoving="splitterBarMovingEvent" SplitterBarPositionChanged="splitterBarPositionChangedEvent"
                                    SplitterBarPositionChanging="splitterBarPositionChangingEvent" Initialize="initializeChildSplitterEvent" />
                            </ig:WebSplitter>
                        </Template>
                    </ig:SplitterPane>
                </Panes>
                <ClientEvents Collapsed="collapsedEvent" Collapsing="collapsingEvent" Expanded="expandedEvent"
                    Expanding="expandingEvent" SplitterBarMoving="splitterBarMovingEvent" SplitterBarPositionChanged="splitterBarPositionChangedEvent"
                    SplitterBarPositionChanging="splitterBarPositionChangingEvent" />
            </ig:WebSplitter>
            <br />
            <input type="button" onclick="javascript:IdentifySplitter()" value="IdentifySplitter" />
            <select id="SplitterList">
                <option value="<%= VerticalSplitter.ClientID %>">VerticalSplitter</option>
                <option value="<%= HorizontalSplitter.ClientID %>">HorizontalSplitter</option>
            </select>
        </div>
    </div>

    <script type="text/javascript">
        function IdentifySplitter(id) {
            if (!id) id = $get("SplitterList").value;
            var splitter = $get(id);
            if (!splitter.__oldBorderLeft) {
                splitter.__oldBorderLeft = $util.getStyleValue(null, 'borderLeftWidth', splitter) + ' ' + $util.getStyleValue(null, 'borderLeftStyle', splitter) + ' ' + _clrFromRGB($util.getStyleValue(null, 'borderLeftColor', splitter));
                splitter.__oldBorderRight = $util.getStyleValue(null, 'borderRightWidth', splitter) + ' ' + $util.getStyleValue(null, 'borderRightStyle', splitter) + ' ' + _clrFromRGB($util.getStyleValue(null, 'borderRightColor', splitter));
                splitter.__oldBorderTop = $util.getStyleValue(null, 'borderTopWidth', splitter) + ' ' + $util.getStyleValue(null, 'borderTopStyle', splitter) + ' ' + _clrFromRGB($util.getStyleValue(null, 'borderTopColor', splitter));
                splitter.__oldBorderBottom = $util.getStyleValue(null, 'borderBottomWidth', splitter) + ' ' + $util.getStyleValue(null, 'borderBottomStyle', splitter) + ' ' + _clrFromRGB($util.getStyleValue(null, 'borderBottomColor', splitter));
            }
            window.setTimeout(function () { _blink(id, false, 0) }, 300);
        }
        function _clrFromRGB(rgb) {
            if (!rgb || rgb.indexOf(',') < 0)
                return rgb;
            var clr = '#';
            rgb = rgb.split(',');
            if (rgb.length != 3)
                return '';
            for (var i = 0; i < 3; i++) {
                var val = rgb[i];
                var num = 0;
                var j = -1, len = val ? val.length : 0;
                while (++j < len) {
                    var ch = val.charCodeAt(j);
                    if (ch >= 48 && ch <= 57) {
                        num = parseInt(val.substring(j));
                        break;
                    }
                }
                clr += _toHex(num);
            }
            return clr;
        }
        function _toHex(num) {
            var high = Math.floor(num / 16);
            var low = num - high * 16;
            high = (high < 10) ? ('' + high) : String.fromCharCode(65 + high - 10);
            low = (low < 10) ? ('' + low) : String.fromCharCode(65 + low - 10);
            return high + low;
        }
        function _blink(id, on, count) {
            if (count > 5) {
                return;
            }
            var e = $get(id);
            window.setTimeout(function () { _blink(id, !on, ++count) }, 500);
            if (on) {
                e.style.borderLeft = e.__oldBorderLeft;
                e.style.borderRight = e.__oldBorderRight;
                e.style.borderTop = e.__oldBorderTop;
                e.style.borderBottom = e.__oldBorderBottom;
            }
            else
                e.style.borderLeft = e.style.borderRight = e.style.borderTop = e.style.borderBottom = '1px solid red';
        }
        function LogEvent(name, desc, cancel) {
            var target = $get('eventList');
            var logEntry = document.createElement("div");
            logEntry.className = "LogEntry";
            logEntry.innerHTML = "<span class='EventTitle" + (cancel ? " Cancel" : "") + "'>" + name + "</span>&nbsp;<span class='EventDesc'>" + desc + (cancel ? ' - <%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_EventCancelled") %>' : "") + "</span>";
            if (target.childNodes.length > 0 && target.firstChild) {
                target.insertBefore(logEntry, target.firstChild);
            } else {
                target.appendChild(logEntry);
            }
        }
        //-------------------
        // function called after pane was collapsed
        function collapsedEvent(sender, splitterArgs) {
            if ($get('<%=ShowCollapseExpandEvents.ClientID %>').checked) LogEvent('<%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_Collapsed") %>', '<%= Resources.WebSplitter.ClientEvents_Pane %> ' + splitterArgs.get_pane().get_index());

        }
        //-------------------
        // function called before pane was collapsed
        function collapsingEvent(sender, splitterArgs) {

            var cancel = $get('<%=CancelCollapseEvents.ClientID %>');
            if (cancel.checked) splitterArgs.set_cancel(true);

            if ($get('<%=ShowCollapseExpandEvents.ClientID %>').checked) LogEvent('<%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_Collapsing") %>', "<%= Resources.WebSplitter.ClientEvents_Pane %> " + splitterArgs.get_pane().get_index(), cancel);

        }
        //-------------------
        // function called after pane was expanded
        function expandedEvent(sender, splitterArgs) {
            if ($get('<%=ShowCollapseExpandEvents.ClientID %>').checked) LogEvent('<%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_Expanded") %>', "<%= Resources.WebSplitter.ClientEvents_Pane %> " + splitterArgs.get_pane().get_index());
        }
        //-------------------
        // function called before pane was expanded
        function expandingEvent(sender, splitterArgs) {
            if ($get('<%= ShowCollapseExpandEvents.ClientID %>').checked) LogEvent('<%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_Expanding") %>', "<%= Resources.WebSplitter.ClientEvents_Pane %> " + splitterArgs.get_pane().get_index());
        }
        //-------------------
        // function called while splitter bar is moving
        function splitterBarMovingEvent(sender, splitterArgs) {
            if ($get('<%=ShowMovingEvents.ClientID %>').checked) LogEvent("SplitterBarMoving", '<%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_NewSize") %> ' + splitterArgs.get_prevPaneNewSize() + ', <%= Resources.WebSplitter.ClientEvents_OldSize %> ' + splitterArgs.get_prevPaneOldSize());
        }
        //-------------------
        // function called after position of splitter bar was changed
        function splitterBarPositionChangedEvent(sender, splitterArgs) {
            if ($get('<%=ShowPositionChangeEvents.ClientID%>').checked) LogEvent("SplitterBarPositionChanged", "Old Size: " + splitterArgs.get_prevPaneOldSize() + ', <%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_NewSize") %> ' + splitterArgs.get_prevPaneNewSize());
        }
        //-------------------
        // function called before position of splitter bar was changed
        function splitterBarPositionChangingEvent(sender, splitterArgs) {
            if ($get('<%=ShowPositionChangeEvents.ClientID %>').checked) LogEvent("SplitterBarPositionChanging", "Old Size: " + splitterArgs.get_prevPaneOldSize() + ', <%= this.GetGlobalResourceObject("WebSplitter","ClientEvents_NewSize") %> ' + splitterArgs.get_prevPaneNewSize());
        }
        var clientID_of_ChildSplitter = null;
        //-------------------
        // function called after initialization of a child WebSplitter control.
        // it is used to get ClientID of that control.
        function initializeChildSplitterEvent(sender, args) {
            clientID_of_ChildSplitter = sender.get_id();
        }


        //-----------------------
        // clear list of events
        function clearList() {
            var target = $get('eventList');
            target.innerHTML = '';
            listCount = 0;
        }
    </script>
</asp:Content>
