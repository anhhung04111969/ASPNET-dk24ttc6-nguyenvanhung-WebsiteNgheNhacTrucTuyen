using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusicWeb
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                showName.Text = Session["username"].ToString();
            }
        }

        protected void Log_In(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                Response.Write("<script> alert('You are already logged in!') </script>");
            }
        }

        protected void Log_Out(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Session["user"] = null;
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                Response.Write("<script> alert('You are not logged in!') </script>");
            }
        }
    }
}