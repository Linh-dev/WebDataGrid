using System;
using System.Drawing;
using System.IO;
using System.Xml.Serialization;

namespace WebSamplesCS.WebCharts.Customization
{
    /// <summary>
    /// This simple class is responsible for loading a Shape File, which contains
    /// the polygon points for the map we are going to draw.
    /// </summary>
	public class ShapeFile
	{
		private PolygonShapeCollection _Shapes = new PolygonShapeCollection();

		public PolygonShapeCollection Shapes
		{
			get
			{
				return _Shapes;
			}
		}

        /// <summary>
        /// Loads the shapes from an external file
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
		public static ShapeFile Load(string filename)
		{
			XmlSerializer serializer = new XmlSerializer(typeof(ShapeFile));
			ShapeFile result = null;
			StreamReader reader = new StreamReader(filename);
			result = Load(reader);
			reader.Close();
			return result;
		} //'Load

        /// <summary>
        /// Loads the shapes from a TextReader
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
		public static ShapeFile Load(TextReader reader)
		{
			XmlSerializer serializer = new XmlSerializer(typeof(ShapeFile));
			ShapeFile result = null;
			result = (ShapeFile)serializer.Deserialize(reader);
			return result;
		} //'Load

        /// <summary>
        /// Save the existing shapes to an XML file
        /// </summary>
        /// <param name="filename"></param>
		public void Save(string filename)
		{
			StreamWriter writer = new StreamWriter(filename);
			XmlSerializer serializer = new XmlSerializer(typeof(ShapeFile));
			serializer.Serialize(writer, this);
			writer.Close();
		} //'Save

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

					foreach(PolygonShape ps in this.Shapes)
					{
						if (ps.Bounds.X < minX)
							minX = ps.Bounds.X;
				
						if (ps.Bounds.Right > maxX)
							maxX = ps.Bounds.Right;
				
						if (ps.Bounds.Y < minY)
							minY = ps.Bounds.Y;
				
						if (ps.Bounds.Bottom > maxY)
							maxY = ps.Bounds.Bottom;
				
					}

					this._Bounds = new Rectangle(minX, minY, maxX - minX, maxY - minY);
					BoundsUptoDate = true;
				}
				return this._Bounds;
			}
		}

		public PolygonShape this[string id]
		{
			get
			{
				return this._Shapes[id];
			}
			set
			{
				this._Shapes[id] = value;
			}
		}
	} //'ShapeFile
}