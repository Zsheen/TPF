using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;
using System.Net;
using System.Windows.Forms;
using System.Web;

namespace IDS348_FinalProject
{
    public partial class SingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Confirmation"] = "False";
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            NotifyIcon notification = new NotifyIcon(); notification.Visible = true;

            txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = fuProfilePhoto.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = false;

            string NuevaURLParaContenido = "Anonimo.jpg";

            if (fuProfilePhoto.HasFiles)
            {
                string TipoDeArchivo = fuProfilePhoto.FileName.Split('.')[fuProfilePhoto.FileName.Split('.').Length - 1].ToLower();

                NuevaURLParaContenido = txtUsername.Text + "_" + "ProfilePhoto." + TipoDeArchivo;
            }

            try
            {
                using (SqlConnection connection = new SqlConnection($@"{ConfigurationManager.AppSettings["🌌"]}"))
                {
                    connection.Open();

                    using (SqlTransaction Transaction = connection.BeginTransaction())
                    {
                        try
                        {
                            using (SqlCommand command = new SqlCommand("CreateUser", connection, Transaction))
                            {
                                command.CommandType = CommandType.StoredProcedure;

                                command.Parameters.AddWithValue("@UserName", txtUsername.Text);

                                command.Parameters.AddWithValue("@Names", txtNames.Text);

                                command.Parameters.AddWithValue("@Passwords", txtPassword.Text);

                                command.Parameters.AddWithValue("@ProfilePhoto", NuevaURLParaContenido);

                                command.Parameters.AddWithValue("@Email", txtMail.Text);

                                command.Parameters.AddWithValue("@Phone", txtTelefono.Text);

                                command.Parameters.AddWithValue("@Birthday", new DateTime(Convert.ToInt32(ddlAño.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlDia.SelectedValue)));

                                command.Parameters.AddWithValue("@Biography", " ");

                                command.Parameters.AddWithValue("@PlaceWhereLives", ddlPlaceWhereLives.SelectedValue);

                                command.Parameters.AddWithValue("@Sex", ddlSex.SelectedValue);

                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        Application.Lock();

                                        Session["Confirmation"] = "True";

                                        Session["UserName"] = txtUsername.Text;

                                        Session["UserID"] = Convert.ToString(reader["UserID"]);

                                        Application.UnLock();
                                    }
                                }
                            }

                            MailMessage mensaje = new MailMessage();

                            mensaje.From = new MailAddress(ConfigurationManager.AppSettings["Email"], "Twitter", System.Text.Encoding.UTF8); ;

                            mensaje.To.Add(txtMail.Text);

                            mensaje.Subject = "Creación de usuario";

                            Session["Email"] = txtMail.Text;

                            Session["CodeConfirmation"] = new Random().Next(1000000).ToString("D6");

                            string AbrevCorreo = txtMail.Text.Substring(0, 2) + "**" + txtMail.Text.Split('@')[0][txtMail.Text.Split('@')[0].Length - 1] + "@" + txtMail.Text.Split('@')[1];

                            string intro = $"<div class=\"\"><div class=\"aHl\"></div><div id=\":n6\" tabindex=\"-1\"></div><div id=\":mw\" class=\"ii gt\" jslog=\"20277; u014N:xr6bB; 1:WyIjdGhyZWFkLWY6MTc5NzAzNTEwNjcxMTg2OTQ2MCJd; 4:WyIjbXNnLWY6MTc5NzAzNTEwNjcxMTg2OTQ2MCJd\"><div id=\":mv\" class=\"a3s aiL msg9144470731465038267\"><div class=\"adM\"> </div><u></u>\r\n \r\n\r\n\r\n\r\n\r\n<div>\r\n<table dir=\"ltr\">\r\n      <tbody><tr><td id=\"m_9144470731465038267i1\" style=\"padding:0;font-family:'Segoe UI Semibold','Segoe UI Bold','Segoe UI','Helvetica Neue Medium',Arial,sans-serif;font-size:17px;color:#707070\">Cuenta Twitter</td></tr>\r\n      <tr><td id=\"m_9144470731465038267i2\" style=\"padding:0;font-family:'Segoe UI Light','Segoe UI','Helvetica Neue Medium',Arial,sans-serif;font-size:41px;color:#2672ec\">Código de seguridad</td></tr>\r\n      <tr><td id=\"m_9144470731465038267i3\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">\r\n                \r\n                Usa el siguiente código de seguridad para la cuenta de Twitter <a dir=\"ltr\" id=\"m_9144470731465038267iAccount\" class=\"m_9144470731465038267link\" style=\"color:#2672ec;text-decoration:none\" href=\"{AbrevCorreo}\" target=\"_blank\">{AbrevCorreo}</a>.\r\n            </td></tr>\r\n      <tr><td id=\"m_9144470731465038267i4\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">\r\n                \r\n                Código de seguridad: <span style=\"font-family:'Segoe UI Bold','Segoe UI Semibold','Segoe UI','Helvetica Neue Medium',Arial,sans-serif;font-size:14px;font-weight:bold;color:#2a2a2a\">{Convert.ToString(Session["CodeConfirmation"])}</span>\r\n            </td></tr>\r\n      <tr><td id=\"m_9144470731465038267i5\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">\r\n                \r\n                Si no reconoces la cuenta de Twitter <a dir=\"ltr\" id=\"m_9144470731465038267iAccount\" class=\"m_9144470731465038267link\" style=\"color:#2672ec;text-decoration:none\" href=\"mailto:ch**z@gmail.com\" target=\"_blank\">ch**z@gmail.com</a>, puedes <a id=\"m_9144470731465038267iLink2\" class=\"m_9144470731465038267link\" style=\"color:#2672ec;text-decoration:none\" href=\"https://account.live.com/dp?ft=-DhXNVizUZB*fCtOBxmnEIoRwEYHbONGWRCPTnIIzod8GLrdbiKDZHpWb9tfZtpCr7QmOtWXnYxRxzYB51E7ayAFBZ4zHW07rzqw*!IdbII3n9bDGJ2ub9ooSi!N4*!2ysjo4IfPfeSnUQm7xwF9!D54*9WuA9SXWjNIEQrTUgNomN2ltzbhMwJ3cN!UNvVrm9SnmvYa9xdfnl7BfQrX3hgpz2G5NIRXbiYbr2oTaIaoj\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://account.live.com/dp?ft%3D-DhXNVizUZB*fCtOBxmnEIoRwEYHbONGWRCPTnIIzod8GLrdbiKDZHpWb9tfZtpCr7QmOtWXnYxRxzYB51E7ayAFBZ4zHW07rzqw*!IdbII3n9bDGJ2ub9ooSi!N4*!2ysjo4IfPfeSnUQm7xwF9!D54*9WuA9SXWjNIEQrTUgNomN2ltzbhMwJ3cN!UNvVrm9SnmvYa9xdfnl7BfQrX3hgpz2G5NIRXbiYbr2oTaIaoj&amp;source=gmail&amp;ust=1713879882003000&amp;usg=AOvVaw3vz3XtpXAhoCaQAvlzNclW\">hacer clic aquí</a> para quitar tu dirección de correo electrónico de ella.\r\n            </td></tr>\r\n      <tr><td id=\"m_9144470731465038267i6\" style=\"padding:0;padding-top:25px;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">Gracias,</td></tr>\r\n      <tr><td id=\"m_9144470731465038267i7\" style=\"padding:0;font-family:'Segoe UI',Tahoma,Verdana,Arial,sans-serif;font-size:14px;color:#2a2a2a\">El equipo de cuentas Twitter</td></tr>\r\n</tbody></table>\r\n</div><div class=\"yj6qo\"></div><div class=\"adL\">\r\n</div></div></div><div class=\"WhmR8e\" data-hash=\"0\"></div></div>";

                            mensaje.Body = $"<html><body>{intro}</body></html>";

                            mensaje.IsBodyHtml = true;

                            mensaje.Priority = MailPriority.High;

                            SmtpClient client = new SmtpClient("smtp.outlook.com", 587);

                            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["EmailPassword"]);

                            client.EnableSsl = true;

                            client.Send(mensaje);

                            fuProfilePhoto.SaveAs(MapPath("DatosDeLaApp") + "\\" + NuevaURLParaContenido);

                            Transaction.Commit();

                            Session["PaginaAnterior"] = "SingUp.aspx";

                            Response.Redirect("EmailConfirmation.aspx", false);
                        }

