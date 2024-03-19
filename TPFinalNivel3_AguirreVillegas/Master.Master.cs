using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using ItemNegocio;
using Microsoft.Win32;

namespace TPFinalNivel3_AguirreVillegas
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string imagePath = ResolveUrl("~/images/tekno_logo_small.png");
            logoBar.ImageUrl = imagePath;
            footerIcono.ImageUrl = imagePath;
            imgAvatar.Visible = false;

            if (!(Page is Default || Page is Registro || Page is Error))
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                {
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    Usuario user = (Usuario)Session["usuario"];
                    lblUser.Text = user.Email;
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                    {
                        imgAvatar.ImageUrl = "~/images/img-profile/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
                        imgAvatar.Visible = true;
                    }
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}