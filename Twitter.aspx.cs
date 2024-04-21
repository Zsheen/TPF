using IDS348_FinalProject.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDS348_FinalProject
{
    public partial class Twitter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MailController mailController = new MailController();

            mailController.SendConfirmationEmail("chenderamirez@gmail.com");
        }
    }
}