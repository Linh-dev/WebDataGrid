using System;
using System.Collections;
using System.Drawing;

using Infragistics.UltraChart.Core;
using Infragistics.UltraChart.Core.ColorModel;
using Infragistics.UltraChart.Data;
using Infragistics.UltraChart.Core.Layers;
using Infragistics.UltraChart.Core.Primitives;
using Infragistics.UltraChart.Resources;
using Infragistics.UltraChart.Shared.Styles;

namespace WebSamplesCS.WebCharts.Customization
{
    /// <summary>
    /// The primary custom layer class.  This class defines each state shaped polygon, 
    /// colors it according to the cooresponding data point value and then adds the
    /// polygon to the SceneGraph.  This class implements ILayer which allows it to
    /// be added to the charts Layers class as a custom layer.
    /// </summary>
	public class MapLayer : ILayer
	{
		private ShapeFile shapeFile = null;

		public MapLayer(string filename)
		{
            //Load the shape file which contains each states shape.
			shapeFile = ShapeFile.Load(filename);
		}

		public static string[] STATES = {"Alabama", "Alaska", "Arizona", "Arkansas",  "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri",  "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota","Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"};

        /// <summary>
        /// Method which loops through each state, locates the appropriate polygon
        /// shape and then determines how it sohuld be added to the SceneGraph
        /// </summary>
        /// <param name="scene"></param>
		public void FillSceneGraph(SceneGraph scene)
		{
            //Create a background Box for the layer and color it white
//            Box bkgnd = new Box(this._OuterBound);
//            bkgnd.PE.Fill = Color.White;
//            bkgnd.PE.FillOpacity = 255;
//            scene.Add(bkgnd);

			for(int i=0;i<STATES.Length;i++)
			{
				string state = STATES[i];

				if (state.StartsWith("Michigan"))
				{
                    //Since Michigan requires two polygons (for the LP and UP) we have to treat it different
					AddPolygons(i, new PolygonShape[] {shapeFile["Michigan0"], shapeFile["Michigan1"]}, scene);
				}
				else if (state.StartsWith("Hawaii"))
				{
                    //Since Hawaii is several polygons, we have to treat it different
					AddPolygons(i, new PolygonShape[] {shapeFile["Hawaii0"], shapeFile["Hawaii1"], shapeFile["Hawaii2"], shapeFile["Hawaii3"], shapeFile["Hawaii4"]}, scene);
				}
				else
				{
					AddPolygons(i, new PolygonShape[] {shapeFile[state]}, scene);
				}
			}

		}

        /// <summary>
        /// Method which creates each new polygon and sets its properties 
        /// and actually adds the polygon to the SceneGraph
        /// </summary>
        /// <param name="index"></param>
        /// <param name="polygonshapes"></param>
        /// <param name="scene"></param>
		private void AddPolygons(int index, PolygonShape[] polygonshapes, SceneGraph scene)
		{
			for(int i=0;i<polygonshapes.Length;i++)
			{
				Polygon polygon = new Polygon(
					Infragistics.UltraChart.Core.Util.Transform.viewingTransform(shapeFile.Bounds, this.OuterBound, polygonshapes[i].Points.ToArray(), true)
				);

				double objectValue = (double)this.ChartData.GetObjectValue(index, 0);

                Console.WriteLine(objectValue.ToString());

				polygon.PE.Fill = this._ChartColorModel.getFillColor(index, 0, objectValue);
				polygon.PE.Stroke = this._ChartColorModel.getOutlineColor(index, 0, objectValue);
				polygon.Caps = PCaps.HitTest | PCaps.Tooltip | PCaps.Skin;

				polygon.Row = index;
				polygon.Column = 0;
				polygon.Value = polygonshapes[i].Name;
				polygon.Layer = this;

				scene.Add(polygon);
			}
		}

		#region ILayer Members

		private Rectangle innerBounds;
		public Rectangle GetInnerBounds()
		{
			return this.innerBounds;
		}

		public string GetDataInvalidMessage()
		{
			return "United States";
		}

		private Hashtable _Grid = new Hashtable();
		public Hashtable Grid
		{
			get 
			{
			return _Grid;
			}
			set 
			{
			_Grid = value;
			}
		}

		private string _LayerID;
		public string LayerID
		{
			get 
			{
			return _LayerID;
			}
			set 
			{
			_LayerID = value;
			}
		}

		private ChartCore _ChartCore;
		public ChartCore ChartCore
		{
			get {
			return _ChartCore;
			}
			set {
			_ChartCore = value;
			}
		}

		private IChartData _ChartData;
		public IChartData ChartData
		{
			get {
			return _ChartData;
			}
			set {
			_ChartData = value;
			}
		}

		private IColorModel _ChartColorModel;
		public IColorModel ChartColorModel
		{
			get {
			return _ChartColorModel;
			}
			set {
			_ChartColorModel = value;
			}
		}

		private bool _Visible;
		public bool Visible
		{
			get {
			return _Visible;
			}
			set {
			_Visible = value;
			}
		}

		private IChartComponent _ChartComponent;
		public IChartComponent ChartComponent
		{
			get {
			return _ChartComponent;
			}
			set {
			_ChartComponent = value;
			}
		}

		private Rectangle _OuterBound = new Rectangle(0, 0, 0, 0);
		public Rectangle OuterBound	
		{
			get {
			return _OuterBound;
			}
			set {
			_OuterBound = value;
			CalculateInnerBounds();
			}
		}

		protected void CalculateInnerBounds()
		{
			this.innerBounds = new Rectangle(this._OuterBound.X, this._OuterBound.Y, this._OuterBound.Width, this._OuterBound.Height);
		}

		#endregion       
    }
}
