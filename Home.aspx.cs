using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml.Linq;

namespace IDS348_FinalProject
{
    public partial class Home : System.Web.UI.Page
    {
        public static Home homeInstance = new Home();

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
                    Session["URLProfilePhoto"] = $"DatosDeLaApp\\{UserResult.ProfilePhoto}";

                    imgFotoInferior.ImageUrl = Convert.ToString(Session["URLProfilePhoto"]);

                    userPlaceholder.InnerText = $"@{UserResult.UserName}";

                    nombrePlaceholder.InnerText = UserResult.Names;

                }
            }
        }

        [System.Web.Services.WebMethod]
        public static void HacerPostStatic(string texto, string NombreDelArchivo)
        {
                using (Database1Entities context = new Database1Entities())
                {
                    string NuevaURLParaContenido = string.Empty;
                    string NombreParaElArchivo;

                    if (NombreDelArchivo != string.Empty)
                    {
                        string TipoDeArchivo = NombreDelArchivo.Split('.')[NombreDelArchivo.Split('.').Length - 1].ToLower();

                        do
                        {
                            NombreParaElArchivo = GenerarNombreAleatorio();

                        } while (File.Exists($"DatosDeLaApp\\{NombreParaElArchivo}_{HttpContext.Current.Session["UserName"]}.{TipoDeArchivo}"));

                        HttpContext.Current.Session["RutaParaGuardarElArchivoDelPost"] = NuevaURLParaContenido = $"DatosDeLaApp\\{NombreParaElArchivo}_{HttpContext.Current.Session["UserName"]}.{TipoDeArchivo}";

                        //archivo.SaveAs(NuevaURLParaContenido);        

                        /*HttpPostedFile file = */
                        //homeInstance.FileUpload1.PostedFile.SaveAs(NuevaURLParaContenido);

                        //FileUpload1.SaveAs(NuevaURLParaContenido);

                        //File.Copy(@"\\?\" + URLDelArchivo, NuevaURLParaContenido);
                    }

                    ObjectResult<CreatePost_Result> Post = context.CreatePost(Convert.ToInt32(HttpContext.Current.Session["UserID"]), Convert.ToString(HttpContext.Current.Session["UserName"]), texto, DateTime.Now, "", NuevaURLParaContenido);

                    context.SaveChanges();
                }
        }

        public static string GenerarNombreAleatorio()
        {
            const string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            StringBuilder nombreAleatorio = new StringBuilder();

            Random rnd = new Random();

            for (int i = 0; i < 8; i++)
            {
                int indiceCaracter = rnd.Next(0, caracteres.Length);
                nombreAleatorio.Append(caracteres[indiceCaracter]);
            }

            return nombreAleatorio.ToString();
        }

        protected void btnTwittear_Click(object sender, EventArgs e)
        {
            using (Database1Entities context = new Database1Entities())
            {
                string NuevaURLParaContenido = string.Empty;
                string NombreParaElArchivo;

                

                if (File1.Value != string.Empty)
                {
                    string TipoDeArchivo = File1.Value.Split('.')[File1.Value.Split('.').Length - 1].ToLower();

                    do
                    {
                        NombreParaElArchivo = GenerarNombreAleatorio();
                        
                    } while (File.Exists($"DatosDeLaApp\\{NombreParaElArchivo}_{Session["UserName"]}.{TipoDeArchivo}"));

                    NuevaURLParaContenido = $"DatosDeLaApp\\{NombreParaElArchivo}_{Session["UserName"]}.{TipoDeArchivo}";

                    File1.PostedFile.SaveAs(NuevaURLParaContenido);

                    //archivo.SaveAs(NuevaURLParaContenido);        

                    /*HttpPostedFile file = */
                    //homeInstance.FileUpload1.PostedFile.SaveAs(NuevaURLParaContenido);

                    //FileUpload1.SaveAs(NuevaURLParaContenido);

                    //File.Copy(@"\\?\" + URLDelArchivo, NuevaURLParaContenido);
                }

                ObjectResult<CreatePost_Result> Post = context.CreatePost(Convert.ToInt32(Session["UserID"]), Convert.ToString(Session["UserName"]), textareaTwitt.Value, DateTime.Now, "", NuevaURLParaContenido);

                context.SaveChanges();
            }
        }
    }
}