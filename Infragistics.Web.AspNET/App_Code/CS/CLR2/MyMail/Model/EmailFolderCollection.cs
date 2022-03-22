using System;
using System.Collections.Generic;
using System.Web;

namespace MyMail
{

    /// <summary>
    /// Summary description for EmailFolderCollection
    /// </summary>
    public class EmailFolderCollection : Dictionary<string, EmailFolder>
    {

        public EmailFolderCollection()
        {
        }


        public static EmailFolder EmtyFolder
        {
            get
            {
                EmailFolder emptyFolder = new EmailFolder();
                emptyFolder.Key = "Empty";
                emptyFolder.FolderName = "Empty";
                return emptyFolder;
            }
        }

        public EmailFolder GetFolderByKey(string key)
        {
            EmailFolder folder = null;

            if (this.ContainsKey(key))
            {
                folder = this[key];
            }
            else
            {
                folder = EmailFolderCollection.EmtyFolder;
            }

            return folder;
        }

    }

}


