
/// <summary>
/// Summary description for RangeFilter
/// </summary>
public class RangeFilter
{
    private const double DEFAULT_VALUE = -1;

    public RangeFilter()
	{
        this._minValue = DEFAULT_VALUE;
        this._maxValue = DEFAULT_VALUE;
	}
    
    public bool IsRangeFilterOn
    {
        get
        {
            return this._minValue != DEFAULT_VALUE && this._maxValue != DEFAULT_VALUE;
        }
    }

    private double _minValue;

    public double MinValue
    {
        get
        {
            return this._minValue;
        }
        set
        {
            this._minValue = value;
        }
    }

    private double _maxValue;

    public double MaxValue
    {
        get
        {
            return this._maxValue;
        }
        set
        {
            this._maxValue = value;
        }
    }
}
