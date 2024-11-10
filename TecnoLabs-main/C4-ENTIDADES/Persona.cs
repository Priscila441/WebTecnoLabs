using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public abstract class Persona
    {
        private int id, edad, dni;
         private string nombre, apellido, direccion, email;

        public int ID { get => id; set => id = value; }
        public int Edad
        {
            get => edad;
            set
            {
                if (value >= 0) edad = value;
                else throw new ArgumentException("la edad no puede ser negativa");

            }
        }
        public int Dni { get => dni; set => dni = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Email {
            get => email;
            set
            {
                if (value.Contains("@")) email = value;
                else throw new ArgumentException("El email debe ser valido");
            } 
        }
        protected Persona()
        {
            
        }
        public Persona(int Id, int edad, int dni, string nombre, string apellido, string direccion, string email)
        {
            this.ID = Id;
            this.Edad = edad;
            this.Dni = dni;
            this.Nombre = nombre;
            this.Apellido = apellido;
            this.Direccion = direccion;
            this.Email = email;
        
        }

        public abstract void InfoPersona() ;

        public virtual void ListarProducto()
        {
            Console.WriteLine("lista de productos base.");
        }
        public void LeerPersona() { Console.WriteLine($"datos de la persona : nombre : {Nombre}, apellido:{apellido} ,edad : {Edad} dni:{Dni}, direccion: {Direccion} , email:{Email}"); }

    }
}
