using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusicWeb
{
    public partial class ChangeAvt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnAvt_Click(object sender, EventArgs e)
        {
            User user = (User) Session["user"];
            String linkAvt = xFilePath.Value;
            user.UrlAvt = linkAvt;
            String path = Server.MapPath("users.xml");
            XMLFile.setImgUser(path, user.Id, linkAvt);
            Response.Redirect("HomePage.aspx");

        }
    }
}