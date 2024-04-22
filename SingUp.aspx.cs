using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Net.PeerToPeer;
using System.IO;

namespace IDS348_FinalProject
{
    public partial class SingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (txtUsername.Text != string.Empty & txtPassword.Text != string.Empty)
            {
                btnRegistrarse.Enabled = true;
            }
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

                    using (var transaction = connection.BeginTransaction())
                    {
                        try
                        {
                            using (SqlCommand command = new SqlCommand("CreateUser", connection))
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

                                        Session["Loged"] = "True";

                                        Session["UserName"] = txtUsername.Text;

                                        Session["UserID"] = Convert.ToString(reader["UserID"]);

                                        Response.Redirect("Home1.aspx");

                                        Application.UnLock();
                                    }
                                }
                            }
                            MailMessage mensaje = new MailMessage();

                            mensaje.From = new MailAddress(ConfigurationManager.AppSettings["Email"], "Twitter", System.Text.Encoding.UTF8); ;

                            mensaje.To.Add(txtMail.Text);

                            mensaje.Subject = "Creación de usuario";

                            string intro = $"Se a creado una cuenta de Twitter a nombre de este correo, bajo el nombre de usuario {txtUsername.Text}";

                            mensaje.Body = $"<html><body><p>{intro}</p></body></html>";

                            mensaje.IsBodyHtml = true;

                            mensaje.Priority = MailPriority.High;

                            SmtpClient client = new SmtpClient("smtp.outlook.com", 587);

                            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["EmailPassword"]);

                            client.EnableSsl = true;

                            client.Send(mensaje);

                            if (NuevaURLParaContenido != "Anonimo.jpg")
                            {
                                fuProfilePhoto.SaveAs(MapPath("DatosDeLaApp") + "\\" + NuevaURLParaContenido);
                            }

                            transaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();

                            notification.Icon = SystemIcons.Error;
                            notification.BalloonTipTitle = Convert.ToString(ex.InnerException);
                            notification.BalloonTipText = ex.Message;
                            notification.ShowBalloonTip(4000);
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                notification.Icon = SystemIcons.Error;
                notification.BalloonTipTitle = "Nombre de usuario";
                notification.BalloonTipText = ex.Message;
                notification.ShowBalloonTip(4000);
            }

            txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = fuProfilePhoto.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = true;
        }
    }
}