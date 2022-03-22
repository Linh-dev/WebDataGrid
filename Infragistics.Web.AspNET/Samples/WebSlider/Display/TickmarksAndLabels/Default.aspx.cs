using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int index = this.TickmarksLocation.SelectedIndex;
        this.WebSlider1.Tickmarks.Location = (Infragistics.Web.UI.EditorControls.SliderTickmarksLocation)index;
       
        index = this.TickmarkLabelsLocation.SelectedIndex;
        this.WebSlider1.Tickmarks.LabelLocation = (Infragistics.Web.UI.EditorControls.SliderTickmarkLabelLocation)index;
        
        index = this.TickmarksNumberMajor.SelectedIndex;
        this.WebSlider1.Tickmarks.NumberOfMajorTickmarks = 2 + index;
        
        index = this.TickmarksNumberMinor.SelectedIndex;
        this.WebSlider1.Tickmarks.NumberOfMinorTickmarks = index;
        
        index = this.TickmarkLabelsNumber.SelectedIndex;
        this.WebSlider1.Tickmarks.NumberOfLabels = 2 + index;
        
        index = this.TrackFillMode.SelectedIndex;
        this.WebSlider1.Track.FillValueMode = (Infragistics.Web.UI.EditorControls.SliderTrackFillValueMode)index;
        
        index = this.Alignment.SelectedIndex;
        if (index == 3)
            index = 4;
        this.WebSlider1.ContentAlignment = (Infragistics.Web.UI.EditorControls.SliderContentAlignment)index;
        
        string format = string.Empty;
        if (this.TickmarkLabelsFormat.SelectedIndex > 0)
            format = this.TickmarkLabelsFormat.SelectedValue;
        this.WebSlider1.Tickmarks.LabelFormatString = format;
        
        index = this.ValueLabel.SelectedIndex;
        this.WebSlider1.ValueLabel.Location = (Infragistics.Web.UI.EditorControls.SliderValueLabelLocation)index;
        
        format = string.Empty;
        if (this.ValueLabelFormat.SelectedIndex > 0)
            format = this.ValueLabelFormat.SelectedValue;
        this.WebSlider1.ValueLabel.Format = format;
        if (this.WebSlider1.ValueLabel.Location >= Infragistics.Web.UI.EditorControls.SliderValueLabelLocation.FloatTopOrLeft)
        {
            if (this.WebSlider1.ValueLabel.Format.IndexOf("{1}") >= 0)
                this.WebSlider1.ValueLabel.FloatCssClass = "width90 halfTransparent";
            else
                this.WebSlider1.ValueLabel.FloatCssClass = "halfTransparent";
        }
    }



    protected void WebSlider_FormatTickmarkLabel(object sender, Infragistics.Web.UI.EditorControls.SliderFormatTickmarkLabelEventArgs e)
    {
        if (!this.FormatTopLabels.Checked)
            return;
        if (((Infragistics.Web.UI.EditorControls.WebSlider)sender).Tickmarks.LabelLocation == Infragistics.Web.UI.EditorControls.SliderTickmarkLabelLocation.TwoLabelsInMargins)
            return;
        if (!e.LeftTop)
            return;
        if (e.LabelID == 0)
        {
            e.Label = this.GetGlobalResourceObject("WebSlider","Tick_First").ToString();
            return;
        }
        if (e.Percent >= 0.95)
        {
            e.Label = this.GetGlobalResourceObject("WebSlider", "Tick_Last").ToString();
            return;
        }
        if (e.LabelID == 1)
            e.Label = this.GetGlobalResourceObject("WebSlider", "Tick_Second").ToString();
        else if (e.LabelID == 2)
            e.Label = this.GetGlobalResourceObject("WebSlider", "Tick_Third").ToString();
        else
            e.Label = e.LabelID + this.GetGlobalResourceObject("WebSlider", "Tick_th").ToString();
    }
}
