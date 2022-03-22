<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <ig:WebTab ID="WebTab1" runat="server" Width="500px" SelectedIndex="0">
        <Tabs>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Name %>">
                <Template>
                    <br />
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_FirstName %>"></asp:Label>:
                        <ig:WebTextEditor ID="WebTextEditor1" runat="server" CssClass="tabsInput" Width="150px">
                        </ig:WebTextEditor>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_LastName %>"></asp:Label>:
                        <ig:WebTextEditor ID="WebTextEditor2" runat="server" Width="150px" CssClass="tabsInput"
                            Height="19px">
                        </ig:WebTextEditor>
                    </div>
                </Template>
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Address %>">
                <Template>
                    <br />
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Street %>"></asp:Label>:
                        <ig:WebTextEditor ID="WebTextEditor3" runat="server" CssClass="tabsInput" Width="150px">
                        </ig:WebTextEditor>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_City %>"></asp:Label>:
                        <ig:WebTextEditor ID="WebTextEditor4" runat="server" Width="150px" CssClass="tabsInput"
                            Height="19px">
                        </ig:WebTextEditor>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_State %>"></asp:Label>:
                        <ig:WebTextEditor ID="WebTextEditor5" runat="server" Width="150px" CssClass="tabsInput"
                            Height="19px">
                        </ig:WebTextEditor>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Zipcode %>"></asp:Label>:
                        <ig:WebNumericEditor ID="WebNumericEditor1" MaxLength="5" runat="server" Width="150px"
                            CssClass="tabsInput" Height="19px">
                        </ig:WebNumericEditor>
                    </div>
                </Template>
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Phone %>">
                <Template>
                    <br />
                    <div>
                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Home %>"></asp:Label>:
                        <ig:WebMaskEditor ID="WebMaskEditor1" runat="server" CssClass="tabsInput" Width="150px"
                            InputMask="(000) 000-0000" DisplayMode="Mask">
                        </ig:WebMaskEditor>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Cell %>"></asp:Label>:
                        <ig:WebMaskEditor ID="WebMaskEditor2" runat="server" Width="150px" CssClass="tabsInput"
                            Height="19px" InputMask="(000) 000-0000" DisplayMode="Mask">
                        </ig:WebMaskEditor>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebTab,WebTab_Visibility_Office %>"></asp:Label>:
                        <ig:WebMaskEditor ID="WebMaskEditor3" runat="server" Width="150px" CssClass="tabsInput"
                            Height="19px" InputMask="(000) 000-0000" DisplayMode="Mask">
                        </ig:WebMaskEditor>
                    </div>
                </Template>
            </ig:ContentTabItem>
        </Tabs>
        <ClientEvents SelectedIndexChanged="tabSelectedIndexChanged" />
    </ig:WebTab><br />
    <div class="btnsBottom">
        <input id="Button1" class="AButton" type="button" value="<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_HideHeader") %>"
            onclick="return Button1_onclick()" /><span lang="en-us"> </span>
        <input id="Button2" class="AButton" type="button" value="<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_HideContent") %>"
            onclick="return Button2_onclick()" />
    </div >
    <div class="btnsBottom">
        <input id="Button3" class="AButton" type="button" onclick="return Button3_onclick()"
            disabled="true" value="<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_Previous") %>" />
        <input id="Button4" class="AButton" type="button" onclick="return Button4_onclick()"
            value="<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_Next") %>" />
    </div>
       <script type="text/javascript">



           function Button1_onclick() {
               var tab = $find("<%= WebTab1.ClientID %>");
               var btnHeader = document.getElementById("Button1");

               if (btnHeader.value == '<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_HideHeader") %>') {
                   tab.set_visibleHeader(false);
                   btnHeader.value = '<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_ShowHeader")%>';
               }
               else {
                   tab.set_visibleHeader(true);
                   btnHeader.value = '<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_HideHeader")%>';
               }


           }

           function Button2_onclick() {
               var tab = $find("<%= WebTab1.ClientID %>");
               var btnContent = document.getElementById("Button2");

               if (btnContent.value == '<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_HideContent") %>') {
                   tab.set_visibleContent(false);
                   btnContent.value = '<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_ShowContent")%>';
               }
               else {
                   tab.set_visibleContent(true);
                   btnContent.value = '<%= this.GetGlobalResourceObject("WebTab","WebTab_Visibility_HideContent")%>';
               }
           }

           function Button3_onclick() {
               var btnPrevious = document.getElementById("Button3");
               var tab = $find("<%= WebTab1.ClientID %>");
               var tabSelectedIndex = tab.get_selectedIndex();
               if (tabSelectedIndex != 0)
                   tab.set_selectedIndex(tabSelectedIndex - 1);
               tabSelectedIndex = tab.get_selectedIndex();
               if (tabSelectedIndex == 0)
                   btnPrevious.disabled = true;
           }
           function Button4_onclick() {

               var btnNext = document.getElementById("Button4");
               var tab = $find("<%= WebTab1.ClientID %>");
               var tabItemSize = tab.get_tabs().length;
               var tabSelectedIndex = tab.get_selectedIndex();

               if (tabSelectedIndex < tabItemSize)
                   tab.set_selectedIndex(tabSelectedIndex + 1);
               tabSelectedIndex = tab.get_selectedIndex();
               if (tabSelectedIndex == tabItemSize - 1)
                   btnNext.disabled = true;


           }
           function tabSelectedIndexChanged(sender, e) {
               var tab = $find("<%= WebTab1.ClientID %>");
               var btnPrevious = document.getElementById("Button3");
               var btnNext = document.getElementById("Button4");
               var tabsLength = tab.get_tabs().length;
               var tabIndex = e.get_tabIndex();

               if (tabIndex == 0) {
                   btnPrevious.disabled = true;
                   btnNext.disabled = false;
               }
               else if (tabIndex == tabsLength - 1) {
                   btnPrevious.disabled = false;
                   btnNext.disabled = true;
               }
               else {
                   btnNext.disabled = false;
                   btnPrevious.disabled = false;
               }
           }

    </script>
</asp:Content>
