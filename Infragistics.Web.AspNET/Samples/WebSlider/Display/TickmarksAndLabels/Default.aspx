<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <ig:htmllink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
  <div style="height: 100%; line-height: normal;">
		<br />
		<br />
		<table style="width: 696px;">
			<tr>
				<td valign="top" class="style1">
					<ig:WebSlider ID="WebSlider1" runat="server" Width="85%" Height="80px" EnableSecondaryValue="true"
						ValueAsString="20" SecondaryValueAsString="70" OnFormatTickmarkLabel="WebSlider_FormatTickmarkLabel">
						<ValueLabel FloatCssClass="halfTransparent" FloatHoverCssClass="opaque" />
						<ClientEvents FormatValueLabel="sliderFormatValueLabel" />
					</ig:WebSlider>
					<br />
					<br/>
					<table width="585" cellpadding="3" cellspacing="0" style="margin-top: 5px;">
						<tr>
							<td height="30" bgcolor="#EEEEEE" style="background: #EEEEEE; text-align: center;">
								<div align="left">
									<span style="font-size: 12px; font-weight: bold;">
										<asp:Label ID="GroupHeader1" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_Header_1 %>"></asp:Label>
									</span>
								</div>
							</td>
							<td bgcolor="#EEEEEE">
							</td>
							<td>
							</td>
							<td bgcolor="#EEEEEE">
								<div align="left">
									<span style="font-size: 12px; font-weight: bold;">
										<asp:Label ID="GroupHeader2" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_Header_2 %>"></asp:Label>
									</span>
								</div>
							</td>
							<td bgcolor="#EEEEEE">
							</td>
						</tr>
						<tr>
							<td width="96" style="background: #F9F9F9;">
								<span>
									<asp:Label ID="SubItem11" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_1_Item_1 %>"></asp:Label>
								</span>
							</td>
							<td width="150" height="30" style="background: #F9F9F9;">
								<asp:DropDownList ID="TickmarksLocation" runat="server" AutoPostBack="true">
									<asp:ListItem>None</asp:ListItem>
									<asp:ListItem>Bottom Or Right</asp:ListItem>
									<asp:ListItem>Top Or Left</asp:ListItem>
									<asp:ListItem Selected="True">Both</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td width="10">
								&nbsp;
							</td>
							<td style="background: #F9F9F9;">
								<asp:Label ID="SubItem21" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_2_Item_1 %>"></asp:Label>
							</td>
							<td style="background: #F9F9F9;">
								<asp:DropDownList ID="ValueLabel" runat="server" AutoPostBack="true">
									<asp:ListItem>Hidden</asp:ListItem>
									<asp:ListItem>Left Or Top</asp:ListItem>
									<asp:ListItem>Right Or Bottom</asp:ListItem>
									<asp:ListItem Selected="True">Float Top Or Left</asp:ListItem>
									<asp:ListItem>Float Bottom Or Right</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td style="background: #F9F9F9;">
								<span style="white-space: nowrap;"><asp:Label ID="SubItem12" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_1_Item_2 %>"></asp:Label></span>
							</td>
							<td height="30" style="background: #F9F9F9;">
								<asp:DropDownList ID="TickmarksNumberMajor" runat="server" AutoPostBack="true">
									<asp:ListItem>2</asp:ListItem>
									<asp:ListItem Selected="True">3</asp:ListItem>
									<asp:ListItem>4</asp:ListItem>
									<asp:ListItem>5</asp:ListItem>
									<asp:ListItem>6</asp:ListItem>
								</asp:DropDownList>
								<asp:DropDownList ID="TickmarksNumberMinor" runat="server" AutoPostBack="true">
									<asp:ListItem>0</asp:ListItem>
									<asp:ListItem>1</asp:ListItem>
									<asp:ListItem>2</asp:ListItem>
									<asp:ListItem>3</asp:ListItem>
									<asp:ListItem Selected="True">4</asp:ListItem>
									<asp:ListItem>5</asp:ListItem>
									<asp:ListItem>6</asp:ListItem>
									<asp:ListItem>7</asp:ListItem>
									<asp:ListItem>8</asp:ListItem>
									<asp:ListItem>9</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								&nbsp;
							</td>
							<td style="background: #F9F9F9;">
								<span style="white-space: nowrap;"><asp:Label ID="SubItem22" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_2_Item_2 %>"></asp:Label></span>
							</td>
							<td style="background: #F9F9F9;">
								<asp:DropDownList ID="ValueLabelFormat" runat="server" AutoPostBack="true">
									<asp:ListItem Selected="True">Default</asp:ListItem>
									<asp:ListItem>{0}</asp:ListItem>
									<asp:ListItem>${0}</asp:ListItem>
									<asp:ListItem>{0}%</asp:ListItem>
									<asp:ListItem>{0}:{1}</asp:ListItem>
									<asp:ListItem>{0}..{1}</asp:ListItem>
									<asp:ListItem>${0}:{1}</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td style="background: #F9F9F9;">
								<span style="white-space: nowrap;"><asp:Label ID="SubItem13" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_1_Item_3 %>"></asp:Label></span>
							</td>
							<td height="30" nowrap="nowrap" style="background: #F9F9F9;">
								<asp:DropDownList ID="TickmarkLabelsLocation" runat="server" AutoPostBack="true">
									<asp:ListItem>None</asp:ListItem>
									<asp:ListItem>Bottom Or Right</asp:ListItem>
									<asp:ListItem>Top Or Left</asp:ListItem>
									<asp:ListItem Selected="True">Both</asp:ListItem>
									<asp:ListItem>2 In Margins</asp:ListItem>
								</asp:DropDownList>
								<asp:DropDownList ID="TickmarkLabelsNumber" runat="server" AutoPostBack="true">
									<asp:ListItem>2</asp:ListItem>
									<asp:ListItem Selected="True">3</asp:ListItem>
									<asp:ListItem>4</asp:ListItem>
									<asp:ListItem>5</asp:ListItem>
									<asp:ListItem>6</asp:ListItem>
									<asp:ListItem>7</asp:ListItem>
									<asp:ListItem>8</asp:ListItem>
									<asp:ListItem>9</asp:ListItem>
									<asp:ListItem>10</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td nowrap="nowrap">
								&nbsp;
							</td>
							<td style="background: #F9F9F9;">
								<span style="white-space: nowrap;"><asp:Label ID="SubItem23" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_2_Item_3 %>"></asp:Label></span>
							</td>
							<td style="background: #F9F9F9;">
								<asp:DropDownList ID="ValueLabelClientFormat" runat="server" AutoPostBack="true">
									<asp:ListItem Selected="True">Default</asp:ListItem>
									<asp:ListItem>{0:0}</asp:ListItem>
									<asp:ListItem>{0:0.#}</asp:ListItem>
									<asp:ListItem>{0:0.0}</asp:ListItem>
									<asp:ListItem>{0:0.00}</asp:ListItem>
									<asp:ListItem>{0:0.0#}</asp:ListItem>
									<asp:ListItem>{0:0,#}</asp:ListItem>
									<asp:ListItem>{0:0,0}</asp:ListItem>
									<asp:ListItem>{0:0,##}</asp:ListItem>
									<asp:ListItem>Red/Blue $</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td style="background: #F9F9F9;">
								<span style="white-space: nowrap;"><asp:Label ID="SubItem14" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_1_Item_4 %>"></asp:Label></span>
							</td>
							<td height="30" style="background: #F9F9F9;">
								<asp:DropDownList ID="TickmarkLabelsFormat" runat="server" AutoPostBack="true">
									<asp:ListItem>Default</asp:ListItem>
									<asp:ListItem Selected="True">{0:0.#}</asp:ListItem>
									<asp:ListItem>{0:0}</asp:ListItem>
									<asp:ListItem>{0:#.0}</asp:ListItem>
									<asp:ListItem>{0:n}</asp:ListItem>
									<asp:ListItem>{0:0.#}%</asp:ListItem>
									<asp:ListItem>{0:c}</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								&nbsp;
							</td>
							<td colspan="2" bgcolor="#F9F9F9">
								<asp:CheckBox ID="FormatTopLabels" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_2_Item_4 %>"
									Style="white-space: nowrap;" AutoPostBack="True" Checked="true" />
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="5">
							</td>
						</tr>
						<tr>
							<td bgcolor="#EEEEEE">
								<div align="left">
									<span style="font-size: 12px; font-weight: bold;"><asp:Label ID="GroupHeader3" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_Header_3 %>"></asp:Label></span>
								</div>
							</td>
							<td height="30" bgcolor="#EEEEEE">
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td bgcolor="#F9F9F9">
								<span><asp:Label ID="SubItem31" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_3_Item_1 %>"></asp:Label></span>
							</td>
							<td height="30" bgcolor="#F9F9F9">
								<asp:DropDownList ID="Alignment" runat="server" AutoPostBack="true">
									<asp:ListItem>Center</asp:ListItem>
									<asp:ListItem Selected="True">Track Center</asp:ListItem>
									<asp:ListItem>Top Or Left</asp:ListItem>
									<asp:ListItem>Bottom Or Right</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td bgcolor="#F9F9F9">
								<span style="white-space: nowrap;"><asp:Label ID="SubItem32" runat="server" Text="<%$ Resources:WebSlider, Tick_Group_3_Item_2 %>"></asp:Label></span>
							</td>
							<td height="30" bgcolor="#F9F9F9">
								<asp:DropDownList ID="TrackFillMode" runat="server" AutoPostBack="true">
									<asp:ListItem>None</asp:ListItem>
									<asp:ListItem>Main Value</asp:ListItem>
									<asp:ListItem>Range</asp:ListItem>
									<asp:ListItem Selected="True">All</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

    <script type="text/javascript">
        function sliderFormatValueLabel(slider, evtArgs) {
            var elem = document.getElementById('<%=ValueLabelClientFormat.ClientID %>');
            if (!elem)
                return;
            var index = elem.selectedIndex;
            if (!index || index == 0)
                return;
            var format = slider.get_valueLabelFormat();
            var range = format.indexOf('{1}') >= 0;
            //----------------
            // assume "0.#"
            var minDec = 0, maxDec = 1, sep = '.';
            var val1 = evtArgs.get_value(), val2 = evtArgs.get_otherValue();
            if (index < 9) {
                //----------------
                // "0"
                if (index == 1)
                    maxDec = 0;
                //----------------
                // "0.0"
                if (index == 3)
                    minDec = 1;
                //----------------
                // "0.00"
                if (index == 4)
                    minDec = maxDec = 2;
                //----------------
                // "0.0#"
                if (index == 5) {
                    minDec = 1;
                    maxDec = 2;
                }
                //----------------
                // "0,#"
                if (index >= 6)
                    sep = ',';
                //----------------
                // "0,0"
                if (index == 7)
                    minDec = 1;
                //----------------
                // "0,0"
                if (index == 8)
                    maxDec = 2;
                format = format.replace('{0}', sliderFormatValue(val1, minDec, maxDec, sep));
                if (range)
                    format = format.replace('{1}', sliderFormatValue(val2, minDec, maxDec, sep));
                evtArgs.set_label(format);
                return;
            }
            format = sliderFormatValue(val1, 1, 1, '.');
            var clr = (!range && evtArgs.get_isSecondary()) ? 'blue' : 'red';
            var html = '<span style="color:' + clr + ';font-weight:bold">$</span>' + format.substring(0, format.length - 1) + '<span style="font-size:8px">' + format.substring(format.length - 1) + '</span>';
            if (range) {
                format = sliderFormatValue(val2, 1, 1, '.');
                html += ':<span style="color:blue;font-weight:bold">$</span>' + format.substring(0, format.length - 1) + '<span style="font-size:8px">' + format.substring(format.length - 1) + '</span>';
            }
            evtArgs.set_label(html);
        }
        function sliderFormatValue(val, minDec, maxDec, sep) {
            if (val == 0) {
                if (minDec == 0)
                    return '0';
                val = '0' + sep;
                while (minDec-- > 0)
                    val += '0';
                return val;
            }
            var i = maxDec;
            while (i-- > 0)
                val *= 10;
            val = '' + Math.round(val);
            if (maxDec == 0)
                return val;
            var len = val.length;
            val = val.substring(0, len - maxDec) + sep + val.substring(len - maxDec);
            //--------------------
            // remove trailing zeros
            while (maxDec-- > minDec) {
                if (val.charAt(len--) != '0')
                    break;
                val = val.substring(0, len);
            }
            //--------------------
            // remove trailing separator
            if (minDec == 0 && val.charAt(val.length - 1) == sep)
                val = val.substring(0, val.length - 1);
            return val;
        }
	</script>

</asp:Content>