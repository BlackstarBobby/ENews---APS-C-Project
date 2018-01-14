using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enews
{
    public partial class Article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id_stire = Convert.ToInt32(Request.Params["article"].ToString());

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            conn.Open();

            cmd.CommandText = "select * from News where id = @id";
            cmd.Parameters.AddWithValue("id", id_stire);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                title.InnerText = reader["title"].ToString();
                image.Src = "Pictures/" + reader["picture"].ToString();
                article.InnerText = reader["content"].ToString();

            }

            conn.Close();
        }
    }
}