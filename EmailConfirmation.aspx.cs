using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDS348_FinalProject
{
    public partial class EmailConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCódigo.Enabled = true;

            if (!IsPostBack)
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(-1));
                Response.Cache.SetNoStore();
            }

            else if (Request.Headers["Cache-Control"] != "max-age=0") { Response.Redirect(Request.Url.AbsoluteUri); }

            if (Convert.ToString(Session["Confirmation"]) != "True")
            {
                Response.Redirect("Twitter.aspx");
            }

            lblEmail.InnerText = Convert.ToString(Session["Email"]);

            if (Convert.ToString(Session["PaginaAnterior"]) == "CambiarContraseña.aspx")
            {
                lblInformation.InnerText = $"Hemos enviado por correo electrónico a {Convert.ToString(Session["Email"])} el código que hace falta para restablecer su contraseña";
            }

            else { lblInformation.InnerText = $"Hemos enviado por correo electrónico a {Convert.ToString(Session["Email"])} el código que hace falta para iniciar sesión"; }

            aBack.HRef = Convert.ToString(Session["PaginaAnterior"]);
        }

        protected void btnComprobar_Click(object sender, EventArgs e)
        {
            txtCódigo.Enabled = false;

            if (txtCódigo.Text == Convert.ToString(Session["CodeConfirmation"]))
            {
                using (SqlConnection connection = new SqlConnection($@"{ConfigurationManager.AppSettings["🌌"]}"))
                {
                    connection.Open();

                    if (Convert.ToString(Session["PaginaAnterior"]) == "CambiarContraseña.aspx")
                    {
                        Session.Remove("CodeConfirmation"); Session.Remove("PaginaAnterior"); Session.Remove("Confirmation");

                        Session["ChangePassword"] = "True"; txtCódigo.Enabled = true;

                        Response.Redirect("NuevaContraseña.aspx");
                    }

                    else
                    {
                        using (SqlCommand command = new SqlCommand("UpdateUser", connection))
                        {
                            command.CommandType = CommandType.StoredProcedure;

                            command.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));

                            command.Parameters.AddWithValue("@Verified", 'V');

                            command.ExecuteNonQuery();

                            Application.Lock();

                            Session["Confirmation"] = "False";

                            HttpCookie cookie = new HttpCookie("Log", $"{Convert.ToString(Session["UserID"])}^{Convert.ToString(Session["UserName"])}^{Convert.ToString(Session["Password"])}");

                            cookie.Expires = DateTime.Now.AddMonths(2);

                            Response.Cookies.Add(cookie);

                            Session.Remove("Email"); Session.Remove("CodeConfirmation"); Session.Remove("PaginaAnterior"); Session.Remove("Confirmation"); Session.Remove("Password");

                            Session["Loged"] = "True"; txtCódigo.Enabled = true;

                            Response.Redirect("Home1.aspx");

                            Application.UnLock();
                        }
                    }
                }
            }

            else
            {
                txtCódigo.Enabled = true; HttpContext.Current.Response.Write("<script>alert('Codigo incorrecto');</script>"); HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>");
            }
        }
    }
}