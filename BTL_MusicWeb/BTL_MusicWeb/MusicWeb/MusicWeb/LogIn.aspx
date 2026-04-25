<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="MusicWeb.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<title>Log In</title>

<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>

<style>

*{
margin:0;
padding:0;
}

html{
font-size:62.5%;
}

body{
font-family:Arial, Helvetica, sans-serif;
background-image:url("/Picture/backgroundBig.jpg");
color:white;
}

#login{
margin-top:50px;
font-size:18px;
border:1px solid black;
padding:20px;
width:350px;
height:380px;
position:absolute;
top:40%;
left:50%;
box-shadow:#FFC0CB 5px 5px 20px 0px;
transform:translate(-50%,-50%);
background-image:url("/Picture/backgroud.jpg");
}

h2{
font-size:4rem;
text-align:center;
margin-bottom:80px;
color:white;
}

.name{
width:100%;
height:50px;
margin-top:10px;
}

label{
width:30%;
float:left;
}

.textbox{
width:70%;
float:right;
}

.btn{
width:100%;
height:30px;
margin-top:30px;
}

#btnLogIn{
float:right;
border-radius:5px;
padding:5px 15px;
width:auto;
box-shadow:rgba(0,0,0,0.3) 2px 2px 20px 0px;
font-size:20px;
cursor:pointer;
}

#btnLogIn:hover{
box-shadow:rgba(255,255,255,0.3) 2px 2px 20px 0px;
}

.withSU label{
text-align:center;
width:100%;
height:60px;
margin-top:30px;
}

.withSU a{
color:chartreuse;
}

.withSU a:hover{
color:darkblue;
font-size:20px;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div id="login">

<h2>Log In</h2>

<div class="name">
<label>User Name:</label>
<asp:TextBox ID="txtUser" runat="server" CssClass="textbox"></asp:TextBox>
</div>

<div class="name">
<label>Password:</label>
<asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
</div>

<div class="btn">
<asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click"/>
</div>

<div class="withSU">
<label>
Do you not have an account?<br/>
<a href="SignUp.aspx">Create Sign Up!</a>
</label>
</div>

</div>

</form>

</body>
</html>
