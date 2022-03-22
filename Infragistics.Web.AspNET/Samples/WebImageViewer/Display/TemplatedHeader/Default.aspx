<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebImageViewer ID="WebImageViewer1"  Width="427px" 
        runat="server" StyleSetName="Nautilus" EnableDragScrolling="false">
        <ScrollAnimations Type="Page"></ScrollAnimations>
        <Header Visible="true">
            <Template>
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td style="text-align: left;">
                            <span style="display: inline; margin-left: 20px;">Aikido WebImageViewer</span>
                        </td>
                        <td>
                            <table style="margin-left: -25px;" border="0" cellpadding="0" cellspacing="0" id="radioList">
                                <tr>
                                    <td>
                                        <input id="radio1" type="radio" name="radioList" value="0" checked="checked" onclick="radioClick_Event(this);" />
                                    </td>
                                    <td>
                                        <input id="radio2" type="radio" name="radioList" value="2" onclick="radioClick_Event(this);" />
                                    </td>
                                    <td>
                                        <input id="radio3" type="radio" name="radioList" value="4" onclick="radioClick_Event(this);" />
                                    </td>
                                    <td>
                                        <input id="radio4" type="radio" name="radioList" value="6" onclick="radioClick_Event(this);" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </Template>
        </Header>
        <Footer Text="<%$ Resources:WebImageViewer,Customizing_Header_Footer %>">
        </Footer>
        <ClientEvents NextButtonClicked="WebImageViewer1_NextButtonClicked" PrevButtonClicked="WebImageViewer1_PrevButtonClicked" />
    </ig:WebImageViewer>

    <script type="text/javascript">
        function radioClick_Event(radio) {
            if (radio.checked) {
                // Get a reference to the WebImageViewer object.
                var imageViewer = $find('<%= WebImageViewer1.ClientID %>');
                // Call the moveItemIntoFocus method on the ImageItem whose index equals the value 
                // of the radio button that has been checked.
                imageViewer.get_scrollAnimations().get_nextItemAnimation().moveItemIntoFocus(imageViewer.get_items().getItem(radio.value));
            }
        }

        function WebImageViewer1_NextButtonClicked(imageViewer, evntArgs) {
            /* The Next Button has been clicked, so lets update our radio buttons so that they stay in sync */
            for (var i = 1; i <= 4; i++) {
                var element = document.getElementById("radio" + i);
                if (element.checked) {
                    i++;
                    if (i == 5)
                        i = 1;
                    document.getElementById("radio" + i).checked = "checked";
                    break;
                }
            }
        }

        function WebImageViewer1_PrevButtonClicked(imageViewer, evntArgs) {
            /* The Previous Button has been clicked, so lets update our radio buttons so that they stay in sync */
            for (var i = 1; i <= 4; i++) {
                var element = document.getElementById("radio" + i);
                if (element.checked) {
                    i--;
                    if (i == 0)
                        i = 4;
                    document.getElementById("radio" + i).checked = "checked";
                    break;
                }
            }
        }       
    </script>  
</asp:Content>