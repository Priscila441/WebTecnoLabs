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
            CargarCarrito();
        }
        protected void CargarCarrito()
        {
            List<Productos> listProductos = CarritoCompra.Instancia.listProductos;
			gvCarrito.DataSource = listProductos;
            gvCarrito.DataBind();
        }

		protected void btnQuitarProducto_Click(object sender, EventArgs e)
		{
			if (gvCarrito.SelectedRow != null)
			{
				int indiceFila = gvCarrito.SelectedRow.RowIndex;

				List<Productos> productos = CarritoCompra.Instancia.listProductos;

				if (indiceFila >= 0 && indiceFila < productos.Count)
				{
					productos.RemoveAt(indiceFila);
					CargarCarrito();

					ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Producto eliminado del carrito.');", true);
				}
				else
				{
					ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Índice fuera de rango.');", true);
				}
			}
			else
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor, seleccione un producto para eliminar.');", true);
			}
		}
		private bool EstaLogueado()
		{
			return GestorCompra.Instancia.ClienteActual != null;
		}

		protected void btnPagar_Click(object sender, EventArgs e)
		{
			if (EstaLogueado())
			{
				panelConfirmarPago.Visible = true;
			}
			else
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor, inicie sesión para completar la compra.');", true);
				panelRegistroRapido.Visible = true;
			}
		}
	}
}