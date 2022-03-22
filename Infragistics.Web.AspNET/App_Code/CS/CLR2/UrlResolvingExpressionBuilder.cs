using System;
using System.Web.UI;
using System.Web.Compilation;
using System.CodeDom;
using System.Web.Util;
using System.Web;
using System.Web.Configuration;

public class UrlResolvingExpressionBuilder: AppSettingsExpressionBuilder
{
    /// <summary>
    /// override the base GetCodeExpression, to redirect processing to our method
    /// </summary>
    /// <param name="entry"></param>
    /// <param name="parsedData"></param>
    /// <param name="context"></param>
    /// <returns></returns>
    public override CodeExpression GetCodeExpression(BoundPropertyEntry entry, object parsedData, ExpressionBuilderContext context)
    {
        if ((entry.DeclaringType == null) || (entry.PropertyInfo == null))
        {
            return new CodeMethodInvokeExpression(new CodeTypeReferenceExpression(base.GetType()), "GetResolvedUrl", new CodeExpression[] { new CodePrimitiveExpression(entry.Expression.Trim()) });
        }
        return new CodeMethodInvokeExpression(new CodeTypeReferenceExpression(base.GetType()), "GetResolvedUrl", new CodeExpression[] { new CodePrimitiveExpression(entry.Expression.Trim()), new CodeTypeOfExpression(entry.DeclaringType), new CodePrimitiveExpression(entry.PropertyInfo.Name) });
    }
    /// <summary>
    /// Resolve the value into a relative url
    /// </summary>
    /// <param name="key"></param>
    /// <param name="targetType"></param>
    /// <param name="propertyName"></param>
    /// <returns>A relative url, based on the appSettings entry</returns>
    public static object GetResolvedUrl(string key, Type targetType, string propertyName)
    {
        //Find out what our application root is
        string dir=HttpContext.Current.Request.ApplicationPath;
        //Get the appsetting from the web.config.  We'll leverage the AppSettingExpressionBuilder to do this for us.
        string val=AppSettingsExpressionBuilder.GetAppSetting(key,targetType,propertyName) as string;
        //If our URL is application relative, let's resolve the "~/" into our app root.
        if(val.StartsWith("~/"))
        {
            val=val.Substring(2);
            if(!dir.EndsWith("/"))dir=dir+"/";
            val=dir+val;
        }
        return val;
    }
    public static object GetResolvedUrl(string key)
    {
        //Call Overloaded method with null params
        return GetResolvedUrl(key,null,null);
    }
    public override bool SupportsEvaluate
    {
        get
        {
            return true;
        }
    }
    public override object EvaluateExpression(object target, BoundPropertyEntry entry, object parsedData, ExpressionBuilderContext context)
    {
        return GetResolvedUrl(entry.Expression, target.GetType(), entry.PropertyInfo.Name);
    }

}

