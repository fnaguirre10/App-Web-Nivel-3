using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ItemNegocio;
using Dominio;
using System.Data;
using System.ComponentModel;
using System.Security.Cryptography;

namespace TPFinalNivel3_AguirreVillegas
{
    public partial class Catalogo : System.Web.UI.Page
    {
        public List<Item> ListarItem { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioItem negocio = new NegocioItem();
            ListarItem = negocio.crearLista();

            if (!IsPostBack)
            {
                repRepetidor.DataSource = ListarItem;
                repRepetidor.DataBind();
            }
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            string nombre = txtBuscar.Text.ToUpper();
            List<Item> resultado = new List<Item>();
            NegocioItem negocio = new NegocioItem();
            ListarItem = negocio.crearLista();

            foreach (Item articulo in ListarItem)
            {
                if (articulo.Nombre.ToLower().Contains(nombre) || articulo.Marca.Descripcion.ToUpper().Contains(nombre))
                {
                    resultado.Add(articulo);
                }
            }

            repRepetidor.DataSource = resultado;
            repRepetidor.DataBind();
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("Favoritos.aspx?id=" + id);
        }

        protected void btnDetalles_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetalleItem.aspx");
        }

        protected void btnEliminarFavorito_Click(object sender, EventArgs e)
        {

        }
    }
}