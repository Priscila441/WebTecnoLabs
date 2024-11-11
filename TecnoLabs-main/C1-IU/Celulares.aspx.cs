using C4_ENTIDADES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C1_IU
{
    public partial class Celulares : System.Web.UI.Page
    {
		string msg;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void BtnAgregarCarrito1_Click(object sender, EventArgs e)
		{
			Productos celu = new Productos();
			celu.IdProducto = 2;
			celu.Marca = "Apple";
			celu.Modelo = "iPhone 11";
			celu.Precio = 1100;
			celu.Stock = 12;
			celu.IdCategoria = 1;

			CarritoCompra.Instancia.AgregarProducto(celu);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}

		protected void BtnAgregarCarrito2_Click(object sender, EventArgs e)
		{
			Productos celu = new Productos();
			celu.IdProducto = 3;
			celu.Marca = "Samsung";
			celu.Modelo = "Galaxy A53";
			celu.Precio = 600;
			celu.Stock = 31;
			celu.IdCategoria = 1;

			CarritoCompra.Instancia.AgregarProducto(celu);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}

		protected void BtnAgregarCarrito3_Click(object sender, EventArgs e)
		{
			Productos celu = new Productos();
			celu.IdProducto = 4;
			celu.Marca = "Redmi";
			celu.Modelo = "Note 13 Pro";
			celu.Precio = 940;
			celu.Stock = 43;
			celu.IdCategoria = 1;

			CarritoCompra.Instancia.AgregarProducto(celu);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}
	}
}