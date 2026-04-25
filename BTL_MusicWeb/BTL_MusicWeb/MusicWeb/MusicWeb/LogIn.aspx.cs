using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace MusicWeb
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Vui lòng nhập đầy đủ tài khoản và mật khẩu!');</script>");
                return;
            }

            string filePath = Server.MapPath("~/App_Data/users.xml");

            if (!File.Exists(filePath))
            {
                Response.Write("<script>alert('Chưa có dữ liệu tài khoản!');</script>");
                return;
            }

            XDocument doc = XDocument.Load(filePath);

            var user = doc.Descendants("user")
                          .FirstOrDefault(x =>
                              (string)x.Element("username") == username &&
                              (string)x.Element("password") == password);

            if (user != null)
            {
                Session["username"] = username;
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Tài khoản hoặc mật khẩu không đúng!');</script>");
            }
        }
    }
}