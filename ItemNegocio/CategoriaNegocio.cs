using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using Dominio;

namespace ItemNegocio
{
    public class CategoriaNegocio
    {
            public List<Categoria> crearLista()
            {
                List<Categoria> lista = new List<Categoria>();
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearConsulta("Select Id, Descripcion from CATEGORIAS");
                    datos.ejecutarLectura();

                    while (datos.Lector.Read())
                    {
                        Categoria aux = new Categoria();
                        aux.Id = (int)datos.Lector["Id"];
                        aux.Descripcion = (string)datos.Lector["Descripcion"];

                        lista.Add(aux);
                    }
                    return lista;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
                finally
                {
                    datos.cerrarConexion();
                }
            }

    }
}
