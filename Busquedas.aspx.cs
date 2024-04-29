using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace IDS348_FinalProject
{
    public partial class Busquedas : System.Web.UI.Page
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

            if (Convert.ToString(Session["Loged"]) != "True" || Convert.ToString(Session["Search"]) == string.Empty)
            {
                Response.Redirect("Twitter.aspx");
            }

            using (SqlConnection connection = new SqlConnection($@"{ConfigurationManager.AppSettings["🌌"]}"))
            {
                connection.Open();

                CentroDTweets.InnerHtml = ""; PersonasDSugerencias.InnerHtml = "";

                using (SqlCommand command = new SqlCommand("ReadUserByParameter", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@SearchParameter", Convert.ToString(Session["UserName"]));

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Session["URLProfilePhoto"] = $"DatosDeLaApp\\{Convert.ToString(reader["ProfilePhoto"])}";

                            imgFotoInferior.ImageUrl = Convert.ToString(Session["URLProfilePhoto"]);

                            if (Convert.ToString(reader["UserName"]).Length > 13)
                            {
                                userPlaceholder.InnerText = $"@{Convert.ToString(reader["UserName"]).Substring(0, 13)}...";
                            }
                            else
                            {
                                userPlaceholder.InnerText = $"@{Convert.ToString(reader["UserName"])}";
                            }

                            if (Convert.ToString(reader["Names"]).Length > 12)
                            {
                                nombrePlaceholder.InnerText = Convert.ToString(reader["Names"]).Substring(0, 11) + "...";
                            }
                            else
                            {
                                nombrePlaceholder.InnerText = Convert.ToString(reader["Names"]);
                            }
                        }
                    }
                }

                List<SearchPost> Posts = new List<SearchPost>();

                using (SqlCommand command = new SqlCommand("SearchPosts", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@Search", Convert.ToString(HttpContext.Current.Session["Search"]));

                    command.Parameters.AddWithValue("@UserID", Convert.ToString(Session["UserID"]));

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Posts.Add(new SearchPost { PostID = Convert.ToInt32(reader["PostID"]), UserID = Convert.ToInt32(reader["UserID"]), Text = Convert.ToString(reader["Text"]), PublicationDate = Convert.ToDateTime(reader["PublicationDate"]), TipoContenido = Convert.ToString(reader["TipoContenido"]), URLContenido = Convert.ToString(reader["URLContenido"]), UserName = Convert.ToString(reader["UserName"]), Names = Convert.ToString(reader["Names"]), ProfilePhoto = Convert.ToString(reader["ProfilePhoto"]), LikesCount = Convert.ToInt32(reader["LikesCount"]), CommentsCount = Convert.ToInt32(reader["CommentsCount"]), UserLiked = Convert.ToInt16(reader["UserLiked"]), Followed = Convert.ToInt32(reader["Followed"]) });
                        }
                    }
                }

                foreach (SearchPost post in Posts)
                {

                    string URLDeSuFoto = $"DatosDeLaApp\\{post.ProfilePhoto}";

                    string Contenido = $"DatosDeLaApp\\{post.URLContenido}";

                    CentroDTweets.InnerHtml += $@"<section id='centro_tweet' class='centro__tweet'>
                                                                <div class='centro__col'>
                                                                    <img class='centro__user' src='{URLDeSuFoto}' alt='Foto del usuario'>
                                                                </div>
                                                                <div id='centro_col' class='centro__col'>
                                                                    <div class='centro__row centro__row--user'>
                                                                        <h3 class='centro__h3'>{post.Names}</h3>
                                                                        <h4 class='centro__h4'>@{post.UserName}</h4>
                                                                        <span class='centro__tiempo'> {Home1.Convertir_Fecha_a_Texto(post.PublicationDate)} </span>";

                    if (post.Followed == 1)
                    {

                        CentroDTweets.InnerHtml += $@"<input id='{post.UserID}' type='button' class='seguir___p' onclick='cambiarColorDeTexto(event);' value='siguiendo' />
                                                          ";
                    }

                    else
                    {
                        CentroDTweets.InnerHtml += $@"<input id='{post.UserID}' type='button' style='color: #ffffff;' class='seguir___p' onclick='cambiarColorDeTexto(event);' value='seguir' />
                                                          ";
                    }

                    CentroDTweets.InnerHtml += $@"</div>
                                                  <div class='centro__row'>
                                                      <p class='centro__text'>{post.Text}</p>
                                                      ";

                    string revisar = post.URLContenido.Split('.')[post.URLContenido.Split('.').Length - 1].ToLower();

                    if (revisar == "jpg" || revisar == "jpeg" || revisar == "png" || revisar == "gif")
                    {
                        CentroDTweets.InnerHtml += $@"<img class='centro__img' src='{Contenido}' alt ='Archivo'>
                                                          ";
                    }

                    else if (revisar == "mp4" || revisar == "avi" || revisar == "mov" || revisar == "wmv")
                    {
                        CentroDTweets.InnerHtml += $@"<video class='centro__vid' onended='ReiniciarVideo(event);' onclick='Pausar_Reproducir(event);'>
                                                               <source class='centro__vid' src='{Contenido}' type='video/mp4'>Tu navegador no admite el elemento de video.
                                                             </video>
                                                         ";
                    }

                    CentroDTweets.InnerHtml += $@"</div>
                                                          <ul id='centro_ul' class='centro__ul'>
                                                              <li class='centro__li'>
                                                                  <svg class='centro__svg' id='{post.PostID}' style='fill: #1da1f2;' onclick='Cambia_a_verde(event)' viewBox='0 0 24 24'><g><path d='M14.046 2.242l-4.148-.01h-.002c-4.374 0-7.8 3.427-7.8 7.802 0 4.098 3.186 7.206 7.465 7.37v3.828c0 .108.044.286.12.403.142.225.384.347.632.347.138 0 .277-.038.402-.118.264-.168 6.473-4.14 8.088-5.506 1.902-1.61 3.04-3.97 3.043-6.312v-.017c-.006-4.367-3.43-7.787-7.8-7.788zm3.787 12.972c-1.134.96-4.862 3.405-6.772 4.643V16.67c0-.414-.335-.75-.75-.75h-.396c-3.66 0-6.318-2.476-6.318-5.886 0-3.534 2.768-6.302 6.3-6.302l4.147.01h.002c3.532 0 6.3 2.766 6.302 6.296-.003 1.91-.942 3.844-2.514 5.176z'></path></g></svg>
                                                                  <span class='centro__numero'> {post.CommentsCount} </span>
                                                              </li>
                                                              <li id='centro_li' class='centro__li'>
                                                                  ";

                    if (post.UserLiked == 1)
                    {
                        CentroDTweets.InnerHtml += $@"<svg class='centro__svg' id='{post.PostID}' style='fill: red;' onclick='cambiarColorDeFondo(event);' viewBox='0 0 24 24'><g><path d='M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z'></path></g></svg>
                                                                  <span id='sDLikes' class='centro__numero'> {post.LikesCount} </span>
                                                                  </li>";
                    }

                    else
                    {
                        CentroDTweets.InnerHtml += $@"<svg class='centro__svg' id='{post.PostID}' style='fill: #1da1f2' onclick='cambiarColorDeFondo(event);' viewBox='0 0 24 24'><g><path d='M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z'></path></g></svg>
                                                                  <span id='sDLikes' class='centro__numero'> {post.LikesCount} </span>
                                                                  </li>";
                    }

                    CentroDTweets.InnerHtml += $@"<li class='centro__li'>
                                                                      <svg class='centro__svg' viewBox='0 0 24 24'>
                                                                          <g>
                                                                              <path d='M17.53 7.47l-5-5c-.293-.293-.768-.293-1.06 0l-5 5c-.294.293-.294.768 0 1.06s.767.294 1.06 0l3.72-3.72V15c0 .414.336.75.75.75s.75-.336.75-.75V4.81l3.72 3.72c.146.147.338.22.53.22s.384-.072.53-.22c.293-.293.293-.767 0-1.06z'></path>
                                                                              <path d='M19.708 21.944H4.292C3.028 21.944 2 20.916 2 19.652V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 .437.355.792.792.792h15.416c.437 0 .792-.355.792-.792V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 1.264-1.028 2.292-2.292 2.292z'></path>
                                                                          </g>
                                                                      </svg>
                                                                  </li>
                                                              </ul>
                                                              <div id='{post.PostID}c' style='width: 100%; position: relative; top: 2%; right: 8%; height: 10%; display: none; align-items: center; margin-bottom: 25px; transition: all 0.8s linear;'>
                                                                  <div style='position: relative; width: 100%; display: flex; margin-bottom: 35px;'>
                                                                      <img style='height: 3em; width: 3em; position: relative; left: 5%' class='centro__user' src='{Convert.ToString(HttpContext.Current.Session["URLProfilePhoto"])}' alt='Foto del usuario'>
                                                                      <textarea id='{post.PostID}t' onkeydown='AgregarComentario(event)' style='position: relative; left: 7.7%; width: 74.8%; height: 50px; top: 10px; border-radius: 0.6em; color: white; border: 1px solid transparent; padding: 1em; resize: none;' class='pasando_textarea' placeholder='¿Qué estás pensando?'></textarea>
                                                                  </div>";

                    using (SqlCommand command2 = new SqlCommand("ReadComments", connection))
                    {
                        command2.CommandType = CommandType.StoredProcedure;

                        command2.Parameters.AddWithValue("@PostID", post.PostID);

                        using (SqlDataReader reader2 = command2.ExecuteReader())
                        {
                            while (reader2.Read())
                            {
                                CentroDTweets.InnerHtml += $@"<div style='position: relative; width: 100%; display: flex; margin-bottom: 35px; border-top: 1px dashed #38444d'>
                                                                  <img style='height: 3em; width: 3em; position: relative; left: 5%; top: 5px;' class='centro__user' src='{$"DatosDeLaApp\\{Convert.ToString(reader2["ProfilePhoto"])}"}' alt='Foto del usuario'>
                                                                  <asp:TextBox style='position: relative; left: 4.7%; width: 74.8%; height: 50px; top: 15px; border-radius: 0.6em; color: white; border: 1px solid transparent; padding: 1em;' class='pasando_textarea' disabled><span style='font-weight: bold;'>{Convert.ToString(reader2["UserName"]) + "  "}</span>{Convert.ToString(reader2["Comment_Text"])}</aso:TextBox>
                                                              </div>";
                            }
                        }
                    }

                    CentroDTweets.InnerHtml += $@"</div>
                                              </div>
                                          </section>";
                }

                using (SqlCommand command = new SqlCommand("GetUserByFollowing", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserID", Convert.ToString(Session["UserID"]));

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string UserName = Convert.ToString(reader["UserName"]); string Names = Convert.ToString(reader["Names"]);

                            if (UserName.Length > 13) { UserName = UserName.Substring(0, 13) + "..."; }

                            if (Names.Length > 12) { Names = Names.Substring(0, 11) + "..."; }

                            PersonasDSugerencias.InnerHtml += $@"<li class='seguir__li'>
                                                                     <img class='seguir__user' src='DatosDeLaApp\\{Convert.ToString(reader["ProfilePhoto"])}' alt='User'>
                                                                     <div class='seguir__text'>
                                                                         <h4 class='seguir__h4'>{Names}</h4>
                                                                         <p class='seguir__p'>@{UserName}</p>
                                                                     </div>
                                                                     <input type='button' value='seguir' onclick='Seguir(event);' class='seguir___a' id='{Convert.ToString(reader["UserID"])}'>
                                                                 </li>
                                                                 ";
                        }

                        PersonasDSugerencias.InnerHtml += "<a class='der__mostrar' href='#' title='Mostrar Más'>Mostrar Más</a>";
                    }
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static void Search(string search)
        {
            HttpContext.Current.Session["Search"] = search;
        }
    }

    public class SearchPost
    {
        public int PostID { get; set; }

        public int UserID { get; set; }

        public string Text { get; set; }

        public DateTime PublicationDate { get; set; }

        public string TipoContenido { get; set; }

        public string URLContenido { get; set; }

        public string UserName { get; set; }

        public string Names { get; set; }

        public string ProfilePhoto { get; set; }

        public int LikesCount { get; set; }

        public int CommentsCount { get; set; }

        public int UserLiked { get; set; }

        public int Followed {  get; set; }
    }
}