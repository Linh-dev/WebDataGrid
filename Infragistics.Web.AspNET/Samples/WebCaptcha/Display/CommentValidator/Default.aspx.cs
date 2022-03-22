using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebCaptcha_Demo_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    public class Comment
    {
        private int _commentNumber;
        public int CommentNumber
        {
            get
            {
                return _commentNumber;
            }
            set
            {
                _commentNumber = value;
            }
        }
        private DateTime _commentDate;
        public DateTime CommentDate
        {
            get
            {
                return _commentDate;
            }
            set
            {
                _commentDate = value;
            }
        }
        private string _commentText;
        public string CommentText
        {
            get
            {

                return _commentText;
            }
            set
            {
                _commentText = value;
            }
        }
        private string _posterName;
        public string PosterName
        {
            get
            {

                return _posterName;
            }
            set
            {
                _posterName = value;
            }
        }

        public Comment(string posterName, string commentText, DateTime commentDate, int commentNubmer)
        {
            this._commentDate = commentDate;
            this._commentText = commentText;
            this._posterName = posterName;
            this._commentNumber = commentNubmer;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.GetData();
    }

    protected List<Comment> Comments
    {
        get { return Session["comm"] != null ? (List<Comment>)Session["comm"] : new List<Comment>(); }
        set { Session["comm"] = value; }
    }

    protected void postBtn_click(object sender, EventArgs e)
    {

        if (this.WebCaptcha1.IsValid && !(this.TextComment.Text == null || this.TextComment.Text.Trim() == string.Empty) && !(this.TextName.Text == null || this.TextName.Text.Trim() == string.Empty))
        {
            Comment newComment = new Comment(this.TextName.Text, this.TextComment.Text, DateTime.Now, Comments.Count);
            List<Comment> comm = Comments;
            comm.Add(newComment);
            Comments = comm;

            this.GetData();

            this.TextComment.Text = "";
            this.TextName.Text = "";

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("ScenarioFadeAnimation(\"");
            sb.Append(newComment.CommentNumber);
            sb.Append("\");");

            ScriptManager.RegisterStartupScript(CommentUpdatePanel, CommentUpdatePanel.GetType(), "id", sb.ToString(), true);
        }
    }

    protected void GetData()
    {
        List<Comment> comments = (List<Comment>)Session["comm"];
        Repeater1.DataSource = comments;
        Repeater1.DataBind();

    }
}