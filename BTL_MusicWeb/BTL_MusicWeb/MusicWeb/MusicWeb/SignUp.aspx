<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="MusicWeb.SignUp" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sign Up</title>
</head>
<body>
<form id="form1" runat="server">

<h2>Sign Up</h2>

<p>
    Tài khoản:
    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
</p>

<p>
    Mật khẩu:
    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
</p>

<p>
    Email:
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
</p>

<p>
    <asp:Button ID="btnSignUp" runat="server" Text="Đăng ký" OnClick="btnSignUp_Click" />
</p>

</form>
</body>
</html>