                        catch (SqlException ex)
                        {
                            Transaction.Rollback();

                            if (ex.Message.Contains(txtMail.Text) & ex.Message.Contains("(" + txtUsername.Text + ")"))
                            {
                                notification.Icon = SystemIcons.Error;
                                notification.BalloonTipTitle = "Nombre de usuario y correo en uso";
                                notification.BalloonTipText = "La dirección de correo electronico y el nombre de usuario que ha ingresado ya se encuentran en uso";
                                notification.ShowBalloonTip(4000);
                            }

                            else if (ex.Message.Contains("(" + txtUsername.Text + ")"))
                            {
                                notification.Icon = SystemIcons.Error;
                                notification.BalloonTipTitle = "Nombre de usuario en uso";
                                notification.BalloonTipText = "El nombre de usuario que ha ingresado ya se encuentra en uso";
                                notification.ShowBalloonTip(4000);
                            }

                            else if (ex.Message.Contains(txtMail.Text))
                            {   
                                notification.Icon = SystemIcons.Error;
                                notification.BalloonTipTitle = "Correo en uso";
                                notification.BalloonTipText = "La dirección de correo electronico que ha ingresado ya se encuentra en uso";
                                notification.ShowBalloonTip(4000);
                            }

                            else
                            {
                                notification.Icon = SystemIcons.Error;
                                notification.BalloonTipTitle = Convert.ToString(ex.InnerException);
                                notification.BalloonTipText = ex.Message;
                                notification.ShowBalloonTip(4000);
                            }
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                notification.Icon = SystemIcons.Error;
                notification.BalloonTipTitle = Convert.ToString(ex.InnerException);
                notification.BalloonTipText = ex.Message;
                notification.ShowBalloonTip(4000);
            }

            txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = fuProfilePhoto.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = true;
        }
    }
}