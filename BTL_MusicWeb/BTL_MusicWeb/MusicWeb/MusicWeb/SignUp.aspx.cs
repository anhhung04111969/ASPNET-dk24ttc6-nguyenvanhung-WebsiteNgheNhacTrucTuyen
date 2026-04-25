using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace MusicWeb
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(email))
            {
                Response.Write("<script>alert('Vui lòng nhập đầy đủ thông tin!');</script>");
                return;
            }

            string filePath = Server.MapPath("~/App_Data/users.xml");

            if (!File.Exists(filePath))
            {
                Directory.CreateDirectory(Server.MapPath("~/App_Data"));

                XDocument newDoc = new XDocument(
                    new XElement("users")
                );

                newDoc.Save(filePath);
            }

            XDocument doc = XDocument.Load(filePath);

            bool userExists = doc.Descendants("user")
                                 .Any(x => (string)x.Element("username") == username);

            if (userExists)
            {
                Response.Write("<script>alert('Tên đăng nhập đã tồn tại!');</script>");
                return;
            }

            doc.Root.Add(
                new XElement("user",
                    new XElement("username", username),
                    new XElement("password", password),
                    new XElement("email", email)
                )
            );

            doc.Save(filePath);

            Response.Write("<script>alert('Đăng ký thành công!'); window.location='LogIn.aspx';</script>");
        }
    }
}