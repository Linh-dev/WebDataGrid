<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebResizingExtender_Display_Customization_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style id="mainPageStyle" runat="server" type="text/css">
        
        div.panel
        {
            float: left;
            width: 100px;
            margin-bottom: 5px;
            padding-left: 5px; 
        }
        
        .divContainer
        {
            float: left;
            border-style: none solid solid none;
            border-width: 1px;
            border-color: Black;
        }
        
        .extendedDiv 
        {
            width: 150px;
            height: 100px;
            vertical-align: middle;
            background-color: Gray;
            border-style: solid;
            border-width: 1px;
            border-color: #777777;
            color: White;
            padding-top: 20px;
        }
    
    </style>

    <script type="text/javascript" language="javascript">

        function onTextBoxFocus(sender) {
            var textBox = document.getElementById(sender);
            textBox.style.color = "Black";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="Container" class="divContainer" runat="server">
        <div id="resizable" class="extendedDiv" runat="server">
            <%= this.GetGlobalResourceObject("WebResizingExtender", "Reiszable_Area")%>
        </div>
    </div>
    <div style="clear: both;"></div>
    <div style="float: left;">
        <div>
            <div class="panel">
                <asp:Literal Text="<%$ Resources:WebResizingExtender, Width %>" runat="server" />
            </div>
            <div class="panel">
                <asp:TextBox ID="WidthTextBox" runat="server" Width="50px" MaxLength="3" TextMode="SingleLine" Text="500" />
            </div>
            <div style="clear: both;">
            </div>
        </div>
        <div>
            <div class="panel">
                <asp:Literal ID="Literal1" Text="<%$ Resources:WebResizingExtender, Height %>" runat="server" />
            </div>
            <div class="panel">
                <asp:TextBox ID="HeightTextBox" runat="server" Width="50px" MaxLength="3" TextMode="SingleLine" Text="480" />
            </div>
            <div style="clear: both;">
            </div>
        </div>
        <div>
            <div class="panel">
                <asp:Literal ID="Literal2" Text="<%$ Resources:WebResizingExtender, Resizing_Image %>" runat="server" />
            </div>
            <div class="panel">
                <asp:DropDownList ID="DropDownList1" runat="server" />
            </div>
            <div style="clear: both;">
            </div>
        </div>
        <div>
            <div class="panel">
            </div>
            <div class="panel">
                <asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:WebResizingExtender, Submit %>" />
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
    <div style="clear: both;"></div>

    <igtk:WebResizingExtender ID="WebResizingExtender1" TargetControlID="resizable" EnableViewState="true" runat="server" MinimumWidth="150" MinimumHeight="100" />
</asp:Content>