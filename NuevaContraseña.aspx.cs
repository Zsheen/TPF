using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Windows.Forms;

namespace IDS348_FinalProject
{
    public partial class NuevaContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(-1));
                Response.Cache.SetNoStore();
            }

            else if (Request.Headers["Cache-Control"] != "max-age=0") { Response.Redirect(Request.Url.AbsoluteUri); }

            if (Convert.ToString(Session["ChangePassword"]) != "True")
            {
                Response.Redirect("Twitter.aspx");
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            txtContraseña.Enabled = txtCContraseña.Enabled = false;

            if (txtContraseña.Text == txtCContraseña.Text)
            {

                try
                {
                    using (SqlConnection connection = new SqlConnection($@"{ConfigurationManager.AppSettings["🌌"]}"))
                    {
                        connection.Open();

                        using (SqlTransaction transaction = connection.BeginTransaction())
                        {
                            try
                            {
                                using (SqlCommand command = new SqlCommand("UpdateUser", connection, transaction))
                                {
                                    command.CommandType = CommandType.StoredProcedure;

                                    command.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));

                                    command.Parameters.AddWithValue("@Passwords", txtContraseña.Text);

                                    command.ExecuteNonQuery();

                                    Session.Remove("UserID");

                                    MailMessage mensaje = new MailMessage();

                                    mensaje.From = new MailAddress(ConfigurationManager.AppSettings["Email"], "Twitter", System.Text.Encoding.UTF8); ;

                                    mensaje.To.Add(Convert.ToString(Session["Email"]));

                                    mensaje.Subject = "Cambio de contraseña de la cuenta Twitter";

                                    string AbrevCorreo = Convert.ToString(Session["Email"]).Substring(0, 2) + "*****@" + Convert.ToString(Session["Email"]).Split('@')[1];

                                    string intro = $"<div>\r\n<table dir=\"ltr\">\r\n      <tbody><tr><td id=\"m_6383292339703305491i1\" style=\"padding:0;font-family:'Segoe UI Semibold','Segoe UI Bold','Segoe UI','Helvetica Neue Medium',Arial,sans-serif;font-size:17px;color:#707070\">Cuenta Twitter</td></tr>\r\n      <tr><td id=\"m_6383292339703305491i2\" style=\"padding:0;font-family:'Segoe UI Light','Segoe UI','Helvetica Neue Medium',Arial,sans-serif;font-size:41px;color:#2672ec\">Tu <span class=\"il\">contraseña</span> ha cambiado</td></tr>\r\n      <tr><td id=\"m_6383292339703305491i3\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">La <span class=\"il\">contraseña</span> de la cuenta Twitter <a dir=\"ltr\" id=\"m_6383292339703305491iAccount\" class=\"m_6383292339703305491link\" style=\"color:#2672ec;text-decoration:none\" href=\"mailto:{AbrevCorreo}\" target=\"_blank\">{AbrevCorreo}</a>&nbsp;acaba de cambiar.</td></tr>\r\n      <tr><td id=\"m_6383292339703305491i4\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">Si has sido tú, puedes descartar tranquilamente este correo electrónico.</td></tr>      \r\n      <tr><td id=\"m_6383292339703305491i5\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">\r\n                    Si no has sido tú, la seguridad de tu cuenta está en peligro. Sigue este link: <a id=\"m_6383292339703305491iLink1\" class=\"m_6383292339703305491link\" style=\"color:#2672ec;text-decoration:none\" href=\"https://account.live.com/pw\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://account.live.com/pw&amp;source=gmail&amp;ust=1713980618177000&amp;usg=AOvVaw3x8UPogWafxJa035A252CP\">Restablece tu <span class=\"il\">contraseña</span></a>\r\n                </td></tr>\r\n      <tr><td id=\"m_6383292339703305491i8\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">Gracias,</td></tr>\r\n      <tr><td id=\"m_6383292339703305491i9\" style=\"padding:0;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">El equipo de cuentas Twitter</td></tr>\r\n</tbody></table>\r\n</div>";

                                    mensaje.Body = $"<html><body>{intro}</body></html>";

                                    mensaje.IsBodyHtml = true;

                                    mensaje.Priority = MailPriority.High;

                                    SmtpClient client = new SmtpClient("smtp.outlook.com", 587);

                                    client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["EmailPassword"]);

                                    client.EnableSsl = true;

                                    client.Send(mensaje);

                                    transaction.Commit();

                                    txtContraseña.Enabled = txtCContraseña.Enabled = true;

                                    Session.Remove("ChangePassword"); Session.Remove("Email");

                                    Response.Redirect("LogIn.aspx");
                                }
                            }

                            catch (Exception ex)
                            {
                                transaction.Rollback();

                                HttpContext.Current.Response.Write("<script>alert('" + Convert.ToString(ex.InnerException) + "\n\n" + ex.Message + "');</script>");

                                HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>");
                            }
                        }
                    }
                }

                catch (Exception ex)
                {
                    txtContraseña.Enabled = txtCContraseña.Enabled = true;

                    HttpContext.Current.Response.Write("<script>alert('" + Convert.ToString(ex.InnerException) + "\n\n" + ex.Message + "');</script>");

                    HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>");
                }
            }

            else
            {
                HttpContext.Current.Response.Write("<script>alert('Las contraseñas deben ser iguales');</script>");

                HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>");
            }
        }
    }
}