using System;
using System.Collections.Generic;
using System.Web;

namespace MyMail
{

    /// <summary>
    /// Summary description for EmailItemRepository
    /// </summary>
    public class EmailItemRepository : BaseOleDBRepository<EmailItemCollection>
    {

        public EmailItemRepository()
            : base("MyMail.mdb")
        {
        }


        protected override EmailItemCollection MapResult(System.Data.IDataReader dbReader)
        {
            EmailItemCollection items = new EmailItemCollection();

            while (dbReader.Read())
            {
                EmailItem item = new EmailItem();
                item.Id = dbReader.GetInt32(dbReader.GetOrdinal("EmailItemID"));
                item.FolderKey = dbReader.GetString(dbReader.GetOrdinal("FolderID"));
                item.Subject = dbReader.GetString(dbReader.GetOrdinal("Subject"));
                item.SentDate = dbReader.GetDateTime(dbReader.GetOrdinal("SentDate"));
                item.Recipient = dbReader.GetString(dbReader.GetOrdinal("Recipient"));
                item.Sender = dbReader.GetString(dbReader.GetOrdinal("Sender"));
                item.Size = dbReader.GetInt32(dbReader.GetOrdinal("Size"));
                item.CarbonCopy = dbReader[dbReader.GetOrdinal("CarbonCopy")].ToString();
                item.HasAttachment = dbReader.GetBoolean(dbReader.GetOrdinal("HasAttachment"));
                item.IsFlagedImportant = dbReader.GetBoolean(dbReader.GetOrdinal("IsFlagedImportant"));
                item.Priority = (EmailItem.MessagePriority)Enum.Parse(typeof(EmailItem.MessagePriority), dbReader.GetInt32(dbReader.GetOrdinal("PriorityID")).ToString());
                item.Status = (EmailItem.MessageStatus) Enum.Parse(typeof(EmailItem.MessageStatus), dbReader.GetInt32(dbReader.GetOrdinal("StatusID")).ToString());

                items.Add(item.Id, item);
                    
                    //dbReader.GetInt32(dbReader.GetOrdinal("StatusID")).ToString());
            }

            return items;


        }
    }

}


