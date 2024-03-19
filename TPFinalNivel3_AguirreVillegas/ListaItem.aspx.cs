using ItemNegocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_AguirreVillegas
{
    public partial class ListaItem : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
                Response.Redirect("Error.aspx");
            }


            FiltroAvanzado = chkAvanzado.Checked;
            if (!IsPostBack)
            {
                NegocioItem negocio = new NegocioItem();
                Session.Add("listaItems", negocio.crearLista());
                dgvItems.DataSource = Session["listaItems"];
                dgvItems.DataBind();
            }
        }

        protected void dgvItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvItems.PageIndex = e.NewPageIndex;
            dgvItems.DataBind();
        }

        protected void dgvItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvItems.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioItem.aspx?id=" + id);
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Item> lista = (List<Item>)Session["listaItems"];
            List<Item> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvItems.DataSource = listaFiltrada;
            dgvItems.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            try
            {
                NegocioItem negocio = new NegocioItem();
                dgvItems.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(),
                ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text);
                dgvItems.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }
    }
}