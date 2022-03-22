<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
        
        .leftBased
        {
            float: left;
        }
        
        .leftPadding
        {
            padding-left: 30px;   
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    
    <div>
        <div class="leftBased" style="padding-top: 2px;">
            <%=this.GetGlobalResourceObject("WebSlider", "Quantity")%>: 
        </div>
        <div class="leftBased leftPadding">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" Width="50px" Text="30" AutoPostBack="false" />
        </div>
        <div style="clear: both;"></div>
    </div>
    <div>
        <div class="leftBased" style="padding-top: 30px;">
             <%=this.GetGlobalResourceObject("WebSlider", "Quantity")%>:
        </div>
        <div class="leftBased leftPadding">
            <ig:WebSlider ID="WebSlider1" runat="server" MaxValueAsString="200" MinValueAsString="0" ValueAsString="20" ValueType="Int">
                <ValueLabel Location="FloatTopOrLeft" />
            </ig:WebSlider>
        </div>
    </div>

    <script type="text/javascript" language="javascript">

        function sliderValueChanged(sender, eventArgs) {
            var newVal = eventArgs.get_newValue();
            var textBox = document.getElementById('<%= this.TextBox1.ClientID %>');

            textBox.value = newVal;
        }

        function textBoxChanged(textBoxID) {
            var textBox = document.getElementById(textBoxID);
            var slider = $find("<%= this.WebSlider1.ClientID %>");

            slider.set_value(textBox.value);
        }

        function textBoxKeyPressed(e, textBoxID) {
            if (e.keyCode == 13 /*ENTER*/) {
                textBoxChanged(textBoxID);
                
                //cancel the event
                return false;
            }
        }
    
    </script>

</asp:Content>