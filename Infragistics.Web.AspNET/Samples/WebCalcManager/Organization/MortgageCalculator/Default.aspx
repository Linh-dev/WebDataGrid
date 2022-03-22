<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table1" cellspacing="5" cellpadding="0" width="100%" border="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table id="Table2" cellspacing="5" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td valign="top" width="100%">
                                    <div style="float: left">
                                        <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="400px" Width="440px" AutoGenerateColumns="false">
                                            <EmptyRowsTemplate>
                                                <asp:Literal ID="EmptyRowsText" runat="server" Text="<%$ Resources:WebCalcManager, Mortgage_BeginMessage %>" />
                                            </EmptyRowsTemplate>
                                            <Columns>
                                                <ig:BoundDataField DataFieldName="PaymentDate" Key="PaymentDate">
                                                    <Header Text="<%$ Resources:WebCalcManager, Mortgage_PaymentDate %>" />
                                                </ig:BoundDataField>
                                                <ig:BoundDataField DataFieldName="Interest" Key="Interest" DataFormatString="{0:c}">
                                                    <Header Text="<%$ Resources:WebCalcManager, Mortgage_Interest %>" />
                                                </ig:BoundDataField>
                                                <ig:BoundDataField DataFieldName="PrincipalPayment" Key="PrincipalPayment" DataFormatString="{0:c}">
                                                    <Header Text="<%$ Resources:WebCalcManager, Mortgage_PrincipalPayment %>" />
                                                </ig:BoundDataField>
                                                <ig:BoundDataField DataFieldName="PrincipalRemaining" Key="PrincipalRemaining" DataFormatString="{0:c}">
                                                    <Header Text="<%$ Resources:WebCalcManager, Mortgage_PrincipalRemaining %>" />
                                                </ig:BoundDataField>
                                            </Columns>
                                        </ig:WebDataGrid>
                                    </div>
                                </td>
                                <td valign="top">
                                    <table id="Table3" cellspacing="5" cellpadding="0" border="0">
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="<%$ Resources:WebCalcManager, Mortgage_Label1Text %>" />
                                            </td>
                                            <td>
                                                <ig:WebCurrencyEditor ID="wcePrincipal" runat="server" DataMode="Decimal" DisplayFactor="1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="<%$ Resources:WebCalcManager, Mortgage_Label2Text %>" />
                                            </td>
                                            <td>
                                                <ig:WebPercentEditor ID="wpeInterestRate" runat="server" DisplayFactor="1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="<%$ Resources:WebCalcManager, Mortgage_Label3Text %>" />
                                            </td>
                                            <td>
                                                <ig:WebNumericEditor ID="wneTerm" runat="server" DataMode="Int" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="<%$ Resources:WebCalcManager, Mortgage_Label4Text %>" />
                                            </td>
                                            <td>
                                                <ig:WebNumericEditor ID="wnePayments" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label5" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="<%$ Resources:WebCalcManager, Mortgage_Label5Text %>" />
                                            </td>
                                            <td>
                                                <ig:WebCurrencyEditor ID="wceCalcPayment" runat="server" ReadOnly="True" DataMode="Decimal" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div style="margin-left: 50px">
                                                    <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCalcManager, Mortgage_Button1Text %>"
                                                        Font-Names="Verdana" Font-Size="8pt" Width="195px" OnClick="Button1_Click"></asp:Button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div style="margin-left: 50px">
                                                    <asp:Button ID="Button2" runat="server" Text="<%$ Resources:WebCalcManager, Mortgage_Button2Text %>"
                                                        Enabled="False" Font-Names="Verdana" Font-Size="8pt" Width="195px" OnClick="Button2_Click">
                                                    </asp:Button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div style="margin-left: 50px">
                                                    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                        <ProgressTemplate>
                                                            <%= this.GetGlobalResourceObject("WebCalcManager","Mortgage_Calculating") %>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        &nbsp; </td>
                    </ContentTemplate>
                </asp:UpdatePanel>
        </tr>
    </table>
    <igcalc:UltraWebCalcManager ID="UltraWebCalcManager1" runat="server">
    </igcalc:UltraWebCalcManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
