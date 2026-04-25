using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace MusicWeb
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllMusic();
            }
        }
        public void LoadMusic()
        {
            List<Musics> listSong = XMLFile.getMusicListInXML(Server.MapPath("~/musics.xml"));

            ListMusic.DataSource = listSong;
            ListMusic.DataBind();
        }

        private void LoadAllMusic()
        {
            string path = Server.MapPath("~/musics.xml");
            List<Musics> listSong = XMLFile.getMusicListInXML(path);

            ListMusic.DataSource = listSong;
            ListMusic.DataBind();
        }
        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            XMLFile.DeleteMusic(id);

            LoadMusic(); // load lại danh sách
        }
        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            Response.Redirect("EditMusic.aspx?id=" + id);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim().ToLower();
            string path = Server.MapPath("~/musics.xml");
            List<Musics> listSong = XMLFile.getMusicListInXML(path);

            List<Musics> result = listSong.Where(x =>
                x.NameMusic.ToLower().Contains(keyword) ||
                x.SingerName.ToLower().Contains(keyword)
            ).ToList();

            ListMusic.DataSource = result;
            ListMusic.DataBind();
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadAllMusic();
        }
    }
}