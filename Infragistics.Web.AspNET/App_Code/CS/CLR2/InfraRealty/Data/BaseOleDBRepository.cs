using System.Data;
using System.Data.OleDb;
using System.Configuration;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;



/// <summary>
/// Summary description for SqlHelper
/// </summary>
public abstract class BaseOleDBRepository<TResult>
{

    private string _connectionString = string.Empty;

    public BaseOleDBRepository()
        : this("Nwind.mdb")
	{
	}

    public BaseOleDBRepository(string mdbFile)
    {
        this._connectionString = new DataRepository().GetMdbConnectionString(mdbFile);
    }
       
    public TResult ExecuteQuery(string commandText, RepositoryCriteria criteria)
    {
        TResult queryResult = default(TResult);
        using (OleDbConnection connection = new OleDbConnection(_connectionString))
        {
            connection.Open();
            OleDbCommand command = new OleDbCommand(commandText, connection);
            if (criteria.HasParameters)
            {
                command.Parameters.AddRange(criteria.Parameters);
            }

            IDataReader dbReader = command.ExecuteReader();
            queryResult = this.MapResult(dbReader);
            dbReader.Close();
            command.Dispose();
        }

        return queryResult;
     }

    protected abstract TResult MapResult(IDataReader dbReader);

}
