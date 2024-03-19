using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Item
    {
        public int Id { get; set; }

        [DisplayName("Código")]
        public string Codigo { get; set; }
        
        private decimal _Precio;

        public decimal Precio
        {
            get { return _Precio; }
            set
            {
                _Precio = Math.Round(value, 2);
            }
        }

        public string PrecioFormateado
        {
            get { return Precio.ToString("C", new CultureInfo("es-AR")); }
        }
        public string Nombre { get; set; }
        
        [DisplayName("Descripción")]
        public string Descripcion { get; set; }

        public string ImagenUrl { get; set; }
        public Marca Marca { get; set; }
        public Categoria Categoria { get; set; }

        public bool Activo { get; set; }
    }
}
