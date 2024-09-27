using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;
using System.Net;
using System.Windows.Forms;
using System.Web;
using Firebase.Auth;
using Firebase.Storage;
using IDS348_FinalProject.Models;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using User = IDS348_FinalProject.Models.User;

namespace IDS348_FinalProject
{
    public partial class SingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = fuProfilePhoto.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = true;
        }

        protected async void btnEntrar_Click(object sender, EventArgs e)
        {
            txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = fuProfilePhoto.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = false;

            var AccessToken = "https://firebasestorage.googleapis.com/v0/b/twitter-73dec.appspot.com/o/ProfilePhotos%2FAnonimo.jpg?alt=media&token=48da3d47-aa8a-4a40-825b-2c97d0ed5226";

            FirebaseStorageReference fileToDelete = null;

            if (fuProfilePhoto.HasFiles)
            {
                var auth = new FirebaseAuthProvider(new FirebaseConfig(ConfigurationManager.AppSettings["WebApiKey"]));
                var a = await auth.SignInWithEmailAndPasswordAsync(ConfigurationManager.AppSettings["FireBaseAuthEmail"], ConfigurationManager.AppSettings["FireBaseAuthPassword"]);
                var cancellation = new CancellationTokenSource();
                string gui = Guid.NewGuid().ToString() + Path.GetExtension(fuProfilePhoto.FileName);
                var task = new FirebaseStorage(ConfigurationManager.AppSettings["PathToFolder"], new FirebaseStorageOptions { AuthTokenAsyncFactory = () => Task.FromResult(a.FirebaseToken), ThrowOnCancel = true }).Child(ConfigurationManager.AppSettings["FireBaseStorageFolderProfilePhotos"]).Child(gui).PutAsync(fuProfilePhoto.FileContent, cancellation.Token);
                fileToDelete = new FirebaseStorage(ConfigurationManager.AppSettings["PathToFolder"], new FirebaseStorageOptions { AuthTokenAsyncFactory = () => Task.FromResult(a.FirebaseToken), ThrowOnCancel = true }).Child(ConfigurationManager.AppSettings["FireBaseStorageFolderProfilePhotos"]).Child(gui);
                AccessToken = await task;
            }
            using (HttpClient client = new HttpClient())
            {
                User user = new User
                {
                    UserName = txtUsername.Text,
                    Names = txtNames.Text,
                    Passwords = txtPassword.Text,
                    ProfilePhoto = AccessToken,
                    Email = txtMail.Text,
                    Phone = txtTelefono.Text,
                    Birthday = new DateTime(Convert.ToInt32(ddlAño.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlDia.SelectedValue)),
                    Biography = " ",
                    PlaceWhereLives = ddlPlaceWhereLives.SelectedValue,
                    Sex = ddlSex.SelectedValue,
                    Verified = "F"
                };

                var json = JsonConvert.SerializeObject(user);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PostAsync($"http://www.r5cgbuwbvefla53gnxa.somee.com/api/User/Create", content);

                string responseBody = await response.Content.ReadAsStringAsync();

                if (responseBody == "El correo y nombre de usuario ya está en uso")
                {
                    if (fileToDelete != null) { await fileToDelete.DeleteAsync(); }

                    HttpContext.Current.Response.Write("<script>alert('La dirección de correo electronico y el nombre de usuario que ha ingresado ya se encuentran en uso');</script>"); HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>"); return;
                }

                else if (responseBody == "El nombre de usuario ya está en uso")
                {
                    if (fileToDelete != null) { await fileToDelete.DeleteAsync(); }

                    HttpContext.Current.Response.Write("<script>alert('El nombre de usuario que ha ingresado ya se encuentra en uso');</script>"); HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>"); return;
                }

                else if (responseBody == "El correo ya está en uso")
                {
                    if (fileToDelete != null) { await fileToDelete.DeleteAsync(); }

                    HttpContext.Current.Response.Write("<script>alert('La dirección de correo electronico que ha ingresado ya se encuentra en uso');</script>"); HttpContext.Current.Response.Write("<script>window.history.back(); window.location.reload();</script>"); return;
                }
            }

            Session["PaginaAnterior"] = "SingUp.aspx";

            HttpContext.Current.Response.Write("<script>alert('Sse ha enviado un correo de verificacion a su direccion de correo electronico, verfique su cuenta antes de iniciar sesión');</script>");

            txtUsername.Enabled = txtNames.Enabled = txtMail.Enabled = txtPassword.Enabled = txtTelefono.Enabled = ddlDia.Enabled = ddlMes.Enabled = ddlAño.Enabled = fuProfilePhoto.Enabled = ddlPlaceWhereLives.Enabled = ddlSex.Enabled = true;

            Response.Redirect("LogIn.aspx", false);
        }
    }
}