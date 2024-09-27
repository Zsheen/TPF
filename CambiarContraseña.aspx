﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarContraseña.aspx.cs" Inherits="IDS348_FinalProject.CambiarContraseña" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #btnSiguiente{
            position: relative;
            top: 38px;
            background-color: rgb(151, 208, 248);
            color: rgb(255, 255, 255);
            width: 24%;
            height: 38px;
            border-radius: 9999px;
            font-weight: bold;
            outline: 0;
            border: none;
        }

        #btnSiguiente:enabled:hover,
        #mobbtnSiguiente:enabled:hover
        {
            background-color: #1A91DA;
        }

        .mail{
          background-color: rgb(245, 248, 250);
          border-bottom: 2px solid rgb(101, 119, 134);
          padding-top: 8px;
        }

        #MiUnicoDiv:focus-within{
            color: rgb(29, 161, 242);
            border-color: rgb(29, 161, 242);
        }


    </style>
    <link rel="icon" type="image/x-icon" href="DatosDeLaApp\twitter-logo.png">
</head>
<body>
    <form id="form1" runat="server">
        <div style="position: relative;left: 2.8%; top: 2.2px">
            <svg style="height: 130px; margin-bottom: -0.8%" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" class="iconify iconify--noto" preserveAspectRatio="xMidYMid meet" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M44.57 93.84s2.67 7.18 1.13 9.71c-1.55 2.53-7.74 2.04-9.64 3.24c-1.36.86-1.34 3.24-.49 4.22c.84.99 13.09.14 15.49-4.5s-.86-13.52-.86-13.52l-5.63.85z" fill="#f97d23"></path><path d="M64.13 92.99l-5.21 1.13s2.25 9.43.42 12.53c-1.83 3.1-8.39 6.41-9.57 9.01c-1.06 2.32 1.55 4.22 5.63 1.69s8.7-6.31 9.57-8.17c2.12-4.5-.84-16.19-.84-16.19z" fill="#f97d23"></path><path d="M28.52 21.9C17.44 24.39 8.81 33.73 12.05 47.94c1.92 8.43 3.1 11.4 3.8 15.2c1.48 7.99 1.08 11.5 4.46 18.82c3.59 7.79 16.8 17.79 33.27 15.39s23.09-4.65 23.09-4.65l5.91-5.21l5.63-1.41l.84-4.08s4.21-.19 5.07-1.55c1.36-2.16.56-3.94-1.83-4.79c-2.39-.84-3.8-1.55-3.8-1.55s23.23-15.35 26.04-17.03s7.18-4.58 7.39-5.63c.53-2.67-6.69-8.59-16.12-11.4c-9.43-2.82-17.53-3.59-18.86-2.53c-1.77 1.39-9.57 16.05-14.78 15.35c-6.76-.92-11.4-7.25-12.67-10.84c-1.44-4.07-10.09-24.82-30.97-20.13z" fill="#36b4e1"></path><path d="M14.3 43.86c-1.69-.28-6.01 4.32-6.85 5.44s-2.17 2.73-1.69 3.94c.75 1.88 4.6 1.98 6.85 2.16c2.35.19 6.85.56 7.6-.84c.75-1.41-.84-4.97-2.16-7.13c-1.22-2.01-1.99-3.27-3.75-3.57z" fill="#f97d23"></path><ellipse transform="rotate(-6.88 32.19 43.623)" cx="32.19" cy="43.61" rx="4.02" ry="4.36" fill="#2a2d2f"></ellipse><path d="M45.41 73.71c-1.95.71.61 7.6 3.24 10.7c2.77 3.26 9.47 10.58 19.71 11.54c6.95.66 10.04-1.31 11.68-3.1c1.22-1.33 2.53-2.87 3.43-3.57c1.31-1.03 2.63-.14 4.88-1.78c1.62-1.18 1.97-3.14 2.82-3.85c.84-.7 2.27-.54 3-1.22c1.31-1.22 1.13-4.79.19-4.97s-1.03 2.53-1.97 2.91s-2.19.14-3.94 1.13c-1.5.84-1.03 2.53-2.06 3.28s-2.91-.28-5.44 1.13c-1.37.76-2.53 4.41-6.48 5.26c-4.9 1.05-12.25-2.52-15.77-5.07c-8.17-5.92-9.96-13.61-13.29-12.39z" fill="#026aa8"></path></g></svg>
            <h1 style="font-size: 40px; font-weight: normal; font-family: SegoeUI-Light-final, Segoe UI Light, Segoe UI, Segoe, Tahoma, Helvetica, Arial, Sans-Serif">Vuelva a su cuenta</h1>
            <h2 style="font-size: 27.5px; font-weight: normal; font-family: SegoeUI-Light-final, Segoe UI Light, Segoe UI, Segoe, Tahoma, Helvetica, Arial, Sans-Serif">¿Quién es usted?</h2>
            <label style="color: #666666; font-family: Segoe UI-Regular-final, Segoe UI, Segoe, Tahoma, Helvetica, Arial, Sans-Serif">Para recuperar su cuenta, escriba su nombre de usuario o correo electrónico.</label><br /><br />
            <label style="position: relative; top: 10px; color: #666666; font-family: Segoe UI-Regular-final, Segoe UI, Segoe, Tahoma, Helvetica, Arial, Sans-Serif">Correo electrónico o nombre de usuario: <span style="color: #a80f22">*</span></label>
            <div id="MiUnicoDiv" class="MiUnicoDiv" style="position: relative; top: 20px; width: 24%; padding-top: 3px; background-color: rgb(245, 248, 250); border-bottom: 2px solid rgb(101, 119, 134); font-family: 'Montserrat', sans-serif;">
                <br/>
                <input style="padding-bottom: 2px; position: relative; color: black; font-size: 20px; height: 75%; width: 96%; left: 2%; outline: 0; background: none; font-family: 'Montserrat', sans-serif; border: none; display: block" value="" id="ipMail" runat="server"/>
            </div>
            <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" Enabled="false" OnClick="btnSiguiente_Click" />
        </div>
    </form>
    <script>

        document.getElementById('ipMail').addEventListener('input', function () {

            var MailText = document.getElementById('<%= ipMail.ClientID %>').value;

            if (MailText.trim() !== '') {
                document.getElementById('<%= btnSiguiente.ClientID %>').disabled = false;
            }

            else {
                document.getElementById('<%= btnSiguiente.ClientID %>').disabled = true;
            }
        });

        document.getElementById('ipMail').addEventListener("keydown", function (event) {

            var char = event.key;

            if (!(/[a-zA-Z0-9@.]/.test(char))) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>
