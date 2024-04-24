<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailConfirmation.aspx.cs" Inherits="IDS348_FinalProject.EmailConfirmation" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Entrar Twitter / Twitter</title>

  <style>

    @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;800&display=swap");

    :root {
      --background-color: rgb(255, 255, 255);
      --h1-input-color: rgb(0, 0, 0);
      --h1-input-color: rgb(0, 0, 0);
      --username-password-color: rgb(0, 0, 0);
      --username-password-background-color: rgb(245, 248, 250);
      --username-password-border-color: rgb(101, 119, 134);
      --username-password-focus-color: rgb(29, 161, 242);
      --username-password-focus-border-color: rgb(29, 161, 242);
      --entrar-background-color: rgb(151, 208, 248);
      --entrar-color: rgb(255, 255, 255);
      --entrar-color: rgb(255, 255, 255);
      --entrar-hover-background-color: rgb(29, 161, 242);
      --entrar-hover-color: rgb(255, 255, 255);
      --login-a-color: rgb(80, 174, 231);
      --dot-color: rgb(101, 119, 134);
    }

    /* Dark mode variables */
    .darkMode {
      --background-color: rgb(21, 32, 43);
      --h1-input-color: rgb(255, 255, 255);
      --label-color: rgb(255, 255, 255);
      --username-password-color: rgb(136, 153, 166);
      --username-password-background-color: rgb(25, 39, 52);
      --username-password-border-color: rgb(136, 153, 166);
      --entrar-background-color: rgb(25, 96, 142);
      --entrar-color: rgb(138, 143, 148);
      --entrar-hover-background-color: rgb(26, 145, 218);
      --entrar-hover-color: rgb(255, 255, 255);
      --login-a-color: rgb(27, 149, 224);
    }

    /* Reset */
    * {
      margin: 0;
      padding: 0;
      font-family: "Montserrat", sans-serif;
      box-sizing: border-box;
      border: none;
    }

    body {
      height: 100%;
      background-color: var(--background-color);
    }

    div {
      margin: 20px 0;
    }

    #singup {
      max-width: 600px;
      margin: -35px auto 0;
      padding: 0 15px;
    }

    /* Header */
    .header {
      display: flex;
      justify-content: space-evenly;
      margin-bottom: 0;
    }

    img {
      width: 70px;
    }

    .logo {
      display: flex;
      position: relative;
      right: 7.3%;
    }

    .change-theme:hover {
      opacity: 0.8;
    }

    #theme-switcher {
      cursor: pointer;
    }

    h1 {
      font-size: 20px;
      font-weight: 800;
      text-align: center;
      margin-bottom: 15px;
      color: var(--h1-input-color);
    }

    /* singup */
    .labelCD {
      padding-left: 7px;
      opacity: 70%;
      font-size: 14px;
      font-weight: 400;
      color: var(--label-color);
    }

    input {
      outline: 0;
      font-size: 19px;
      color: var(--h1-input-color);
    }

    .username,
    .password,
    .mail,
    .names,
    .telefono,
    .birthday,
    .biografia,
    .placewherelives,
    .sex{
      background-color: var(--username-password-background-color);
      border-bottom: 2px solid var(--username-password-border-color);
      padding-top: 8px;
    }

    .username:focus-within,
    .password:focus-within,
    .mail:focus-within,
    .names:focus-within,
    .telefono:focus-within,
    .birthday:focus-within,
    .biografia:focus-within,
    .placewherelives:focus-within,
    .sex:focus-within{
      color: rgb(29, 161, 242);
      border-color: rgb(29, 161, 242);
    }

    .entrar {
      padding-top: 8px;
    }

    .input-box{
      padding: 2px 10px 5px;
      margin: 0;
    }

    #txtCódigo
    {
      width: 100%;
      background: none;
    }

    #btnComprobar {
      background-color: var(--entrar-background-color);
      color: var(--entrar-color);
      font-weight: bold;
      position: relative;
      left: 5%;
      width: 75%;
      padding: 15px 10px 15px 10px;
      border-radius: 9999px;
      font-size: 14px;
    }

    #entrar:hover {
      background-color: var(--entrar-hover-background-color);
      color: var(--entrar-hover-color);
      cursor: pointer;
    }

    .login {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 14px;
      margin-top: 30px;
    }

    .login a {
      color: var(--singup-a-color);
      font-weight: 400;
      margin: 0 5px;
      text-align: center;
      text-decoration: none;
    }

    .login a:hover {
      text-decoration: underline;
    }

    span.dot {
      padding-bottom: 5px;
      color: var(--dot-color);
      font-weight: 400;
    }

    #btnComprobar:enabled:hover,
    #mobbtnComprobar:enabled:hover
    {
        background-color: #1A91DA; /* Oscurecer ligeramente el botón al pasar el mouse */
    
    }

    #rogressBar
    {
        display: none;
        position: fixed;
        top: -20px;
        width: 0%;
        height: 5px;
        background-color: deepskyblue !important;
    }

      .custom-dropdown {
          background-color: var(--username-password-background-color);
          border: double;
          border-color: var(--username-password-background-color);
          border-width: 2px;
          color: var(--username-password-color);
          font-size: 16px;
          padding: 8px;
          width: 100%;
          outline: none;
          -webkit-appearance: none; /* Para navegadores basados en WebKit (Chrome, Safari, etc.) */
          -moz-appearance: none;
          appearance: none;
          
      }

      .custom-dropdown:focus{
          border-color: var(--username-password-background-color);
      }

