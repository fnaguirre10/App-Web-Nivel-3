using ItemNegocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TPFinalNivel3_AguirreVillegas
{
    public partial class FormularioItem : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmaEliminacion = false;
            try
            {
                //Configuración inicial de la pantalla.
                if (!IsPostBack)
                {
                    MarcaNegocio negocio1 = new MarcaNegocio();
                    CategoriaNegocio negocio2 = new CategoriaNegocio();
                    List<Marca> lista1 = negocio1.crearLista();
                    List<Categoria> lista2 = negocio2.crearLista();

                    ddlMarca.DataSource = lista1;
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    ddlCategoria.DataSource = lista2;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();


                    string idEliminar = Request.QueryString["id"];

                    if (!string.IsNullOrEmpty(idEliminar))
                    {
                        btnEliminar.Visible = true;
                    }
                    else
                    {
                        btnEliminar.Visible = false;
                    }
                }

                //COnfiguración si estamos modificando.
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    NegocioItem negocio = new NegocioItem();
                    Item seleccionado = (negocio.crearLista(id))[0];

                    //guardo articulo seleccionado en session
                    Session.Add("artiSeleccionado", seleccionado);

                    //Pre carga todos los campos.

                    txtId.Text = id;
                    txtCodigo.Text = seleccionado.Codigo;
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtImagenUrl.Text = seleccionado.ImagenUrl;

                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                    txtImagenUrl_TextChanged(sender, e);
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Item nuevo = new Item();
                NegocioItem negocio = new NegocioItem();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.Marca = new Marca();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                nuevo.Precio = decimal.Parse(txtPrecio.Text);
                nuevo.ImagenUrl = txtImagenUrl.Text;

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificar(nuevo);
                }
                else
                    negocio.agregar(nuevo);


                Response.Redirect("ListaItem.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgItem.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminacion.Checked)
                {
                    NegocioItem negocio = new NegocioItem();
                    negocio.borrar(int.Parse(txtId.Text));
                    Response.Redirect("ListaItem.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            try
            {
                NegocioItem negocio = new NegocioItem();
                Item seleccionado = (Item)Session["pokeSeleccionado"];

                negocio.borrarLogico(seleccionado.Id, !seleccionado.Activo);
                Response.Redirect("PokemonsLista.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}