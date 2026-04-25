<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeAvt.aspx.cs" Inherits="MusicWeb.ChangeAvt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Avatar User</title>
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
    <style>
        body{
            background-image: url("/Picture/backgroundBig.jpg");
        }
        #change h2{
            padding-top: 40px;
            color: 	#C25283;
            text-align: center;
            font-size: 45px;
        }
        #infoPic{
            margin-top: 200px;
            font-size: 1.5rem;
            text-emphasis-color: white;
            border: none;
            padding: 2rem;
            width: 35rem;
            height: 25rem;
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        #infoPic label {
            width: 40%;
            float: left;
            margin-top: 20px;
        }
        #infoPic .ipMid{
            float: right;
            width: 50%;
            margin-top: 5px;
            margin-right: 100px;
        }
        #infoPic .ipRight {
            width:30%;
            float: right;
            margin-right: 20px;
            margin-top: 20px;
        }
        #btnAvt{
            margin-top:100px;
            margin-left: 180px;
            border-radius: 5px;
            padding: 5px 15px 5px 15px;
            width:auto;
            font-size: 30px;
            box-shadow: rgba(0,0,0,0.3) 2px 2px 20px 0px;
            cursor: pointer;
        }
        #btnAvt:hover{
            box-shadow: rgba(255,255,255,0.3) 2px 2px 20px 0px;
        }

        @media only screen
        and (min-width: 320px)
        and (max-width: 768px) {
            /* For mobile phone: */
            body{
                width: 100%;
                height: auto;
            }
            #change h2{
                margin-left: 60px; 
            }
            #infoPic label{
                margin-left: 100px;
                font-size: 30px;
                width: 50%;
            }
            #infoPic .ipMid{
                margin-top: 30px;
            }
            #infoPic .ipRight{
                height: auto;
                font-size: 17px;
            }
            #btnAvt{
                margin-left: 200px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="change">
            <h2> Change Avatar </h2>
            <div id="infoPic">
                <label for="xFilePath"> Change Avatar User: </label>
                <input class="ipMid" id="xFilePath" name="FilePath" type="text" runat="server"/>
                <input class="ipRight" type="button" value="Browse Server" onclick="BrowseServer()"/>

                <asp:Button id="btnAvt" runat="server" Text="Upload Avatar" OnClick="btnAvt_Click"/>
            </div>
        </div>
    </form>
</body>
    <script>
        function BrowseServer() {
            var finder = new CKFinder();
            finder.basePath = "/plugin/ckfinder/ckfinder/";
            finder.selectActionFunction = SetFileField;
            finder.popup();
        }
        function SetFileField(fileUrl) {
            document.getElementById("<%=xFilePath.ClientID%>").value = fileUrl;
         }
    </script>
    <script src="/plugin/ckfinder/ckfinder/ckfinder.js"></script>

</html>
