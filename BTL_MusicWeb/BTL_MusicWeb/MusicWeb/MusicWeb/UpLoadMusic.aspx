
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpLoadMusic.aspx.cs" Inherits="MusicWeb.UpMusic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Up Load Music</title>
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
    <style>
        body{
            background-image: url("/Picture/backgroundBig.jpg");
        }
        #header{
            color: 	#C25283;
            text-align: center;
            font-size: 40px;
        }
        #up{
            margin-top: 100px;
            font-size: 1.5rem;
            text-emphasis-color: white;
            border: none;
            padding: 2rem;
            width: 35rem;
            height: 25rem;
            position: absolute;
            top: 35%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        .upLoad label {
            width: 30%;
            float: left;
            margin-top: 5px;
        }
        .upLoad .ipMid{
            float: right;
            width: 60%;
            margin-top: 5px;
            margin-right: 100px;
        }
        .upLoad .ipRight {
            width:30%;
            margin-right: 100px;
            margin-left: 292px;
        }
        #btn{
            text-align: center;
            width: 100%;
            height: 30px;
            margin-top: 30px;
        }
        #Button1{
            margin-top:30px;
            border-radius: 5px;
            padding: 5px 15px 5px 15px;
            width:auto;
            font-size: 30px;
            box-shadow: rgba(0,0,0,0.3) 2px 2px 20px 0px;
            cursor: pointer;
        }
        #Button1:hover{
            box-shadow: rgba(255,255,255,0.3) 2px 2px 20px 0px;
        }

        @media only screen
        and (min-width: 320px)
        and (max-width: 768px) {
            /* For mobile phone: */
            body{
                width: 500px;
                height: auto;
            }
            #header{
                padding-top: 20px;
                width: 100%;
                height: 30%;
                text-align: center;
            }
            #up{
                padding-top: 200px;
                width: 100%;
                height: 70%;
            }
            #up label{
                width: 40%;
                margin-left: 30px;
                margin-top: 20px;
            }
            #up .ipMid{
                width: 50%;
                margin-left: 50px;
                margin-right: 50px;
            }
            .upLoad .ipRight{
                float: right;
                margin-left: 0;
                margin-right: 0;
            }
            #btn #Button1{
                width: 200px;
                margin-left: 100px;
                margin-top: 50px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <h3>UP LOAD</h3>
        </div>
        <div id="up">
            <div class="upLoad">
                <label> Name Music: </label>
                <input class="ipMid" id="nameMs" name="nameMs" type="text" runat ="server"/>
                <br />
            </div>
            <div class="upLoad">
                <label> Singer Name: </label>
                <input class="ipMid" id="singerMs" name="singerMs" type="text" runat="server"/>
                <br />
            </div>
            
            <div class="upLoad">
                <label for="xFileMusicPath"> Link Music: </label>
                <input class="ipMid" id="xFileMusicPath" name="FilePath" type="text"  runat="server"/>
                <input class="ipRight" type="button" value="Browse Server" onclick="MusicBrowseServer()"/> 
                <br />
            </div>
            
            <div class="upLoad">
                <label for="xFilePath"> Avatar Music: </label>
                <input class="ipMid" id="xFilePath" name="FilePath" type="text"  runat="server"/>
                <input class="ipRight" type="button" value="Browse Server" onclick="BrowseServer()"/> 
                <br />
            </div>
            
            <div class="upLoad">
                <label> Album: </label>
                <asp:DropDownList CssClass="ipMid" ID="DropDownList1" runat="server">
                <asp:ListItem>V-POP</asp:ListItem>
                <asp:ListItem>K-POP</asp:ListItem>
                <asp:ListItem>J-POP</asp:ListItem>
                <asp:ListItem>US-UK</asp:ListItem>
            </asp:DropDownList>
            <br />
            </div>
            <div id="btn">
                <asp:Button ID="Button1" runat="server" Text="Up Load" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>  
     <script type="text/javascript">
         function BrowseServer() {
             var finder = new CKFinder();
             finder.basePath = "/plugin/ckfinder/ckfinder/";
             finder.selectActionFunction = SetFileField;
             finder.popup();
         }
         function SetFileField(fileUrl) {
             document.getElementById("<%=xFilePath.ClientID%>").value = fileUrl;
         }

         function MusicBrowseServer() {
             var finder = new CKFinder();
             finder.basePath = "/plugin/ckfinder/ckfinder/";
             finder.selectActionFunction = SetFileMusic;
             finder.popup();
         }
         function SetFileMusic(fileUrl) {
             document.getElementById("<%=xFileMusicPath.ClientID%>").value = fileUrl;
         }
     </script>
     <script src="/plugin/ckfinder/ckfinder/ckfinder.js"></script>
</html>


