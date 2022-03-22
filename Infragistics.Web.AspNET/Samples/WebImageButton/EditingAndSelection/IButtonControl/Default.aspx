<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

	<table>
	<tbody>
	<tr>
	<td>
		<div>
			<asp:Label ID="oldPasswordLabel" runat="server" AssociatedControlID="OldPasswordBox"><%= this.GetGlobalResourceObject("WebButton", "OldPasswordText") %></asp:Label>
			<br />
            <asp:TextBox ID="OldPasswordBox" runat="server" TextMode="Password" 
				ValidationGroup="password"></asp:TextBox>
		</div>
		<div>
			<asp:RequiredFieldValidator ID="RequireOldPasswordValidator" runat="server" 
				ControlToValidate="OldPasswordBox" ValidationGroup="password" 
				ErrorMessage="<%$ Resources:WebButton, OldPasswordEmptyMessage  %>"></asp:RequiredFieldValidator>
		</div>
		<div>
			<asp:Label ID="newPasswordLabel" runat="server" AssociatedControlID="NewPasswordBox1"><%= this.GetGlobalResourceObject("WebButton", "EnterNewPasswordText") %></asp:Label>
			<br />
            <asp:TextBox ID="NewPasswordBox1" runat="server" TextMode="Password" 
				ValidationGroup="password"></asp:TextBox>
		</div>
		<div>
			<asp:Label ID="newPasswordLabel2" runat="server" AssociatedControlID="NewPasswordBox2"><%= this.GetGlobalResourceObject("WebButton", "ReenterNewPasswordText")%></asp:Label>
			<br />
            <asp:TextBox ID="NewPasswordBox2" runat="server" TextMode="Password" 
				ValidationGroup="password"></asp:TextBox>
		</div>
		<div>
			<asp:RequiredFieldValidator ID="RequireNewPasswordValidator" runat="server" 
				ControlToValidate="NewPasswordBox1" ValidationGroup="password" 
				ErrorMessage="<%$ Resources:WebButton, NewPasswordEmptyMessage  %>"></asp:RequiredFieldValidator>
			<br />
			<asp:CompareValidator ID="CompareValidator1" runat="server" 
				ControlToCompare="NewPasswordBox1" ControlToValidate="NewPasswordBox2" ErrorMessage="<%$ Resources:WebButton, NewPasswordMismatchMessage  %>" 
				ValidationGroup="password"></asp:CompareValidator>
			<igtxt:WebImageButton ID="WebImageButton1" runat="server" ValidationGroup="password" Text="<%$ Resources:WebButton, ChangePasswordText  %>" AutoSubmit="true">
			</igtxt:WebImageButton>
		</div>
	</td>
	<td valign="top">
		<div>
			<asp:Label ID="AboutMeTextboxLabel" runat="server" AssociatedControlID="AboutMeTextbox"><%= this.GetGlobalResourceObject("WebButton", "AboutMe")%></asp:Label>
			<asp:TextBox ID="AboutMeTextbox" runat="server" TextMode="MultiLine">
			</asp:TextBox>
		</div>
		<div>
			<asp:RequiredFieldValidator ID="RequireAboutMeValidator" runat="server" 
				ControlToValidate="AboutMeTextbox" ValidationGroup="aboutme" 
				ErrorMessage="<%$ Resources:WebButton, AboutMeEmptyMessage  %>"></asp:RequiredFieldValidator>
			<igtxt:WebImageButton ID="WebImageButton2" runat="server" Text="<%$ Resources:WebButton, UpdateDescriptionButtonText  %>" ValidationGroup="aboutme" AutoSubmit="true" >
			</igtxt:WebImageButton>
		</div>
	</td>
	</tr>
	</tbody>
	</table>

	<br />
	<igtxt:WebImageButton ID="WebImageButton3" runat="server" Text="jQuery.com" PostBackUrl="http://www.jquery.com" >
	</igtxt:WebImageButton>
	<%--<igtxt:WebImageButton ID="WebImageButton4" runat="server" Text="Main Samples" PostBackUrl="../../../../" >
	</igtxt:WebImageButton>--%>
	
</asp:Content>

