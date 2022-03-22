using System.Data;
using System.Data.OleDb;
using System.Configuration;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

/// <summary>
/// Summary description for DataAccessHelper
/// </summary>
public class DataAccessHelper
{

    private string _connectionString = string.Empty;

    public DataAccessHelper()
    {
    }


    public TResult ExecuteQuery<TResult>(string commandText, DataCriteria criteria, IDataMapper<TResult> mapper)
    {
        //Quick Fix this code should be reconstructed
        DataRepository manager = new DataRepository();
        string connectionString = string.Empty;//ConfigurationManager.ConnectionStrings[mapper.ConnectString].ConnectionString;
        if (mapper.ConnectString.ToLower().Contains(".mdf")) //hack
        {
            connectionString = manager.GetSqlClientConnectionString(mapper.ConnectString);
        }
        else //hack 2
        {
            if (mapper.ConnectString.ToLower().Contains(".mdb"))
            {
                connectionString = manager.GetMdbConnectionString(mapper.ConnectString);
            }
            else
            {
                connectionString = manager.GetMdbConnectionString(mapper.ConnectString + ".mdb");
            }
        }

        TResult queryResult = default(TResult);
        using (OleDbConnection connection = new OleDbConnection(connectionString))
        {
            connection.Open();
            OleDbCommand command = new OleDbCommand(commandText, connection);
            if (criteria.HasParameters)
            {
                command.Parameters.AddRange(criteria.Parameters);
            }

            IDataReader dbReader = command.ExecuteReader(CommandBehavior.CloseConnection);
            queryResult = mapper.MapData(dbReader);
            dbReader.Close();
            command.Dispose();
        }

        return queryResult;
    }
}
