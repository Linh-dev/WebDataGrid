using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using Infragistics.UltraChart.Core;
using Infragistics.UltraChart.Core.Primitives;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;

namespace WebCharts.AnnotationsDemo
{
	public class MyCustomAnnotation : IAnnotation
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public MyCustomAnnotation()
		{
			// instantiate objects
            this.Location = new Location();
            this.TextStyle = new LabelStyle();
            this.LineStyle = new LineStyle();
            this.LineThickness = 4;
            this.LineColor = Color.CornflowerBlue;
            this.Height = -1;
            this.Width = -1;
            this.PE = new PaintElement(Color.Orange);
            this.PE.ElementType = PaintElementType.Texture;
            this.PE.Texture = TexturePresets.GrainA;
            this.Text = "Default Text";
		}

		/// <summary>
		/// This method renders different annotations.
		/// </summary>
		/// <param name="scene">Collection class for Primitives.</param>
		/// <param name="renderPoint">Position of an annotation.</param>
		public void RenderAnnotation(SceneGraph scene, Point renderPoint)
		{
			// Create primitive and set visual attributes.
            Size starSize = this.GetStarSize();
            renderPoint.X = 150;
            renderPoint.Y = 100;
            int height = starSize.Height;
            int width = starSize.Width;

            int[] xCoords = new int[] { -1, 1, 1, 5, 0, -5, -1 };
            int[] yCoords = new int[] { -5, -5, 0, 0, 5, 0, 0 };

            Point[] points = new Point[xCoords.Length];
            for (int pointIndx = 0; pointIndx < xCoords.Length; pointIndx++)
            {
                points[pointIndx].X = xCoords[pointIndx] * width / 10 + renderPoint.X;
                points[pointIndx].Y = yCoords[pointIndx] * height / 3 + renderPoint.Y;
            }

            Polygon arrow = new Polygon(points);

            // Set visual attributes.
            arrow.PE = this.PE;

            arrow.lineStyle = this.LineStyle;
            arrow.PE.StrokeWidth = this.LineThickness;
            arrow.PE.Stroke = this.LineColor;
            arrow.PE.StrokeOpacity = this.LineColor.A;
            scene.Add(arrow);

            Point textPoint = new Point(renderPoint.X - width / 4, renderPoint.Y + height / 2);
            Text label = new Text(textPoint, this.Text, this.TextStyle);
            scene.Add(label);
		}

		/// <summary>
		/// This method renders different annotations.
		/// </summary>
		/// <param name="scene">Collection class for Primitives.</param>
		/// <param name="renderPoint">Position of an annotation.</param>
		public void RenderAnnotation(SceneGraph scene, Primitive parent)
		{
			// Gets a point for rendering an annotation upon the specified parent primitive. 
			Point renderPoint = Annotation.GetRenderPointFromParent(parent);

			// Render Annotation
			this.RenderAnnotation(scene, renderPoint);
		}

		/// <summary>
		/// Location of the annotation.
		/// </summary>
		private Location _location;

		/// <summary>
		/// Sets or Gets a location of the annotation.
		/// </summary>
		public Location Location
		{
			get
			{
				return this._location;
			}
			set
			{
				this._location = value;
			}
		}

		#region Public Properties

		private int _height;
		public int Height
		{
			get
			{
				return this._height;
			}
			set
			{
				this._height = value;
			}
		}
		private int _width;
		public int Width
		{
			get
			{
				return this._width;
			}
			set
			{
				this._width = value;
			}
		}
		private string _text;
		public string Text
		{
			get
			{
				return this._text;
			}
			set
			{
				this._text = value;
			}
		}
		private LabelStyle _textStyle;
		public LabelStyle TextStyle
		{
			get
			{
				return this._textStyle;
			}
			set
			{
				this._textStyle = value;
			}
		}
		public Color FillColor
		{
			get
			{
				return this.PE.Fill;
			}
			set
			{
				this.PE.Fill = value;
			}
		}
		private PaintElement _pE;
		public PaintElement PE
		{
			get
			{
				return this._pE;
			}
			set
			{
				this._pE = value;
			}
		}
		private LineStyle _lineStyle;
		public LineStyle LineStyle
		{
			get
			{
				return this._lineStyle;
			}
			set
			{
				this._lineStyle = value;
			}
		}
		private int _lineThickness;
		public int LineThickness
		{
			get
			{
				return this._lineThickness;
			}
			set
			{
				this._lineThickness = value;
			}
		}
		private Color _lineColor;
		public Color LineColor
		{
			get
			{
				return this._lineColor;
			}
			set
			{
				this._lineColor = value;
			}
		}
		#endregion

		#region Helper Functions

		/// <summary>
		/// Calculates the size of the star.
		/// </summary>
		/// <returns>Size of the star</returns>
		private Size GetStarSize()
		{
			double inflation = 2;
			int starHeight, starWidth;
			SizeF textSize;
			if (this.TextStyle != null)
			{
				textSize = Infragistics.UltraChart.Core.Util.Platform.GetStringSizePixels(this.Text, this.TextStyle.Font);
			}
			else // TextStyle should really not be null, but just in case it is, measure the string using Arial 12pt.
			{
				textSize = Infragistics.UltraChart.Core.Util.Platform.GetStringSizePixels(this.Text, new Font("Arial", 12));
			}
			if (this.Height < 0)
			{
				starHeight  = (int)(textSize.Height*inflation);
			}
			else
			{
				starHeight = this.Height;
			}
			if (this.Width < 0)
			{
				starWidth   = (int)(textSize.Width*inflation);
			}
			else
			{
				starWidth  = this.Width;
			}
			return new Size(starWidth, starHeight);
		}

		#endregion
	}

	
}


