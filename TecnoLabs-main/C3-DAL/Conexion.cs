using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using C4_ENTIDADES;
using System.Text.RegularExpressions;
using System.ComponentModel.Design;

namespace C3_DAL
{
    public class Conexion
    {
        SqlConnection conexion;
        SqlCommand comando;
        SqlDataReader lector;
                                                 //Acuerdense de cambiar la ruta
        private string connectionString = "Data Source =PHOENIX\\MSSQLSERVER01; Initial Catalog =PracticoGrupal; Integrated Security =sspi";

        public Conexion()
        {
            conexion = new SqlConnection(connectionString);
            comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = System.Data.CommandType.Text;
        }
        public List<Productos> MostrarProductos()
        {
            List<Productos> listProductos = new List<Productos>();

            conexion.Open();
            comando.CommandText = "SELECT * FROM Productos";

            lector = comando.ExecuteReader();
            while (lector.Read())
            {
                Productos producto = new Productos();
                producto.IdProducto = lector.GetInt32(0);
                producto.Marca = lector.GetString(1);
                producto.Modelo = lector.GetString(2);
                producto.Precio = lector.GetDecimal(3);
                producto.Stock = lector.GetInt32(4);
                producto.IdCategoria = lector.GetInt32(5);

                listProductos.Add(producto);
            }
            conexion.Close();
            return listProductos;
        }
        public List<ProductoDTO> LeerProductos()
        {
            List<ProductoDTO> listProductos = new List<ProductoDTO>();

            conexion.Open();
            comando.CommandText = "SELECT * FROM VistaProductos";

            lector = comando.ExecuteReader();
            while (lector.Read())
            {
                ProductoDTO producto = new ProductoDTO();
                producto.Categoria = lector.GetString(0);
                producto.Marca = lector.GetString(1);
                producto.Modelo = lector.GetString(2);
                producto.Precio = lector.GetDecimal(3);

                listProductos.Add(producto);
            }

            conexion.Close();
            return listProductos;
        }
        // METODOS PARA MOSTRAR PRODUCTOS
        public List<ProductoDTO> FiltrarPorMarca(string marca, string orden)
        {
            List<ProductoDTO> listProductos = new List<ProductoDTO>();

            conexion.Open();

            comando.Parameters.Clear();
            comando.Parameters.AddWithValue("@Marca", marca);
            if (orden == "Menor")
            {
                comando.CommandText = "SELECT * FROM VistaProductos WHERE Marca = @Marca ORDER BY Precio ASC";
            }
            else if (orden == "Mayor")
            {
                comando.CommandText = "SELECT * FROM VistaProductos WHERE Marca = @Marca ORDER BY Precio DESC";
            }
            else
            {
                comando.CommandText = "SELECT * FROM VistaProductos WHERE Marca = @Marca";
            }
            lector = comando.ExecuteReader();
            while (lector.Read())
            {
                ProductoDTO producto = new ProductoDTO();
                producto.Categoria = lector.GetString(0);
                producto.Marca = lector.GetString(1);
                producto.Modelo = lector.GetString(2);
                producto.Precio = lector.GetDecimal(3);

                listProductos.Add(producto);
            }
            conexion.Close();
            return listProductos;
        }
        public void EditarProducto(Productos producto)
        {
            conexion.Open();
            comando.CommandText = "UPDATE Productos SET Marca = @marca, Modelo = @modelo, Precio = @precio, Stock = @stock, IdCategoria = @idCategoria WHERE IdProducto = @IdProducto";

            comando.Parameters.Clear();
            comando.Parameters.AddWithValue("@IdProducto", producto.IdProducto);
            comando.Parameters.AddWithValue("@marca", producto.Marca);
            comando.Parameters.AddWithValue("@modelo", producto.Modelo);
            comando.Parameters.AddWithValue("@precio", producto.Precio);
            comando.Parameters.AddWithValue("@stock", producto.Stock);
            comando.Parameters.AddWithValue("@idCategoria", producto.IdCategoria);

            comando.ExecuteNonQuery();
            conexion.Close();
        }
        // METODO PARA AGREGAR PRODUCTOS
        public void AgregarProducto(Productos producto)
        {
            conexion.Open();
            comando.CommandText = "INSERT INTO Productos VALUES (@Marca,@Modelo,@Precio,@Stock,@IdCategoria)";

            comando.Parameters.Clear();
            comando.Parameters.AddWithValue("@Marca", producto.Marca);
            comando.Parameters.AddWithValue("@Modelo", producto.Modelo);
            comando.Parameters.AddWithValue("@Precio", producto.Precio.ToString());
            comando.Parameters.AddWithValue("@Stock", producto.Stock.ToString());
            comando.Parameters.AddWithValue("@IdCategoria", producto.IdCategoria.ToString());

            comando.ExecuteNonQuery();
            conexion.Close();
        }

