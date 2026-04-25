using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace MusicWeb
{
    public class XMLFile
    {
        private XMLFile()
        {

        }

        public static List<User> getUserListInXML(String path)
        {
            List<User> list;
            XmlSerializer reader = new XmlSerializer(typeof(List<User>));
            StreamReader file = new StreamReader(path);
            list = (List<User>) reader.Deserialize(file);
            file.Close();

            return list;
        }

        public static bool addUserToList(String path, User user)
        {
            bool test = false;
            List<User> list = getUserListInXML(path);
            //List < User > list = new List<User>();

            foreach (User u in list)
            {
                if (u.Nickname.ToLower().Equals(user.Nickname.ToLower()))
                {
                    test = true;
                    break;
                }
            }
            if (test == false)
            {
                list.Add(user);
                XmlSerializer writer = new XmlSerializer(typeof(List<User>));
                FileStream _file = File.Create(path);
                writer.Serialize(_file, list);
                _file.Close();

                return true;
            }
            return false;
        }

        public static List<Musics> getMusicListInXML(String path)
        {
            List<Musics> list;
            XmlSerializer reader = new XmlSerializer(typeof(List<Musics>));
            StreamReader file = new StreamReader(path);
            list = (List<Musics>) reader.Deserialize(file);
            file.Close();

            return list;
        }
        public static bool deteteMusic(String path,  String id)
        {
            bool kt = false;
            List<Musics> list = getMusicListInXML(path);

            foreach (Musics m in list)
            {
                if (id.Equals(m.IdMusic))
                {
                    list.Remove(m);
                    kt = true;
                    break;
                }
            }
            XmlSerializer writer = new XmlSerializer(typeof(List<Musics>));
            FileStream _file = File.Create(path);
            writer.Serialize(_file, list);
            _file.Close();
            return kt;
        }

        public static void setImgUser(String path, String idUser, String linkPic)
        {
            List<User> listUs = getUserListInXML(path);
            foreach(User us in listUs)
            {
                if (us.Id.Equals(idUser))
                {
                    us.UrlAvt = linkPic;
                    break;
                }
            }
            XmlSerializer writer = new XmlSerializer(typeof(List<User>));
            FileStream _file = File.Create(path);
            writer.Serialize(_file, listUs);
            _file.Close();
        }
        public static void saveListMusic(string path, List<Musics> list)
        {

            System.Xml.Serialization.XmlSerializer serializer =
            new System.Xml.Serialization.XmlSerializer(typeof(List<Musics>));

            using (System.IO.FileStream fs = new System.IO.FileStream(path, System.IO.FileMode.Create))
            {
                serializer.Serialize(fs, list);
            }

        }
        public static void DeleteMusic(string id)
        {
            string path = HttpContext.Current.Server.MapPath("~/musics.xml");

            XDocument doc = XDocument.Load(path);

            var music = doc.Descendants("Music")
                           .Where(x => x.Element("Id").Value == id)
                           .FirstOrDefault();

            if (music != null)
            {
                music.Remove();
                doc.Save(path);
            }
        }

        public static bool addMusicToList(String path, Musics musics)
        {
            bool test = false;
            List<Musics> list = getMusicListInXML(path);


            foreach (Musics m in list)
            {
                if (m.Mp3Url.ToLower().Equals(musics.Mp3Url.ToLower()))
                {
                    test = true;
                    break;
                }
            }
            if(test == false)
            {
                list.Add(musics);
                XmlSerializer writer = new XmlSerializer(typeof(List<Musics>));
                FileStream _file = File.Create(path);
                writer.Serialize(_file, list);
                _file.Close();

                return true;
            }
            return false;
        }
    }

   
}