<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_AjaxIndicator_Display_Using_WebDropDown" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

   <style type="text/css">
       
        .ig_AjaxIndicatorBlock
        {
            background: #909090;
            filter: alpha(opacity:30);
            opacity: 0.3;
        }
        
        #Div3
        {
           height: 130px;
        }
        
    </style>

    <link href="/samplesbrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanel.css" rel="stylesheet" type="text/css" />

    <link href="/samplesbrowser/SamplesCommon/aspnet/Common/ControlPanel/css_form.css" type="text/css" rel="Stylesheet" />

    <script src="/samplesbrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
            var milisec = 0;
            var seconds = 5;
            var secLabel = '<%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_SecLabel") %>';

            function display() {
                if (seconds == 0 && milisec == 0)
                    return;

                if (milisec <= 0) {
                    milisec = 9;
                    seconds -= 1;
                }
                if (seconds <= -1) {
                    milisec = 0;
                    seconds += 1;
                }
                else
                    milisec -= 1;

                document.getElementById("countdownSpan").innerHTML = seconds + "." + milisec + " " + secLabel;

                setTimeout("display()", 107);
            }

            function startCountDown() {
                milisec = 0;
                seconds = document.getElementById("<%= this.ddlRequestDelay.ClientID %>").value / 1000;
                document.getElementById("countdownSpan").innerHTML = "";
                display();
            }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="Div1" class="ControlPanelHeader">
         <img src="/samplesbrowser/samplescommon/aspnet/Common/config.png" />
        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPTitle") %>
    </div>

    <div id="Div2" class="controlPanel">
        <div id="Div3" class="controlPanelEvent">
            <table>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_FadeInEquationTypeLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFadeInEquationType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFadeInEquationType_SelectedIndexChanged"
                            Width="120px">
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_Linear %>"
                                Value="0" Selected="True" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_EaseIn %>"
                                Value="1" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_EaseOut %>"
                                Value="2" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_EaseInOut %>"
                                Value="3" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_FadeInEquationType_Bounce %>"
                                Value="4" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_LocationLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                            Width="120px">
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_NotSet %>"
                                Value="-1" Selected="True" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopLeft %>"
                                Value="0" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopCenter %>"
                                Value="1" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopRight %>"
                                Value="2" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopInfront %>"
                                Value="3" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_TopBehind %>"
                                Value="4" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleLeft %>"
                                Value="8" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleCenter %>"
                                Value="9" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleRight %>"
                                Value="10" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleInfront %>"
                                Value="11" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_MiddleBehind %>"
                                Value="12" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomLeft %>"
                                Value="16" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomCenter %>"
                                Value="17" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomRight %>"
                                Value="18" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomInfront %>"
                                Value="19" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BottomBehind %>"
                                Value="20" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveLeft %>"
                                Value="32" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveCenter %>"
                                Value="33" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveRight %>"
                                Value="34" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveInfront %>"
                                Value="35" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_AboveBehind %>"
                                Value="36" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowLeft %>"
                                Value="64" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowCenter %>"
                                Value="65" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowRight %>"
                                Value="66" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowInfront %>"
                                Value="67" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_Location_BelowBehind %>"
                                Value="68" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_BlockAreaLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBlockArea" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBlockArea_SelectedIndexChanged"
                            Width="120px">
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_NotSet %>"
                                Value="0" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_Disabled %>"
                                Value="1" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_Control %>"
                                Selected="True" Value="2" />
                            <asp:ListItem Text="<%$ Resources:AjaxIndicator, AjaxIndicator_BlockArea_Page %>"
                                Value="3" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_RequestDelayLabel")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRequestDelay" runat="server" Width="120px">
                            <asp:ListItem Text="" Value="" Selected="True" />
                            <asp:ListItem Text="1 sec." Value="1000" />
                            <asp:ListItem Text="2 sec." Value="2000" />
                            <asp:ListItem Text="3 sec." Value="3000" />
                            <asp:ListItem Text="4 sec." Value="4000" />
                            <asp:ListItem Text="5 sec." Value="5000" />
                        </asp:DropDownList>
                        <span id="countdownSpan"></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="DataGridWrapper">
        <table>
            <tr style="height: 30px;">
                <td>
                    <%= this.GetGlobalResourceObject("AjaxIndicator","AjaxIndicator_WebDropDown_ScrollDownLabel")%>
                </td>
            </tr>
            <tr>
                <td style="height: 230px;">
                    <ig:WebDropDown runat="server" ID="WebDropDown1" DataSourceID="DefaultDataSource" OnInit="WebDropDown1_Init"
                        TextField="Company" PageSize="20" EnableLoadOnDemand="True" Width="300px" Height="220px" DropDownContainerHeight="200px"
                        DropDownContainerWidth="300px">
                        <AjaxIndicator Enabled="True" BlockArea="Control" BlockCssClass="ig_AjaxIndicatorBlock" />
                    </ig:WebDropDown>
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
    [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
    </asp:AccessDataSource>

</asp:Content>
