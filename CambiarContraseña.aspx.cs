using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using IDS348_FinalProject.Models;
using Newtonsoft.Json;
using System.Net.Http;

namespace IDS348_FinalProject
{
    public partial class CambiarContraseña : System.Web.UI.Page
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
        }

        protected async void btnSiguiente_Click(object sender, EventArgs e)
        {
            ipMail.Disabled = true;

            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/ChangePassword/{ipMail.Value}");

                string responseBody = await response.Content.ReadAsStringAsync();

                if (responseBody == "Correo no encontrado") { HttpContext.Current.Response.Write("<script>alert('El nombre de usuario o correo que ingreso no existe');</script>"); ipMail.Disabled = false; return; }

                string token = responseBody;

                response = await client.GetAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/Read/{ipMail.Value}");

                response.EnsureSuccessStatusCode();

                responseBody = await response.Content.ReadAsStringAsync();

                Application[token] = JsonConvert.DeserializeObject<User>(responseBody);

                Application[token + "t"] = DateTime.Now.AddMinutes(30);
            }
        }
    }
}