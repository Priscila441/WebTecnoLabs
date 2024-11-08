using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public class GestorCompra
    {
        // Instancia privada estática del Singleton
        private static GestorCompra _instancia;

        // Propiedades para manejar un cliente y una persona
        public Clientes ClienteActual { get; private set; }
        public Persona PersonaActual { get; private set; }

        // Constructor privado para evitar instanciación desde fuera
        private GestorCompra() { }

        // Propiedad pública para obtener la instancia del Singleton
        public static GestorCompra Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new GestorCompra();
                }
                return _instancia;
            }
        }

        // Método para asignar el cliente actual
        public void AsignarCliente(Clientes cliente)
        {
            ClienteActual = cliente;
        }

        // Método para asignar la persona actual
        public void AsignarPersona(Persona persona)
        {
            PersonaActual = persona;
        }

        // Método para verificar si es posible realizar la compra final
        public bool PuedeRealizarCompra()
        {
            // Condiciones mínimas para permitir la compra: cliente y persona deben existir y estar completos
            if (ClienteActual != null && PersonaActual != null)
            {
                if (ClienteActual.IdPersona != 0 &&
                    !string.IsNullOrWhiteSpace(PersonaActual.Email))
                {
                    // Se cumplen todas las condiciones para realizar la compra
                    return true;
                }
            }
            // Si no se cumplen las condiciones, no se permite la compra
            return false;
        }
    }

}
