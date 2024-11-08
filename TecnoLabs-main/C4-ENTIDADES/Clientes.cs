using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public class Clientes : Persona 
    {
        int idCliente;
        int idPersona;
        string tipoCliente;
        decimal descuento;

        public Clientes()
        {
            
        }
        public int IdCliente { get => idCliente; set => idCliente = value; }
        public int IdPersona { get => idPersona; set => idPersona = value; }
        public string TipoCliente { get => tipoCliente; set => tipoCliente = value; }
        public decimal Descuento { get => descuento; set => descuento = value; }
        private List<Productos> listaProductos = new List<Productos>();


        
        public Clientes(int Id, int edad, int dni, string nombre, string apellido, string direccion, string email, int idCliente, int idPersona, string tipoCliente, decimal descuento ) : base(Id,edad,dni,nombre,apellido,direccion,email)
        {
            IdCliente = idCliente;
            TipoCliente = tipoCliente;
            Descuento = descuento;
            IdPersona = idPersona;

        }
        public void AgregarAlCarrito(Carrito carrito, int productoId, int cantidad)
        {

            if (carrito == null)
            {
                throw new ArgumentNullException(nameof(carrito), "El carrito no puede ser nulo.");
            }
          

            /*var producto = ObtenerProductoPorId(productoId);
            if (producto == null)
            {
                throw new ArgumentException("El producto no existe.", nameof(productoId));
            }*/

            int idCarrito = carrito.IdCarrito;
            int idCarritoProducto = GenerateNewCarritoProductoId();
            //var carritoProducto = new CarritoProducto(idCarritoProducto, idCarrito, producto.IdProducto, cantidad, producto.Precio);

           //carrito.AgregarProducto(carritoProducto);
        }
        /*private Productos ObtenerProductoPorId(int productoId)
        {

            if (ListarProducto == null)
            {
                throw new InvalidOperationException("La lista de productos no está disponible.");
            }
            return ListarProducto.FirstOrDefault(p => p.IdProducto == productoId);



        }*/
        private int GenerateNewCarritoProductoId()
        {
            // Lógica para generar un nuevo ID único. Por ejemplo, un contador estático.
            return new Random().Next(1, 10000); 
        }

        public void Comprar(Carrito carrito)
        {
            if (carrito == null)
            {
                throw new ArgumentNullException(nameof(carrito), "El carrito no puede ser nulo.");
            }

            if (carrito.ProductosEnCarrito.Count == 0)
            {
                throw new InvalidOperationException("El carrito está vacío. No se puede proceder a la compra.");
            }

            decimal total = carrito.CalcularTotal();

          

            // Actualizar el stock de los productos
            /*foreach (var carritoProducto in carrito.ProductosEnCarrito)
            {
                var producto = ObtenerProductoPorId(carritoProducto.IdProducto); 
                if (producto != null)
                {
                    producto.DisminuirStock(carritoProducto.Cantidad);
                }
            }*/

            // Limpiar el carrito después de la compra
            carrito.LimpiarCarrito();

            Console.WriteLine($"Compra realizada con éxito. Total: {total:C}");
        }









        public override void InfoPersona()
        {
            throw new NotImplementedException();
        }
       
    }
}
