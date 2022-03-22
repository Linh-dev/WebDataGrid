using System.Data;

/// <summary>
/// Summary description for StateRepository
/// </summary>
public class StateRepository : BaseOleDBRepository<StateCollection>
{
	public StateRepository()
	{
	}

    protected override StateCollection MapResult(IDataReader dbReader)
    {
        StateCollection states = new StateCollection();

        while (dbReader.Read())
        {
            State state = new State();
            state.state_id = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_STATEID));
            state.name = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_NAME));
            states.Add(state);
        }

        return states;


    }
}
