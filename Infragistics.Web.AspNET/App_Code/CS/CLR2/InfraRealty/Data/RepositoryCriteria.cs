using System.Collections.Generic;
using System.Data.OleDb;
using System.Text;

/// <summary>
/// Summary description for RepositoryCriteria
/// </summary>
public class RepositoryCriteria
{
    private List<OleDbParameter> _dataParameters = new List<OleDbParameter>();

    private StringBuilder _whereClause = new StringBuilder();

    public RepositoryCriteria()
    {
    }

    public OleDbParameter[] Parameters
    {
        get
        {
            return this._dataParameters.ToArray();
        }
    }

    public bool HasParameters
    {
        get
        {
            return this._dataParameters.Count > 0;
        }
    }


    public void StartFilter()
    {
        this._whereClause.Append(InfraRealtyCommon.SQL_CRITERIABUIDLER_CONDITION_START);
    }

    public void EndFilter()
    {
        this._whereClause.Append(InfraRealtyCommon.SQL_CRITERIABUIDLER_CONDITION_END);
    }

    public void AddCondtionAnd()
    {
        this._whereClause.Append(InfraRealtyCommon.SQL_CRITERIABUIDLER_CONDITION_AND);
    }

    public void AddCondtionOr()
    {
        this._whereClause.Append(InfraRealtyCommon.SQL_CRITERIABUIDLER_CONDITION_OR);
    }

    private void AddParameter(OleDbParameter parameter, string value, string condtion)
    {
        parameter.Value = value;
        _dataParameters.Add(parameter);

         this._whereClause.Append(condtion);
    }

    public void AddStringParameter(CriteriaParameter parameter)
    {
        AddParameter(new OleDbParameter(parameter.Name, OleDbType.VarChar, parameter.Length), parameter.Value, parameter.Condtion);
    }

    public void AddCharParameter(CriteriaParameter parameter)
    {
        AddParameter(new OleDbParameter(parameter.Name, OleDbType.Char, parameter.Length), parameter.Value, parameter.Condtion);
    }

    public void AddIntParameter(CriteriaParameter parameter)
    {
        AddParameter(new OleDbParameter(parameter.Name, OleDbType.Integer), parameter.Value, parameter.Condtion);
    }

    public void AddMoneyParameter(CriteriaParameter parameter)
    {
        AddParameter(new OleDbParameter(parameter.Name, OleDbType.Currency), parameter.Value, parameter.Condtion);
    }

    public string GetWhereClause()
    {
        return InfraRealtyCommon.SQL_CRITERIABUIDLER_WHERE + this._whereClause.ToString();
    }


}
