<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Area_Charts_3D_Area_Chart_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igchart:UltraChart ID="UltraChart1" runat="server" ChartType="AreaChart3D" Transform3D-Perspective="50"
        Transform3D-ZRotation="0" Transform3D-Scale="50" Transform3D-XRotation="144"
        Transform3D-YRotation="12" Height="400px">
        <ColorModel ModelStyle="CustomLinear" />
        <Axis>
            <X Visible="True">
                <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                    FontColor="Black" Orientation="VerticalLeftFacing" Visible="True" HorizontalAlign="Near" />
            </X>
            <Y Visible="True" TickmarkStyle="Smart">
                <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                    FontColor="Black" Orientation="Horizontal" Visible="True" HorizontalAlign="Far" />
            </Y>
            <Z Visible="True">
                <Labels ItemFormatString="&lt;SERIES_LABEL&gt;" VerticalAlign="Center" Font="Verdana, 7pt, style=Bold"
                    Flip="False" FontColor="Black" Orientation="Horizontal" Visible="True" />
            </Z>
            <X2 Visible="False" />
            <Y2 Visible="False" />
            <Z2 Visible="False" />
        </Axis>
        <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages" />
        <Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;"
            EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black"
            Display="MouseMove" BackColor="AntiqueWhite" Padding="0" />
    </igchart:UltraChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
