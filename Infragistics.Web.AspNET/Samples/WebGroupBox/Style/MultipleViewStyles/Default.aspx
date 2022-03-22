<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebGroupBox_Style_Multiple_ViewStyles_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .groupBox
        {
            background-color: Yellow;
            border-style: dotted;
            border-color: Black;
            border-width: 1px;
            padding: 5px;
        }
    </style>
	<link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="OptionPanel" style="width: 370px;">
		<div id="Icon2" style="position: relative; float: left; padding-right: 10px; margin-bottom: 10px;">
			<img src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/Style/ApplicationStyling/StyleSet.png" alt="Style Set" title="Style Set" width="60" height="61" />
        </div>
		<div id="DropDown" style="position: relative;float: left; padding-top: 20px; margin-bottom: 10px;">
			<asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:WebGroupBox, Styling_Theme_SelectATheme %>" />
			<asp:DropDownList ID="DDList1" runat="server" AutoPostBack="True" CssClass="CSSform" >
					<asp:ListItem Selected="True">Appletini</asp:ListItem>
					<asp:ListItem>Caribbean</asp:ListItem>
					<asp:ListItem>Claymation</asp:ListItem>	
					<asp:ListItem>ElectricBlue</asp:ListItem>
					<asp:ListItem>Harvest</asp:ListItem>
					<asp:ListItem>Nautilus</asp:ListItem>
					<asp:ListItem>Pear</asp:ListItem>
					<asp:ListItem>RedPlanet</asp:ListItem>
					<asp:ListItem>RubberBlack</asp:ListItem>
					<asp:ListItem>Trendy</asp:ListItem>
			</asp:DropDownList>
		</div>
        <div style="clear: both;"></div>
	</div>
    <igmisc:WebGroupBox ID="WebGroupBox1" runat="server" Width="400" Height="180">
        <Template>
            <div style="padding: 5px">
                <p>
                    <%=this.GetGlobalResourceObject("WebGroupBox", "GroupBox_TemplateItem")%> 1
                </p>
                <p>
                    <%=this.GetGlobalResourceObject("WebGroupBox", "GroupBox_TemplateItem")%> 2
                </p>
                <p>
                    <%=this.GetGlobalResourceObject("WebGroupBox", "GroupBox_TemplateItem")%> 3
                </p>
                <p>
                    <%=this.GetGlobalResourceObject("WebGroupBox", "GroupBox_TemplateItem")%> 4
                </p>
                <p>
                    <%=this.GetGlobalResourceObject("WebGroupBox", "GroupBox_TemplateItem")%> 5
                </p>
                <p>
                    <%=this.GetGlobalResourceObject("WebGroupBox", "GroupBox_TemplateItem")%> 6
                </p>
            </div>
        </Template>
    </igmisc:WebGroupBox>
</asp:Content>
