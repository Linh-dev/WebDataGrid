using System;
using System.Collections.Generic;
using System.Data.SqlClient;


using Infragistics.Web.UI.EditorControls;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebDataGrid1.DataSource = GetData();
        this.WebDataGrid1.DataBind();
    }

    public void TextBox1_TextChanged(object sender, EventArgs e)
    {
        List<Movie> movies = this.WebDataGrid1.DataSource as List<Movie>;

        WebNumericEditor textBox1 = sender as WebNumericEditor;

        int origIndex = int.Parse(this.Hidden1.Value);
        int newIndex = int.Parse(textBox1.Text);

        Movie movie = movies[origIndex];
        movies.RemoveAt(origIndex);
        movies.Insert(newIndex, movie);

        this.WebDataGrid1.Rows.Clear();

        this.WebDataGrid1.DataSource = movies;
        this.WebDataGrid1.DataBind();
    }

    public void WebDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        WebRating ratingControl = e.Row.Items[3].FindControl("WebRating1") as WebRating;

        List<Movie> movies = this.WebDataGrid1.DataSource as List<Movie>;

        ratingControl.Value = movies[e.Row.Index].Rating;

        WebNumericEditor editor = e.Row.Items[0].FindControl("WebNumericEditor1") as WebNumericEditor;
        editor.Text = e.Row.Index.ToString();
    }

    protected void WebRating1_Rated(object sender, Infragistics.Web.UI.EditorControls.RatingRatedEventArgs e)
    {
        WebRating activeRating = sender as WebRating;
        List<Movie> movies = this.WebDataGrid1.DataSource as List<Movie>;

        Movie m = null;
        int i = 0;
        while (m == null && i < movies.Count)
        {
            m = movies[i++];
            if (m.Title != this.Hidden1.Value)
                m = null;
        }
        if (m != null)
        {
            m.Rating = activeRating.Value;
            activeRating.RatingImage.SelectedImageCssClass = "hoveredRating";
        }
    }
    private string GetConnectionString()
    {
        DataRepository manager = new DataRepository();
        return manager.GetSqlClientConnectionString("SamplesDB.mdf");
    }
    private List<Movie> GetData()
    {
        SqlConnection con = new SqlConnection(this.GetConnectionString());
        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM [mov].[Movies]";

        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        List<Movie> movies = new List<Movie>();
        while (reader.Read())
        {
            movies.Add(new Movie(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetDouble(3)));
        }
        con.Close();

        return movies;
    }

    private class Movie
    {
        private int movieId;

        public int MovieID
        {
            get { return movieId; }
            set { movieId = value; }
        }

        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        private string genre;

        public string Genre
        {
            get { return genre; }
            set { genre = value; }
        }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set { rating = value; }
        }

        public Movie(int movieId, string title, string genre, double rating)
        {
            this.movieId = movieId;
            this.title = title;
            this.genre = genre;
            this.rating = rating;
        }
    }
}
