using System.Collections.Generic;

/// <summary>
/// Summary description for CriteriaParameter
/// </summary>
public class CriteriaParameter
{
    public CriteriaParameter(string name, int length, string value, string condtion)
	{
        this._name = name;
        this._length = length;
        this._value = value;
        this._condtion = condtion;
	}

    private string _name;
    public string Name
    {
        get
        {
            return this._name;
        }
    }

    private int _length;
    public int Length
    {
        get
        {
            return this._length;
        }
    }

    private string _value;
    public string Value
    {
        get
        {
            return this._value;
        }
    }

    private string _condtion;
    public string Condtion
    {
        get
        {
            return this._condtion;
        }
    }


}

public class CriteriaParameterCollection : List<CriteriaParameter>
{
    public CriteriaParameterCollection()
    {
    }

}