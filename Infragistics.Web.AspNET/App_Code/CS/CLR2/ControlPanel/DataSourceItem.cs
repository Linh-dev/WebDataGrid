
/// <summary>
/// Summary description for DataSourceItem
/// </summary>
public class DataSourceItem
{
	public DataSourceItem(string value, string description)
	{
        this.sourceValue = value;
        this.description = description;
	}

    private string sourceValue = string.Empty;
    public string Value
    {
        get
        {
            return this.sourceValue;
        }
    }

    private string description = string.Empty;
    public string Description
    {
        get
        {
            return this.description;
        }
    }


}
