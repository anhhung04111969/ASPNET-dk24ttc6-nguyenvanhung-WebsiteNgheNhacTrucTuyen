<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="MusicWeb.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       h2{
    width: 100%;
    margin-top: 0;
    margin-bottom: 15px;
    font-size: 42px;
    color: #333;
}

.searchBox{
    width: 100%;
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 25px;
    flex-wrap: wrap;
}

.searchInput{
    width: 320px;
    padding: 10px 12px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 8px;
}

.searchBtn{
    padding: 10px 14px;
    font-size: 15px;
    cursor: pointer;
    border: none;
    border-radius: 8px;
    background: #f3b6c6;
}

.searchBtn:hover{
    background: #e89ab1;
}

.musicSong{
    width: 23%;
    min-height: 340px;
    float: left;
    margin-right: 2%;
    margin-bottom: 25px;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    cursor: pointer;
    transition: 0.2s;
    padding-bottom: 12px;
}

.musicSong:hover{
    transform: translateY(-4px);
}

.musicSong img{
    width: 100%;
    height: 220px;
    object-fit: cover;
}

.infoMusic{
    padding: 10px 12px;
}

.infoMusic h3{
    font-size: 26px;
    margin-bottom: 8px;
    color: #222;
}

.infoMusic p{
    font-size: 18px;
    margin-bottom: 4px;
    color: #444;
}

.infoMusic i{
    font-size: 15px;
    color: #777;
}

.album{
    width: 23%;
    float: left;
    margin-right: 2%;
    margin-bottom: 20px;
    text-align: center;
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    cursor: pointer;
    padding-bottom: 10px;
}

.album img{
    width: 100%;
    height: 220px;
    object-fit: cover;
}

.album h5{
    font-size: 18px;
    margin-top: 10px;
}

@media only screen and (max-width: 768px){
    h2{
        font-size: 30px;
    }

    .searchBox{
        display: block;
    }

    .searchInput{
        width: 100%;
        margin-bottom: 10px;
    }

    .searchBtn{
        margin-right: 5px;
        margin-bottom: 10px;
    }

    .musicSong{
        width: 48%;
        margin-right: 2%;
        min-height: 280px;
    }

    .musicSong img{
        height: 170px;
    }

    .album{
        width: 48%;
        margin-right: 2%;
    }

    .album img{
        height: 170px;
    }
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="welcomeBox">
        <% if (Session["username"] != null) { %>
            Xin chào, <%= Session["username"].ToString() %>
        <% } else { %>
            Xin chào, Khách
        <% } %>
    </div>

    <h2><u>Song</u></h2>

<div class="searchBox">
    <asp:TextBox ID="txtSearch" runat="server" CssClass="searchInput" placeholder="Nhập tên bài hát hoặc ca sĩ..."></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="searchBtn" OnClick="btnSearch_Click" />
    <asp:Button ID="btnAll" runat="server" Text="Hiện tất cả" CssClass="searchBtn" OnClick="btnAll_Click" />
</div>

<asp:ListView ID="ListMusic" runat="server">
    <ItemTemplate>
        <div class="musicSong" onclick="setMusicPlay('<%# Eval("Mp3Url") %>', '<%# Eval("ImgUrl") %>', '<%# Eval("NameMusic") %>', '<%# Eval("SingerName") %>')">
            <img src="<%# Eval("ImgUrl") %>" />
            <div class="infoMusic">
                <h3><%# Eval("NameMusic") %></h3>
                <p><%# Eval("SingerName") %></p>
                <i>(<%# Eval("Album") %>)</i>
                    <asp:Button 
    ID="btnDelete"
    runat="server"
    Text="Delete"
    CommandArgument='<%# Eval("Id") %>'
    OnCommand="btnDelete_Command"
/>
    <asp:Button 
    ID="btnEdit"
    runat="server"
    Text="Edit"
    CommandArgument='<%# Eval("Id") %>'
    OnCommand="btnEdit_Command"
/>
            </div>
        </div>
    </ItemTemplate>
</asp:ListView>

    <h2><u>Album</u></h2>

    <div class="album" onclick="setShowAlbum('V-POP')">
        <img src="Picture/v-pop.jpg" />
        <br />
        <h5>V-POP Music</h5>
    </div>
 

    <div class="album" onclick="setShowAlbum('K-POP')">
        <img src="Picture/k-pop.jpg" />
        <br />
        <h5>K-POP Music</h5>
    </div>

    <div class="album" onclick="setShowAlbum('J-POP')">
        <img src="Picture/Japanese.jpg" />
        <br />
        <h5>J-POP Music</h5>
    </div>

    <div class="album" onclick="setShowAlbum('US-UK')">
        <img src="Picture/usuk.jpg" />
        <br />
        <h5>US-UK Music</h5>
    </div>

    <script>
        function setMusicPlay(musicUrl, imgURL, nameSong, singerSong) {
            var audio = document.getElementById("audio");
            var image = document.getElementById("showI");
            var name = document.getElementById("showN");
            var singer = document.getElementById("showS");

            audio.src = musicUrl;
            image.src = imgURL;
            name.innerText = nameSong;
            singer.innerHTML = singerSong;
        }
    </script>
</asp:Content>