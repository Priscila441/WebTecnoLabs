using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public class CarritoProducto
    {
        private int idCarritoProducto, idCarrito, idProducto, cantidad;
        private decimal precio;

        public int IdCarritoProducto { get => idCarritoProducto; set => idCarritoProducto = value; }
        public int IdCarrito { get => idCarrito; set => idCarrito = value; }
        public int IdProducto { get => idProducto; set => idProducto = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public decimal Precio { get => precio; set => precio = value; }

        public CarritoProducto(int idCarritoProducto, int idCarrito, int idProducto, int cantidad, decimal precio)
        {
            this.IdCarritoProducto = idCarritoProducto;
            this.IdCarrito = idCarrito;
            this.IdProducto = idProducto;
            this.Cantidad = cantidad;
            this.Precio = precio;
        }
        public decimal CalcularTotal()
        {
            return Cantidad * precio;
        }

        public void ActualizarCantidad(int nuevaCantidad)
        {
            if (nuevaCantidad > 0)
            {
                cantidad = nuevaCantidad;
            }
            else
            {
                throw new ArgumentException("la cantidad debe ser mayor que 0");
            }
        }

        public string OptenerDescripcion()
        {
            return $"producto ID: {IdProducto}, cantidad: {Cantidad}, precio unitario :{Precio},total:{CalcularTotal()}";
        }






    }
}
