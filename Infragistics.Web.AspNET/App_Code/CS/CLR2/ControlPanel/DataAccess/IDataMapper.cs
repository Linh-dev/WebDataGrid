using System.Data;
using System.Data.OleDb;
using System.Configuration;

/// <summary>
/// Summary description for IDataMapper
/// </summary>
public interface IDataMapper<TResult>
{
    string ConnectString { get; }

    TResult MapData(IDataReader dbReader);
}
