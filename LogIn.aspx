<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Entrar no Twitter / Twitter</title>
  <link rel="stylesheet" href="./styles/style.css" />

  <style>
    /* Aquí pega todos los estilos CSS proporcionados */

    @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;800&display=swap");

    /* Variables */
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
      --signup-a-color: rgb(80, 174, 231);
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
      --signup-a-color: rgb(27, 149, 224);
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

    #entrar {
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

    /* Footer */
    .signup {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 14px;
      margin-top: 30px;
    }

    .signup a {
      color: var(--signup-a-color);
      font-weight: 400;
      margin: 0 5px;
      text-align: center;
      text-decoration: none;
    }

    .signup a:hover {
      text-decoration: underline;
    }

    span.dot {
      padding-bottom: 5px;
      color: var(--dot-color);
      font-weight: 400;
    }
  </style>
</head>

<body>
  <section id="login">

    <!-- Header -->
    <div class="header">

      <!-- Logo -->
      <div class="logo">
        <img id="img-logo" src="DatosDeLaApp\twitter-logo.png" />
      </div>

    </div>

    <h1>Log In Twitter</h1>

    <form>

      <!-- Login -->

      <!-- User -->
      <div class="username">
        <label for="user">Usuario o e-mail</label>
        <br />
        <div class="input-box input-user">
          <input type="textarea" name="user" id="user" />
        </div>
    </div>

    <!-- Password -->
    <div class="password">
      <label for="password">Contraseña</label>
      <br />
      <div class="input-box input-password">
        <input type="password" name="password" id="password" />
      </div>
    </div>

    <!-- Login button -->
    <div class="entrar">
      <input type="button" name="entrar" id="entrar" value="Entrar" />
    </div>
  </form>

  <!-- Footer -->
  <footer class="signup">
    <a href="#">¿Olvidaste tu contraseña?</a>
    <span class="dot"></span>
    <a href="#">Regístrate</a>
  </footer>
</section>

<script src="./js/script.js"></script>
</body>

</html>