using System;
using System.Web.UI;

namespace MusicWeb
{
    public partial class UpMusic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userID = Session["username"].ToString();
            string nameMusic = nameMs.Value.Trim();
            string musicSinger = singerMs.Value.Trim();
            string mp3Url = xFileMusicPath.Value.Trim();
            string imgUrl = xFilePath.Value.Trim();
            string albumName = DropDownList1.SelectedValue;
            Random rd = new Random();
            string musicID = "" + (100000 + rd.Next(899999));

            if (!string.IsNullOrEmpty(nameMusic) &&
                !string.IsNullOrEmpty(musicSinger) &&
                !string.IsNullOrEmpty(mp3Url))
            {
                if (string.IsNullOrEmpty(imgUrl))
                {
                    imgUrl = "/Picture/logoMusic.jpg";
                }

                Musics musics = new Musics(musicID, userID, nameMusic, mp3Url, imgUrl, musicSinger, "", albumName);
                string path = Server.MapPath("~/musics.xml");

                if (XMLFile.addMusicToList(path, musics))
                {
                    Response.Redirect("YourSong.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Upload song fail!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Vui lòng nhập đầy đủ thông tin!');</script>");
            }
        }
    }
}