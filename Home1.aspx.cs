using System.IO;
using System.Text;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;
using System.Web;

namespace IDS348_FinalProject
{
    public partial class Home1 : System.Web.UI.Page
    {
        public static string UserName;

        public static int UserID;


        #region Favor_No_Tocar_Si_Usted_No_Se_Llama_Chen

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

                            UserID = Convert.ToInt32(Session["UserID"]);

                            UserName = Convert.ToString(Session["UserName"]);
                        }
                    }
                }

                HtmlGenericControl centroTweets = (HtmlGenericControl)Page.FindControl("CentroDTweets");

                using (SqlCommand command = new SqlCommand("GetPostByFollowing", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserID", Convert.ToString(Session["UserID"]));

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string URLDeSuFoto = $"DatosDeLaApp\\{Convert.ToString(reader["ProfilePhoto"])}";

                            string Contenido = $"DatosDeLaApp\\{Convert.ToString(reader["URLContenido"])}";

                            CentroDTweets.InnerHtml += $@"<section id='centro_tweet' class='centro__tweet'>
                                                                <div class='centro__col'>
                                                                    <img class='centro__user' src='{URLDeSuFoto}' alt='Foto del usuario'>
                                                                </div>
                                                                <div id='centro_col' class='centro__col'>
                                                                    <div class='centro__row centro__row--user'>
                                                                        <h3 class='centro__h3'>{Convert.ToString(reader["Names"])}</h3>
                                                                        <h4 class='centro__h4'>@{Convert.ToString(reader["UserName"])}</h4>
                                                                        <span class='centro__tiempo'> {Convertir_Fecha_a_Texto(Convert.ToDateTime(reader["PublicationDate"]))} </span>
                                                                    </div>
                                                                    <div class='centro__row'>
                                                                        <p class='centro__text'>{Convert.ToString(reader["Text"])}</p>
                                                                        ";

                            string revisar = Convert.ToString(reader["URLContenido"]).Split('.')[Convert.ToString(reader["URLContenido"]).Split('.').Length - 1].ToLower();

                            if (revisar == "jpg" || revisar == "jpeg" || revisar == "png" || revisar == "gif")
                            {
                                CentroDTweets.InnerHtml += $@"<img class='centro__img' src='{Contenido}' alt ='Archivo'>
                                                          ";
                            }

                            else if (revisar == "mp4" || revisar == "avi" || revisar == "mov" || revisar == "wmv")
                            {
                                centroTweets.InnerHtml += $@"<video class='centro__vid' width='320' height='240' muted controls>
                                                               <source class='centro__vid' src='{Contenido}' type='video/mp4'>Tu navegador no admite el elemento de video.
                                                             </video>
                                                         ";
                            }

                            CentroDTweets.InnerHtml += $@"</div>
                                                          <ul id='centro_ul' class='centro__ul'>
                                                              <li class='centro__li'>
                                                                  <svg class='centro__svg' viewBox='0 0 24 24'><g><path d='M14.046 2.242l-4.148-.01h-.002c-4.374 0-7.8 3.427-7.8 7.802 0 4.098 3.186 7.206 7.465 7.37v3.828c0 .108.044.286.12.403.142.225.384.347.632.347.138 0 .277-.038.402-.118.264-.168 6.473-4.14 8.088-5.506 1.902-1.61 3.04-3.97 3.043-6.312v-.017c-.006-4.367-3.43-7.787-7.8-7.788zm3.787 12.972c-1.134.96-4.862 3.405-6.772 4.643V16.67c0-.414-.335-.75-.75-.75h-.396c-3.66 0-6.318-2.476-6.318-5.886 0-3.534 2.768-6.302 6.3-6.302l4.147.01h.002c3.532 0 6.3 2.766 6.302 6.296-.003 1.91-.942 3.844-2.514 5.176z'></path></g></svg>
                                                                  <span class='centro__numero'> 1 </span>
                                                              </li>
                                                              <li id='centro_li' class='centro__li'>
                                                                  ";

                            if (Convert.ToInt16(reader["UserLiked"]) == 1)
                            {
                                CentroDTweets.InnerHtml += $@"<svg class='centro__svg' id='{Convert.ToString(reader["PostID"])}*{Session["UserID"]}' style='fill: red;' onclick='cambiarColorDeFondo(event);' viewBox='0 0 24 24'><g><path d='M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z'></path></g></svg>
                                                                  <span id='sDLikes' class='centro__numero'> {Convert.ToInt64(reader["LikesCount"])} </span>
                                                                  </li>
                                                                  <li class='centro__li'>
                                                                      <svg class='centro__svg' viewBox='0 0 24 24'>
                                                                          <g>
                                                                              <path d='M17.53 7.47l-5-5c-.293-.293-.768-.293-1.06 0l-5 5c-.294.293-.294.768 0 1.06s.767.294 1.06 0l3.72-3.72V15c0 .414.336.75.75.75s.75-.336.75-.75V4.81l3.72 3.72c.146.147.338.22.53.22s.384-.072.53-.22c.293-.293.293-.767 0-1.06z'></path>
                                                                              <path d='M19.708 21.944H4.292C3.028 21.944 2 20.916 2 19.652V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 .437.355.792.792.792h15.416c.437 0 .792-.355.792-.792V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 1.264-1.028 2.292-2.292 2.292z'></path>
                                                                          </g>
                                                                      </svg>
                                                                  </li>
                                                              </ul>
                                                          </div>
                                                      </section>";
                            }

                            else
                            {
                                CentroDTweets.InnerHtml += $@"<svg class='centro__svg' id='{Convert.ToString(reader["PostID"])}*{Session["UserID"]}' style='fill: lightgray' onclick='cambiarColorDeFondo(event);' viewBox='0 0 24 24'><g><path d='M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z'></path></g></svg>
                                                                  <span id='sDLikes' class='centro__numero'> {Convert.ToInt64(reader["LikesCount"])} </span>
                                                                  </li>
                                                                  <li class='centro__li'>
                                                                      <svg class='centro__svg' viewBox='0 0 24 24'>
                                                                          <g>
                                                                              <path d='M17.53 7.47l-5-5c-.293-.293-.768-.293-1.06 0l-5 5c-.294.293-.294.768 0 1.06s.767.294 1.06 0l3.72-3.72V15c0 .414.336.75.75.75s.75-.336.75-.75V4.81l3.72 3.72c.146.147.338.22.53.22s.384-.072.53-.22c.293-.293.293-.767 0-1.06z'></path>
                                                                              <path d='M19.708 21.944H4.292C3.028 21.944 2 20.916 2 19.652V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 .437.355.792.792.792h15.416c.437 0 .792-.355.792-.792V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 1.264-1.028 2.292-2.292 2.292z'></path>
                                                                          </g>
                                                                      </svg>
                                                                  </li>
                                                              </ul>
                                                          </div>
                                                      </section>";
                            }
                        }
                    }
                }

                connection.Close();
            }
        }

        [System.Web.Services.WebMethod]
        public static void DarLike(int UserID, int LikedEntityID, string LikedEntityType)
        {
            using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30"))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("CreateLike", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserID", UserID);
                    command.Parameters.AddWithValue("@LikedEntityID", LikedEntityID);
                    command.Parameters.AddWithValue("@LikedEntityType", LikedEntityType);

                    command.ExecuteNonQuery();
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static void QuitarLike(int UserID, int LikedEntityID, string LikedEntityType)
        {
            using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30"))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("DeleteLike", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserID", UserID);
                    command.Parameters.AddWithValue("@LikedEntityID", LikedEntityID);
                    command.Parameters.AddWithValue("@LikedEntityType", LikedEntityType);

                    command.ExecuteNonQuery();
                }
            }
        }

        #endregion

        [System.Web.Services.WebMethod]
        public static void Twittear(HttpPostedFile Archivo, string Texto)
        {
            string NuevaURLParaContenido = string.Empty;
            string NombreParaElArchivo;

            if (Archivo != null)
            {
                string TipoDeArchivo = Archivo.FileName.Split('.')[Archivo.FileName.Split('.').Length - 1].ToLower();

                do
                {
                    NombreParaElArchivo = GenerarNombreAleatorio();

                } while (File.Exists(@"DatosDeLaApp\" + NombreParaElArchivo + "_" + UserName + "." + TipoDeArchivo));

                NuevaURLParaContenido = @"DatosDeLaApp\" + NombreParaElArchivo + "_" + UserName + "." + TipoDeArchivo;

                //File.Copy(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile) + @"\\Downloads\aoiMLPAxw(Wdecaq123423KliLNbcGghtXfsd)." + form1.Name, NuevaURLParaContenido);

                //File.Delete(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile) + @"\\Downloads\aoiMLPAxw(Wdecaq123423KliLNbcGghtXfsd)." + form1.Name);

                Archivo.SaveAs(NuevaURLParaContenido);
            }

            using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30"))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("CreatePost", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserID", UserID);

                    command.Parameters.AddWithValue("@UserName", UserName);

                    command.Parameters.AddWithValue("@Text", Texto);

                    command.Parameters.AddWithValue("@PublicationDate", DateTime.Now);

                    command.Parameters.AddWithValue("@TipoContenido", "");

                    command.Parameters.AddWithValue("@URLContenido", NuevaURLParaContenido);

                    command.ExecuteNonQuery();
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

        public static string Convertir_Fecha_a_Texto(DateTime Fecha)
        {
            string Fecha_en_Texto = string.Empty;

            switch (Fecha.Month)
            {
                case 1:

                    Fecha_en_Texto += "Ene ";

                    break;

                case 2:

                    Fecha_en_Texto += "Feb ";

                    break;

                case 3:

                    Fecha_en_Texto += "Mar ";

                    break;

                case 4:

                    Fecha_en_Texto += "Abr ";

                    break;

                case 5:

                    Fecha_en_Texto += "May ";

                    break;

                case 6:

                    Fecha_en_Texto += "Jun ";

                    break;

                case 7:

                    Fecha_en_Texto += "Jul ";

                    break;

                case 8:

                    Fecha_en_Texto += "Ago ";

                    break;

                case 9:

                    Fecha_en_Texto += "Sep ";

                    break;

                case 10:

                    Fecha_en_Texto += "Oct ";

                    break;

                case 11:

                    Fecha_en_Texto += "Nov ";

                    break;

                case 12:

                    Fecha_en_Texto += "Dic ";

                    break;
            }

            return Fecha_en_Texto + Fecha.Day;
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