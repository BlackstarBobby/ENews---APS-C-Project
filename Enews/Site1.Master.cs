using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enews
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (HttpContext.Current.User.IsInRole("Admin"))
                {
                    admin_link1.Visible = true;
                    admin_link2.Visible = true;
                    editor_link.Visible = true;
                }
                else if (HttpContext.Current.User.IsInRole("Editor"))
                {
                    admin_link1.Visible = false;
                    admin_link2.Visible = false;
                    editor_link.Visible = true;
                }
                else
                {
                    admin_link1.Visible = false;
                    admin_link2.Visible = false;
                    editor_link.Visible = false;
                }
            }
            else
            {
                admin_link1.Visible = false;
                admin_link2.Visible = false;
                editor_link.Visible = false;
            }
        }
    }
}