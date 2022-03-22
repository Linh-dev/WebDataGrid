<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Client_Side_Object_Model_Printing_Client_Side_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function PrintChart() {
            // reference the chart image
            var chartImage = document.getElementById('<%= UltraChart1.ClientID + "_BaseImage"%>');
            //create a new window
            var newWindow = window.open("", "", "width=450,height=350");
            
            //create a new image element with the same src as chartImage
            var newImage = newWindow.document.createElement("img");
            newImage.src = chartImage.src;
            // append it to the new window document body
            newWindow.document.body.appendChild(newImage);
            $(newWindow).ready(function () {
                if ($.browser.opera) {
                    sleep(1500);
                }
                newWindow.print();
                var isWebKit = $.browser.webkit ? true : false;
                if (!isWebKit) {
                    newWindow.close();
                }
            });
        }
        function sleep(milliSeconds) {
            var startTime = new Date().getTime();
            while (new Date().getTime() < startTime + milliSeconds);
        }
    </script>
    <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCharts, PrintChartOnClient_Label1 %>" />    
    <igchart:UltraChart runat="server" ID="UltraChart1">
        <Data>
            <EmptyStyle>
                <PointPE FillOpacity="255" Fill="Transparent"></PointPE>
                <LineStyle DrawStyle="Dash"></LineStyle>
                <PE FillOpacity="255" Fill="Transparent"></PE>
            </EmptyStyle>
        </Data>
        <TitleLeft Visible="False" Orientation="VerticalLeftFacing" HorizontalAlign="Near"
            Extent="26" Location="Left">
            <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
        </TitleLeft>
        <ColorModel AlphaLevel="255" ModelStyle="CustomLinear">
        </ColorModel>
        <Legend FormatString="&lt;ITEM_LABEL&gt;">
            <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
        </Legend>
        <ColumnChart SeriesSpacing="1" ColumnSpacing="0" NullHandling="Zero">
        </ColumnChart>
        <Axis>
            <X Visible="True" LineThickness="1" Extent="50">
                <StripLines>
                    <PE FillOpacity="255" Fill="Transparent"></PE>
                </StripLines>
                <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" Visible="True"
                    HorizontalAlign="Near" ItemFormat="ItemLabel" Orientation="VerticalLeftFacing"
                    Font="Verdana, 7pt">
                    <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="Horizontal"
                        Visible="True" FormatString="&lt;SERIES_LABEL&gt;" Font="Verdana, 7pt" />
                </Labels>
                <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                </MajorGridLines>
                <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                </MinorGridLines>
            </X>
            <Y Visible="True" TickmarkStyle="Smart" LineThickness="1" Extent="20">
                <StripLines>
                    <PE FillOpacity="255" Fill="Transparent"></PE>
                </StripLines>
                <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" Visible="True"
                    HorizontalAlign="Far" ItemFormat="DataValue" Orientation="Horizontal" Font="Verdana, 7pt" />
                <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                </MajorGridLines>
                <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                </MinorGridLines>
            </Y>
            <X2 Visible="False" />
            <Y2 Visible="False" />
        </Axis>
        <TitleRight Visible="False" Orientation="VerticalRightFacing" HorizontalAlign="Near"
            Extent="26" Location="Right">
            <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
        </TitleRight>
        <TitleBottom Visible="True" Orientation="Horizontal" HorizontalAlign="Far" Extent="26"
            Location="Bottom">
            <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
        </TitleBottom>
        <TitleTop Visible="True" Orientation="Horizontal" HorizontalAlign="Near" Extent="33"
            Location="Top">
            <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
        </TitleTop>
        <Effects>
            <Effects>
                <igchartprop:GradientEffect />
                <igchartprop:ShadowEffect />
            </Effects>
        </Effects>
        <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
            ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
    </igchart:UltraChart>


    <br />
    <br />
    <div id="shot"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
