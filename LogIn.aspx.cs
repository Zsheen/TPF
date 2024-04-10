using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDS348_FinalProject
{    
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            using (Database1Entities context = new Database1Entities())
            {
                ObjectResult<ReadUserByUserName_Result> User = context.ReadUserByUserName(Convert.ToString(user.Text));

                if (User != null)
                {
                    foreach (var userResult in User)
                    {
                        if (userResult.Passwords == password.Text)
                        {
                            Response.Redirect("Home.aspx");
                        }
                    }
                }  
            }
        }
    }
}