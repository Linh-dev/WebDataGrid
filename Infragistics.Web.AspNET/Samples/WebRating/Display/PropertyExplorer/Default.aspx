<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
 	<ig:WebDialogWindow runat="server" ID="WebDialogWindow1" CssClass="igrating_PositionRelative" Width="600px" Height="250px"
		Modal="false" WindowState="Normal" Moveable="false" MaintainLocationOnScroll="false"
		Top="100px" Left="20px">
		<Header CloseBox-Visible="false">
			<CloseBox Visible="False"></CloseBox>
		</Header>
        <ContentPane EnableRelativeLayout="true">
			<Template>
				<div class="OptionPanel">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always">
						<ContentTemplate>
							<div id="container">
								<table id="propertyList" style="width: 100%;" cellspacing="0" border="0">
									<tr>
										<td style="background-color: White; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
											background-repeat: no-repeat; border-right: 1px solid #89bd37;">
											<div style="width: 300px;">
												<div style="width: 100px; padding-top: 50px; margin: 0 auto;">
													<ig:WebRating ID="WebRating1"  runat="server">
													</ig:WebRating>
												</div>
											</div>
										</td>
										<td class="propertyPanel">
											<div>
												<table style="width: 100%;">
													<tr class="itemRow">
														<td class="textAlignR">
															<span>AutoPostbackFlag.Rated:</span>
														</td>
														<td>
															<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
																<asp:ListItem Text="Off" Selected="True"></asp:ListItem>
																<asp:ListItem Text="Async"></asp:ListItem>
																<asp:ListItem Text="On"></asp:ListItem>
															</asp:DropDownList>
															<br />
														</td>
														<td>
														</td>
													</tr>
													<tr class="altRow">
														<td class="textAlignR">
															<span>RatingPrecision:</span>
														</td>
														<td>
															<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
																<asp:ListItem Text="Whole" Selected="True"></asp:ListItem>
																<asp:ListItem Text="Exact"></asp:ListItem>
																<asp:ListItem Text="Half"></asp:ListItem>
															</asp:DropDownList>
															<br />
														</td>
													</tr>
													<tr class="itemRow">
														<td class="textAlignR">
															<span>EnableContinuousSelection:</span>
														</td>
														<td>
															<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox2_CheckedChanged"
																Checked="true" />
															<br />
														</td>
														<td>
														</td>
													</tr>
													<tr class="altRow">
														<td class="textAlignR">
															<span>EnableShowSelectionOnHover:</span>
														</td>
														<td>
															<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged"
																Checked="true" />
															<br />
														</td>
													</tr>
													<tr class="itemRow">
														<td class="textAlignR">
															<%=this.GetGlobalResourceObject("WebRating","PropertyExplorer_Horizontal") %>
														</td>
														<td>
															<asp:RadioButton ID="RadioButton1" runat="server" GroupName="WebRatingOrientation"
																OnCheckedChanged="RadioButton1_CheckedChanged" Checked="true" AutoPostBack="true" />
															<br />
														</td>
													</tr>
													<tr class="altRow">
														<td class="textAlignR">
															<%=this.GetGlobalResourceObject("WebRating","PropertyExplorer_Vertical") %>
														</td>
														<td>
															<asp:RadioButton ID="RadioButton2" runat="server" GroupName="WebRatingOrientation"
																OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true" />
											</div>
										</td>
									</tr>
								</table>
							</div>
							</td> </table>
						</ContentTemplate>
					</asp:UpdatePanel>
				</div>
			</Template>
		</ContentPane>
	</ig:WebDialogWindow> 
</asp:Content>
