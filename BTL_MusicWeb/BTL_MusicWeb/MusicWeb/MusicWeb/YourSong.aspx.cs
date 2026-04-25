using System;
using System.Collections.Generic;

namespace MusicWeb
{
    public partial class YourSong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LogIn.aspx");
                return;
            }

            if (Request.Form["Delete"] != null)
            {
                DeleteSong();
                return;
            }

            if (!IsPostBack)
            {
                LoadYourSongs();
            }
        }

        private void LoadYourSongs()
        {
            string idKey = Session["username"].ToString();
            string path = Server.MapPath("~/musics.xml");
            List<Musics> listSong = XMLFile.getMusicListInXML(path);

            List<Musics> yourSong = new List<Musics>();

            foreach (Musics musics in listSong)
            {
                if (musics.IdUser == idKey)
                {
                    yourSong.Add(musics);
                }
            }

            YourMusic.DataSource = yourSong;
            YourMusic.DataBind();
        }

        private void DeleteSong()
        {
            string path = Server.MapPath("~/musics.xml");
            string idMusic = Request.Form["Delete"];

            if (XMLFile.deteteMusic(path, idMusic))
            {
                Response.Redirect("YourSong.aspx");
            }
            else
            {
                Response.Write("<script>alert('Delete fail!');</script>");
            }
        }
    }
}