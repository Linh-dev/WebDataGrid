<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Visual_Appearance_Chart_Sizing_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        function checkRenderingType(correctUnitValidator, validation) {
            var prefix = correctUnitValidator.id;
            prefix = prefix.substr(0, prefix.indexOf("CorrectUnitValidator"));
            var unitTypeEditor = document.getElementById(prefix + "unitTypeEditor");
            var renderingTypeEditor = document.getElementById(prefix + "renderingTypeEditor");
            if (validation.Value == "Image" && unitTypeEditor.selectedIndex == 1) {
                validation.IsValid = false;
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igchart:UltraChart runat="server" ID="UltraChart1" Width="300" Height="300">
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
            <X Visible="True" LineThickness="1" Extent="70">
                <StripLines>
                    <PE FillOpacity="255" Fill="Transparent"></PE>
                </StripLines>
                <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" Visible="True"
                    HorizontalAlign="Near" ItemFormat="ItemLabel" Orientation="VerticalLeftFacing"
                    Font="Verdana, 7pt">
                    <Layout Behavior="Auto" />
                    <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="Horizontal"
                        Visible="True" FormatString="&lt;SERIES_LABEL&gt;" Font="Verdana, 7pt">
                        <Layout Behavior="Auto" />
                    </SeriesLabels>
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
                    HorizontalAlign="Far" ItemFormat="DataValue" Orientation="Horizontal" Font="Verdana, 7pt">
                    <Layout Behavior="Auto" />
                </Labels>
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
    <table>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebCharts, Sizing_Label1 %>"></asp:Label>
            </td>
            <td>
                <ig:WebNumericEditor ID="widthEditor" runat="server" DataMode="Int" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCharts, Sizing_Label2 %>"></asp:Label>
            </td>
            <td>
                <ig:WebNumericEditor ID="heightEditor" runat="server" DataMode="Int" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebCharts, Sizing_Label3 %>"></asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="unitTypeEditor">
                    <asp:ListItem Text="Pixels" />
                    <asp:ListItem Text="Percentage" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebCharts, Sizing_Label4 %>"></asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="Server" ID="renderingTypeEditor">
                    <asp:ListItem Text="Image" />
                    <asp:ListItem Text="Flash" />
                    <asp:ListItem Text="Svg" />
                </asp:DropDownList>
                <asp:CustomValidator ID="CorrectUnitValidator" runat="server" ControlToValidate="renderingTypeEditor" ClientValidationFunction="checkRenderingType"
                    Text="<%$ Resources:WebCharts, CorrectUnitValidationMessage %>">
                </asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button runat="server" ID="submitButton" Text="<%$ Resources:WebCharts, EmptyDataStyle_Label7 %>" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
