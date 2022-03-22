using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace MyMail
{

    /// <summary>
    /// Summary description for EmailFolder
    /// </summary>
    public class EmailFolder
    {

        public EmailFolder()
        {
        }

        private string _key;
        public string Key
        {
            get
            {
                return this._key;
            }
            set
            {
                this._key = value;
            }
        }
        
        private string _folderIcon;
        public string FolderIcon
        {
            get
            {
                return this._folderIcon;
            }
            set
            {
                this._folderIcon = value;
            }
        }

        private bool _isInbox;
        public bool IsInbox
        {
            get
            {
                return this._isInbox;
            }
            set
            {
                this._isInbox = value;
            }
        }

        public bool IsSentItemFolder
        {
            get
            {
                return this._key.Equals("SentItems");
            }
        }

        private string _folderName = string.Empty;
        public string FolderName
        {
            get
            {
                return this._folderName;
            }
            set
            {
                this._folderName = value;
            }
        }

        private EmailItemCollection _emailItems = new EmailItemCollection();
        public EmailItemCollection Items
        {
            get
            {
                return this._emailItems;
            }
            set
            {
                this._emailItems = value;
            }
        }

        private EmailFolderCollection _subFolders = new EmailFolderCollection();
        public EmailFolderCollection SubFolders
        {
            get
            {
                return this._subFolders;
            }
            set
            {
                this._subFolders = value;
            }
        }

        private EmailFolder _defaultFolder;

        public void AddSubFolder(EmailFolder child)
        {
            if (child.IsInbox)
            {
                _defaultFolder = child;
            }

            this._subFolders.Add(child.Key, child);
        }

        public void RemoveSubFolder(EmailFolder child)
        {
            this._subFolders.Remove(child.Key);
        }
        
        public IList<EmailItem> Children
        {
            get
            {
                IList<EmailItem> children = new List<EmailItem>();

                foreach (EmailItem item in this.Items.Values)
                {
                    children.Add(item);
                }

                return children;
            }
        }
        
        public void AddEmailItem(EmailItem item)
        {
            item.FolderKey = this._key;
            this._emailItems.Add(item.Id, item);
        }

        public void RemoveEmailItem(EmailItem item)
        {
            item.FolderKey = string.Empty;
            this._emailItems.Remove(item.Id);
        }


        public object GetItemsToDisplay()
        {
            object itemsToDisplay = null;

            if (this.Items.Keys.Count > 0)
            {
                itemsToDisplay = this.Children;
            }
            else
            {
                itemsToDisplay = this.GetEmptyResultSet();
            }

            return itemsToDisplay;
        }

        public int GetNumberOfUnreadItems()
        {
            int numberOfUnreadItems = 0;

            foreach(EmailItem item in this.Children)
            {
                if (item.IsNew)
                {
                    numberOfUnreadItems++;
                }
            }

            return numberOfUnreadItems;
        }


        public void MoveItem(EmailItem item, string destinationFolderKey)
        {
            EmailFolder currentFolder = this.SubFolders.GetFolderByKey(item.FolderKey);
            currentFolder.RemoveEmailItem(item);

            EmailFolder deletedItemsFolder = this.SubFolders.GetFolderByKey(destinationFolderKey);
            deletedItemsFolder.AddEmailItem(item);
        }

        public void DeleteItem(EmailItem item)
        {
            EmailFolder currentFolder = this.SubFolders.GetFolderByKey(item.FolderKey);
            currentFolder.RemoveEmailItem(item);
        }

        private DataTable GetEmptyResultSet()
        {
            DataTable emptyResult = new DataTable();
            emptyResult.Columns.Add("IdValue");
            emptyResult.Columns.Add("FolderKey");
            emptyResult.Columns.Add("Resource");
            emptyResult.Columns.Add("Recipient");
            emptyResult.Columns.Add("Sender");
            emptyResult.Columns.Add("CarbonCopy");
            emptyResult.Columns.Add("Subject");
            emptyResult.Columns.Add("SentDate");
            emptyResult.Columns.Add("FormatedSentDate");
            emptyResult.Columns.Add("Size");
            emptyResult.Columns.Add("HasAttachment");
            emptyResult.Columns.Add("IsNew");
            emptyResult.Columns.Add("IsFlagedImportant");
            emptyResult.Columns.Add("Status");
            emptyResult.Columns.Add("Priority");
            return emptyResult;
        }

        public EmailFolder GetDefaultFolder()
        {
            return this._defaultFolder;
        }

        public void MarkItemRead(int emailId)
        {
            if (this.Items.ContainsKey(emailId))
            {
                this.Items[emailId].MarkMessageRead();
            }
        }


    }

}


