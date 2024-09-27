<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="IDS348_FinalProject.LogIn" Async="true" %>
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
      --singup-a-color: rgb(80, 174, 231);
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
      --singup-a-color: rgb(27, 149, 224);
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

    #login {
      max-width: 600px;
      margin: 150px auto 0;
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
      justify-content: center;
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

    /* Login */
    label {
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
    .password {
      background-color: var(--username-password-background-color);
      border-bottom: 2px solid var(--username-password-border-color);
    }

    .username:focus-within,
    .password:focus-within {
      color: var(--username-password-focus-color);
      border-color: var(--username-password-focus-border-color);
    }

    .username,
    .password,
    .entrar {
      padding-top: 8px;
    }

    .input-box {
      padding: 2px 10px 5px;
      margin: 0;
    }

    #user,
    #password {
      width: 100%;
      background: none;
    }

    #btnEntrar {
      background-color: var(--entrar-background-color);
      color: var(--entrar-color);
      font-weight: bold;
      width: 100%;
      padding: 15px 10px 15px 10px;
      border-radius: 9999px;
      font-size: 14px;
    }

    #entrar:hover {
      background-color: var(--entrar-hover-background-color);
      color: var(--entrar-hover-color);
      cursor: pointer;
    }

    .singup {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 14px;
      margin-top: 30px;
    }

    .singup a {
      color: var(--singup-a-color);
      font-weight: 400;
      margin: 0 5px;
      text-align: center;
      text-decoration: none;
    }

    .singup a:hover {
      text-decoration: underline;
    }

    span.dot {
      padding-bottom: 5px;
      color: var(--dot-color);
      font-weight: 400;
    }

    #btnEntrar:enabled:hover,
    #mobbtnEntrar:enabled:hover
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

    #form1 {
    pointer-events: none;
}

#form1 > *{
    pointer-events: auto;
}
  </style>
    <link rel="icon" type="image/x-icon" href="DatosDeLaApp\twitter-logo.png">
</head>
<body>
  <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
              <asp:HiddenField ID="ProgressHiddenField" runat="server"/>
              <div id="rogressBar" runat="server">
                  <asp:UpdateProgress ID="ProgressBar" runat="server"></asp:UpdateProgress>
              </div>
            <section id="login">
                <div class="header">
                    <div class="logo">
                        <img id="img-logo" src="DatosDeLaApp\twitter-logo.png" />
                    </div>
                </div>
                <h1>Log In Twitter</h1>
                <div class="username">
                    <label for="user">Usuario o e-mail</label> <br />
                    <div class="input-box input-user">
                        <asp:TextBox oninput="userInputChanged()" type="username" name="user" id="user" runat="server"/>
                    </div>
                </div>
                <div class="password">
                    <label for="password">Contrase&ntilde;a</label> <br />
                    <div class="input-box input-password">
                        <asp:TextBox oninput="userInputChanged()" type="password" name="password" runat="server" id="password"/>
                    </div>
                </div>
                <div class="entrar">
                    <asp:Button id="btnEntrar" Text="Entrar" runat="server" Enabled="False" OnClick="btnEntrar_Click" OnClientClick="mostrarProgreso();"/>
                </div>
                <footer class="singup">
                    <a href="CambiarContrase&ntilde;a.aspx" >&iquest;Olvidaste tu contrase&ntilde;a?</a>
                    <span class="dot"></span>
                    <a href="SingUp.aspx">Reg&iacute;strate</a>
                </footer>
            </section>
          </ContentTemplate>
      </asp:UpdatePanel>
      <script>

          function userInputChanged() {
              //var UserText = document.getElementById('<//%= user.ClientID %>').value;
              //var PasswordText = document.getElementById('<//%= password.ClientID %>').value;

              /*if (UserText.trim() !== '' && PasswordText.trim() !== '') {
                  btnEntrar.disabled = false;
              }

              else {
                  btnEntrar.disabled = true;
              }*/btnEntrar.disabled = false;
          }

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
  </form>
</body>
</html>