using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for SideBySideHelper
/// </summary>
public class SideBySideHelper
{
    #region Constants
    public const string JS_SCRIPT = "javascript:this.src='{0}'";
    public const string JS_SCRIPT_SCROLL_SYNC =
                    @"
                    var isMaintainScrollPositionEnabled = false;
                    var scrollSyncField = document.getElementById('[#HIDDEN]');

                    function addScrollSynchronization(fromElement, toElement, direction) {
        
                    fromElement._syncScroll = getOnScrollFunction(fromElement);
                    fromElement._scrollSyncDirection = direction;
                    fromElement._syncTo = toElement;

                    toElement._syncScroll = getOnScrollFunction(toElement);
                    toElement._scrollSyncDirection = direction;
                    toElement._syncTo = fromElement;

                    if (detectBrowser() == 1) {
                        toElement.attachEvent('onscroll', fromElement._syncScroll);
                        fromElement.attachEvent('onscroll', toElement._syncScroll);
                    }
                    else {
                        toElement.addEventListener('scroll', fromElement._syncScroll, true);
                        fromElement.addEventListener('scroll', toElement._syncScroll, true);
                    }
                }

                function removeScrollSynchronization(fromElement) {
                    if (fromElement._syncTo != null) {
                        if (detectBrowser() == 1) {
                            fromElement._syncTo.detachEvent('onscroll', fromElement._syncScroll);
                        }
                        else {
                            fromElement._syncTo.removeEventListener('scroll', fromElement._syncScroll, true);
                        }
                    }

                    fromElement._syncTo = null;
                    fromElement._syncScroll = null;
                    fromElement._scrollSyncDirection = null;
                }

                function getOnScrollFunction(oElement) {
                    return function(event) {
                        if(detectBrowser() == 1){                            
                            
                            if (oElement._scrollSyncDirection == 'vertical' || oElement._scrollSyncDirection == 'both'){
                                if(oElement.scrollTop != event.srcElement.scrollTop)
                                    oElement.scrollTop = event.srcElement.scrollTop;
                            }

                            if (oElement._scrollSyncDirection == 'horizontal' || oElement._scrollSyncDirection == 'both'){
                                if(oElement.scrollLeft != event.srcElement.scrollLeft)
                                    oElement.scrollLeft = event.srcElement.scrollLeft;
                            }
                        }
                        else {
                            if (oElement._scrollSyncDirection == 'vertical' || oElement._scrollSyncDirection == 'both'){
                                if(oElement.scrollTop != event.target.scrollTop)
                                    oElement.scrollTop = event.target.scrollTop;
                            }

                            if (oElement._scrollSyncDirection == 'horizontal' || oElement._scrollSyncDirection == 'both'){
                                if(oElement.scrollLeft != event.target.scrollLeft)
                                    oElement.scrollLeft = event.target.scrollLeft;
                            }
                        }      

                        scrollSyncField.value = oElement.scrollTop; 
                    };
                }

                function detectBrowser() {
                    var browser = navigator.appName;
                    var b_version = navigator.appVersion;
                    var version = parseFloat(b_version);
                    if (browser == 'Microsoft Internet Explorer') {
                        return 1;
                    }
                    else {
                        return 0;
                    }
                }

                function IsDefaultSrollPosition(position)
                {
                    return (position >= 320 && position <=336);                        
                }

                function hideScrollDiv(dayView) {
                    FindScroller(dayView).style.overflow = 'hidden';                    
                }

                function fixScrollDivHeight(dayView) {
                    FindScroller(dayView).style.height = (FindScroller(dayView).style.pixelHeight+25).toString() + 'px';                    
                }

                function scrollDivTo(dayView) {                
                    isMaintainScrollPositionEnabled = true;
                    FindScroller(dayView).scrollTop = scrollSyncField.value;  
                }

                function FindScroller(dayView){
                    var scroller;
                    for (var i = 0; i < dayView.childNodes.length; i++) {
                        if(dayView.childNodes[i].attributes != null){
                            for (var j = 0; j < dayView.childNodes[i].attributes.length; j++) {
                                 if (dayView.childNodes[i].attributes[j].name == 'uie' &&
                                     dayView.childNodes[i].attributes[j].value.indexOf('SCRL') != -1) {
                                     scroller = dayView.childNodes[i];                                     
                                     return scroller;
                                 }
                            }
                        }

                        if(dayView.childNodes[i].childNodes.length > 0)
                             scroller = FindScroller(dayView.childNodes[i]);
                    }
                    return scroller;
                }

                function scrollSynch(dayView1, dayView2, type) {
                    addScrollSynchronization(FindScroller(dayView1), FindScroller(dayView2), type);
                }
                
