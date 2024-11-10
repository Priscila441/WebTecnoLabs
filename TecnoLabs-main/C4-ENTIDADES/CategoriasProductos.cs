using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C4_ENTIDADES
{
    public class CategoriasProductos
    {
        int idCategoria;
        string categoria;

        public int IdCategoria { get => idCategoria; set => idCategoria = value; }
        public string Categoria { get => categoria; set => categoria = value; }

        public CategoriasProductos(int idCategoria,string categoria) 
        {
            this.IdCategoria = idCategoria;
            this.Categoria = categoria;
        }
    }
}
