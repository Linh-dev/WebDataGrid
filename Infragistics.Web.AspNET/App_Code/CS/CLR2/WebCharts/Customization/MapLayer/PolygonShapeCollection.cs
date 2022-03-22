using System;
using System.Collections;

namespace WebSamplesCS.WebCharts.Customization
{
    /// <summary>
    /// This custom collection is used to store all of the
    /// polygon shapes that we need to draw the US map
    /// </summary>
	public class PolygonShapeCollection : CollectionBase
	{

		public PolygonShape this[string id]
		{
			get
			{
				return SearchForId(id);
			}
			set
			{
				PolygonShape e = SearchForId(id);
				if (e==null)
				{
					this.Add(value);
				}
				else
				{
					this[this.IndexOf(e)] = value;
				}
			}
		}

		private PolygonShape SearchForId(string id)
		{
			PolygonShape result = null;
	
			foreach(PolygonShape ef in this)
			{
				if (ef.Name.Equals(id))
				{
					return ef;
				}
			}

			return result;

		} //'SearchForId


		public PolygonShape this[int index]
		{
			get
			{
				return (PolygonShape)this[index];
			}
			set
			{
				this[index] = value;
			}
		}

		public int Add(PolygonShape value)
		{
			return List.Add(value);
		} //'Add

		public int IndexOf(PolygonShape value)
		{
			return this.IndexOf(value);
		} //'IndexOf

		public void Insert(int index, PolygonShape value)
		{
			this.Insert(index, value);
		} //'Insert

		public void Remove(PolygonShape value)
		{
			this.Remove(value);
		} //'Remove

		public bool Contains(PolygonShape value)
		{
			//' If value is not of type PolygonShape, this will return false.
			return this.Contains(value);
		} //'Contains

	} //'PolygonShapeCollection
}
