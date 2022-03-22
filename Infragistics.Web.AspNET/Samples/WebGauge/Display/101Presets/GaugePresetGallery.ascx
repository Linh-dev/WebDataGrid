<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GaugePresetGallery.ascx.cs" Inherits="Samples_WebGauge_Display_101Presets_GaugePresetGallery" %>
<%@ OutputCache Duration="3600" VaryByParam="none" %>
<div class="Gallery">
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="CreateItem">
<ItemTemplate>
<div class="Item">
    <div>
        <a href="presetviewer.aspx?preset=<%# System.Web.HttpUtility.UrlEncode(Eval("Path").ToString()) %>" target="PreviewPane">
        <img alt='<%# Eval("Name") %>' src='<%# Eval("ThumbnailUrl") %>' />
        </a>
    </div>
    <div>
   <asp:Label Visible="true" runat="server" ID="Link" ToolTip='<%# Eval("Path") %>' Text='<%# Eval("Name") %>'></asp:Label>
    </div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>