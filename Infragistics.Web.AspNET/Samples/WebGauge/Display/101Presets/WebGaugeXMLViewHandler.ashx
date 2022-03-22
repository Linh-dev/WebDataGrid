<%@ WebHandler Language="C#" Class="WebGaugeXMLViewHandler" %>

using System;
using System.Web;

public class WebGaugeXMLViewHandler : IHttpHandler
{

    private const string IGGAUGE_STRING = "<igGauge:UltraGauge";
    private const string XMLNS_IGGAUGE_STRING = " xmlns:igGauge=\"IG\" ";
    private const string XMLNS_IGGAUGEPROP_STRING = " xmlns:igGaugeProp=\"IG\" ";
    
    public void ProcessRequest (HttpContext context) {

        string xmlDocPath = context.Request.QueryString["xmlDocPath"];

        if (String.IsNullOrEmpty(xmlDocPath) || !System.IO.File.Exists(context.Server.MapPath(xmlDocPath)))
        {
            context.Response.Write("Sorry Bad Request!");
            return;
        }

        string xml = "";
        using (System.IO.StreamReader fs = System.IO.File.OpenText(context.Server.MapPath(xmlDocPath)))
        {
            xml = fs.ReadToEnd();
        }

        int igGauge = xml.IndexOf(IGGAUGE_STRING) + IGGAUGE_STRING.Length;
        xml = xml.Insert(igGauge, XMLNS_IGGAUGE_STRING).Insert(igGauge + XMLNS_IGGAUGE_STRING.Length, XMLNS_IGGAUGEPROP_STRING);
        
        context.Response.ContentType = "text/xml";
        context.Response.Write(xml);               
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}