using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public class Administradores : Persona
    {
        private int idPersona;
        private string rol;
        private int idAdmin;
        private string clave;

        public int IdAdmin { get => idAdmin; set => idAdmin = value; }
        public int IdPersona { get => idPersona; set => idPersona = value; }
        public string Clave { get => clave; set => clave = value; }
        public string Rol { get => rol; set => rol = value; }

        public Administradores(int Id, int edad, int dni, string nombre, string apellido, string direccion, string email, int idAdmin, string rol, string clave, int idPersona) : base(Id, edad, dni, nombre, apellido, direccion, email)
        {
            IdAdmin = idAdmin;
            Rol = rol;
            Clave = clave;
            IdPersona = idPersona;

        }

        public void IniciarSecion(string clave) 
        {
            if (clave == Clave)
            {
                Console.WriteLine("inicio de secion exitosa");
            }
            else {
                Console.WriteLine("clave incorrecta. intenta nuevamente");
            }
        }

        public void CerrarSesion()
        {
            Console.WriteLine("sesion cerrada");
        }

        public void GestionarProductos()
        {
            Console.WriteLine("gestionando productos..");
        }


        //agregar vinculo con producto??
        public void AgregarProducto()
        {
            Console.WriteLine($"producto agregado");
        }

        public void ModificarProducto()
        {
            Console.WriteLine($"producto (producto.nombre) modificado");
        }
        public void EliminarProducro()
        {
            Console.WriteLine("producto eliminado");
        }

        public override void InfoPersona()
        {
            Console.WriteLine($"datos del admi : idadmi{idAdmin} rol:{rol} ");
        }

        
        public override void ListarProducto()
        {
            base.ListarProducto();
        }

    }
}
