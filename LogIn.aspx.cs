using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDS348_FinalProject
{    
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(user.Text != string.Empty & password.Text != string.Empty)
            {
                btnEntrar.Enabled = true;
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30"))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("ReadUserByUserName", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserName", Convert.ToString(user.Text));

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                if (Convert.ToString(reader["Passwords"]) == password.Text)
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
    }
}
