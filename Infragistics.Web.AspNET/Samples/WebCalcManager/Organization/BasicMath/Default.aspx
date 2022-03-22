<%@  Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="Samples_WebCalcManager_Organization_Basic_Math_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .igEdit
        {
            width:130px;
        }
        .igReadonly
        {
            background-image:none;
            background-color:lightgrey;
        }
    </style>
    <div style="float: left;">
        <div style="clear: both; margin-bottom: 10px;">
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCalcManager, BasicMath_DesignTime %>"></asp:Label>
        </div>
        <div style="width: 150px; float: left;">
            <ig:WebNumericEditor ID="WebNumericEdit1" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit2" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit3" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit4" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit5" runat="server" ReadOnly="True" CssClass="igEdit igReadonly">
            </ig:WebNumericEditor>
        </div>
        <div style="width: 150px; float: left;">
            <ig:WebNumericEditor ID="WebNumericEdit6" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit7" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit8" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit9" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit10" runat="server" ReadOnly="True" CssClass="igEdit igReadonly">
            </ig:WebNumericEditor>
        </div>
    </div>
    <div style="float: left;">
        <div style="clear: both; margin-bottom: 10px;">
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebCalcManager, BasicMath_RunTime %>"></asp:Label>
        </div>
        <div style="width: 150px; float: left;">
            <ig:WebNumericEditor ID="WebNumericEdit11" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit12" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit13" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit14" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit15" runat="server" ReadOnly="True" CssClass="igEdit igReadonly">
            </ig:WebNumericEditor>
        </div>
        <div style="width: 150px; float: left;">
            <ig:WebNumericEditor ID="WebNumericEdit16" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit17" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit18" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit19" runat="server" CssClass="igEdit">
            </ig:WebNumericEditor>
            <ig:WebNumericEditor ID="WebNumericEdit20" runat="server" ReadOnly="True" CssClass="igEdit igReadonly">
            </ig:WebNumericEditor>
        </div>
    </div>
    <div style="float: left; clear: left; padding-left: 70px; margin-top: 20px;">
        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebCalcManager, BasicMath_GrandTotal %>"></asp:Label>
        <ig:WebNumericEditor ID="WebNumericEdit21" runat="server" ReadOnly="True" CssClass="igEdit igReadonly">
        </ig:WebNumericEditor>
    </div>
    <div style="float: left; clear: right; margin-left: 230px; margin-top: 20px;">
        <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCalcManager, BasicMath_Calculate %>">
        </asp:Button>
    </div>
    <igcalc:ultrawebcalcmanager id="UltraWebCalcManager1" runat="server">
        <CalcSettingsCollection>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit1"></igcalc:CalcSettings>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit2"></igcalc:CalcSettings>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit3"></igcalc:CalcSettings>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit4"></igcalc:CalcSettings>
            <igcalc:CalcSettings Formula="[//WebNumericEdit1] +  [//WebNumericEdit2] +  [//WebNumericEdit3] +  [//WebNumericEdit4]"
                PropertyName="Value" Key="WebNumericEdit5"></igcalc:CalcSettings>
            <igcalc:CalcSettings Formula="sum( [//WebNumericEdit6] , [//WebNumericEdit7] , [//WebNumericEdit8] , [//WebNumericEdit9] )"
                PropertyName="Value" Key="WebNumericEdit10"></igcalc:CalcSettings>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit9"></igcalc:CalcSettings>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit8"></igcalc:CalcSettings>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit7"></igcalc:CalcSettings>
            <igcalc:CalcSettings PropertyName="Value" Key="WebNumericEdit6"></igcalc:CalcSettings>
        </CalcSettingsCollection>
    </igcalc:ultrawebcalcmanager>
</asp:Content>
