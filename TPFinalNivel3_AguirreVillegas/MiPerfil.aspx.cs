using ItemNegocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TPFinalNivel3_AguirreVillegas
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuario user = (Usuario)Session["usuario"];
                        lblNombreUsuario.Text = user.Nombre + " " + user.Apellido;
                        lblEmail.Text = user.Email;
                        txtNombre.Text = user.Nombre;
                        txtApellido.Text = user.Apellido;

                        // Verificar si hay una imagen de perfil para el usuario
                        if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        {
                            string rutaImagen = "~/images/img-profile/" + user.ImagenPerfil;
                            imgPerfil.ImageUrl = File.Exists(Server.MapPath(rutaImagen)) ? rutaImagen : "~/images/no_usuario.png";
                        }
                        else
                        {
                            imgPerfil.ImageUrl = "~/images/no_usuario.png";
                        }

                        if (Session["NuevaCiudad"] != null)
                        {
                            string nuevaCiudad = Session["NuevaCiudad"].ToString();
                            ddlCiudad.Text = nuevaCiudad;
                        }

                        // Agregar encabezados de control de caché para evitar almacenamiento en caché de la imagen
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.Cache.SetNoStore();
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario user = (Usuario)Session["usuario"];

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("~/images/img-profile/");

                    // Verificar si ya existe una imagen de perfil para el usuario
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                    {
                        // Si ya existe, eliminar la imagen existente antes de guardar la nueva
                        string rutaImagenExistente = ruta + user.ImagenPerfil;
                        if (File.Exists(rutaImagenExistente))
                        {
                            File.Delete(rutaImagenExistente);
                        }
                    }

                    // Guardar la nueva imagen de perfil
                    string nombreImagen = "perfil-" + user.Id + ".jpg";
                    txtImagen.PostedFile.SaveAs(ruta + nombreImagen);
                    user.ImagenPerfil = nombreImagen;
                }

                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;

                negocio.actualizar(user);

                // Actualizar la imagen en el control de la MasterPage
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/images/img-profile/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            string nuevaCiudad = ddlCiudad.SelectedItem.Text;
            Session["NuevaCiudad"] = nuevaCiudad;
        }
    }
}
