<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="width: 540px; height: 500px; padding-top: 30px; padding-left: 1px;">
        <div style="position:relative;z-index:10;">
		<ig:WebDataMenu runat="server" ID="WebDataMenu" Width="458px" EnableScrolling="false" StyleSetName="Default" CloseMenuOnClick="false">
			<GroupSettings Orientation="Horizontal" ExpandDirection="Down"/>
			<Items>
				<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataBooks %>" >
					<Items>
						<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataASPNet %>" />
						<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataSilverlight %>" />
						<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataInfragisticsTimes %>" />
						<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataIGLife %>" />
					</Items>
				</ig:DataMenuItem>
				<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataPages %>">
					<Items>
						<ig:DataMenuItem TemplateId="PagesTemplate" />
						<ig:DataMenuItem TemplateId="CheckBoxTemplate" />				
					</Items>
				</ig:DataMenuItem>
				<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataHelp %>">
					<Items>
						<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataIndex %>" />
						<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataSearch %>" />
						<ig:DataMenuItem Text="<%$ Resources:WebDataMenu, DataAbout %>" />
					</Items>
				</ig:DataMenuItem>
			</Items>
            <Templates>
                <ig:ItemTemplate ID="ItemTemplate1" runat="server" TemplateID="CheckBoxTemplate">
                    <Template>
                        <div>
                            <asp:CheckBox ID="MenuItemCheckBox" Text="<%$ Resources:WebDataMenu, SelectAllPages %>" runat="server" />
                        </div>
                    </Template>
                </ig:ItemTemplate>
                <ig:ItemTemplate ID="PagesTemplate" runat="server" TemplateID="PagesTemplate">
                    <Template>
                    <table>
                    <tr>
					<td><a class="pg1" href="javascript:;" onclick="ChangePage(1);" />  <span class="alt" /></a></td>
					<td><a class="pg2" href="javascript:;" onclick="ChangePage(2);" ><span class="alt" /></a></td>
					<td><a class="pg3" href="javascript:;" onclick="ChangePage(3);" ><span class="alt" /></a></td>
					<td><a class="pg4" href="javascript:;" onclick="ChangePage(4);" ><span class="alt" /></a></td>
                    </tr>
                    <tr>
					<td><a class="pg5" href="javascript:;" onclick="ChangePage(5);" ><span class="alt" /></a></td>
					<td><a class="pg6" href="javascript:;" onclick="ChangePage(6);" ><span class="alt" /></a></td>
					<td><a class="pg7" href="javascript:;" onclick="ChangePage(7);" ><span class="alt" /></a></td>
					<td><a class="pg8" href="javascript:;" onclick="ChangePage(8);" ><span class="alt" /></a></td>
                    </tr>
                    </table>
                    </Template>
                </ig:ItemTemplate>                
                </Templates>  
            </ig:WebDataMenu>
        </div>
<table class="main-content">
	<tr>
	    <td>
	        <div style="background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebDataMenu/Display/Templates/wdm_TemplatesBG.png); background-repeat: no-repeat; height: 374px;">
		        <div class="prevArrow">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebDataMenu/Display/Templates/wdm_TemplatesPrev.png" onclick="MoveToPreviousPage();" />
	            </div>
		        <div class="pageHold">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebDataMenu/Display/Templates/wdm_PageHold.png"/>
		        </div>
		        <div class="nextArrow">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebDataMenu/Display/Templates/wdm_TemplatesNext.png" onclick="MoveToNextPage();" />
		        </div>
	        </div>
	    </td>
	</tr>
	<tr>
	<td>
		<div class="footerTemplate">
			<p class="currentPage">
                <%= this.GetGlobalResourceObject("WebDataMenu","TemplatePage") %> 
                <span id="CurrentPageXXX">1</span>
			</p>
		</div>
	</td>
	</tr>
</table>
</div>
    
<script type="text/javascript">

    function ChangePage(pageNumber) {

        var currentPage = $get("CurrentPageXXX");
        if (currentPage != null) {
            currentPage.innerHTML = pageNumber;
        }

        return false;
    }

    function MoveToPreviousPage() {
        var currentPage = $get("CurrentPageXXX");
        if (currentPage != null) {
            var currentPageNumber = currentPage.innerHTML;
            if (currentPageNumber > 1) {
                currentPage.innerHTML = --currentPageNumber;
            }
        }
    }

    function MoveToNextPage() {
        var currentPage = $get("CurrentPageXXX");
        if (currentPage != null) {
            var currentPageNumber = currentPage.innerHTML;
            if (currentPageNumber < 8) {
                currentPage.innerHTML = ++currentPageNumber;
            }
        }
    }
        
</script>
</asp:Content>
