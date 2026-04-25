<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditMusic.aspx.cs" Inherits="MusicWeb.EditMusic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Edit Music</title>

<style>

body{
font-family:Arial;
background-image:url("Picture/backgroundBig.jpg");
}

#box{
width:400px;
background:white;
padding:30px;
margin:auto;
margin-top:120px;
border-radius:10px;
}

.row{
margin-bottom:15px;
}

.row input{
width:100%;
padding:8px;
}

#save{
margin-top:20px;
padding:10px;
font-size:18px;
cursor:pointer;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div id="box">

<h2>Edit Music</h2>

<asp:HiddenField ID="hdIdMusic" runat="server" />

<div class="row">
Name Music
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
</div>

<div class="row">
Singer
<asp:TextBox ID="txtSinger" runat="server"></asp:TextBox>
</div>

<div class="row">
Music URL
<asp:TextBox ID="txtMp3" runat="server"></asp:TextBox>
</div>

<div class="row">
Image URL
<asp:TextBox ID="txtImg" runat="server"></asp:TextBox>
</div>

<div class="row">
Album
<asp:DropDownList ID="ddlAlbum" runat="server">
<asp:ListItem>V-POP</asp:ListItem>
<asp:ListItem>K-POP</asp:ListItem>
<asp:ListItem>J-POP</asp:ListItem>
<asp:ListItem>US-UK</asp:ListItem>
</asp:DropDownList>
</div>

<asp:Button ID="save" runat="server" Text="Save" OnClick="save_Click"/>

</div>

</form>

</body>
</html>