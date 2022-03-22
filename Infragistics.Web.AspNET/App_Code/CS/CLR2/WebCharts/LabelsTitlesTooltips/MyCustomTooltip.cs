using System;
using Infragistics.UltraChart.Resources;
using System.Web;
using System.Globalization;

namespace ChartSamples.LabelsTitlesTooltips.CustomTooltips
{
	/// <summary>
	/// Summary description for MyCustomTooltip.
	/// </summary>
	public class MyCustomTooltip : IRenderLabel
	{
		public MyCustomTooltip()
		{
			
		}
		#region IRenderLabel Members

		public string ToString(System.Collections.Hashtable Context)
        {
            double dataValue = (double)Context["DATA_VALUE"];
			if (dataValue > 75)
            { return dataValue.ToString() + "[" + HttpContext.GetGlobalResourceObject("WebCharts", "Tooltip_VeryHigh", CultureInfo.CurrentCulture) + "]"; }
			else if (dataValue > 50)
            { return dataValue.ToString() + "[" + HttpContext.GetGlobalResourceObject("WebCharts", "Tooltip_High", CultureInfo.CurrentCulture) + "]"; }
			else if (dataValue > 25)
            { return dataValue.ToString() + "[" + HttpContext.GetGlobalResourceObject("WebCharts", "Tooltip_Medium", CultureInfo.CurrentCulture) + "]"; }
			else if (dataValue >= 0)
            { return dataValue.ToString() + "[" + HttpContext.GetGlobalResourceObject("WebCharts", "Tooltip_Low", CultureInfo.CurrentCulture) + "]"; }
			else
            { return dataValue.ToString() + "[" + HttpContext.GetGlobalResourceObject("WebCharts", "Tooltip_Negative", CultureInfo.CurrentCulture) + "]"; }
		}

		#endregion
	}
}
