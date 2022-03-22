using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string quinceHeaderImg = "/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/EditingAndSelection/InsertRichContent/quince-header.jpg";
        string playerScreenShot = "/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/EditingAndSelection/InsertRichContent/movie.jpg";
        string overviewHeaderImg = "/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/EditingAndSelection/InsertRichContent/OverviewHeader.jpg";
        string htmlEditorContent = @"
            <div style='margin: 10px auto; background-color: #100601; width:700px; padding-bottom: 10px;'>
                <div>
                    <img src='{0}' height='97'>
                </div>
                <div>
                    <div style='margin-bottom: 10px;'>
                    <div style='background-color: #371403; color: #DCAC2A; padding: 15px; margin: 0pt 10px; width: 290px; height:252px; float:left; font-size:14px'>
                        <div style='border-bottom: 1px solid #B97722; padding:5px 0; margin-bottom: 13px;'>
                            <span style='font-weight:bold;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RirchContent_WhatIsIt").ToString()+@"</span>
                        </div>
                        <div style='color: #DCAC2A'>
                           " + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_QuinceInfo").ToString() + @"
                        </div>
                     </div>
                    <div style='float:left;'>
                        <img src='{1}'>
                    </div>
                        <div style='clear:both; height: 0;'></div>
                    </div>                    
                    <div style='background-color: #371403; color: #DCAC2A; padding: 15px; margin: 0pt 10px;'>
                        <div style='border-bottom: 1px solid #B97722; padding:5px 0; margin-bottom: 15px;'>
                            <span style='font-weight:bold;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_ExploreQuince").ToString() + @"</span>
                        </div>
                        <div style='float: left;'>
                            <img src='{2}'>
                        </div>
                        <div style='float: left; width: 298px; padding-left: 10px;'>
                            <div style='height: 20px; background-color:#DCAC2A; margin-bottom: 13px;'>
                                <div style='height: 20px; width: 10px; float:left; background-color:#7F3E12;'></div>
                                <span style='color: #321403; font-weight: bold; vertical-align: middle; line-height: 20px; padding-left: 5px;'>
                                    " + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Features").ToString() + @"
                                </span>
                            </div>
                            <ul style='color: #DCAC2A; list-style-type: none; list-style-position: outside; padding:0;'>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature1").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature2").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature3").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature4").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature5").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature6").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature7").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature8").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature9").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature10").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature11").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature12").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature13").ToString() + @"</li>
	                            <li style='float:left; width: 50%; padding: 2px 0;'>" + this.GetGlobalResourceObject("WebHTMLEditor", "RichContent_Feature14").ToString() + @"</li>
                            </ul>
                            <div style='clear:both; height: 0;'></div>
                        </div>
                        <div style='clear:both; height: 0;'></div>
                    </div>
                    <div style='clear:both; height: 0;'></div>
                </div>
            </div>";

        WebHtmlEditor1.Text = string.Format(htmlEditorContent, quinceHeaderImg, playerScreenShot, overviewHeaderImg);
    }
}
