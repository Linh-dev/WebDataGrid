<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="background-color: white; height: 220px;">

        <script type="text/javascript">

            // Called when the user clicks a move button
            // The clientID of the DialogWindow is passed in as a parameter
            // as well as the distance to move
            // This then adjusts the left propery of the dialogwindow
            function move(sControlID, distance) {
                oWebDialogWindow1 = $find(sControlID);
                var newLeft = parseInt(oWebDialogWindow1.get_left()) + distance;
                oWebDialogWindow1.set_left(newLeft + 'px');
            }

        </script>
        <div style="width: 800px; position: relative;">
            <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="200px" Width="320px"
                Modal="false" WindowState="Normal" Moveable="false" MaintainLocationOnScroll="false" Top="20" Left="160">
                <Header CloseBox-Visible="false">
                    <CloseBox Visible="False"></CloseBox>
                </Header>
                <ContentPane>
                    <Template>
                        <div style="text-align: center; position: relative; padding: 5px;">
                            <br />
                            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:WebDialogWindow, Positioning_Dialog_Command_3%>" />
                            <br />
                            <br />
                            <input type="button" onclick="move('<%= WebDialogWindow1.ClientID %>', -20);" value='<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow, Positioning_Dialog_Command_1%>" />' />
                            <input type="button" onclick="move('<%= WebDialogWindow1.ClientID %>', 20);" value='<asp:Literal runat="server" Text="<%$ Resources:WebDialogWindow, Positioning_Dialog_Command_2%>" />' />
                        </div>
                        </div>
                    </Template>
                </ContentPane>
            </ig:WebDialogWindow>
            <h1>&nbsp;</h1>
        </div>
    </div>
</asp:Content>