        // METODO PARA ACTUALIZAR PRECIO Y STOCK DE UN PRODUCTO
        public void ActualizarPrecioStock(ActualizarProductoDTO producto)
        {
            conexion.Open();
            comando.CommandText = "UPDATE Productos SET Precio = @Precio, Stock = @Stock WHERE IdProducto = @IdProducto";

            comando.Parameters.Clear();
            comando.Parameters.AddWithValue("@IdProducto", producto.IdProducto.ToString());
            comando.Parameters.AddWithValue("@Precio", producto.Precio.ToString());
            comando.Parameters.AddWithValue("@Stock", producto.Stock.ToString());

            comando.ExecuteNonQuery();
            conexion.Close();
        }

        // METODO PARA ELIMINAR UN PRODUCTO
        public void EliminarProducto(Productos producto)
        {
            conexion.Open();
            comando.Parameters.AddWithValue("@IdProducto", producto.IdProducto.ToString());
            comando.CommandText = "DELETE FROM Productos WHERE IdProducto = @IdProducto";

            comando.ExecuteNonQuery();
            conexion.Close();
        }
        public List<Productos> BuscarProductos(string marca)
        {
            List<Productos> listProductos = new List<Productos>();
            try
            {
                conexion.Open();
                comando.Parameters.Clear();
                comando.Parameters.AddWithValue("@marca", "%" + marca + "%");
                comando.CommandText = "SELECT * FROM Productos WHERE Marca LIKE @marca";

                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Productos producto = new Productos();
                    producto.IdProducto = lector.GetInt32(0);
                    producto.Marca = lector.GetString(1);
                    producto.Modelo = lector.GetString(2);
                    producto.Precio = lector.GetDecimal(3);
                    producto.Stock = lector.GetInt32(4);
                    producto.IdCategoria = lector.GetInt32(5);

                    listProductos.Add(producto);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar productos: " + ex.Message);
            }
            finally
            {
                conexion.Close();
            }

            return listProductos;
        }
        public List<Productos> FiltrarProductos(int categoria, string orden)
        {
            List<Productos> listProductos = new List<Productos>();

            conexion.Open();

            comando.Parameters.Clear();
            comando.Parameters.AddWithValue("@IdCategoria", categoria);
            if (orden == "Menor")
            {
                comando.CommandText = "SELECT * FROM Productos WHERE IdCategoria = @IdCategoria ORDER BY Precio ASC";
            }
            else if (orden == "Mayor")
            {
                comando.CommandText = "SELECT * FROM Productos WHERE IdCategoria = @IdCategoria ORDER BY Precio DESC";
            }
            else
            {
                comando.CommandText = "SELECT * FROM Productos WHERE IdCategoria = @IdCategoria";
            }
            lector = comando.ExecuteReader();
            while (lector.Read())
            {
                Productos producto = new Productos();
                producto.IdProducto = lector.GetInt32(0);
                producto.Marca = lector.GetString(1);
                producto.Modelo = lector.GetString(2);
                producto.Precio = lector.GetDecimal(3);
                producto.Stock = lector.GetInt32(4);
                producto.IdCategoria = lector.GetInt32(5);

                listProductos.Add(producto);
            }
            conexion.Close();
            return listProductos;
        }
        public Clientes ValidarUsuario(string email)
        {
            Clientes cliente = new Clientes();
            conexion.Open();
            int Id_Persona = 0;
            int Id_Cliente = 0;

            comando.Parameters.Clear();
            comando.Parameters.AddWithValue("@Email", email);

            comando.CommandText = "SELECT p.Id AS idPersona, c.IdCliente AS idCliente FROM Persona p JOIN Clientes c ON p.Id = c.IdPersona WHERE p.Email = @Email";
            lector = comando.ExecuteReader();
            if (lector.Read())
            {
                Id_Persona = lector.GetInt32(0);
                Id_Cliente = lector.GetInt32(1);
            }
            cliente.IdCliente = Id_Cliente;
            cliente.IdPersona = Id_Persona;
            conexion.Close();
            return cliente;
        }
        public Clientes RegistrarUsuario(Clientes cliente)
        {
            Clientes nuevoUsuario = new Clientes();
            int Id_Persona = 0;
            int Id_Cliente = 0;

            conexion.Open();

            string queryPersona = "INSERT INTO Persona (Nombre, Apellido, Edad, Direccion, Email) OUTPUT INSERTED.Id VALUES (@nombre, @apellido, @edad, @direccion, @email)";
            string queryCliente = "INSERT INTO Clientes (IdPersona, TipoCliente, Descuento) OUTPUT INSERTED.IdCliente VALUES (@idPersona, @tipoCliente, @descuento)";

            SqlCommand comando = new SqlCommand(queryPersona, conexion);

            comando.Parameters.Clear();
            comando.Parameters.AddWithValue("@nombre", cliente.Nombre);
            comando.Parameters.AddWithValue("@apellido", cliente.Apellido);
            comando.Parameters.AddWithValue("@edad", cliente.Edad);
            comando.Parameters.AddWithValue("@direccion", cliente.Direccion);
            comando.Parameters.AddWithValue("@email", cliente.Email);

            SqlTransaction transaccion = conexion.BeginTransaction();

            try
            {
                comando.Transaction = transaccion;

                Id_Persona = (int)comando.ExecuteScalar();
                SqlCommand comandoCliente = new SqlCommand(queryCliente, conexion);
                comandoCliente.Transaction = transaccion;

                comandoCliente.Parameters.AddWithValue("@idPersona", Id_Persona);
                comandoCliente.Parameters.AddWithValue("@tipoCliente", cliente.TipoCliente);
                comandoCliente.Parameters.AddWithValue("@descuento", cliente.Descuento);

                
                Id_Cliente = (int)comandoCliente.ExecuteScalar();
                transaccion.Commit();
            }
            catch (Exception ex)
            {
                transaccion.Rollback();
               //trow ex;
            }
            finally
            {
                conexion.Close();
            }

            
            cliente.IdPersona = Id_Persona;
            cliente.IdCliente = Id_Cliente;
            nuevoUsuario = cliente;

            return nuevoUsuario;
        }
        public int CrearCompra(Clientes cliente, string metodoPago)
        {
            int idCarrito = 0;
            int idCompra = 0;

            conexion.Open();
            SqlTransaction transaccion = conexion.BeginTransaction();
            try
            {
                comando = new SqlCommand("INSERT INTO Carrito (IdCliente, MetodoPago) OUTPUT INSERTED.IdCarrito VALUES (@idCliente, @metodoPago)", conexion, transaccion);
                comando.Parameters.Clear();
                comando.Parameters.AddWithValue("@idCliente", cliente.IdCliente);
                comando.Parameters.AddWithValue("@metodoPago", metodoPago);

                idCarrito = (int)comando.ExecuteScalar();

                comando = new SqlCommand("INSERT INTO Compra (IdCarrito, IdCliente, MetodoPago) OUTPUT INSERTED.IdCompra VALUES (@idCarrito, @idCliente, @metodoPago)", conexion, transaccion);
                comando.Parameters.Clear();
                comando.Parameters.AddWithValue("@idCarrito", idCarrito);
                comando.Parameters.AddWithValue("@idCliente", cliente.IdCliente);
                comando.Parameters.AddWithValue("@metodoPago", metodoPago);

                idCompra = (int)comando.ExecuteScalar();

                /*List<Productos> listProductos = CarritoCompra.Instancia.listProductos;
                if (listProductos != null && listProductos.Count > 0)  // Verificar si hay productos en la lista
                {
                    foreach (Productos producto in listProductos)
                    {
                        comando = new SqlCommand("INSERT INTO CarritoProducto (IdCarrito, IdProducto, Cantidad, Precio) VALUES (@idCarrito, @idProducto, @cantidad, @precio)", conexion, transaccion);
                        comando.Parameters.Clear();
                        comando.Parameters.AddWithValue("@idCarrito", idCarrito);
                        comando.Parameters.AddWithValue("@idProducto", producto.IdProducto);
                        comando.Parameters.AddWithValue("@cantidad", 1);
                        comando.Parameters.AddWithValue("@precio", producto.Precio);

                        comando.ExecuteNonQuery();
                    }
                }
                else
                {
                    throw new Exception("No hay productos en el carrito.");
                }*/
                transaccion.Commit();
            }
            catch (Exception ex)
            {
                transaccion.Rollback();
                
                throw ex;
            }
            finally
            {
                conexion.Close();
            }

            return idCompra;
        }
    }
}