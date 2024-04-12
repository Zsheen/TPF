using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDS348_FinalProject
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Loged"]) != "True")
            {
                Response.Redirect("Twitter.aspx");
            }

            using (Database1Entities context = new Database1Entities())
            {
                ObjectResult<ReadUserByUserName_Result> User = context.ReadUserByUserName(Convert.ToString(Session["UserName"]));

                foreach (var UserResult in User)
                {
                    imgFotoInferior.ImageUrl = $"DatosDeLaApp\\{UserResult.ProfilePhoto}";

                    userPlaceholder.InnerText = $"@{UserResult.UserName}";

                    nombrePlaceholder.InnerText = UserResult.Names;

                }
            }
        }

        protected void lnkInicio_Click(object sender, EventArgs e)
        {

        }

        protected void lnkNotificaciones_Click(object sender, EventArgs e)
        {

        }

        protected void lnkMensajes_Click(object sender, EventArgs e)
        {

        }

        protected void lnkGuardados_Click(object sender, EventArgs e)
        {

        }

        protected void lnkPerfil_Click(object sender, EventArgs e)
        {

        }

        protected void lnkAjustes_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}