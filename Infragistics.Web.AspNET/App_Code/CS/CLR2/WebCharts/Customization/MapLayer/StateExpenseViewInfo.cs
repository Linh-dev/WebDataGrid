using System;

namespace WebSamplesCS.WebCharts.Customization
{
    /// <summary>
    /// This class simply serves as a simple placeholder for our state dummy data
    /// </summary>
	public class StateExpenseViewInfo
	{
		#region Private Member Variables
		private string _State = "";
		private double _Amount = 0.0;
		#endregion

		#region Constructors
		public StateExpenseViewInfo(string state, double amount, string category)
		{
			_State = state;
			_Amount = amount;
		}

        #endregion

        #region Public Properties
		public string State
		{
			get
			{
				return _State;
			}
		
			set
			{
				_State = value;
			}
		}

		public double Amount
		{
			get
			{
				return _Amount;
			}
	
			set
			{
				_Amount = value;
			}
		}	

		#endregion
	}	
}
