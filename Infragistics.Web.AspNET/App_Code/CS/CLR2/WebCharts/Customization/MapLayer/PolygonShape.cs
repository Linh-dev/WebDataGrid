using System;
using System.Collections;
using System.Drawing;
using System.Xml.Serialization;

namespace WebSamplesCS.WebCharts.Customization
{
    /// <summary>
    /// This custom collection allows us to collect the Points 
    /// required for each state polygon into a single location
    /// </summary>
	public class PointCollection : CollectionBase
	{
		public virtual int Add(Point point)
		{
			return this.List.Add(point);
		}

		public virtual Point this[int index]
		{
			get
			{
				return (Point)this.List[index];
			}
			set
			{
				this[index] = value;
			}
		}

        public virtual Point[] ToArray()
        {
            Point[] points = new Point[this.Count];
            for (int current = 0; current < this.Count; current++)
            {
                points[current] = this[current];
            }
            return points;
        }
    }

    /// <summary>
    /// The PolygonShape class contains each states polygon shape,
    /// which is deserialized from an external XML file
    /// </summary>
    public class PolygonShape
	{
		private string _Name;

		[XmlAttribute()]
		public string Name
		{
			get
			{
				return _Name;
			}
			set
			{
				_Name = value;
			}
		}

		private PointCollection _Points = new PointCollection();
		public PointCollection Points
		{
			get
			{
				return _Points;
			}
		}

		private bool BoundsUptoDate = false;
		private Rectangle _Bounds;
		public Rectangle Bounds
		{
			get
			{
				if (!this.BoundsUptoDate)
				{
					int minX = Int32.MaxValue;
					int minY = Int32.MaxValue;
					int maxX = Int32.MinValue;
					int maxY = Int32.MinValue;

	
					foreach(Point p in this._Points)
					{
						if (p.X < minX)
							minX = p.X;
	
						if (p.X > maxX)
							maxX = p.X;
	
						if (p.Y < minY)
							minY = p.Y;
	
						if (p.Y > maxY)
							maxY = p.Y;
					}

					this._Bounds = new Rectangle(minX, minY, maxX - minX, maxY - minY);
					BoundsUptoDate = true;
				}
				return this._Bounds;
			}
		}
	} //'PolygonShape
}
