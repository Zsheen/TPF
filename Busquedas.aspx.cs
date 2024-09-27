using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using IDS348_FinalProject.Models;
using Newtonsoft.Json;
using System.Net.Http;
using System.Web.Services.Description;
using System.Text;

namespace IDS348_FinalProject
{
    public partial class Busquedas : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
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
                Response.Redirect("Twitter.aspx", false);
            }

            else
            {
                CentroDTweets.InnerHtml = ""; PersonasDSugerencias.InnerHtml = "";

                User Vuser = (User)Session["User"];

                imgFotoInferior.ImageUrl = Vuser.ProfilePhoto;

                if (Vuser.UserName.Length > 13)
                {
                    userPlaceholder.InnerText = $"@{Vuser.UserName.Substring(0, 13)}...";
                }
                else
                {
                    userPlaceholder.InnerText = $"@{Vuser.UserName}";
                }

                if (Vuser.Names.Length > 12)
                {
                    nombrePlaceholder.InnerText = Vuser.Names.Substring(0, 11) + "...";
                }
                else
                {
                    nombrePlaceholder.InnerText = Vuser.Names;
                }

                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/Post/Search/{Convert.ToString(HttpContext.Current.Session["Search"])}/{Vuser.UserId}");

                    response.EnsureSuccessStatusCode();

                    string responseBody = await response.Content.ReadAsStringAsync();

                    List<Post> SearchedPosts = JsonConvert.DeserializeObject<List<Post>>(responseBody);

                    Session["SearchedPosts"] = SearchedPosts;
                }

                foreach (Post post in (List<Post>)Session["SearchedPosts"])
                {
                    using (HttpClient client = new HttpClient())
                    {
                        HttpResponseMessage response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/Read/{post.UserId}");

                        response.EnsureSuccessStatusCode();

                        string responseBody = await response.Content.ReadAsStringAsync();

                        User PostUser = JsonConvert.DeserializeObject<User>(responseBody);

                        CentroDTweets.InnerHtml += $@"<section id='centro_tweet' class='centro__tweet'>
                                                                <div class='centro__col'>
                                                                    <img class='centro__user' src='{PostUser.ProfilePhoto}' alt='Foto del usuario'>
                                                                </div>
                                                                <div id='centro_col' class='centro__col'>
                                                                    <div class='centro__row centro__row--user'>
                                                                        <h3 class='centro__h3'>{PostUser.Names}</h3>
                                                                        <h4 class='centro__h4'>@{PostUser.UserName}</h4>
                                                                        <span class='centro__tiempo'> {Home1.Convertir_Fecha_a_Texto(post.PublicationDate)} </span>";

                        var followerData = new Follower
                        {
                            FollowerId = Vuser.UserId,
                            FollowingId = post.UserId
                        };

                        var json = JsonConvert.SerializeObject(followerData);
                        var content = new StringContent(json, Encoding.UTF8, "application/json");

                        response = await client.PostAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/Follower/Read", content);

                        response.EnsureSuccessStatusCode();

                        responseBody = await response.Content.ReadAsStringAsync();

                        if (JsonConvert.DeserializeObject<Follower>(responseBody) != null)
                        {
                            CentroDTweets.InnerHtml += $@"<input id='{post.UserId}' type='button' class='seguir___p' onclick='cambiarColorDeTexto(event);' value='siguiendo' />";
                        }

                        else
                        {
                            CentroDTweets.InnerHtml += $@"<input id='{post.UserId}' type='button' style='color: #ffffff;' class='seguir___p' onclick='cambiarColorDeTexto(event);' value='seguir' />";
                        }

                        CentroDTweets.InnerHtml += $@" </div>
                                                          <div class='centro__row'>
                                                              <p class='centro__text'>{post.Text}</p>
                                                              ";


                        if (post.UrlContenido.Contains("jpg") || post.UrlContenido.Contains("jpeg") || post.UrlContenido.Contains("png") || post.UrlContenido.Contains("gif"))
                        {
                            CentroDTweets.InnerHtml += $@"<img class='centro__img' src='{post.UrlContenido}' alt ='Archivo'>
                                                          ";
                        }

                        else if (post.UrlContenido.Contains("mp4") || post.UrlContenido.Contains("avi") || post.UrlContenido.Contains("mov") || post.UrlContenido.Contains("wmv"))
                        {
                            CentroDTweets.InnerHtml += $@"<video class='centro__vid' onended='ReiniciarVideo(event);' onclick='Pausar_Reproducir(event);'>
                                                               <source class='centro__vid' src='{post.UrlContenido}' type='video/mp4'>Tu navegador no admite el elemento de video.
                                                             </video>
                                                         ";
                        }

                        response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/Comment/GetByPost/{post.PostId}");

                        response.EnsureSuccessStatusCode();

                        responseBody = await response.Content.ReadAsStringAsync();

                        List<Comment> Comments = JsonConvert.DeserializeObject<List<Comment>>(responseBody);

                        CentroDTweets.InnerHtml += $@"</div>
                                                          <ul id='centro_ul' class='centro__ul'>
                                                              <li class='centro__li'>
                                                                  <svg class='centro__svg' id='{post.PostId}' style='fill: #1da1f2;' onclick='Cambia_a_verde(event)' viewBox='0 0 24 24'><g><path d='M14.046 2.242l-4.148-.01h-.002c-4.374 0-7.8 3.427-7.8 7.802 0 4.098 3.186 7.206 7.465 7.37v3.828c0 .108.044.286.12.403.142.225.384.347.632.347.138 0 .277-.038.402-.118.264-.168 6.473-4.14 8.088-5.506 1.902-1.61 3.04-3.97 3.043-6.312v-.017c-.006-4.367-3.43-7.787-7.8-7.788zm3.787 12.972c-1.134.96-4.862 3.405-6.772 4.643V16.67c0-.414-.335-.75-.75-.75h-.396c-3.66 0-6.318-2.476-6.318-5.886 0-3.534 2.768-6.302 6.3-6.302l4.147.01h.002c3.532 0 6.3 2.766 6.302 6.296-.003 1.91-.942 3.844-2.514 5.176z'></path></g></svg>
                                                                  <span class='centro__numero'> {Comments.Count} </span>
                                                              </li>
                                                              <li id='centro_li' class='centro__li'>
                                                                  ";

                        var likeData = new Like
                        {
                            UserId = Vuser.UserId,
                            LikedEntityId = post.PostId,
                            LikedEntityType = "Post"
                        };

                        json = JsonConvert.SerializeObject(likeData);
                        content = new StringContent(json, Encoding.UTF8, "application/json");

                        response = await client.PostAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/Like/Get", content);

                        response.EnsureSuccessStatusCode();

                        responseBody = await response.Content.ReadAsStringAsync();

                        Like like = JsonConvert.DeserializeObject<Like>(responseBody);

                        response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/Like/GetCountByPost/{post.PostId}");

                        response.EnsureSuccessStatusCode();

                        responseBody = await response.Content.ReadAsStringAsync();

                        int likes = JsonConvert.DeserializeObject<int>(responseBody);

                        if (like != null)
                        {
                            CentroDTweets.InnerHtml += $@"<svg class='centro__svg' id='{post.PostId}' style='fill: red;' onclick='cambiarColorDeFondo(event);' viewBox='0 0 24 24'><g><path d='M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z'></path></g></svg>
                                                                  <span id='sDLikes' class='centro__numero'> {likes} </span>
                                                                  </li>";
                        }

                        else
                        {
                            CentroDTweets.InnerHtml += $@"<svg class='centro__svg' id='{post.PostId}' style='fill: #1da1f2' onclick='cambiarColorDeFondo(event);' viewBox='0 0 24 24'><g><path d='M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z'></path></g></svg>
                                                                  <span id='sDLikes' class='centro__numero'> {likes} </span>
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
                                                              <div id='{post.PostId}c' style='width: 100%; position: relative; top: 2%; right: 8%; height: 10%; display: none; align-items: center; margin-bottom: 25px; transition: all 0.8s linear;'>
                                                                  <div style='position: relative; width: 100%; display: flex; margin-bottom: 35px;'>
                                                                      <img style='height: 3em; width: 3em; position: relative; left: 5%' class='centro__user' src='{Vuser.ProfilePhoto}' alt='Foto del usuario'>
                                                                      <textarea id='{post.PostId}t' onkeydown='AgregarComentario(event)' style='position: relative; left: 7.7%; width: 74.8%; height: 50px; top: 10px; border-radius: 0.6em; color: white; border: 1px solid transparent; padding: 1em; resize: none;' class='psndtextarea' placeholder='¿Qué estás pensando?'></textarea>
                                                                  </div>";

                        foreach (Comment comment in Comments)
                        {
                            response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/Read/{comment.UserId}");

                            response.EnsureSuccessStatusCode();

                            responseBody = await response.Content.ReadAsStringAsync();

                            User CommentUser = JsonConvert.DeserializeObject<User>(responseBody);

                            CentroDTweets.InnerHtml += $@"<div style='position: relative; width: 100%; display: flex; margin-bottom: 35px; border-top: 1px dashed #38444d'>
                                                                  <img style='height: 3em; width: 3em; position: relative; left: 5%; top: 5px;' class='centro__user' src='{CommentUser.ProfilePhoto}' alt='Foto del usuario'>
                                                                  <asp:TextBox style='position: relative; left: 4.7%; width: 74.8%; height: 50px; top: 15px; border-radius: 0.6em; color: white; border: 1px solid transparent; padding: 1em;' class='psndtextarea' disabled><span style='font-weight: bold;'>{CommentUser.UserName + "  "}</span>{comment.CommentText}</aso:TextBox>
                                                              </div>";
                        }

                        CentroDTweets.InnerHtml += $@"</div>
                                              </div>
                                          </section>";
                    }
                }

                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/GetByRecommendation/{Vuser.UserId}");

                    string responseBody = await response.Content.ReadAsStringAsync();

                    List<User> RecommendedUsers = JsonConvert.DeserializeObject<List<User>>(responseBody);

                    if (RecommendedUsers != null)
                    {
                        foreach (User user in RecommendedUsers)
                        {
                            if (user.UserName.Length > 13) { user.UserName = user.UserName.Substring(0, 13) + "..."; }

                            if (user.Names.Length > 12) { user.Names = user.Names.Substring(0, 11) + "..."; }

                            PersonasDSugerencias.InnerHtml += $@"<li class='seguir__li'>
                                                                     <img class='seguir__user' src='{user.ProfilePhoto}' alt='User'>
                                                                     <div class='seguir__text'>
                                                                         <h4 class='seguir__h4'>{user.Names}</h4>
                                                                         <p class='seguir__p'>@{user.UserName}</p>
                                                                     </div>
                                                                     <input type='button' value='seguir' onclick='Seguir(event);' class='seguir___a' id='{user.UserId}'>
                                                                 </li>
                                                                 ";
                        }
                    }
                }

                PersonasDSugerencias.InnerHtml += "<a class='der__mostrar' href='#' title='Mostrar Más'>Mostrar Más</a>";
            }
        }

        [System.Web.Services.WebMethod]
        public static void Search(string search)
        {
            HttpContext.Current.Session["Search"] = search;
        }
    }
}