                function DisableActivityDialogOpening(scheduleInfo, evnt) {
                    evnt.cancel = true;
                }

                function DisableActivityUpdating(scheduleInfo, evnt) {
                    evnt.cancel = true;
                }

                ";
    #endregion

    public static List<SideBySideStyle> GetSideBySideStyles()
    {
        List<SideBySideStyle> styles = new List<SideBySideStyle>();

        SideBySideStyle blue = new SideBySideStyle();
        #region Blue

        blue.ImageHeaderLeft = "blueLeft.png";
        blue.ImageHeaderMiddle = "blueMiddle.png";
        blue.ImageHeaderRight = "blueRight.png";

        blue.CaptionColor = System.Drawing.ColorTranslator.FromHtml("#90B0DA");
        blue.SelectedColor = System.Drawing.ColorTranslator.FromHtml("#A4C7FC");

        blue.CaptionHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BFDAFF");
        blue.CaptionHeaderStyle.BorderStyle = BorderStyle.Solid;
        blue.CaptionHeaderStyle.Padding.Top = new Unit("3px");
        blue.CaptionHeaderStyle.Padding.Bottom = new Unit("2px");
        blue.CaptionHeaderStyle.Height = new Unit("22px");

        blue.NonWorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E6EDF7");
        blue.NonWorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.ColorTranslator.FromHtml("#999999");
        blue.NonWorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        blue.NonWorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        blue.NonWorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#D5E1F1");
        blue.NonWorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        blue.NonWorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        blue.NonWorkingTimeSlotStyle.Height = new Unit("20px");

        blue.WorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        blue.WorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.ColorTranslator.FromHtml("#999999");
        blue.WorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        blue.WorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        blue.WorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#E6EDF7");
        blue.WorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        blue.WorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        blue.WorkingTimeSlotStyle.Height = new Unit("20px");

        blue.TimeSlotLabelStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E6EDF7");
        blue.TimeSlotLabelStyle.BorderDetails.ColorRight = System.Drawing.Color.LightGray;
        blue.TimeSlotLabelStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        blue.TimeSlotLabelStyle.BorderDetails.WidthRight = new Unit("1px");
        blue.TimeSlotLabelStyle.BorderDetails.ColorBottom = System.Drawing.Color.LightGray;
        blue.TimeSlotLabelStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        blue.TimeSlotLabelStyle.BorderDetails.WidthBottom = new Unit("1px");
        blue.TimeSlotLabelStyle.Width = new Unit("60px");
        blue.TimeSlotLabelStyle.ForeColor = System.Drawing.Color.Gray;

        blue.AppointmentStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E6EDF7");

        blue.DayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BFDAFF");
        blue.DayHeaderFormatString = "ddd dd";
        blue.DayHeaderStyle.ForeColor = System.Drawing.Color.Black;



        blue.CompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        blue.MonthDayOfWeekHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BFDAFF");
        blue.OtherCompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E7F1FF");
        blue.OtherMonthDayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#95B9C7");
        blue.OtherMonthDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E7F1FF");
        blue.WeekNumberStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BFDAFF");
        blue.DayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        

        #endregion

        SideBySideStyle green = new SideBySideStyle();
        #region Green

        green.ImageHeaderLeft = "greenLeft.png";
        green.ImageHeaderMiddle = "greenMiddle.png";
        green.ImageHeaderRight = "greenRight.png";

        green.CaptionColor = System.Drawing.ColorTranslator.FromHtml("#9EC08D");
        green.SelectedColor = System.Drawing.ColorTranslator.FromHtml("#B3DDC7");

        green.CaptionHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BDEDD2");
        green.CaptionHeaderStyle.BorderStyle = BorderStyle.Solid;
        green.CaptionHeaderStyle.Padding.Top = new Unit("3px");
        green.CaptionHeaderStyle.Padding.Bottom = new Unit("2px");
        green.CaptionHeaderStyle.Height = new Unit("22px");

        green.NonWorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3F4EB");
        green.NonWorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.Color.Green;
        green.NonWorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        green.NonWorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        green.NonWorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#BDEDD2");
        green.NonWorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        green.NonWorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        green.NonWorkingTimeSlotStyle.Height = new Unit("20px");

        green.WorkingTimeSlotStyle.BackColor = System.Drawing.Color.White;
        green.WorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.ColorTranslator.FromHtml("#999999");
        green.WorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        green.WorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        green.WorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#BDEDD2");
        green.WorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        green.WorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        green.WorkingTimeSlotStyle.Height = new Unit("20px");

        green.TimeSlotLabelStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#DCE9D6");
        green.TimeSlotLabelStyle.BorderDetails.ColorRight = System.Drawing.Color.LightGray;
        green.TimeSlotLabelStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        green.TimeSlotLabelStyle.BorderDetails.WidthRight = new Unit("1px");
        green.TimeSlotLabelStyle.BorderDetails.ColorBottom = System.Drawing.Color.LightGray;
        green.TimeSlotLabelStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        green.TimeSlotLabelStyle.BorderDetails.WidthBottom = new Unit("1px");
        green.TimeSlotLabelStyle.Width = new Unit("60px");
        green.TimeSlotLabelStyle.ForeColor = System.Drawing.Color.Gray;

        green.AppointmentStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#D7F1E3");

        green.ActivityEdgeLeftStyle.BackColor = System.Drawing.Color.Green;
        green.ActivityEdgeBusyStyle.BackColor = System.Drawing.Color.Green;

        green.DayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BDEDD2");
        green.DayHeaderFormatString = "ddd dd";
        green.DayHeaderStyle.ForeColor = System.Drawing.Color.Black;

        green.CompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        green.MonthDayOfWeekHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BDEDD2");
        green.OtherCompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E2F8EB");
        green.OtherMonthDayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#95C6A9");
        green.OtherMonthDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E2F8EB");
        green.WeekNumberStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#BDEDD2");
        green.DayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

        #endregion

        SideBySideStyle pink = new SideBySideStyle();
        #region Pink

        pink.ImageHeaderLeft = "pinkLeft.png";
        pink.ImageHeaderMiddle = "pinkMiddle.png";
        pink.ImageHeaderRight = "pinkRight.png";

        pink.CaptionColor = System.Drawing.ColorTranslator.FromHtml("#D297AC");
        pink.SelectedColor = System.Drawing.ColorTranslator.FromHtml("#EACCDB");

        pink.CaptionHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBD9EB");
        pink.CaptionHeaderStyle.BorderStyle = BorderStyle.Solid;
        pink.CaptionHeaderStyle.Padding.Top = new Unit("3px");
        pink.CaptionHeaderStyle.Padding.Bottom = new Unit("2px");
        pink.CaptionHeaderStyle.Height = new Unit("22px");

        pink.NonWorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFEDF7");
        pink.NonWorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.Color.Purple;
        pink.NonWorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        pink.NonWorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        pink.NonWorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#FFD7F1");
        pink.NonWorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        pink.NonWorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        pink.NonWorkingTimeSlotStyle.Height = new Unit("20px");

        pink.WorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFAFF");
        pink.WorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.ColorTranslator.FromHtml("#999999");
        pink.WorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        pink.WorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        pink.WorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#E6EDF7");
        pink.WorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        pink.WorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        pink.WorkingTimeSlotStyle.Height = new Unit("20px");

        pink.TimeSlotLabelStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F2E1E8");
        pink.TimeSlotLabelStyle.BorderDetails.ColorRight = System.Drawing.Color.LightGray;
        pink.TimeSlotLabelStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        pink.TimeSlotLabelStyle.BorderDetails.WidthRight = new Unit("1px");
        pink.TimeSlotLabelStyle.BorderDetails.ColorBottom = System.Drawing.Color.LightGray;
        pink.TimeSlotLabelStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        pink.TimeSlotLabelStyle.BorderDetails.WidthBottom = new Unit("1px");
        pink.TimeSlotLabelStyle.Width = new Unit("60px");
        pink.TimeSlotLabelStyle.ForeColor = System.Drawing.Color.Gray;

        pink.AppointmentStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFEDF7");

        pink.ActivityEdgeLeftStyle.BackColor = System.Drawing.Color.Pink;
        pink.ActivityEdgeBusyStyle.BackColor = System.Drawing.Color.Pink;

        pink.DayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F9DEEB");
        pink.DayHeaderFormatString = "ddd dd";
        pink.DayHeaderStyle.ForeColor = System.Drawing.Color.Black;


        pink.CompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        pink.MonthDayOfWeekHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBD9EB");
        pink.OtherCompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBE6F0");
        pink.OtherMonthDayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F7C9E1");
        pink.OtherMonthDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBE6F0");
        pink.WeekNumberStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBD9EB");
        pink.DayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

        #endregion

        SideBySideStyle yellow = new SideBySideStyle();
        #region Yellow

        yellow.CaptionColor = System.Drawing.ColorTranslator.FromHtml("#FBFFBF");
        yellow.SelectedColor = System.Drawing.ColorTranslator.FromHtml("#EEF2B7");

        yellow.CaptionHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBFFBF");
        yellow.CaptionHeaderStyle.BorderStyle = BorderStyle.Solid;
        yellow.CaptionHeaderStyle.Padding.Top = new Unit("3px");
        yellow.CaptionHeaderStyle.Padding.Bottom = new Unit("2px");
        yellow.CaptionHeaderStyle.Height = new Unit("22px");

        yellow.NonWorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FDFFDC");
        yellow.NonWorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.Color.Black;
        yellow.NonWorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        yellow.NonWorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        yellow.NonWorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#EEF2B7");
        yellow.NonWorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        yellow.NonWorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        yellow.NonWorkingTimeSlotStyle.Height = new Unit("20px");

        yellow.WorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFAFF");
        yellow.WorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.ColorTranslator.FromHtml("#999999");
        yellow.WorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        yellow.WorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        yellow.WorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#EEF2B7");
        yellow.WorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        yellow.WorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        yellow.WorkingTimeSlotStyle.Height = new Unit("20px");

        yellow.TimeSlotLabelStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFE8");
        yellow.TimeSlotLabelStyle.BorderDetails.ColorRight = System.Drawing.Color.LightGray;
        yellow.TimeSlotLabelStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        yellow.TimeSlotLabelStyle.BorderDetails.WidthRight = new Unit("1px");
        yellow.TimeSlotLabelStyle.BorderDetails.ColorBottom = System.Drawing.Color.LightGray;
        yellow.TimeSlotLabelStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        yellow.TimeSlotLabelStyle.BorderDetails.WidthBottom = new Unit("1px");
        yellow.TimeSlotLabelStyle.Width = new Unit("60px");
        yellow.TimeSlotLabelStyle.ForeColor = System.Drawing.Color.Gray;

        yellow.AppointmentStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFE8");

        yellow.ActivityEdgeLeftStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#EEF2B7");
        yellow.ActivityEdgeBusyStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#EEF2B7");

        yellow.DayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FAFBD9");
        yellow.DayHeaderFormatString = "ddd dd";
        yellow.DayHeaderStyle.ForeColor = System.Drawing.Color.Black;

        yellow.CompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        yellow.MonthDayOfWeekHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FAFBD9");
        yellow.OtherCompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBFBE6");
        yellow.OtherMonthDayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F4F5C8");
        yellow.OtherMonthDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FBFBE6");
        yellow.WeekNumberStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FAFBD9");
        yellow.DayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

        #endregion

        SideBySideStyle purple = new SideBySideStyle();
        #region Purple

        purple.ImageHeaderLeft = "purpleLeft.png";
        purple.ImageHeaderMiddle = "purpleMiddle.png";
        purple.ImageHeaderRight = "purpleRight.png";

        purple.CaptionColor = System.Drawing.ColorTranslator.FromHtml("#8E8ED8");
        purple.SelectedColor = System.Drawing.ColorTranslator.FromHtml("#C6B8EE");

        purple.CaptionHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#D2C2FF");
        purple.CaptionHeaderStyle.BorderStyle = BorderStyle.Solid;
        purple.CaptionHeaderStyle.Padding.Top = new Unit("3px");
        purple.CaptionHeaderStyle.Padding.Bottom = new Unit("2px");
        purple.CaptionHeaderStyle.Height = new Unit("22px");

        purple.NonWorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F5F1FE");
        purple.NonWorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.Color.Black;
        purple.NonWorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        purple.NonWorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        purple.NonWorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#E3DDF2");
        purple.NonWorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        purple.NonWorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        purple.NonWorkingTimeSlotStyle.Height = new Unit("20px");

        purple.WorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFAFF");
        purple.WorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.ColorTranslator.FromHtml("#999999");
        purple.WorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        purple.WorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        purple.WorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#E6EDF7");
        purple.WorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        purple.WorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        purple.WorkingTimeSlotStyle.Height = new Unit("20px");

        purple.TimeSlotLabelStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3DDF2");
        purple.TimeSlotLabelStyle.BorderDetails.ColorRight = System.Drawing.Color.LightGray;
        purple.TimeSlotLabelStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        purple.TimeSlotLabelStyle.BorderDetails.WidthRight = new Unit("1px");
        purple.TimeSlotLabelStyle.BorderDetails.ColorBottom = System.Drawing.Color.LightGray;
        purple.TimeSlotLabelStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        purple.TimeSlotLabelStyle.BorderDetails.WidthBottom = new Unit("1px");
        purple.TimeSlotLabelStyle.Width = new Unit("60px");
        purple.TimeSlotLabelStyle.ForeColor = System.Drawing.Color.Gray;

        purple.AppointmentStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F5F1FE");

        purple.ActivityEdgeLeftStyle.BackColor = System.Drawing.Color.Purple;
        purple.ActivityEdgeBusyStyle.BackColor = System.Drawing.Color.Purple;

        purple.DayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#DDD4F5");
        purple.DayHeaderFormatString = "ddd dd";
        purple.DayHeaderStyle.ForeColor = System.Drawing.Color.Black;

        purple.CompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        purple.MonthDayOfWeekHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3DDF2");
        purple.OtherCompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F5F1FE");
        purple.OtherMonthDayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#C6B8EE");
        purple.OtherMonthDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F5F1FE");
        purple.WeekNumberStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3DDF2");
        purple.DayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

        #endregion

        SideBySideStyle gray = new SideBySideStyle();
        #region Gray

        gray.ImageHeaderLeft = "grayLeft.png";
        gray.ImageHeaderMiddle = "grayMiddle.png";
        gray.ImageHeaderRight = "grayRight.png";

        gray.CaptionColor = System.Drawing.ColorTranslator.FromHtml("#B1B7BF");
        gray.SelectedColor = System.Drawing.ColorTranslator.FromHtml("#DDDDDD");

        gray.CaptionHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E7E7E7");
        gray.CaptionHeaderStyle.BorderStyle = BorderStyle.Solid;
        gray.CaptionHeaderStyle.Padding.Top = new Unit("3px");
        gray.CaptionHeaderStyle.Padding.Bottom = new Unit("2px");
        gray.CaptionHeaderStyle.Height = new Unit("22px");

        gray.NonWorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#EFEFEF");
        gray.NonWorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.Color.Black;
        gray.NonWorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        gray.NonWorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        gray.NonWorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#DDDDDD");
        gray.NonWorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        gray.NonWorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        gray.NonWorkingTimeSlotStyle.Height = new Unit("20px");

        gray.WorkingTimeSlotStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F9F9F9");
        gray.WorkingTimeSlotStyle.BorderDetails.ColorRight = System.Drawing.ColorTranslator.FromHtml("#999999");
        gray.WorkingTimeSlotStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        gray.WorkingTimeSlotStyle.BorderDetails.WidthRight = new Unit("1px");
        gray.WorkingTimeSlotStyle.BorderDetails.ColorBottom = System.Drawing.ColorTranslator.FromHtml("#DDDDDD");
        gray.WorkingTimeSlotStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        gray.WorkingTimeSlotStyle.BorderDetails.WidthBottom = new Unit("1px");
        gray.WorkingTimeSlotStyle.Height = new Unit("20px");

        gray.TimeSlotLabelStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E4E7E9");
        gray.TimeSlotLabelStyle.BorderDetails.ColorRight = System.Drawing.Color.LightGray;
        gray.TimeSlotLabelStyle.BorderDetails.StyleRight = BorderStyle.Solid;
        gray.TimeSlotLabelStyle.BorderDetails.WidthRight = new Unit("1px");
        gray.TimeSlotLabelStyle.BorderDetails.ColorBottom = System.Drawing.Color.LightGray;
        gray.TimeSlotLabelStyle.BorderDetails.StyleBottom = BorderStyle.Solid;
        gray.TimeSlotLabelStyle.BorderDetails.WidthBottom = new Unit("1px");
        gray.TimeSlotLabelStyle.Width = new Unit("60px");
        gray.TimeSlotLabelStyle.ForeColor = System.Drawing.Color.Gray;

        gray.AppointmentStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#EDEDED");

        gray.ActivityEdgeLeftStyle.BackColor = System.Drawing.Color.Gray;
        gray.ActivityEdgeBusyStyle.BackColor = System.Drawing.Color.Gray;

        gray.DayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E7E7E7");
        gray.DayHeaderFormatString = "ddd dd";
        gray.DayHeaderStyle.ForeColor = System.Drawing.Color.Black;

        gray.CompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
        gray.MonthDayOfWeekHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E7E7E7");
        gray.OtherCompressedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
        gray.OtherMonthDayHeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#D9D9D9");
        gray.OtherMonthDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
        gray.WeekNumberStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E7E7E7");
        gray.DayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

        #endregion

        styles.Add(blue);
        styles.Add(green);
        styles.Add(gray);
        styles.Add(pink);
        //styles.Add(yellow);
        styles.Add(purple);

        return styles;
    }
}
