<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingUp.aspx.cs" Inherits="IDS348_FinalProject.SingUp" %>
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

    /* singup */
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
      color: var(--username-password-focus-color);
      border-color: var(--username-password-focus-border-color);
    }

    .entrar {
      padding-top: 8px;
    }

    .input-box{
      padding: 2px 10px 5px;
      margin: 0;
    }

    #txtUsername,
    #txtPassword,
    #txtMail,
    #txtNames,
    #txtTelefono,
    #txtBiografia,
    #calendarBirthday,
    #ddlPlaceWhereLives,
    #ddlSex
    {
      width: 100%;
      background: none;
    }

    #btnRegistrarse {
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

    #btnRegistrarse:enabled:hover,
    #mobbtnRegistrarse:enabled:hover
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

#ddlDia{
    width: 28%;
    background: none;
}

#ddlMes, #ddlAño{
    width: 32%;
    background: none;
}

#form1{
    top: 80px;
}
  </style>
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
            <section id="singup">
                <div class="header">
                    <div class="logo">
                        <img id="img-logo" src="DatosDeLaApp\twitter-logo.png" />
                    </div>
                </div>
                <h1>Sing Up Twitter</h1>
                <div class="username">
                    <label for="username">Usuario</label> <br />
                    <div class="input-box input-username">
                        <asp:TextBox type="username" id="txtUsername" runat="server" oninput="userInputChanged();" />
                    </div>
                </div>
                <div class="names">
                    <label for="names">Nombres</label> <br />
                    <div class="input-box input-username">
                        <asp:TextBox type="names" id="txtNames" runat="server" oninput="userInputChanged();" />
                    </div>
                </div>
                <div class="mail">
                    <label for="mail">e-mail</label> <br />
                    <div class="input-box input-username">
                        <asp:TextBox type="mail" id="txtMail" runat="server" oninput="userInputChanged();" />
                    </div>
                </div>
                <div class="password">
                    <label for="password">Contraseña</label> <br />
                    <div class="input-box input-password">
                        <asp:TextBox type="password" runat="server" id="txtPassword" oninput="userInputChanged();" />
                    </div>
                </div>
                <div class="telefono">
                    <label for="telefono">Telefono</label> <br />
                    <div class="input-box input-password">
                        <asp:TextBox type="telefono" runat="server" id="txtTelefono" oninput="userInputChanged();"/>
                    </div>
                </div>
                <div class="birthday">
                    <label for="birthday">Fecha de cumpleaños</label> <br />
                    <div class="input-box input-password">
                        <asp:DropDownList ID="ddlDia" runat="server" CssClass="custom-dropdown" onchange="userInputChanged();">
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                            <asp:ListItem Text="26" Value="26"></asp:ListItem>
                            <asp:ListItem Text="27" Value="27"></asp:ListItem>
                            <asp:ListItem Text="28" Value="28"></asp:ListItem>
                            <asp:ListItem Text="29" Value="29"></asp:ListItem>
                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                            <asp:ListItem Text="31" Value="30"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlMes" runat="server" CssClass="custom-dropdown" onchange="userInputChanged();">
                            <asp:ListItem Text="Enero" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Febrero" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Marzo" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Mayo" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Junio" Value="6"></asp:ListItem>
                            <asp:ListItem Text="Julio" Value="7"></asp:ListItem>
                            <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                            <asp:ListItem Text="Septiembre" Value="9"></asp:ListItem>
                            <asp:ListItem Text="Octubre" Value="10"></asp:ListItem>
                            <asp:ListItem Text="Noviembre" Value="11"></asp:ListItem>
                            <asp:ListItem Text="Diciembre" Value="12"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlAño" runat="server" CssClass="custom-dropdown" onchange="userInputChanged();">
                            <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                            <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                            <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                            <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                            <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                            <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                            <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                            <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                            <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                            <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                            <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                            <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                            <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
                            <asp:ListItem Text="2011" Value="2011"></asp:ListItem>
                            <asp:ListItem Text="2010" Value="2010"></asp:ListItem>
                            <asp:ListItem Text="2009" Value="2009"></asp:ListItem>
                            <asp:ListItem Text="2008" Value="2008"></asp:ListItem>
                            <asp:ListItem Text="2007" Value="2007"></asp:ListItem>
                            <asp:ListItem Text="2006" Value="2006"></asp:ListItem>
                            <asp:ListItem Text="2005" Value="2005"></asp:ListItem>
                            <asp:ListItem Text="2004" Value="2004"></asp:ListItem>
                            <asp:ListItem Text="2003" Value="2003"></asp:ListItem>
                            <asp:ListItem Text="2002" Value="2002"></asp:ListItem>
                            <asp:ListItem Text="2001" Value="2001"></asp:ListItem>
                            <asp:ListItem Text="2000" Value="2000"></asp:ListItem>
                            <asp:ListItem Text="1999" Value="1999"></asp:ListItem>
                            <asp:ListItem Text="1998" Value="1998"></asp:ListItem>
                            <asp:ListItem Text="1997" Value="1997"></asp:ListItem>
                            <asp:ListItem Text="1996" Value="1996"></asp:ListItem>
                            <asp:ListItem Text="1995" Value="1995"></asp:ListItem>
                            <asp:ListItem Text="1994" Value="1994"></asp:ListItem>
                            <asp:ListItem Text="1993" Value="1993"></asp:ListItem>
                            <asp:ListItem Text="1992" Value="1992"></asp:ListItem>
                            <asp:ListItem Text="1991" Value="1991"></asp:ListItem>
                            <asp:ListItem Text="1990" Value="1990"></asp:ListItem>
                            <asp:ListItem Text="1989" Value="1989"></asp:ListItem>
                            <asp:ListItem Text="1988" Value="1988"></asp:ListItem>
                            <asp:ListItem Text="1987" Value="1987"></asp:ListItem>
                            <asp:ListItem Text="1986" Value="1986"></asp:ListItem>
                            <asp:ListItem Text="1985" Value="1985"></asp:ListItem>
                            <asp:ListItem Text="1984" Value="1984"></asp:ListItem>
                            <asp:ListItem Text="1983" Value="1983"></asp:ListItem>
                            <asp:ListItem Text="1982" Value="1982"></asp:ListItem>
                            <asp:ListItem Text="1981" Value="1981"></asp:ListItem>
                            <asp:ListItem Text="1980" Value="1980"></asp:ListItem>
                            <asp:ListItem Text="1979" Value="1979"></asp:ListItem>
                            <asp:ListItem Text="1978" Value="1978"></asp:ListItem>
                            <asp:ListItem Text="1977" Value="1977"></asp:ListItem>
                            <asp:ListItem Text="1976" Value="1976"></asp:ListItem>
                            <asp:ListItem Text="1975" Value="1975"></asp:ListItem>
                            <asp:ListItem Text="1974" Value="1974"></asp:ListItem>
                            <asp:ListItem Text="1973" Value="1973"></asp:ListItem>
                            <asp:ListItem Text="1972" Value="1972"></asp:ListItem>
                            <asp:ListItem Text="1971" Value="1971"></asp:ListItem>
                            <asp:ListItem Text="1970" Value="1970"></asp:ListItem>
                            <asp:ListItem Text="1969" Value="1969"></asp:ListItem>
                            <asp:ListItem Text="1968" Value="1968"></asp:ListItem>
                            <asp:ListItem Text="1967" Value="1967"></asp:ListItem>
                            <asp:ListItem Text="1966" Value="1966"></asp:ListItem>
                            <asp:ListItem Text="1965" Value="1965"></asp:ListItem>
                            <asp:ListItem Text="1964" Value="1964"></asp:ListItem>
                            <asp:ListItem Text="1963" Value="1963"></asp:ListItem>
                            <asp:ListItem Text="1962" Value="1962"></asp:ListItem>
                            <asp:ListItem Text="1961" Value="1961"></asp:ListItem>
                            <asp:ListItem Text="1960" Value="1960"></asp:ListItem>
                            <asp:ListItem Text="1959" Value="1959"></asp:ListItem>
                            <asp:ListItem Text="1958" Value="1958"></asp:ListItem>
                            <asp:ListItem Text="1957" Value="1957"></asp:ListItem>
                            <asp:ListItem Text="1956" Value="1956"></asp:ListItem>
                            <asp:ListItem Text="1955" Value="1955"></asp:ListItem>
                            <asp:ListItem Text="1954" Value="1954"></asp:ListItem>
                            <asp:ListItem Text="1953" Value="1953"></asp:ListItem>
                            <asp:ListItem Text="1952" Value="1952"></asp:ListItem>
                            <asp:ListItem Text="1951" Value="1951"></asp:ListItem>
                            <asp:ListItem Text="1950" Value="1950"></asp:ListItem>
                            <asp:ListItem Text="1949" Value="1949"></asp:ListItem>
                            <asp:ListItem Text="1948" Value="1948"></asp:ListItem>
                            <asp:ListItem Text="1947" Value="1947"></asp:ListItem>
                            <asp:ListItem Text="1946" Value="1946"></asp:ListItem>
                            <asp:ListItem Text="1945" Value="1945"></asp:ListItem>
                            <asp:ListItem Text="1944" Value="1944"></asp:ListItem>
                            <asp:ListItem Text="1943" Value="1943"></asp:ListItem>
                            <asp:ListItem Text="1942" Value="1942"></asp:ListItem>
                            <asp:ListItem Text="1941" Value="1941"></asp:ListItem>
                            <asp:ListItem Text="1940" Value="1940"></asp:ListItem>
                            <asp:ListItem Text="1939" Value="1939"></asp:ListItem>
                            <asp:ListItem Text="1938" Value="1938"></asp:ListItem>
                            <asp:ListItem Text="1937" Value="1937"></asp:ListItem>
                            <asp:ListItem Text="1936" Value="1936"></asp:ListItem>
                            <asp:ListItem Text="1935" Value="1935"></asp:ListItem>
                            <asp:ListItem Text="1934" Value="1934"></asp:ListItem>
                            <asp:ListItem Text="1933" Value="1933"></asp:ListItem>
                            <asp:ListItem Text="1932" Value="1932"></asp:ListItem>
                            <asp:ListItem Text="1931" Value="1931"></asp:ListItem>
                            <asp:ListItem Text="1930" Value="1930"></asp:ListItem>
                            <asp:ListItem Text="1929" Value="1929"></asp:ListItem>
                            <asp:ListItem Text="1928" Value="1928"></asp:ListItem>
                            <asp:ListItem Text="1927" Value="1927"></asp:ListItem>
                            <asp:ListItem Text="1926" Value="1926"></asp:ListItem>
                            <asp:ListItem Text="1925" Value="1925"></asp:ListItem>
                            <asp:ListItem Text="1924" Value="1924"></asp:ListItem>
                            <asp:ListItem Text="1923" Value="1923"></asp:ListItem>
                            <asp:ListItem Text="1922" Value="1922"></asp:ListItem>
                            <asp:ListItem Text="1921" Value="1921"></asp:ListItem>
                            <asp:ListItem Text="1920" Value="1920"></asp:ListItem>
                            <asp:ListItem Text="1919" Value="1919"></asp:ListItem>
                            <asp:ListItem Text="1918" Value="1918"></asp:ListItem>
                            <asp:ListItem Text="1917" Value="1917"></asp:ListItem>
                            <asp:ListItem Text="1916" Value="1916"></asp:ListItem>
                            <asp:ListItem Text="1915" Value="1915"></asp:ListItem>
                            <asp:ListItem Text="1914" Value="1914"></asp:ListItem>
                            <asp:ListItem Text="1913" Value="1913"></asp:ListItem>
                            <asp:ListItem Text="1912" Value="1912"></asp:ListItem>
                            <asp:ListItem Text="1911" Value="1911"></asp:ListItem>
                            <asp:ListItem Text="1910" Value="1910"></asp:ListItem>
                            <asp:ListItem Text="1909" Value="1909"></asp:ListItem>
                            <asp:ListItem Text="1908" Value="1908"></asp:ListItem>
                            <asp:ListItem Text="1907" Value="1907"></asp:ListItem>
                            <asp:ListItem Text="1906" Value="1906"></asp:ListItem>
                            <asp:ListItem Text="1905" Value="1905"></asp:ListItem>
                            <asp:ListItem Text="1904" Value="1904"></asp:ListItem>
                            <asp:ListItem Text="1903" Value="1903"></asp:ListItem>
                            <asp:ListItem Text="1902" Value="1902"></asp:ListItem>
                            <asp:ListItem Text="1901" Value="1901"></asp:ListItem>
                            <asp:ListItem Text="1900" Value="1900"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                </div>
                <div class="biografia">
                    <label for="biografia">biografia</label> <br />
                    <div class="input-box input-password">
                        <asp:TextBox type="biografia" runat="server" id="txtBiografia" oninput="userInputChanged();"/>
                    </div>
                </div>
                <div class="placewherelives">
                    <label for="placewherelives">¿Donde vive?</label> <br />
                    <div class="input-box input-password">
                        <asp:DropDownList ID="ddlPlaceWhereLives" runat="server" CssClass="custom-dropdown">
                            <asp:ListItem Text="Antigua y Barbuda" Value="Antigua y Barbuda"></asp:ListItem>
                            <asp:ListItem Text="Argentina" Value="Argentina"></asp:ListItem>
                            <asp:ListItem Text="Bahamas" Value="Bahamas"></asp:ListItem>
                            <asp:ListItem Text="Barbados" Value="Barbados"></asp:ListItem>
                            <asp:ListItem Text="Belice" Value="Belice"></asp:ListItem>
                            <asp:ListItem Text="Bolivia" Value="Bolivia"></asp:ListItem>
                            <asp:ListItem Text="Brasil" Value="Brasil"></asp:ListItem>
                            <asp:ListItem Text="Canadá" Value="Canadá"></asp:ListItem>
                            <asp:ListItem Text="Chile" Value="Chile"></asp:ListItem>
                            <asp:ListItem Text="Colombia" Value="Colombia"></asp:ListItem>
                            <asp:ListItem Text="Costa Rica" Value="Costa Rica"></asp:ListItem>
                            <asp:ListItem Text="Cuba" Value="Cuba"></asp:ListItem>
                            <asp:ListItem Text="Dominica" Value="Dominica"></asp:ListItem>
                            <asp:ListItem Text="Ecuador" Value="Ecuador"></asp:ListItem>
                            <asp:ListItem Text="El Salvador" Value="El Salvador"></asp:ListItem>
                            <asp:ListItem Text="Estados Unidos" Value="Estados Unidos"></asp:ListItem>
                            <asp:ListItem Text="Granada" Value="Granada"></asp:ListItem>
                            <asp:ListItem Text="Guatemala" Value="Guatemala"></asp:ListItem>
                            <asp:ListItem Text="Guyana" Value="Guyana"></asp:ListItem>
                            <asp:ListItem Text="Haití" Value="Haití"></asp:ListItem>
                            <asp:ListItem Text="Honduras" Value="Honduras"></asp:ListItem>
                            <asp:ListItem Text="Jamaica" Value="Jamaica"></asp:ListItem>
                            <asp:ListItem Text="México" Value="México"></asp:ListItem>
                            <asp:ListItem Text="Nicaragua" Value="Nicaragua"></asp:ListItem>
                            <asp:ListItem Text="Panamá" Value="Panamá"></asp:ListItem>
                            <asp:ListItem Text="Paraguay" Value="Paraguay"></asp:ListItem>
                            <asp:ListItem Text="Perú" Value="Perú"></asp:ListItem>
                            <asp:ListItem Text="República Dominicana" Value="República Dominicana"></asp:ListItem>
                            <asp:ListItem Text="San Cristóbal y Nieves" Value="San Cristóbal y Nieves"></asp:ListItem>
                            <asp:ListItem Text="San Vicente y las Granadinas" Value="San Vicente y las Granadinas"></asp:ListItem>
                            <asp:ListItem Text="Santa Lucía" Value="Santa Lucía"></asp:ListItem>
                            <asp:ListItem Text="Surinam" Value="Surinam"></asp:ListItem>
                            <asp:ListItem Text="Trinidad y Tobago" Value="Trinidad y Tobago"></asp:ListItem>
                            <asp:ListItem Text="Uruguay" Value="Uruguay"></asp:ListItem>
                            <asp:ListItem Text="Venezuela" Value="Venezuela"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="sex">
                    <label for="sex">sexo</label> <br />
                    <div class="input-box input-password">
                        <asp:DropDownList ID="ddlSex" runat="server" CssClass="custom-dropdown">
                            <asp:ListItem Text="M" Value="M"></asp:ListItem>
                            <asp:ListItem Text="F" Value="F"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="entrar">
                    <asp:Button id="btnRegistrarse" Text="Registrarse" runat="server" Enabled="False" OnClick="btnEntrar_Click" OnClientClick="mostrarProgreso();"/>
                </div>
            </section>
          </ContentTemplate>
      </asp:UpdatePanel>
  </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <script>

        $(document).ready(function () {
            $('#<%=txtTelefono.ClientID%>').mask('+1 (000) 000-0000');
        });


        document.getElementById('txtUsername').addEventListener("keydown", function (event) {

            var char = event.key;

            if (!(/[a-zA-Z0-9_]/.test(char))) {
                event.preventDefault();
            }
        });

        document.getElementById('txtTelefono').addEventListener("keydown", function (event) {
            var char = event.key;

            if (!(/[0-9]/.test(char))) {
                event.preventDefault();
            }
            
            if (event.keyCode === 8) {
                document.getElementById('txtTelefono').value = parseInt(document.getElementById('txtTelefono').value.substring(0, document.getElementById('txtTelefono').length));
            }
        });



        document.getElementById('txtMail').addEventListener("keydown", function (event) {

            var char = event.key;

            if (!(/[a-zA-Z0-9@.]/.test(char))) {
                event.preventDefault();
            }
        });

        document.getElementById('txtPassword').addEventListener("keydown", function (event) {

            var char = event.key;

            if (!(/[a-zA-Z0-9]/.test(char))) {
                event.preventDefault();
            }
        });

        document.getElementById('txtNames').addEventListener("keydown", function (event) {

            var char = event.key;

            if (!(/[a-zA-Z\s]/.test(char))) {
                event.preventDefault();
            }
        });

        document.getElementById('txtBiografia').addEventListener("keydown", function (event) {

            var char = event.key;

            if (!(/[a-zA-Z\s]/.test(char))) {
                event.preventDefault();
            }
        });

        function userInputChanged() {
            var UserText = document.getElementById('<%= txtUsername.ClientID %>').value;
            var NamesText = document.getElementById('<%= txtNames.ClientID %>').value;
            var MailText = document.getElementById('<%= txtMail.ClientID %>').value;
            var PasswordText = document.getElementById('<%= txtPassword.ClientID %>').value;
            var TelefonoText = document.getElementById('<%= txtTelefono.ClientID %>').value;
            var BiografiaText = document.getElementById('<%= txtBiografia.ClientID %>').value;

            var fechaEspecifica = new Date(document.getElementById('<%= ddlAño.ClientID %>').value, document.getElementById('<%= ddlMes.ClientID %>').value - 1, document.getElementById('<%= ddlDia.ClientID %>').value, 0, 0, 0);

            if (UserText.trim() === '' || PasswordText.trim() === '' || NamesText.trim() === '' || MailText.trim() === '' || TelefonoText.trim() === '' || BiografiaText.trim() === '' || fechaEspecifica > new Date() || !MailText.includes("@") || !MailText.includes(".")) {
                document.getElementById('<%= btnRegistrarse.ClientID %>').disabled = true;
            }

            else {
                document.getElementById('<%= btnRegistrarse.ClientID %>').disabled = false;
            }
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
</body>
</html>