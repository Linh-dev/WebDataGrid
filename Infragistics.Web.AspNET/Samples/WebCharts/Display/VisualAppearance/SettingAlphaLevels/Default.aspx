<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Visual_Appearance_Setting_Alpha_Levels_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table1" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" ChartType="AreaChart3D" Transform3D-ZRotation="0"
                    Transform3D-XRotation="130" Transform3D-YRotation="45">
                    <Border CornerRadius="5" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
                    </Border>
                    <ColorModel AlphaLevel="255" ModelStyle="CustomLinear" />
                    <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                </igchart:UltraChart>
            </td>
            <td valign="top">
                <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebCharts, AlphaLevels_Label %>"></asp:Label><br />
                            <ig:WebNumericEditor ID="WebNumericEdit1" runat="server">
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCharts, OthersCategoryDisplay_Label3 %>">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
