using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Net.WebRequestMethods;
using File = System.IO.File;

namespace IDS348_FinalProject
{
    public partial class Home1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Loged"]) != "True")
            {
                Response.Redirect("Twitter.aspx");
            }

            using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30"))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("ReadUserByUserName", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserName", Convert.ToString(Session["UserName"]));

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Session["URLProfilePhoto"] = $"DatosDeLaApp\\{Convert.ToString(reader["ProfilePhoto"])}";

                            imgFotoInferior.ImageUrl = Convert.ToString(Session["URLProfilePhoto"]);

                            userPlaceholder.InnerText = $"@{Convert.ToString(reader["UserName"])}";

                            nombrePlaceholder.InnerText = Convert.ToString(reader["Names"]);
                        }
                    }
                }
            }
        }

        public static string GenerarNombreAleatorio()
        {
            const string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            StringBuilder nombreAleatorio = new StringBuilder();

            Random rnd = new Random();

            for (int i = 0; i < 8; i++)
            {
                int indiceCaracter = rnd.Next(0, caracteres.Length);
                nombreAleatorio.Append(caracteres[indiceCaracter]);
            }

            return nombreAleatorio.ToString();
        }

        protected void btnTwittear_Click(object sender, EventArgs e)
        {
            string NuevaURLParaContenido = string.Empty;
            string NombreParaElArchivo;

            if (File1.Value != string.Empty)
            {
                string TipoDeArchivo = File1.Value.Split('.')[File1.Value.Split('.').Length - 1].ToLower();

                do
                {
                    NombreParaElArchivo = GenerarNombreAleatorio();

                } while (File.Exists($"DatosDeLaApp\\{NombreParaElArchivo}_{Session["UserName"]}.{TipoDeArchivo}"));

                NuevaURLParaContenido = $"DatosDeLaApp\\{NombreParaElArchivo}_{Session["UserName"]}.{TipoDeArchivo}";

                File1.PostedFile.SaveAs(NuevaURLParaContenido);
            }

            using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30"))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("CreatePost", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserID", Convert.ToString(Session["UserID"]));

                    command.Parameters.AddWithValue("@UserName", Convert.ToString(Session["UserName"]));

                    command.Parameters.AddWithValue("@Text", textareaTwitt.Value);

                    command.Parameters.AddWithValue("@PublicationDate", DateTime.Now);

                    command.Parameters.AddWithValue("@TipoContenido", "");

                    command.Parameters.AddWithValue("@URLContenido", NuevaURLParaContenido);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                        }
                    }
                }
            }
        }

        protected string BuscarPosts(string searchTerm)
        {
            // Conexión a la base de datos
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30";

            StringBuilder htmlResult = new StringBuilder();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Nombre del stored procedure creado para buscar posts
                string storedProcedureName = "SearchPosts";

                using (SqlCommand command = new SqlCommand(storedProcedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Parámetro para el término de búsqueda
                    command.Parameters.AddWithValue("@SearchTerm", searchTerm);

                    try
                    {
                        connection.Open();

                        // Ejecutar el comando y obtener los resultados
                        SqlDataReader reader = command.ExecuteReader();

                        // Construir la cadena HTML con los resultados de la búsqueda
                        while (reader.Read())
                        {
                            // Por ejemplo, asumiendo que la columna "Text" contiene el texto de cada post
                            string postText = reader["Text"].ToString();
                            htmlResult.Append($"<div>{postText}</div>");
                        }

                    }
                    catch (Exception)
                    {

                        // lblMessage.Text = "Error al buscar posts: " + ex.Message;
                    }
                }
            }

            return htmlResult.ToString();
        }
    }
}