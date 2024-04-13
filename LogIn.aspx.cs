using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
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

        [WebMethod]

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            using (Database1Entities context = new Database1Entities())
            {
                rogressBar.Style.Add(HtmlTextWriterStyle.Width, "30%");

                ObjectResult<ReadUserByUserName_Result> User = context.ReadUserByUserName(Convert.ToString(user.Text));

                if (User != null)
                {
                    foreach (var userResult in User)
                    {
                        if (userResult.Passwords == password.Text)
                        {
                            Application.Lock();

                            Session["Loged"] = "True";

                            Session["UserName"] = userResult.UserName;

                            Session["UserID"] = userResult.UserID;

                            Response.Redirect("Home.aspx");

                            Application.UnLock();
                        }
                    }
                }
            }
        }
    }
}