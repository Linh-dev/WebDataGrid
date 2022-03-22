<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebImageViewer_Display_Horizontal_and_Vertical_Orientation_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .igiv_IGImageAreaContainer { height: 150px!important; }
        .igiv_IGImageAreaContainer_Vert { height: 500px!important; }
        .igiv_IGImageArea_Vert { height: 500px!important; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  	<div style="margin-bottom: 20px;">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />
    </div>
    <div style="overflow: visible;">
        <ig:WebImageViewer ID="WebImageViewer1" runat="server" Header-Text="<%$ Resources:WebImageViewer,Client_Side_Events_Description_3 %>">
		    <ScrollAnimations>
			    <NextItem Alignment="Near" />
		    </ScrollAnimations>
		    <PreviousButton Visible="False" />
		    <NextButton Visible="False" />
		    <Header Text="<%$ Resources:WebImageViewer,Client_Side_Events_Description_3 %>">
		    </Header>
	    </ig:WebImageViewer>
    </div>
</asp:Content>