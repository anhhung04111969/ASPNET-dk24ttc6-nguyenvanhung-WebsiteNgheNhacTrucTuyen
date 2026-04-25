using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicWeb
{
    public class User
    {
        private String id;
        private String nickname;
        private String password;
        private String email;
        private String birthday;
        private String urlAvt;

        public User()
        {

        }

        public User(String id, String nickname, String password, String email, String birthday, String urlAvt)
        {
            this.Id = id;
            this.Nickname = nickname;
            this.Password = password;
            this.Email = email;
            this.Birthday = birthday;
            this.urlAvt = urlAvt;
        }

        public string Id { get => id; set => id = value; }
        public string Nickname { get => nickname; set => nickname = value; }
        public string Password { get => password; set => password = value; }
        public string Email { get => email; set => email = value; }
        public string UrlAvt { get => urlAvt; set => urlAvt = value; }
        public string Birthday { get => birthday; set => birthday = value; }
    }
}