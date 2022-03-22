<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />

	 <style type="text/css">
		.restoreInput input
		{
			 border: 0px none !important;
			 background: transparent !important;
			 outline: none !important;
		}
		input
		{
			overflow: visible !important;
			font-size: 12px !important;
		}
	 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="padding: 20px; height:420px; width:550px;">
        <div class="css_form">
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
                <tr>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelTheme") %></label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ThemeList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ThemeList_SelectedIndexChanged">
                            <asp:ListItem Value="Default" Text="Default" />
                            <asp:ListItem Value="LucidDream" Text="LucidDream" />
                            <asp:ListItem Value="Caribbean" Text="Caribbean" />
                            <asp:ListItem Value="Claymation" Text="Claymation" />
                            <asp:ListItem Value="ElectricBlue" Text="ElectricBlue" />
                            <asp:ListItem Value="Harvest" Text="Harvest" />
                            <asp:ListItem Value="Nautilus" Text="Nautilus" />
                            <asp:ListItem Value="Office2007Black" Text="Office2007Black" />
                            <asp:ListItem Value="Office2007Blue" Text="Office2007Blue" />
                            <asp:ListItem Value="Office2007Silver" Text="Office2007Silver" />
                            <asp:ListItem Value="Appletini" Text="Appletini" />
                            <asp:ListItem Value="Pear" Text="Pear" />
                            <asp:ListItem Value="RedPlanet" Text="RedPlanet" />
                            <asp:ListItem Value="RubberBlack" Text="RubberBlack" />
                            <asp:ListItem Value="Trendy" Text="Trendy" />
                            <asp:ListItem Value="Windows7" Text="Windows7" />
                                <asp:ListItem Value="Office2010Blue" Text="Office2010Blue" />
                                        
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelSingle") %></label>
                    </td>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelDateTime") %></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ig:WebTextEditor ID="SingleLineEditor" Height="20px" runat="server" StyleSetName="Default" />
                    </td>
                    <td class="restoreInput">
                        <ig:WebDateTimeEditor ID="BasicDateTimeEditor" Width="180px" Height="20px" runat="server" StyleSetName="Default">
									<Buttons SpinButtonsDisplay="OnRight"></Buttons>
								</ig:WebDateTimeEditor>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelNumeric") %></label>
                    </td>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelCurrency") %></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ig:WebNumericEditor ID="BasicNumericEditor" Height="20px" runat="server" StyleSetName="Default"  />
                    </td>
                    <td class="restoreInput">
                        <ig:WebCurrencyEditor ID="BasicCurrencyEditor" Width="180px" Height="20px" runat="server" StyleSetName="Default">
									<Buttons SpinButtonsDisplay="OnRight"></Buttons>
								</ig:WebCurrencyEditor>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelPercent") %></label>
                    </td>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelPhone") %></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ig:WebPercentEditor ID="BasicPercentEditor" Height="20px" runat="server" StyleSetName="Default" />
                    </td>
                    <td>
                        <ig:WebMaskEditor ID="PhoneNumberWithExtEditor" Height="20px" runat="server" InputMask="<%$ Resources:WebEditors, WebEditorMaskBasicPhoneExtMask %>"
                            DisplayMode="Mask" StyleSetName="Default" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebEditorStylesLabelMulti") %></label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <ig:WebTextEditor ID="MultiLineEditor" runat="server" TextMode="MultiLine" Width="300px"
                            Height="80px" StyleSetName="Default" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
