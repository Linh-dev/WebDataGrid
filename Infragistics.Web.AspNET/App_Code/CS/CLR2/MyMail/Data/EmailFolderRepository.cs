using System;
using System.Collections.Generic;
using System.Web;

namespace MyMail
{

    /// <summary>
    /// Summary description for EmailFolderRepository
    /// </summary>
    public class EmailFolderRepository : BaseOleDBRepository<EmailFolderCollection>
    {
        public EmailFolderRepository() : base("MyMail.mdb")
        {
        }

        protected override EmailFolderCollection MapResult(System.Data.IDataReader dbReader)
        {

            EmailFolderCollection topFolders = new EmailFolderCollection();

            while (dbReader.Read())
            {
                EmailFolder folder = new EmailFolder();
                folder.Key = dbReader.GetString(dbReader.GetOrdinal("FolderID"));
                folder.FolderName = dbReader.GetString(dbReader.GetOrdinal("FolderName"));
                folder.FolderIcon = dbReader.GetString(dbReader.GetOrdinal("FolderIcon"));
                folder.IsInbox = dbReader.GetBoolean(dbReader.GetOrdinal("IsDefault"));
                string parentFolder = dbReader[dbReader.GetOrdinal("ParentFolder")].ToString();

                if (string.IsNullOrEmpty(parentFolder.Trim()))
                {
                    topFolders.Add(folder.Key, folder);
                }
                else
                {
                    EmailFolder parent = topFolders[parentFolder];
                    parent.AddSubFolder(folder);
                }

            }

            return topFolders;
        }

    }

}


