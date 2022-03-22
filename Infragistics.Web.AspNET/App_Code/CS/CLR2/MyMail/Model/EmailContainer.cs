using System;
using System.Collections.Generic;
using System.Web;

namespace MyMail
{

    /// <summary>
    /// Summary description for EmailContainer
    /// </summary>
    public class EmailContainer
    {

        public EmailContainer(string userName)
        {
            this._userName = userName;
        }

        private string _userName;

        public string UserName
        {
            get { return this._userName; }
        }

        private EmailFolderCollection _emailFolders = new EmailFolderCollection();

        public EmailFolderCollection Folders
        {
            get
            {
                return this._emailFolders;
            }
            set
            {
                this._emailFolders = value;
            }
        }

        public void AddFolder(EmailFolder folder)
        {
            this._emailFolders.Add(folder.Key, folder);
        }

        public int GetNumberOfUnreadItems()
        {
            int numberOfUnreadItems = 0;

            EmailFolder defaultfolder = this.Folders["Root"].SubFolders.GetFolderByKey("Inbox");

            if (defaultfolder != null)
            {
                numberOfUnreadItems = defaultfolder.GetNumberOfUnreadItems();
            }

            return numberOfUnreadItems;
        }


    }

}


