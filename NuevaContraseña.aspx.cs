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
using IDS348_FinalProject.Models;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;

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

            string token = Request.QueryString["token"];

            if ((User)Application[token] == null || Convert.ToDateTime(Application[token + "t"]) < DateTime.Now)
            {
                Response.Redirect("Twitter.aspx");
            }

            Session["User"] = (User)Application[token];
        }

        protected async void btnConfirmar_Click(object sender, EventArgs e)
        {
            txtContraseña.Enabled = txtCContraseña.Enabled = false;

            if (txtContraseña.Text == txtCContraseña.Text)
            {
                using (HttpClient client = new HttpClient())
                {
                    User user = new User
                    {
                        UserId = ((User)Session["User"]).UserId,
                        Passwords = txtContraseña.Text
                    };

                    var json = JsonConvert.SerializeObject(user);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    HttpResponseMessage response = await client.PutAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/Update", content);

                    response.EnsureSuccessStatusCode();
                }

                HttpContext.Current.Response.Write("<script>alert('Se ha restablecido su contraseña');</script>");

                Response.Redirect("LogIn.aspx", false);
            }

            else
            {
                HttpContext.Current.Response.Write("<script>alert('Las contraseñas deben ser iguales');</script>");

                HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>");
            }
        }
    }
}