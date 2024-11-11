using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C2_BLL;
using C4_ENTIDADES;

namespace C1_IU
{
    public partial class Carrito : System.Web.UI.Page
    {
        CN_Productos conexion = new CN_Productos();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cargar();
        }
        protected void Cargar()
        {
            gvCarrito.DataSource = conexion.CargarProductos();
            gvCarrito.DataBind();
        }
	}
}