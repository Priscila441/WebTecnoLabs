using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using C3_DAL;
using C4_ENTIDADES;

namespace C2_BLL
{
    public class CN_Productos
    {
        public readonly StringBuilder stringBuilder = new StringBuilder();
        Conexion conexion = new Conexion();

        public void AgregarNuevoProducto(Productos producto)
        {
            if (producto == null) stringBuilder.Append("Proporcione valores válidos");

            if (stringBuilder.Length == 0)
            {
                conexion.AgregarProducto(producto);
            }
        }

        public List<Productos> CargarProductos()
        {
            if (conexion.MostrarProductos().Count > 0)
            {
                return conexion.MostrarProductos();
            }
            else return null;
        }
        public void Editar(Productos producto)
        {
            if (producto == null) stringBuilder.Append("Proporcione valores válidos");

            if (stringBuilder.Length == 0)
            {
                conexion.EditarProducto(producto);
            }
        }
        public void Eliminar(Productos producto)
        {
            if (producto == null) stringBuilder.Append("Proporcione valores válidos");

            if (stringBuilder.Length == 0)
            {
                conexion.EliminarProducto(producto);
            }
        }
        public List<Productos> Buscar(string marca)
        {
            if (conexion.BuscarProductos(marca).Count > 0)
            {
                return conexion.BuscarProductos(marca);
            }
            else return null;
        }
        public List<Productos> AplicarFiltros(int categoria, string orden)
        {
            if (conexion.FiltrarProductos(categoria, orden).Count > 0)
            {
                return conexion.FiltrarProductos(categoria, orden);
            }
            else return null;
        }
        public bool VerificarUsuario(string email)
        {
            Clientes cliente = new Clientes();
            cliente = conexion.ValidarUsuario(email);
            
            if (cliente.IdPersona != 0 && cliente.IdCliente != 0)
            {
                cliente.TipoCliente = "Regular";
                cliente.Descuento = 10;

                GestorCompra.Instancia.AsignarCliente(cliente);
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool NuevoRegistro(Clientes cliente)
        {
            cliente.TipoCliente = "Regular";
            cliente.Descuento = 10;
            cliente = conexion.RegistrarUsuario(cliente);
            if (cliente.IdPersona != 0 && cliente.IdCliente != 0)
            {
                GestorCompra.Instancia.AsignarPersona(cliente);
                GestorCompra.Instancia.AsignarCliente(cliente);
                return true;
            }
            else
            {
                return false;
            }
        }
        public int RealizarCompra(string metodoPago)
        {
            int idCompra = 0;
            Clientes cliente = new Clientes();
            cliente.IdCliente = GestorCompra.Instancia.ClienteActual.IdCliente;

            idCompra = conexion.CrearCompra(cliente, metodoPago);
            return idCompra;
        }
    }
}
