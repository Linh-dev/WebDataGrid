using Infragistics.Web.UI.EditorControls;
using System;
using System.IO;

namespace Infragistics.Samples.WebUpload
{
    /// <summary>
    /// Class used to delete temporary files uploaded from the WebUpload control in the samples browser
    /// </summary>
    public static class WebUploadEventHandlers
    {
        public static void OnUploadFinishing(object sender, UploadFinishingEventArgs e)
        {
            string filePath = String.Format("{0}{1}", e.FolderPath, e.TemporaryFileName);
            if (File.Exists(filePath))
            {
                try
                {
                    File.Delete(filePath);
                }
                catch (Exception)
                {

                }
            }
        }
    }
}