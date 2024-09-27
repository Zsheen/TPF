using System;
using System.Web;
using System.Net.Http;
using Newtonsoft.Json;
using IDS348_FinalProject.Models;
using System.Text;

namespace IDS348_FinalProject
{    
    public partial class LogIn : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["Log"] != null)
            {
                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/Read/{Request.Cookies["Log"].Value.Split('^')[1]}");

                    response.EnsureSuccessStatusCode();

                    string responseBody = await response.Content.ReadAsStringAsync();

                    Session["User"] = JsonConvert.DeserializeObject<User>(responseBody);
                }

                User Vuser = (User)Session["User"];

                if (Vuser.Passwords == Request.Cookies["Log"].Value.Split('^')[2])
                {
                    Application.Lock();

                    Session["Loged"] = "True";

                    Response.Redirect("Home1.aspx", false);

                    Application.UnLock();
                }
            }

            else
            {
                user.Enabled = password.Enabled = true;

                if (user.Text == string.Empty & password.Text == string.Empty)
                {
                    btnEntrar.Enabled = false;
                }

                Session["Confirmation"] = "False";
            }
        }

        protected async void btnEntrar_Click(object sender, EventArgs e)
        {
            user.Enabled = password.Enabled = false;

            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/Read/{user.Text}");

                response.EnsureSuccessStatusCode();

                string responseBody = await response.Content.ReadAsStringAsync();

                Session["User"] = JsonConvert.DeserializeObject<User>(responseBody);

                User Vuser = (User)Session["User"];

                if (Session["User"] != null)
                {
                    if (Vuser.Passwords == password.Text && Vuser.Verified == "V")
                    {
                        Application.Lock();

                        HttpCookie cookie = new HttpCookie("Log", responseBody);

                        cookie.Expires = DateTime.Now.AddMonths(2);

                        Response.Cookies.Add(cookie);

                        Session["Loged"] = "True";

                        Response.Redirect("Home1.aspx", true);

                        Application.UnLock();
                    }

                    else if (Vuser.Passwords == password.Text && Vuser.Verified != "V")
                    {
                        response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/ResendConfirmationEmail/{Vuser.Email}");

                        response.EnsureSuccessStatusCode();

                        user.Enabled = password.Enabled = true;

                        HttpContext.Current.Response.Write("<script>alert('El correo electronico de su cuenta no ha sido validado, se ha enviado un correo para validar su cuenta');</script>");

                        HttpContext.Current.Response.Write("<script>window.location.reload();</script>");
                    }

                    else
                    {
                        user.Enabled = password.Enabled = true;

                        HttpContext.Current.Response.Write("<script>alert('La contraseña que ingreso es erronea');</script>");

                        HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>");
                    }
                }

                else
                {
                    user.Enabled = password.Enabled = true;

                    HttpContext.Current.Response.Write("<script>alert('El nombre de usuario o correo que ingreso no existe');</script>");

                    HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>");
                }
            }
        }
    }
}