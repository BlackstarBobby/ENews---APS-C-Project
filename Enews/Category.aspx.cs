using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enews
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
            }  
        }

        protected void refreshdata()
        {
            int id_categorie = Convert.ToInt32(Request.Params["category"].ToString());

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            
            cmd.CommandText = "select * from  News inner join NewsCategories on News.id = NewsCategories.News_id where NewsCategories.Category_id = @cat";
            cmd.Parameters.AddWithValue("cat", id_categorie);
            
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ListView2.DataSource = ds;
            ListView2.DataBind();  

            con.Close();
        }
    }
}