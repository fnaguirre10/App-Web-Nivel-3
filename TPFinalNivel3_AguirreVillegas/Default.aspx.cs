using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ItemNegocio;

namespace TPFinalNivel3_AguirreVillegas
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string imagePath = ResolveUrl("~/images/tekno_logo.jpg");
                teknoLogo.ImageUrl = imagePath;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                if (Validaciones.validaTextoVacio(txtEmail) || Validaciones.validaTextoVacio(txtPassword))
                {
                    Session.Add("error", "Debes completar Correo electónico y contraseña");
                    Response.Redirect("Error.aspx");
                }
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPassword.Text;
                if (negocio.Login(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    Session.Add("error", "Correo electrónico o contraseña incorrecta...");
                    Response.Redirect("Error.aspx", false);
                }
            }
            //catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}