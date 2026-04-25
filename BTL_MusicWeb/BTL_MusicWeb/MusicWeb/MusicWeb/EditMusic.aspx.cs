using System;
using System.Collections.Generic;
using System.Linq;

namespace MusicWeb
{
    public partial class EditMusic : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] == null)
            {
                Response.Redirect("LogIn.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];

                if (id != null)
                {
                    LoadMusic(id);
                }
            }

        }

        void LoadMusic(string id)
        {

            string path = Server.MapPath("~/musics.xml");

            List<Musics> list = XMLFile.getMusicListInXML(path);

            Musics song = list.FirstOrDefault(x => x.IdMusic == id);

            if (song != null)
            {

                hdIdMusic.Value = song.IdMusic;

                txtName.Text = song.NameMusic;

                txtSinger.Text = song.SingerName;

                txtMp3.Text = song.Mp3Url;

                txtImg.Text = song.ImgUrl;

                ddlAlbum.SelectedValue = song.Album;

            }

        }

        protected void save_Click(object sender, EventArgs e)
        {

            string path = Server.MapPath("~/musics.xml");

            List<Musics> list = XMLFile.getMusicListInXML(path);

            foreach (Musics m in list)
            {

                if (m.IdMusic == hdIdMusic.Value)
                {

                    m.NameMusic = txtName.Text;

                    m.SingerName = txtSinger.Text;

                    m.Mp3Url = txtMp3.Text;

                    m.ImgUrl = txtImg.Text;

                    m.Album = ddlAlbum.SelectedValue;

                }

            }

            XMLFile.saveListMusic(path, list);

            Response.Redirect("YourSong.aspx");

        }

    }
}