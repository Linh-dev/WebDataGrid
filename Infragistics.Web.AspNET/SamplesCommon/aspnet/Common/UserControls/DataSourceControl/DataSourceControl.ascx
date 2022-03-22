<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DataSourceControl.ascx.cs" Inherits="WebFeatureBrowser_ControlPanel_DataSourceControl" %>
<asp:Table runat="server" ID="Background" BackImageUrl="images/DatabaseBG.png" Width="675px" Height="96px">
    <asp:TableRow runat="server">
        <asp:TableCell runat="server" Width="80px">
        </asp:TableCell>
        <asp:TableCell runat="server">
        	<div id="Div1" > 
			    <table> 
			        <tr>
			            <td>&nbsp;&nbsp;<b><%= this.GetGlobalResourceObject("Strings","DataBindingCaption")%> </b>&nbsp;&nbsp;</td>
			            <td>
			                <asp:DropDownList ID="DataSourceList" runat="server" AutoPostBack="True" 
			                    DataValueField="Value" DataTextField="Description" 
		    			        OnSelectedIndexChanged="DataSouce_SelectedIndexChanged" />
		    			</td>
	    		    </tr> 
    			</table>  
			</div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
