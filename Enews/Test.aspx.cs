using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enews.Editor
{
    public partial class Test : System.Web.UI.Page
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

                Select1.DataSource = ds;
                Select1.DataTextField = "display";
                Select1.DataValueField = "Id";
                Select1.DataBind();
            }
          
        }

        protected void TestSel(object sender, EventArgs e)
        {
            Label1.Text = Select1.Value;
        }
    }
}