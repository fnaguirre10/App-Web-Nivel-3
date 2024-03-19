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
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Item> ListarItem { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuario usuario = (Usuario)Session["usuario"];
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id) && int.TryParse(id, out int idItem))
                {
                    FavoritoNegocio negocio = new FavoritoNegocio();
                    Favorito nuevo = new Favorito();

                    nuevo.IdUser = usuario.Id;
                    nuevo.IdItem = int.Parse(id);

                    negocio.agregarFav(nuevo);
                }

                ListarItem = new List<Item>();

                if (usuario != null)
                {
                    FavoritoNegocio artNegocio = new FavoritoNegocio();
                    List<int> idArtFavoritos = artNegocio.listarFavoritoIdUser(usuario.Id);
                    if (idArtFavoritos.Count > 0)
                    {
                        NegocioItem itemNeg = new NegocioItem();
                        ListarItem = itemNeg.listarItemId(idArtFavoritos);
                        repRepetidor.DataSource = ListarItem;
                        repRepetidor.DataBind();
                    }
                }
                else
                {
                    Session.Add("error", "No se han podido cargar los articulos");
                    Response.Redirect("Error.aspx");
                }
            }

        }

        protected void btnEliminarFavorito_Click(object sender, EventArgs e)
        {
            Usuario user = (Usuario)Session["usuario"];
            FavoritoNegocio negocio = new FavoritoNegocio();

            int idItem = int.Parse(((Button)sender).CommandArgument);
            int idUser = user.Id;

            negocio.eliminarFav(idItem, idUser);

            // Recargar la lista de favoritos después de eliminar uno
            CargarFavoritos();
        }

        private void CargarFavoritos()
        {
            Usuario usuario = (Usuario)Session["usuario"];
            FavoritoNegocio itemNegocio = new FavoritoNegocio();
            List<int> idItemFavoritos = itemNegocio.listarFavoritoIdUser(usuario.Id);

            if (idItemFavoritos.Count > 0)
            {
                NegocioItem itemNeg = new NegocioItem();
                ListarItem = itemNeg.listarItemId(idItemFavoritos);
                repRepetidor.DataSource = ListarItem;
                repRepetidor.DataBind();
            }
            else
            {
                // Si no hay favoritos restantes, limpiamos la lista de favoritos en la interfaz de usuario
                repRepetidor.DataSource = null;
                repRepetidor.DataBind();
            }
        }

    }
}