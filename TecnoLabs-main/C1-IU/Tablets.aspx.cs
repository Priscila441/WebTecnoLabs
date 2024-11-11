using C4_ENTIDADES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C1_IU
{
    public partial class Tablets : System.Web.UI.Page
    {
		string msg;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAgregarCarrito1_Click(object sender, EventArgs e)
        {
			Productos tablet = new Productos();
			tablet.IdProducto = 5;
			tablet.Marca = "Apple";
			tablet.Modelo = "iPad 9°";
			tablet.Precio = 700;
			tablet.Stock = 11;
			tablet.IdCategoria = 2;

			CarritoCompra.Instancia.AgregarProducto(tablet);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}

		protected void BtnAgregarCarrito2_Click(object sender, EventArgs e)
		{
			Productos tablet = new Productos();
			tablet.IdProducto = 6;
			tablet.Marca = "Lenovo";
			tablet.Modelo = "Tab M10 Plus";
			tablet.Precio = 580;
			tablet.Stock = 14;
			tablet.IdCategoria = 2;

			CarritoCompra.Instancia.AgregarProducto(tablet);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}

		protected void BtnAgregarCarrito3_Click(object sender, EventArgs e)
		{
			Productos tablet = new Productos();
			tablet.IdProducto = 7;
			tablet.Marca = "Samsung";
			tablet.Modelo = "Galaxy Tab S Lite";
			tablet.Precio = 640;
			tablet.Stock = 3;
			tablet.IdCategoria = 2;

			CarritoCompra.Instancia.AgregarProducto(tablet);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}
	}
}