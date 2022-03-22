using System;
using System.Collections.Generic;
using System.Web;
using System.Resources;
using System.Reflection;
using System.IO;
using System.Text.RegularExpressions;
using System.Text;

/// <summary>
/// Summary description for Common
/// </summary>
public class Common
{
    
    public enum DataSourceTypes
    {
        AccessDataSource,
        DataTable,
        Xml,
        ICollection,
        IBindingList,
        IEnumerable,
        DataSet
    }


    public static StreamReader ProcessSource(StreamReader SR)
    {
            string translated_val = "";
            string sourceCode = SR.ReadToEnd();

            MatchCollection mc = Regex.Matches(sourceCode, @"<%[=$].*Resources[.:].*[.,].*%>", RegexOptions.IgnoreCase);
            if (mc.Count>0)
            {
                string basename, key, resource_string;
                
                foreach (Match m in mc)
                {
                    resource_string = m.Value;

                    string[] resourcesOnOneRow = resource_string.Split(new string[] { "<%" }, StringSplitOptions.RemoveEmptyEntries);

                    if (resourcesOnOneRow.Length > 1)
                    {
                        foreach (string r in resourcesOnOneRow)
                        { 
                            string oldString = "<%" +r;
                            Match sub_m = Regex.Match(oldString, @"<%[=$].*Resources[.:].*[.,].*%>", RegexOptions.IgnoreCase);
                            if (sub_m.Success)
                            {
                                resource_string = sub_m.Value;
                                if (resource_string.Contains("$"))
                                {
                                    resource_string = resource_string.Replace("<%$", "").Replace("%>", "").Replace(":", ".").Trim();

                                    string[] basekey = resource_string.Split(",".ToCharArray());
                                    basename = basekey[0].Trim().Replace(" ", "");
                                    key = basekey[1].Trim();
                                }
                                else
                                {
                                    resource_string = resource_string.Replace("<%=", "").Replace("%>", "").Trim();

                                    int idx = resource_string.LastIndexOf(".");
                                    basename = resource_string.Substring(0, idx);
                                    idx++;
                                    key = resource_string.Substring(idx, resource_string.Length - idx);
                                }

                                translated_val = Common.GetResourceValue(basename.Trim(), key.Trim());
                                sourceCode = sourceCode.Replace(sub_m.Value, translated_val);
                            }
                        }

                        continue;
                    }
                    
                    if (resource_string.Contains("$"))
                    {
                        resource_string = resource_string.Replace("<%$", "").Replace("%>", "").Replace(":", ".").Trim();

                        string[] basekey = resource_string.Split(",".ToCharArray());
                        basename = basekey[0].Trim().Replace(" ","");
                        key = basekey[1].Trim();
                    }
                    else
                    {
                        resource_string = resource_string.Replace("<%=", "").Replace("%>", "").Trim();
                        
                        int idx = resource_string.LastIndexOf(".");
                        basename = resource_string.Substring(0, idx);
                        idx++;
                        key = resource_string.Substring(idx, resource_string.Length - idx);
                    }

                    translated_val = Common.GetResourceValue(basename.Trim(), key.Trim());
                    sourceCode = sourceCode.Replace(m.Value, translated_val);
                }
            }

            return new StreamReader(new MemoryStream(Encoding.UTF8.GetBytes(sourceCode)));
            
    }


    private static string GetResourceValue(string basename, string key)
    {
        ResourceManager rm;

        /*
        We are referencing the App_GlobalResources.dll which is generated automatically when using  the website project type.  
        */

        rm = new ResourceManager(basename, Assembly.Load("App_GlobalResources"));

        string value = rm.GetString(key);

        if(!string.IsNullOrEmpty(value)){
            return value;
        }

        return null;
        
    }
}
