using Dominio;
using ItemNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_AguirreVillegas
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                Usuario nuevoUsuario = new Usuario();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                //EmailServicio emailServicio = new EmailServicio();

                nuevoUsuario.Nombre = txtNombre.Text;
                nuevoUsuario.Apellido = txtApellido.Text;
                nuevoUsuario.Email = txtEmail.Text;
                nuevoUsuario.Pass = txtContraseña.Text;
                nuevoUsuario.Id = usuarioNegocio.insertarNuevo(nuevoUsuario);
                Session.Add("usuario", nuevoUsuario);

                Response.Redirect("Default.aspx", false);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}