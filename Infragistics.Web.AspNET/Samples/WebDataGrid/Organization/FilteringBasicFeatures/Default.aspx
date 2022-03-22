<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Filtering_Basic_Features_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div1" class="wgDataBind">
        <div id="Div2">
            <div id="headerContainer" class="ControlPanelHeader">
                <img alt="Config" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
                <%= this.GetGlobalResourceObject("WebDataGrid","Filtering_Basic_HeaderTitle") %></div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEvent">
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebDataGrid","Filtering_Basic_ConfigSettings_Label1") %></span>
                    <asp:RadioButton ID="AlignmentTop" GroupName="Alignment" Text="<%$ Resources:WebDataGrid, Filtering_Basic_ConfigSettings_Value1 %>"
                        AutoPostBack="true" Checked="true" runat="server" OnCheckedChanged="AlignmentTop_CheckedChanged" />
                    <asp:RadioButton ID="AlignmentBottom" GroupName="Alignment" Text="<%$ Resources:WebDataGrid, Filtering_Basic_ConfigSettings_Value2 %>"
                        AutoPostBack="true" runat="server" OnCheckedChanged="AlignmentBottom_CheckedChanged" />
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebDataGrid","Filtering_Basic_ConfigSettings_Label2") %></span>
                    <asp:CheckBox ID="Visibility" AutoPostBack="true" Checked="true" runat="server" OnCheckedChanged="Visibility_CheckedChanged" />
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebDataGrid","Filtering_Basic_ConfigSettings_Label3") %></span>
                    <asp:CheckBox ID="Animation" AutoPostBack="true" Checked="true" runat="server" OnCheckedChanged="Animation_CheckedChanged" />
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebDataGrid","Filtering_Basic_ConfigSettings_Label4") %></span>
                    <asp:DropDownList ID="AnimationType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="AnimationType_SelectedIndexChanged"
                        CssClass="CSSform">
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, Filtering_AnimationType_Bounce %>"
                            Value="Bounce " />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, Filtering_AnimationType_EaseIn %>"
                            Value="EaseIn" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, Filtering_AnimationType_EaseInOut %>"
                            Value="EaseInOut" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, Filtering_AnimationType_EaseOut %>"
                            Value="EaseOut" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, Filtering_AnimationType_Linear %>"
                            Value="Linear" />
                    </asp:DropDownList>
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebDataGrid","Filtering_Basic_ConfigSettings_Label5") %></span>
                    <asp:DropDownList ID="AnimationDuration" runat="server" AutoPostBack="true" OnSelectedIndexChanged="AnimationDuration_SelectedIndexChanged"
                        CssClass="CSSform">
                        <asp:ListItem Text="1000" Value="1000" />
                        <asp:ListItem Text="2000" Value="2000" />
                        <asp:ListItem Text="3000" Value="3000" />
                        <asp:ListItem Text="4000" Value="4000" />
                        <asp:ListItem Text="5000" Value="5000" />
                    </asp:DropDownList>
                </div>
            </div>
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
                    Width="100%" Height="425" DataKeyFields="CustomerID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Address" Key="Address">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="City" Key="City">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Country" Key="Country">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                        </ig:BoundDataField>
                    </Columns>
                    <EditorProviders>
                        <ig:TextBoxProvider ID="TextBoxProvider" />
                    </EditorProviders>
                    <Behaviors>
                        <ig:Filtering Alignment="Top" Visibility="Visible" Enabled="true" AnimationEnabled="true" />
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>' OnInit="DataSourceInit"
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
