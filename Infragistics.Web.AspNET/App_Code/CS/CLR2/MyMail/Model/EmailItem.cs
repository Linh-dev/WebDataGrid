using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace MyMail
{    
    /// <summary>
    /// Summary description for EmailItem
    /// </summary>
    public class EmailItem
    {
        public enum MessagePriority
        {
            Normal = 1,
            High = 2,
            Low = 3
        }

        public enum MessageStatus
        {
            New = 1,
            Open = 2,
            RespondSent = 3,
            Deleted = 4
        }

        public EmailItem()
        {
        }

        private string _folderKey = string.Empty;
        public string FolderKey
        {
            get
            {
                return this._folderKey;
            }
            set
            {
                this._folderKey = value;
            }
        }


        private int _messageId;
        public int Id
        {
            get
            {
                return this._messageId;
            }
            set
            {
                this._messageId = value;
            }
        }

        public string IdValue
        {
            get
            {
                return this._messageId.ToString();
            }
        }


        public string Resource
        {
            get
            {

                string resource = string.Empty;

                if (this.FolderKey.Equals("SentItems"))
                {
                    resource = this._recipient;
                }
                else
                {
                    resource = this.Sender;
                }

                return resource;
            }
        }
        
        private string _recipient = string.Empty;
        public string Recipient
        {
            get
            {
                return this._recipient;
            }
            set
            {
                this._recipient = value;
            }
        }

        private string _sender = string.Empty;
        public string Sender
        {
            get
            {
                return this._sender;
            }
            set
            {
                this._sender = value;
            }
        }

        private string _carbonCopy = string.Empty;
        public string CarbonCopy
        {
            get
            {
                return this._carbonCopy;
            }
            set
            {
                this._carbonCopy = value;
            }
        }

        private string _subject = string.Empty;
        public string Subject
        {
            get
            {
                return this._subject;
            }
            set
            {
                this._subject = value;
            }
        }

        private DateTime _sentDate = default(DateTime);
        public DateTime SentDate
        {
            get
            {
                return this._sentDate;
            }
            set
            {
                this._sentDate = value;
            }
        }

        public string FormatedSentDate
        {
            get
            {
                string formated = @"{0} : {1}";
                System.Globalization.CultureInfo ci = System.Threading.Thread.CurrentThread.CurrentUICulture;

                if (ci.Name == "ja-JP")
                    formated = String.Format(formated, ci.DateTimeFormat.ShortDatePattern, "ddd");
                else
                    formated = String.Format(formated, "ddd", ci.DateTimeFormat.ShortDatePattern);

                return this._sentDate.ToString(formated); //this._sentDate.DayOfWeek + " " + _sentDate.ToShortDateString();
            }
        }

        private int _size = 0;
        public int Size
        {
            get
            {
                return this._size;
            }
            set
            {
                this._size = value;
            }
        }

        public string FormatedSize
        {
            get
            {
                return string.Format("{0} KB", this._size);
            }
        }

        private bool _hasAttachment = false;
        public bool HasAttachment
        {
            get
            {
                return this._hasAttachment;
            }
            set
            {
                this._hasAttachment = value;
            }
        }

        public bool IsNew
        {
            get
            {
                return this._status == MessageStatus.New;
            }
        }

        private MessageStatus _status;
        public MessageStatus Status
        {
            get
            {
                return this._status;
            }
            set
            {
                this._status = value;
            }
        }

        private bool _isFlagedImportant = false;
        public bool IsFlagedImportant
        {
            get
            {
                return this._isFlagedImportant;
            }
            set
            {
                this._isFlagedImportant = value;
            }
        }

        private MessagePriority _priority = MessagePriority.Normal;
        public MessagePriority Priority
        {
            get
            {
                return this._priority;
            }
            set
            {
                this._priority = value;
            }
        }

        public void MarkMessageRead()
        {
            this._status = MessageStatus.Open;
        }

        public void MarkMessageDeleted()
        {
            this._status = MessageStatus.Deleted;
        }

        public void RestoreMessage()
        {
            this._status = MessageStatus.Open;
        }

        public void FlagMessage()
        {
            this._isFlagedImportant = true;
        }

        public void ClearFlag()
        {
            this._isFlagedImportant = false;
        }

    }

}

