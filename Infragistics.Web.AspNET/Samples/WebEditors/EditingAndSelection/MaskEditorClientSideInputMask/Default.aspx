<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%= this.ResolveUrl("~/samplescommon/aspnet/Common/css_form.css") %>" rel="stylesheet" type="text/css"/>
    <link href="<%= this.ResolveUrl("~/samplescommon/aspnet/Common/Common.css") %>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        var BG_MASKS = {
            identificator: "bg",
            idTitle: '<%=this.GetGlobalResourceObject("WebEditors","WebMaskEditorEGN") %>',
            idMask: "##########",
            phoneMask: "+35\\9-###-###-###",
            postalMask: "####"
        },
        US_MASKS = {
            identificator: "us",
            idTitle: '<%=this.GetGlobalResourceObject("WebEditors","WebMaskEditorSSN") %>',
            idMask: "###-##-####",
            phoneMask: "+1 ###-###-####",
            postalMask: "#####-####"
        };

        var lastEditor = null;
        // Wait the infragistic controls to load and then set default masks
        $(window).load(function () {
            // get browser language and load default editor masks due to that language
            //debugger;
            var BROWSER_MASK = US_MASKS,
                userLang = (navigator.language) ? navigator.language : navigator.userLanguage;
            if (userLang.indexOf(BG_MASKS.identificator) > -1) {
                BROWSER_MASK = BG_MASKS;
                $('#langDropDown').val('bg');
            }
            if (lastEditor)
                changeMaskDynamically(BROWSER_MASK);

            $(document).on("click", "#btnClear", clearFormData);
					$('#langDropDown').change(function () {
						NEW_MASK = ($(this).val() === BG_MASKS.identificator) ? BG_MASKS : US_MASKS;
						changeMaskDynamically(NEW_MASK);
					});
        });

        function initControls(maskEditor) {
            lastEditor = maskEditor;
            var BROWSER_MASK = US_MASKS,
                userLang = (navigator.language) ? navigator.language : navigator.userLanguage;
            if (userLang.indexOf(BG_MASKS.identificator) > -1) {
                BROWSER_MASK = BG_MASKS;
                $('#langDropDown').val('bg');
            }
            changeMaskDynamically(BROWSER_MASK);
        }


        function changeMaskDynamically(MASK) {
            $("#idEditorLabel").html(MASK.idTitle);
            // <!--#BEGIN SNIPPET#-->
            $find("<%= this.idEditor.ClientID %>").set_inputMask(MASK.idMask);
            // <!--#END SNIPPET#-->
            $("#maskId").html("(" + MASK.idMask + ")");

            $find("<%= this.phoneEditor.ClientID %>").set_inputMask(MASK.phoneMask);
            $("#maskPhone").html("(" + MASK.phoneMask.replace('\\', '') + ")");

            $find("<%= this.postalCodeEditor.ClientID %>").set_inputMask(MASK.postalMask);
            $("#maskPostalCode").html("(" + MASK.postalMask + ")");
        }

        function clearFormData() {
            // You can set Editor's value either through the control client API...
            $find("<%= this.nameEditor.ClientID %>").set_value("");
            $find("<%= this.phoneEditor.ClientID %>").set_value("");
            $find("<%= this.postalCodeEditor.ClientID %>").set_value("");
            $find("<%= this.idEditor.ClientID %>").set_value("");

            // ...or directly manipultaing the DOM element using jQuery.
            $("#<%= this.phoneEditor.ClientID %>").val("");
            $("#<%= this.postalCodeEditor.ClientID %>").val("");
        }
    </script>
    <style type="text/css">
        .form-container { padding: 10px; font-size: 12px; }
        .form-container .sample-ig-controls { float: right; }
        .form-container .mask-container { float: right; color: #3EC2F9; font-style: italic; margin-right: 10px; }
        .form-container label { display: block; float: left; width: 150px; }
        .dropdown-container { float: right; margin-bottom: 30px; padding: 5px; }
        .dropdown-container label { float: right; width: 130px; height: 23px; }
        .clear-sample-floating { clear: both; }
        .form-row { padding: 5px; }
        .mask-editors { color: #3EC2F9; }
        .btn-clear { float: right; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="290px" Width="590px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div class="form-container">
                    <div class="dropdown-container">
                        <select id="langDropDown" class="sample-ig-controls" style="width:100px;" name="DropDownList1" id="DropDownList1">
                           <option value="us"><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: WebEditors, WebMaskEditorUS%>" /></option>
                           <option value="bg"><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: WebEditors, WebMaskEditorBulgarian%>" /></option>
                        </select>
                        <label for="langDropDown">
                            <%=this.GetGlobalResourceObject("WebEditors","WebMaskEditorEditorFormat") %>
                        </label>
                    </div>
                    <div class="clear-sample-floating">
                    </div>
                    <div class="form-row">
                        <label for="nameEditor">
                            <%=this.GetGlobalResourceObject("WebEditors","WebMaskEditorName") %></label>
                        <ig:WebTextEditor ID="nameEditor" runat="server" CssClass="sample-ig-controls">
                        </ig:WebTextEditor>
                        <div class="clear-sample-floating">
                        </div>
                    </div>
                    <div class="form-row">
                        <label id="idEditorLabel" for="idEditor" class="mask-editors">
                        </label>
                        <ig:WebMaskEditor ID="idEditor" runat="server" CssClass="sample-ig-controls">
                        </ig:WebMaskEditor>
                        <div id="maskId" class="mask-container">
                        </div>
                        <div class="clear-sample-floating">
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="phoneEditor" class="mask-editors">
                            <%=this.GetGlobalResourceObject("WebEditors", "WebMaskEditorMobilePhoneNumber")%></label>
                        <ig:WebMaskEditor ID="phoneEditor" runat="server" CssClass="sample-ig-controls">
                        </ig:WebMaskEditor>
                        <div id="maskPhone" class="mask-container">
                        </div>
                        <div class="clear-sample-floating">
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="postalCodeEditor" class="mask-editors">
                            <%=this.GetGlobalResourceObject("WebEditors", "WebMaskEditorPostCode")%></label>
                        <ig:WebMaskEditor ID="postalCodeEditor" runat="server" CssClass="sample-ig-controls">
                            <ClientEvents Initialize="initControls" />
                        </ig:WebMaskEditor>
                        <div id="maskPostalCode" class="mask-container">
                        </div>
                        <div class="clear-sample-floating">
                        </div>
                    </div>
                    <div class="form-row">
                        <input type="button" id="btnClear" class="btn-clear" value="<%=this.GetGlobalResourceObject("WebEditors", "WebMaskEditorClear").ToString().ToUpper()%>" />
                        <div class="clear-sample-floating">
                        </div>
                    </div>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
