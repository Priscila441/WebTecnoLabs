using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public class Carrito : Clientes
    {
        int idCarrito;
        string estado, metodoPago;
        decimal descuentosAplicados, impuestos, envio;

        public int IdCarrito { get => idCarrito; set => idCarrito = value; }
        public string Estado { get => estado; set => estado = value; }
        public string MetodoPago { get => metodoPago; set => metodoPago = value; }
        public decimal DescuentosAplicados { get => descuentosAplicados; set => descuentosAplicados = value; }
        public decimal Impuestos { get => impuestos; set => impuestos = value; }
        public decimal Envio { get => envio; set => envio = value; }

        public Clientes _clientes;
        public List<CarritoProducto> ProductosEnCarrito { get; set; }
        public Clientes Clientes { get => _clientes; set => _clientes = value; }


        public Carrito(int idCarrito, string estado, string metodoPago, decimal descuentosAplicados, decimal impuestos, decimal envio, int Id, int edad, int dni, string nombre, string apellido, string direccion, string email, int idCliente, int idPersona, string tipoCliente, decimal descuento) : base (Id,edad,dni,nombre,apellido,direccion,email,idCliente,idPersona,tipoCliente,descuento)
        {
            this.IdCarrito = idCarrito;
            this.Estado = estado;
            this.MetodoPago = metodoPago;
            this.DescuentosAplicados = descuentosAplicados;
            this.Impuestos = impuestos;
            this.Envio = envio;
            ProductosEnCarrito = new List<CarritoProducto>();


        }



    
        public void AgregarProducto(CarritoProducto producto)
        {
            ProductosEnCarrito.Add(producto);
        }

        public bool EliminarProducto(int idCarritoProducto) 
        {
            var producto = ProductosEnCarrito.FirstOrDefault(p => p.IdCarritoProducto == idCarritoProducto);//corrobora que el id del producto en el carrito sea el mismo que el id del producto a eliminar
            if (producto != null)
            {
                ProductosEnCarrito.Remove(producto);
                return true;//se elimino el producto
                
            }
            else {
            return false;//no se encontro el producto
            }
        }

        public decimal CalcularTotal() 
        {
            return ProductosEnCarrito.Sum(p => p.Precio * p.Cantidad) + impuestos + envio - descuentosAplicados;
        }
        public string OptenerDescripcion()
        {
            var descripcion = $"carrito id :{IdCarrito}, estado: {Estado}, metodo de pago : {metodoPago},total:{CalcularTotal()}";
            foreach(var productos in ProductosEnCarrito)
            {
                descripcion += productos.OptenerDescripcion();
            }
            return descripcion;
        }
        public void LimpiarCarrito()
        {
            ProductosEnCarrito.Clear();
        }



    }

    
}
