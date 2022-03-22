using System;
using System.Collections.Generic;
using System.Web;

namespace MyMail
{

    /// <summary>
    /// Summary description for EmailCommand
    /// </summary>
    public class EmailCommand
    {

        private EmailContainer _container;
        
        public EmailCommand()
        {
            LoadData("Demo User");
        }

        public EmailContainer GetEmailForUser(string userName)
        {
            return this._container;
        }

        private void LoadFolders(string userName)
        {
            this._container = new EmailContainer(userName);

            string CommandText = "SELECT [FolderID], [FolderName], [FolderIcon], [IsDefault], [ParentFolder] FROM [Folder] ORDER BY [SortOrder]";
            this._container.Folders = new EmailFolderRepository().ExecuteQuery(CommandText, new RepositoryCriteria());
        }

        private void LoadItems()
        {

            EmailFolder rootFolder = this._container.Folders["Root"];

            string CommandText = "SELECT [EmailItemID], [Recipient], [Sender], [CarbonCopy], [Subject], [SentDate], [Size], [HasAttachment], [IsFlagedImportant], [FolderID], [PriorityID], [StatusID] FROM [Item]";
            EmailItemCollection items = new EmailItemRepository().ExecuteQuery(CommandText, new RepositoryCriteria());

            foreach (EmailItem item in items.Values)
            {
                EmailFolder folder = rootFolder.SubFolders[item.FolderKey];

                if (folder != null)
                {
                    folder.AddEmailItem(item);
                }
            }
        }


        private void LoadData(string userName)
        {

            if (HttpContext.Current.Session["EmailCache"] == null)
            {

                this.LoadFolders(userName);
                this.LoadItems();

                HttpContext.Current.Session.Add("EmailCache", this._container);
            }
            else
            {
                this._container = HttpContext.Current.Session["EmailCache"] as EmailContainer;
            }
        }

        public int MarkItemRead(int emailId)
        {
            EmailFolder inboxFolder = this.GetDefaultFolder();
            inboxFolder.MarkItemRead(emailId);

            int numberOfItemsRead = this._container.GetNumberOfUnreadItems();
            return numberOfItemsRead;
        }

        public EmailFolder GetDefaultFolder()
        {
            return GetDefaultFolder(false);
        }

        public EmailFolder GetDefaultFolder(bool noCache)
        {
            EmailFolder folder = null;

            if (noCache)
            {
                this.LoadFolders("DemoUser");
                this.LoadItems();
                folder = this._container.Folders["Root"].GetDefaultFolder();
            }
            else
            {
                EmailFolder parentFolder = this._container.Folders.GetFolderByKey("Root");
                folder = parentFolder.SubFolders.GetFolderByKey("Inbox");
            }

            return folder;
        }

        public EmailFolder GetEmailFolderByKey(string key)
        {
            EmailFolder parentFolder = this._container.Folders.GetFolderByKey("Root");
            return parentFolder.SubFolders.GetFolderByKey(key);
        }

        public void DeleteEmailItem(EmailItem item)
        {

            if (item != null)
            {
                EmailFolder parentFolder = this._container.Folders.GetFolderByKey("Root");

                if (item.FolderKey.Equals("DeletedItems"))
                {
                    parentFolder.DeleteItem(item);
                }
                else
                {
                    parentFolder.MoveItem(item, "DeletedItems");
                }

            }

        }

    }

}


