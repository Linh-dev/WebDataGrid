<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Heatmap_Charts_3D_Heatmap_Chart_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igchart:UltraChart ID="UltraChart1" runat="server" ChartType="HeatMapChart3D" Transform3D-Perspective="50"
        Transform3D-ZRotation="0" Transform3D-Scale="70" Transform3D-XRotation="144"
        Transform3D-YRotation="12" Height="400px" Version="6.2">
        <ColorModel ColorBegin="108, 162, 36" ColorEnd="7, 108, 176" ModelStyle="CustomLinear"
            AlphaLevel="255">
        </ColorModel>
        <Axis>
            <Z Visible="True" LineThickness="1" TickmarkStyle="Smart">
                <Labels ItemFormatString="&lt;SERIES_LABEL&gt;" VerticalAlign="Center" Visible="True"
                    HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="DimGray" Orientation="Horizontal">
                    <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="DimGray"
                        Orientation="VerticalLeftFacing" Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                        <Layout Behavior="Auto">
                        </Layout>
                    </SeriesLabels>
                    <Layout Behavior="Auto">
                    </Layout>
                </Labels>
            </Z>
            <X Visible="True" LineThickness="1" TickmarkStyle="Smart">
                <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                <Labels SeriesFormatString="" ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center"
                    Visible="True" HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="ItemLabel"
                    FontColor="DimGray" Orientation="VerticalLeftFacing">
                    <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="DimGray"
                        Orientation="VerticalLeftFacing" Visible="True" FormatString="">
                        <Layout Behavior="Auto">
                        </Layout>
                    </SeriesLabels>
                    <Layout Behavior="Auto">
                    </Layout>
                </Labels>
            </X>
            <Y Visible="True" LineThickness="1" TickmarkStyle="Smart">
                <Labels SeriesFormatString="" ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center"
                    Visible="True" HorizontalAlign="Far" Font="Verdana, 7pt" ItemFormat="ItemLabel"
                    FontColor="DimGray" Orientation="Horizontal">
                    <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Font="Verdana, 7pt" FontColor="DimGray"
                        Orientation="VerticalLeftFacing" Visible="True" FormatString="">
                        <Layout Behavior="Auto">
                        </Layout>
                    </SeriesLabels>
                    <Layout Behavior="Auto">
                    </Layout>
                </Labels>
            </Y>
            <X2 Visible="False" />
            <Y2 Visible="False" />
            <Z2 Visible="False" />
        </Axis>
        <DeploymentScenario ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" FilePath="/SamplesBrowser/Temp/ChartImages">
        </DeploymentScenario>
    </igchart:UltraChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>