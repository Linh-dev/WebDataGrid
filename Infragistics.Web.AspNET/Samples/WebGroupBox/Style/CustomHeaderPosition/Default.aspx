<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebGroupBox_Style_Custom_Header_Position_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .groupBox
        {
            border-style: dotted;
            border-color: Black;
            border-width: 1px;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="float: left;">
        <igmisc:WebGroupBox ID="WebGroupBox1" runat="server" Width="400" >
            <Template>
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
            </Template>
        </igmisc:WebGroupBox>
    </div>
    <div style="float: left; padding: 5px;">
        <div style="float: left;">
            <%=this.GetGlobalResourceObject("WebGroupBox", "GroupBox_HeaderPosition")%>
        </div>
        <div style="float: left; padding-left: 10px;">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />
        </div>
    </div>
</asp:Content>
