using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicWeb
{
    public class Musics
    {
        String idMusic;
        String time;
        String idUser;
        String nameMusic;
        String mp3Url;
        String imgUrl;
        String singerName;
        String album; 

        public Musics()
        {

        }

        public Musics(String idMusic, String idUser, String nameMusic, String mp3Url, String imgUrl, String singerName, String time, String album)
        {
            this.idMusic = idMusic;
            this.idUser = idUser;
            this.nameMusic = nameMusic;
            this.mp3Url = mp3Url;
            this.imgUrl = imgUrl;
            this.singerName = singerName;
            this.time = time;
            this.album = album;
        }

        public string IdMusic { get => idMusic; set => idMusic = value; }
        public string Id { get; set; }
        public string NameMusic { get => nameMusic; set => nameMusic = value; }
        public string Mp3Url { get => mp3Url; set => mp3Url = value; }
        public string ImgUrl { get => imgUrl; set => imgUrl = value; }
        public string SingerName { get => singerName; set => singerName = value; }
        public string Time1 { get => time; set => time = value; }
        public string Album { get => album; set => album = value; }
        public string IdUser { get => idUser; set => idUser = value; }
    }

}