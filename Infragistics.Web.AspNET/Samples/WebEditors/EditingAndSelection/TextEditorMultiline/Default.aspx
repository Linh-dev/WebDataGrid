<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink4" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="Div1" class="ControlPanelHeader">
        <img src="/samplesbrowser/samplescommon/aspnet/Common/config.png" />
        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPTitle") %></div>
    <div id="Div2" class="controlPanel">
        <div id="Div3" class="controlPanelEvent">
            <div id="eventList">
                <span class="leftTitle">
                    <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPStart") %></span><span id="selectionStartSpan">0</span>
                <br />
                <span class="leftTitle">
                    <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPEnd") %></span><span id="selectionEndSpan">0</span>
                <br />
                <span class="leftTitle">
                    <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPSelected") %></span><span id="selectedTextSpan"></span>
                <br />
                <span class="leftTitle">
                    <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPStartText") %></span><span id="currentTextSpan"></span>
            </div>
        </div>
    </div>
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="220px" Width="500px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="320px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors,  ControlName%>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="true"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 20px;" class="css_form">
                    <label>
                        <%=this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingMultiLabel")%></label>
                    <ig:WebTextEditor ID="MultiLineEditor" runat="server" TextMode="MultiLine" Width="330px"
                        Height="80px">
                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" TextChanged="showCaret" />
                    </ig:WebTextEditor>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>

    <script type="text/javascript">

        function mouseMoveEvt(editor, evtArgs) {
            if (editor.hasFocus())
                showCaret(editor);
        }

        function showCaret(editor, evtArgs) {
            var text = editor.get_text();
            var selText = editor.getSelectedText();
            var selStart = editor.getSelection(true);
            var selEnd = editor.getSelection(false);
            $get('selectionStartSpan').innerHTML = selStart;
            $get('selectionEndSpan').innerHTML = selEnd;
            $get('selectedTextSpan').innerHTML = selText;
            $get('currentTextSpan').innerHTML = text;
        }
    </script>
</asp:Content>
