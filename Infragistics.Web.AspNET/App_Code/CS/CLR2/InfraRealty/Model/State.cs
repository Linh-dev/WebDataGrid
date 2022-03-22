using System.Collections.Generic;

/// <summary>
/// Summary description for State
/// </summary>
public class State
{
	public State()
	{
	}

    private string _state_id;
    public string state_id
    {
        get
        {
            return this._state_id;
        }
        set
        {
            this._state_id = value;
        }
    }

    private string _name;
    public string name
    {
        get
        {
            return this._name;
        }
        set
        {
            this._name = value;
        }
    }

}

public class StateCollection : List<State>
{
    public StateCollection()
    {
    }

}
