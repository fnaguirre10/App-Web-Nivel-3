using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemNegocio
{
    public class FavoritoNegocio
    {
        public List<int> listarFavoritoIdUser(int idUser)
        {
            AccesoDatos datos = new AccesoDatos();
            List<int> lista = new List<int>();

            try
            {
                datos.setearConsulta("Select IdArticulo from FAVORITOS where IdUser = @idUser");
                datos.setearParametro("@idUser", idUser);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int aux = (int)datos.Lector["idArticulo"];
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

        public void agregarFav(Favorito nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM FAVORITOS WHERE IdUser = @idUser AND IdArticulo = @idArticulo");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("@idArticulo", nuevo.IdItem);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidadFav = Convert.ToInt32(datos.Lector[0]);
                    if (cantidadFav > 0)
                    {
                        datos.cerrarConexion();
                        return;
                    }
                }
                datos.cerrarConexion();
                datos = new AccesoDatos();
                datos.setearConsulta("insert into FAVORITOS (IdUser, IdArticulo)VALUES(@idUser, @idArticulo)");
                datos.setearParametro("idUser", nuevo.IdUser);
                datos.setearParametro("idArticulo", nuevo.IdItem);
                datos.ejecutarAccion();


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

        public void eliminarFav(int idItem, int idUser)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("DELETE FROM FAVORITOS WHERE IdArticulo = @idArticulo AND IdUser = @idUser");
                datos.setearParametro("@idArticulo", idItem);
                datos.setearParametro("@idUser", idUser);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool remanenteFav(int idUser)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("SELECT COUNT(*) FROM FAVORITOS WHERE IdUser = @idUser");
                datos.setearParametro("@idUser", idUser);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidadFavoritos = Convert.ToInt32(datos.Lector[0]);
                    return cantidadFavoritos > 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return false; // En caso de error o si no hay favoritos restantes
        }

    }
}
