<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="gaugeContainer">
                    <iggauge:UltraGauge runat="server" ID="UltraGauge1">
                        <DeploymentScenario FilePath="/SamplesBrowser/Temp/GaugeImages" ImageURL="/SamplesBrowser/Temp/GaugeImages/Gauge_#SEQNUM(100).#EXT" />
                    </iggauge:UltraGauge>
                    <div class="layerChooser">
                        <h5>
                            <asp:Label ID="Label3" runat="server" Text="<%$Resources:WebGauge, Combination_Gauge_Description_3 %>"></asp:Label></h5>
                        <asp:CheckBoxList runat="Server" ID="CheckBoxList1" OnSelectedIndexChanged="checkChanged"
                            Width="120px" AutoPostBack="true">
                            <asp:ListItem Value="Radial" Text="<%$Resources:WebGauge, Combination_Gauge_Type_1 %>"
                                Selected="true" />
                            <asp:ListItem Value="Linear" Text="<%$Resources:WebGauge, Combination_Gauge_Type_2 %>"
                                Selected="true" />
                            <asp:ListItem Value="Digital" Text="<%$Resources:WebGauge, Combination_Gauge_Type_3 %>"
                                Selected="true" />
                        </asp:CheckBoxList>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
