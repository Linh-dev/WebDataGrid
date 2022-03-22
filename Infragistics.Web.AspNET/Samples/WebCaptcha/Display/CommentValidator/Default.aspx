<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebCaptcha_Demo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:UpdatePanel runat="server" ID="CommentUpdatePanel">
        <ContentTemplate>
            <div style="width: 200px; position: relative; margin-top: 30px; height: 100%; padding: 15px 0 10px;">
                <div class="titles">
                    <%= this.GetGlobalResourceObject("WebCaptcha","ScenarioAddYourComment")%></div>
                <div style="border: 3px solid #D2D2D2; width: 730px; height: 180px; padding:10px">
                    <div style="float: left;">
                        <div>
                            <%= this.GetGlobalResourceObject("WebCaptcha","ScenarioName")%>:</div>
                        <asp:TextBox MaxLength="30" Style="border: 1px solid #BBBBBB; width: 250px;" ID="TextName"
                            runat="server"> </asp:TextBox>
                        <br />
                        <br />
                        <div>
                            <%= this.GetGlobalResourceObject("WebCaptcha","ScenarioComment")%>:</div>
                        <asp:TextBox Style="width: 450px; height: 100px; border: 1px solid #BBBBBB; font-family: Arial, Sans-Serif;"
                            Rows="2" TextMode="MultiLine" ID="TextComment" runat="server" /></div>
                    <div class="Captcha">
                        <ig:WebCaptcha ID="WebCaptcha1" Width="177px" ErrorMessage="<%$ Resources:WebCaptcha, ScenarioErrorMessage %>"
                            runat="server" EnableEmbeddedJavaScript="true">
                            <RefreshButton AltText="" Visible="false"></RefreshButton>
                            <SubmitButton runat="server" ID="SubmitButton" Visible="false"></SubmitButton>
                            <CaptchaImageSettings TextColor="DarkGray" LinesNoise="VeryLow" FontWarping="Low"
                                FontSize="25" TextLength="5" EnableUniqueChars="False" />
                            <AudioButton AltText="" Visible="false"></AudioButton>
                            <InputValueEditor runat="server" NullText="<%$ Resources:WebCaptcha, ScenarioNullText %>" Width="175px" ID="_editor">
                            </InputValueEditor>
                        </ig:WebCaptcha>
                        <asp:Button runat="server" ID="postBtn" OnClick="postBtn_click" Text="<%$ Resources:WebCaptcha, ScenarioPostYourComment %>"
                            CssClass="SubmitButton" />
                    </div>
                </div>
            </div>
            <div class="titles">
                <%= this.GetGlobalResourceObject("WebCaptcha","ScenarioAllReplies")%></div>
            <div id="Comments">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div id="CommentDiv">
                            <div class="CommentImage">
                                <div id="Counter" class="CommentNumber">
                                    <%# Convert.ToInt32(DataBinder.Eval(Container.DataItem, "CommentNumber")) + 1%>
                                </div>
                            </div>
                            <div class="CommentArrow">
                            </div>
                            <div class="CommentWrapper Shadow">
                                <div class="CommentPosterName">
                                    <%# DataBinder.Eval(Container.DataItem, "PosterName")%>
                                    <span class="CommentDate">&nbsp|
                                        <%# DataBinder.Eval(Container.DataItem, "CommentDate")%>
                                    </span>
                                </div>
                                <div class="CommentText">
                                    <%# DataBinder.Eval(Container.DataItem, "CommentText")%></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        var opacity = 0;

        function ScenarioFadeAnimation(CommentNumber) {
            var CommentsWrapper = document.getElementById("Comments");
            var LastComment = CommentsWrapper.children[CommentNumber];
            if ($util.IsIE) {
                LastComment.style.filter = "alpha(opacity = 0)";
                animationInterval = setInterval(function () { FadeInIE(LastComment); }, 10);
            }
            else {
                LastComment.style.opacity = 0;
                animationInterval = setInterval(function () { FadeIn(LastComment); }, 10);
            }
        }

        function FadeInIE(elem) {
            opacity += 5;
            elem.style.filter = "alpha(opacity = " + opacity + ")";
            if (opacity >= 100) {
                clearInterval(animationInterval);
                opacity = 0;
            }
        }
        function FadeIn(elem) {
            opacity += 0.05;
            elem.style.opacity = opacity;

            if (elem.style.opacity >= 1) {
                clearInterval(animationInterval);
                opacity = 0;
            }
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" Runat="Server">
</asp:Content>

