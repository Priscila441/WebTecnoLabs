using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public class CarritoCompra
    {
        // Campo privado estático que almacena la única instancia del Singleton
        private static CarritoCompra _instancia;

        // Lista de productos seleccionados
        public List<Productos> listProductos { get; private set; }

        // Constructor privado para evitar instancias fuera de esta clase
        private CarritoCompra()
        {
            listProductos = new List<Productos>();
        }

        // Propiedad estática para obtener la instancia del Singleton
        public static CarritoCompra Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CarritoCompra();
                }
                return _instancia;
            }
        }

        // Método para agregar un producto a la lista
        public void AgregarProducto(Productos producto)
        {
            listProductos.Add(producto);
        }

        // Método opcional para obtener el resumen del carrito
        public string ObtenerResumen()
        {
            if (listProductos.Count == 0)
                return "El carrito está vacío.";

            string resumen = "Productos en el carrito:\n";
            foreach (var producto in listProductos)
            {
                resumen += producto.ToString() + "\n";
            }
            return resumen;
        }
        // Método para calcular el precio total del carrito
        public decimal CalcularTotal()
        {
            decimal total = 0;

            // Recorrer todos los productos y sumar sus precios
            foreach (var producto in listProductos)
            {
                total += producto.Precio;
            }

            return total;
        }
    }
}
