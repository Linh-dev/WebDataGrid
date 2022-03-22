<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="height: 565px;">
        <ighedit:WebHtmlEditor UploadedFilesDirectory="/SamplesBrowser/Temp/Uploads" ImageDirectory="/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/Display/WebHTMlEditorWithWebSpellChecker"
            Width="100%" Height="350px" ID="WebHtmlEditor1" SpellCheckerID="WebSpellChecker1"
            runat="server" FontFormattingList="Heading 1=<h1>&amp;Heading 2=<h2>&amp;Heading 3=<h3>&amp;Heading 4=<h4>&amp;Heading 5=<h5>&amp;Normal=<p>"
            SpecialCharacterList="&amp;#937;,&amp;#931;,&amp;#916;,&amp;#934;,&amp;#915;,&amp;#936;,&amp;#928;,&amp;#920;,&amp;#926;,&amp;#923;,&amp;#958;,&amp;#956;,&amp;#951;,&amp;#966;,&amp;#969;,&amp;#949;,&amp;#952;,&amp;#948;,&amp;#950;,&amp;#968;,&amp;#946;,&amp;#960;,&amp;#963;,&amp;szlig;,&amp;thorn;,&amp;THORN;,&amp;#402,&amp;#1041;,&amp;#1046;,&amp;#1044;,&amp;#1062;,&amp;#1064;,&amp;#1070;,&amp;#1071;,&amp;#1073;,&amp;#1078;,&amp;#1092;,&amp;#1096;,&amp;#1102;,&amp;#1103;,&amp;#12362;,&amp;#12354;,&amp;#32117;,&amp;#25152;,&amp;AElig;,&amp;Aring;,&amp;Ccedil;,&amp;ETH;,&amp;Ntilde;,&amp;Ouml;,&amp;aelig;,&amp;aring;,&amp;atilde;,&amp;auml;,&amp;ccedil;,&amp;ecirc;,&amp;eth;,&amp;euml;,&amp;ntilde;,&amp;cent;,&amp;pound;,&amp;curren;,&amp;yen;,&amp;#8470;,&amp;#153;,&amp;copy;,&amp;reg;,&amp;#151;,@,&amp;#149;,&amp;iexcl;,&amp;#14;,&amp;#18;,&amp;#24;,&amp;#26;,&amp;#27;,&amp;brvbar;,&amp;sect;,&amp;uml;,&amp;ordf;,&amp;not;,&amp;macr;,&amp;para;,&amp;deg;,&amp;plusmn;,&amp;laquo;,&amp;raquo;,&amp;middot;,&amp;cedil;,&amp;ordm;,&amp;sup1;,&amp;sup2;,&amp;sup3;,&amp;frac14;,&amp;frac12;,&amp;frac34;,&amp;iquest;,&amp;times;,&amp;divide;"
            FontNameList="Arial,Verdana,Tahoma,Courier New,Georgia" FontStyleList="Blue Underline=color:blue;text-decoration:underline;&amp;Red Bold=color:red;font-weight:bold;&amp;ALL CAPS=text-transform:uppercase;&amp;all lowercase=text-transform:lowercase;&amp;Reset="
            FontSizeList="1,2,3,4,5,6,7">
            <DialogStyle Font-Size="8pt" Font-Names="sans-serif" BorderWidth="1px" ForeColor="Black"
                BorderStyle="Solid" BorderColor="Black" BackColor="#ECE9D8"></DialogStyle>
            <RightClickMenu>
                <ighedit:HtmlBoxMenuItem Act="Cut">
                </ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem Act="Copy">
                </ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem Act="Paste">
                </ighedit:HtmlBoxMenuItem>
            </RightClickMenu>
        </ighedit:WebHtmlEditor>
    </div>
</asp:Content>
