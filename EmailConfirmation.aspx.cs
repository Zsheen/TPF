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
            if (Convert.ToString(Session["Confirmation"]) != "True")
            {
                Response.Redirect("Twitter.aspx");
            }

            lblEmail.InnerText = Convert.ToString(Session["Email"]);

            lblInformation.InnerText = $"Hemos enviado por correo electrónico a {Convert.ToString(Session["Email"])} el código que hace falta para iniciar sesión";

            aBack.HRef = Convert.ToString(Session["PaginaAnterior"]);
        }

        protected void btnComprobar_Click(object sender, EventArgs e)
        {
            if (txtCódigo.Text == Convert.ToString(Session["CodeConfirmation"]))
            {
                using (SqlConnection connection = new SqlConnection($@"{ConfigurationManager.AppSettings["🌌"]}"))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("UpdateUserVerified", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));

                        command.Parameters.AddWithValue("@Verified", 'V');

                        command.ExecuteNonQuery();

                        Session["Confirmation"] = "False";

                        Session.Remove("Confirmation"); Session.Remove("Email"); Session.Remove("CodeConfirmation"); Session.Remove("PaginaAnterior"); Session.Remove("PaginaAnterior");

                        Session["Loged"] = "True";

                        Response.Redirect("Home1.aspx");
                    }
                }
            }
        }
    }
}