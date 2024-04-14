using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = txtBiografia.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = false;

            try
            {

                using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30"))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("CreateUser", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@UserName", txtUsername.Text);

                        command.Parameters.AddWithValue("@Names", txtNames.Text);

                        command.Parameters.AddWithValue("@Passwords", txtPassword.Text);

                        command.Parameters.AddWithValue("@ProfilePhoto", "");

                        command.Parameters.AddWithValue("@Email", txtMail.Text);

                        command.Parameters.AddWithValue("@Phone", txtTelefono.Text);

                        command.Parameters.AddWithValue("@Birthday", new DateTime(Convert.ToInt32(ddlAño.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlDia.SelectedValue)));

                        command.Parameters.AddWithValue("@Biography", txtBiografia.Text);

                        command.Parameters.AddWithValue("@PlaceWhereLives", ddlPlaceWhereLives.SelectedValue);

                        command.Parameters.AddWithValue("@Sex", ddlSex.SelectedValue);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    if (Convert.ToString(reader["Passwords"]) == txtPassword.Text)
                                    {
                                        Application.Lock();

                                        Session["Loged"] = "True";

                                        Session["UserName"] = Convert.ToString(reader["UserName"]);

                                        Session["UserID"] = Convert.ToString(reader["UserID"]);

                                        Response.Redirect("Home.aspx");

                                        Application.UnLock();
                                    }
                                }
                            }

                            else
                            {
                                //Console.WriteLine("No se encontraron filas.");
                            }
                        }
                    }

                }
            }

            catch (Exception)
            {


                txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = txtBiografia.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = true;
            }
        }

        protected void CambienTodos(object sender, EventArgs e)
        {
            if (txtUsername.Text != string.Empty & txtNames.Text != string.Empty & txtMail.Text != string.Empty & txtPassword.Text != string.Empty & txtTelefono.Text != string.Empty & txtBiografia.Text != string.Empty & new DateTime(Convert.ToInt32(ddlAño.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlDia.SelectedValue)) <= DateTime.Now)
            {
                btnRegistrarse.Enabled = true;
            }

            else
            {
                btnRegistrarse.Enabled = false;
            }
        }
    }
}