.custom-dropdown option {
    background-color: var(--background-color);
    color: var(--h1-input-color);
}

#form1{
    position: relative;
    top: 200px;
    left: 2%;
}

.noclick {
    pointer-events: none;
}

.noclick > *{
 pointer-events: auto;
}

.lblInformation{
    width: 65%;
    position: relative;
    left: 10%;
}

.svgMail{
    width: 5%;
    position: relative;
    left: 5%;
}

.svgYlbl{
    display: flex;
    align-items: center;
    margin-bottom: 2%;
}

.lbl{
    font-size: 17px;
color: black;
}

.mail{
    position: relative;
left: 5%;
width: 75%;
}

  </style>
    <link rel="icon" type="image/x-icon" href="DatosDeLaApp\twitter-logo.png">
</head>
<body>
  <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <asp:HiddenField ID="ProgressHiddenField" runat="server"/>
              <div id="rogressBar" runat="server">
                  <asp:UpdateProgress ID="ProgressBar" runat="server"></asp:UpdateProgress>
              </div>
            <section id="singup">
                <div class="header">
                    <div class="logo">
                        <img id="img-logo" src="DatosDeLaApp\twitter-logo.png" />
                    </div>
                </div>
                <div style="display: flex; align-items: center;">
                    <a id="aBack" runat="server" style="background: none; border: none; cursor: pointer; width: 4.5%; position: relative; left: 5%;">
                    <svg fill="#000000" id="FlechaAtras" viewBox="0 0 512.00 512.00" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" stroke="#000000" stroke-width="0.00512"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M34,256,210,80l21.21,21.2L91.4,241H478v30H91.4L231.25,410.84,210,432Z"></path></g></svg>
                        </a>
                    <label id="lblEmail" runat="server" style="position: relative; bottom: 3.8px; left: 7%; font-size: 18px;"></label>
                </div>
                <div style="margin-top: 5%; position: relative; left: 5%; margin-bottom: -3%;"><label runat="server" style="font-size: 30px; color: black; position: relative; margin-top: 10%;">Escribe el código</label></div>
                <div class="svgYlbl">
                <svg viewBox="0 0 48 48" id="Layer_2" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" fill="#000000" class="svgMail"><g id="SVGRepobgCarrier" stroke-width="0"></g><g id="SVGRepotracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepoiconCarrier"><defs><style>.cls-1{fill:none;stroke:#000000;stroke-linecap:round;stroke-linejoin:round;}</style></defs><path class="cls-1" d="M6.47,10.71a2,2,0,0,0-2,2h0V35.32a2,2,0,0,0,2,2H41.53a2,2,0,0,0,2-2h0V12.68a2,2,0,0,0-2-2H6.47Zm33.21,3.82L24,26.07,8.32,14.53"></path></g></svg>
                <div class="lblInformation">
                    <label id="lblInformation" runat="server" class="lbl"></label><br />
                </div>
                </div>
                <div class="mail">
                    <label class="labelCD" for="Código">Código</label> <br />
                    <div class="input-box input-username">
                        <asp:TextBox type="code" id="txtCódigo" runat="server" oninput="userInputChanged();" MaxLength="6" />
                    </div>
                </div>
                <div class="btn">
                    <asp:Button id="btnComprobar" Text="Comprobar" runat="server" Enabled="False" OnClientClick="mostrarProgreso();" OnClick="btnComprobar_Click"/>
                </div>
            </section>
  </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>

        // #region Validaciones

        document.getElementById('txtCódigo').addEventListener("keydown", function (event) {
            var char = event.key;

            if (!(/[0-9]/.test(char))) {
                event.preventDefault();
            }
        });

        function userInputChanged() {
            var CodeText = document.getElementById('<%= txtCódigo.ClientID %>').value;

            if (CodeText.trim() === '' || CodeText.trim().length < 6 ) {
                document.getElementById('<%= btnComprobar.ClientID %>').disabled = true;
            }

            else
            {
                document.getElementById('<%= btnComprobar.ClientID %>').disabled = false;
            }
        }

        // #endregion

        function mostrarProgreso() {
            document.getElementById('rogressBar').style.display = 'block';

            document.getElementById('rogressBar').style.width = 20 + '%';

            setTimeout(function () {
                document.getElementById('rogressBar').style.width = 50 + '%';

                setTimeout(function () {
                    document.getElementById('rogressBar').style.width = 70 + '%';

                    setTimeout(function () {
                        document.getElementById('rogressBar').style.width = 90 + '%';

                    }, 2500);

                }, 2500);

            }, 4000);
        }
    </script>
</body>
</html>