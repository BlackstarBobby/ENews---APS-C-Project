using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.IO;

namespace Enews.Editor
{
    public partial class CreatePost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                string query = "select id, display from Categories";

                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                DataSet ds = new DataSet();
                sda.Fill(ds, "Categories");

                categories.DataSource = ds;
                categories.DataTextField = "display";
                categories.DataValueField = "Id";
                categories.DataBind();
            }
        }


        protected void StorePost(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand();

            string filename = "";


            if (FileUpload1.HasFile)
            {
                try
                {
                    filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Pictures/") + filename);

                }
                catch (Exception ex)
                {

                }
            }

            var currentUser = Membership.GetUser(User.Identity.Name);
            //string username = currentUser.UserName;
            string username = User.Identity.Name;
            //Guid userID = (Guid)Membership.GetUser().ProviderUserKey;
            ;

            cmd.CommandText = "insert into News (title, content, picture, created_by) values(@title, @content, @filename, @created)" + "Select cast( Scope_identity() as int)";

            cmd.Parameters.AddWithValue("title", title.Text);
            cmd.Parameters.AddWithValue("content", Request.Form["content"]);
            cmd.Parameters.AddWithValue("filename", filename);
            cmd.Parameters.AddWithValue("created", username);

            cmd.Connection = conn;
            conn.Open();

            int id = (int)cmd.ExecuteScalar();

            cmd.CommandText = "insert into NewsCategories (News_ID, Category_ID) values (@n_id, @c_id)";
            cmd.Parameters.AddWithValue("n_id", id);
            cmd.Parameters.AddWithValue("c_id", int.Parse(categories.Value));

            cmd.ExecuteNonQuery();

            conn.Close();

            Response.Redirect("~/Default.aspx");


        }

    }
}