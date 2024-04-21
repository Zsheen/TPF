using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Configuration;

namespace IDS348_FinalProject.Controllers
{
    public class MailController : Controller
    {
        // GET: Mail
        public ActionResult SendConfirmationEmail(string userEmail)
        {
            // Generar un token único para el enlace de confirmación
            string token = GenerateToken();

            // Construir el enlace de confirmación
            string confirmationLink = System.Web.Mvc.UrlHelper.GenerateUrl("httproute", "ConfirmEmail", "MailController", new {tokn = token }, );//Url.Action("ConfirmEmail", "MailController", new { token = token }, "http");

            // Construir el cuerpo del correo electrónico
            string body = $"Por favor, haz clic en el siguiente enlace para confirmar tu cuenta: <a href='{confirmationLink}'>Confirmar</a>";

            // Enviar el correo electrónico
            SendEmail(userEmail, "Confirmación de cuenta", body);

            return View("ConfirmationSent");
        }

        // Método para manejar la confirmación de correo electrónico
        public ActionResult ConfirmEmail(string token)
        {

            return View("EmailConfirmed");
        }

        // Método para generar un token único
        private string GenerateToken()
        {
            byte[] tokenData = new byte[32];
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(tokenData);
            }
            return Convert.ToBase64String(tokenData);
        }

        // Método para enviar el correo electrónico
        private void SendEmail(string toEmail, string subject, string body)
        {
            using (var smtpClient = new SmtpClient("smtp.outlook.com", 587))
            {
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["EmailPassword"]);
                smtpClient.Send(ConfigurationManager.AppSettings["Email"], toEmail, subject, body);
            }
        }
    }
}