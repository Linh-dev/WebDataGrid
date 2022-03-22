<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <script type="text/javascript">
        function minWebNumericEditor_ValueChanged(sender, e) {

            var editor = GetEditor();
            editor.set_minValue(e.get_value());

            GetMinWebNumericEditor().set_maxValue(GetMaxWebNumericEditor().get_value());
            GetMaxWebNumericEditor().set_minValue(GetMinWebNumericEditor().get_value());

            RefreshEditorValue();
        }

        function maxWebNumericEditor_ValueChanged(sender, e) {

            var editor = GetEditor();
            editor.set_maxValue(e.get_value());

            GetMinWebNumericEditor().set_maxValue(GetMaxWebNumericEditor().get_value());
            GetMaxWebNumericEditor().set_minValue(GetMinWebNumericEditor().get_value());

            RefreshEditorValue();
        }

        function RefreshEditorValue() {

            if (GetEditor().get_text() < GetMinWebNumericEditor().get_value())
                GetEditor().set_value(GetMinWebNumericEditor().get_value());
            else if (GetEditor().get_text() > GetMaxWebNumericEditor().get_value())
                GetEditor().set_value(GetMaxWebNumericEditor().get_value());
        }

        function GetEditor() {
            return $find("<%= this.RangedNumericEditor.ClientID %>");
        }

        function GetMaxWebNumericEditor() {
            return $find("<%= this.maxWebNumericEditor.ClientID %>");
        }

        function GetMinWebNumericEditor() {
            return $find("<%= this.minWebNumericEditor.ClientID %>");
        }
        
    </script>

    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="320px" Width="500px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors,  ControlName%>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 20px;" class="css_form">
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorRangeMinValue") %></label>
                    <br />
                    <ig:WebNumericEditor Height="20px" ID="minWebNumericEditor" runat="server" ReadOnly="true"
                        CssClass="list" ClientEvents-ValueChanged="minWebNumericEditor_ValueChanged">
                        <Buttons SpinButtonsDisplay="OnRight" SpinOnArrowKeys="true" SpinOnReadOnly="true"
                            SpinWrap="true" />
                    </ig:WebNumericEditor>
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorRangeMaxValue") %></label>
                    <br />
                    <ig:WebNumericEditor Height="20px" ID="maxWebNumericEditor" runat="server" ReadOnly="true"
                        CssClass="list" ClientEvents-ValueChanged="maxWebNumericEditor_ValueChanged">
                        <Buttons SpinButtonsDisplay="OnRight" SpinOnArrowKeys="true" SpinOnReadOnly="true"
                            SpinWrap="true" />
                    </ig:WebNumericEditor>
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorRangeLabel") %></label>
                    <br />
                    <ig:WebNumericEditor Height="20px" ID="RangedNumericEditor" runat="server" />
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
