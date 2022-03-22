<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        fieldset
        {
            margin: 5px;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #CCCCCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <fieldset>
            <legend><%= this.GetGlobalResourceObject("InfragisticsExcel", "SaveLoad_CreateExcelText") %></legend>
            <span><%= this.GetGlobalResourceObject("InfragisticsExcel", "SaveLoad_ChooseFileText") %></span>
            <asp:DropDownList runat="server" ID="ddlFormats">
                <asp:ListItem Text="<%$ Resources:InfragisticsExcel, Excel_2007%>" Value="xlsx" />
                <asp:ListItem Text="<%$ Resources:InfragisticsExcel, Excel_2007_Template%>" Value="xltx" />
                <asp:ListItem Text="<%$ Resources:InfragisticsExcel, Excel_2007_Macro_Enabled%>" Value="xlsm" />
                <asp:ListItem Text="<%$ Resources:InfragisticsExcel, Excel_2007_Macro_Enabled_Template%>" Value="xltm" />
                <asp:ListItem Text="<%$ Resources:InfragisticsExcel, Excel_97_To_2003%>" Value="xls" />
                <asp:ListItem Text="<%$ Resources:InfragisticsExcel, Excel_97_To_2003_Template%>" Value="xlt" />
            </asp:DropDownList>
            <asp:Button runat="server" ID="btnSave" Text="<%$ Resources:InfragisticsExcel, Save%>" OnClick="btnSave_Click"/>
        </fieldset>
    </div>
    <div style="margin-top:30px;">
        <fieldset>
            <legend><%= this.GetGlobalResourceObject("InfragisticsExcel", "SaveLoad_AddWorksheetText") %></legend>
            <asp:FileUpload runat="server" ID="fuExistingWorkbook" />
            <asp:Button runat="server" ID="btnLoadModifySave" Text="<%$ Resources:InfragisticsExcel, Load_Modify_Save%>" 
                OnClick="btnLoadModifySave_Click" ValidationGroup="load" />
            <asp:RegularExpressionValidator ID="fileExtensionValidator" runat="server" 
                ControlToValidate="fuExistingWorkbook" ValidationGroup="load"
                ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.xlsx|.XLS|.XLSX|.xlsm|.XLSM|xlt|XLT|xltm|XLTM)$">
                </asp:RegularExpressionValidator>
        </fieldset>
    </div>
</asp:Content>