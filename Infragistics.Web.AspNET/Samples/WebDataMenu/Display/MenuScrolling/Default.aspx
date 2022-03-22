<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
<ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <style type="text/css">
        #sampleContainer 
        {
            overflow: visible;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <script type="text/javascript">
            function onClick(sender, args) {
                var resultDiv = document.getElementById("resultDiv");
                if (resultDiv) {
                    resultDiv.style.visibility = "visible";
                    resultDiv.innerHTML = '<%= this.GetGlobalResourceObject("WebDataMenu","MenuScrolling_Clicked") %>' + "<br /><span class='bold'>" + args.getItem().get_text() + "</span>";
                }
            }

            // ensure that menus are not corrupted and transparent. IE7 has a well known bug with the z-indexes and reseting the stacking index whenever there is a 
            // an element with position relative or absolute in the control's dom hierarchy 
            function IE7ZIndexAdjust() {
                var div1 = $get('div1');
                var div2 = $get('div2');

                if ($util.IsIE7) {
                    div1.style.zIndex = '10';
                    div1.style.position = 'relative';

                    div2.style.zIndex = '1';
                    div2.style.position = 'relative';
                }

            }
    </script>
    <div style="width: 650px; height: 490px; margin-top: 40px; float: left;">
        <asp:Panel ID="Horizontal" Width="600px" runat="server">
            <h3>
                <%=this.GetGlobalResourceObject("WebDataMenu","MenuScrolling_Horizontal") %>
            </h3>
            <div id="div1" style="margin-left:20px;position:relative;">
                <ig:WebDataMenu ID="WebDataMenuHorizontal" EnableScrolling="true" runat="server"
                    MaxDataBindDepth="1" >
                    <ClientEvents Initialize="IE7ZIndexAdjust" />
                    <GroupSettings Orientation="Horizontal" Width="500px" Height="100%" EnableAnimation="true"
                        AnimationType="OpacityAnimation" AnimationDuration="500" />
                    <ClientEvents ItemClick="onClick" />
                    <DataBindings>
                        <ig:DataMenuItemBinding DefaultText=" " TextField="ID" ValueField="Value" TargetField="_blank"
                            ToolTipField="Text" />
                    </DataBindings>
                </ig:WebDataMenu>
            </div>
            <br />
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Vertical" Width="100%" runat="server">
            <h3>
                <%=this.GetGlobalResourceObject("WebDataMenu","MenuScrolling_Vertical") %>
            </h3>
            <div id="div2" style="margin-left:20px;">
            <ig:WebDataMenu ID="WebDataMenuVertical" runat="server" EnableScrolling="true" MaxDataBindDepth="1"
                StyleSetName="Office2007Black" >
                <GroupSettings Orientation="Vertical" Height="200px" EnableAnimation="true" AnimationType="ExpandAnimation"
                    AnimationDuration="500" />
                <ClientEvents ItemClick="onClick" />
                <DataBindings>
                    <ig:DataMenuItemBinding DefaultText=" " TextField="ID" ValueField="Value" NavigateUrlFields="URL"
                        TargetField="_blank" ToolTipField="Text" />
                </DataBindings>
            </ig:WebDataMenu>
            </div>
        </asp:Panel>
    </div>
    <div id="resultDiv" style="display: inline; float: left; text-align: center; margin-top: 35px;
        visibility: hidden">
    </div>
    <div style="clear: left">
    </div>
    <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/Scrolling/Menu" />
</asp:Content>
