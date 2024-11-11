using C4_ENTIDADES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace C1_IU
{
    public partial class Notebooks : System.Web.UI.Page
    {
		string msg;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAgregarCarrito1_Click(object sender, EventArgs e)
        {
			Productos compu = new Productos();
			compu.IdProducto = 8;
			compu.Marca = "Apple";
			compu.Modelo = "Air";
			compu.Precio = 1800;
			compu.Stock = 8;
			compu.IdCategoria = 3;

			CarritoCompra.Instancia.AgregarProducto(compu);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}

		protected void BtnAgregarCarrito2_Click(object sender, EventArgs e)
		{
			Productos compu = new Productos();
			compu.IdProducto = 9;
			compu.Marca = "Asus";
			compu.Modelo = "Vivobook 16";
			compu.Precio = 1400;
			compu.Stock = 13;
			compu.IdCategoria = 3;

			CarritoCompra.Instancia.AgregarProducto(compu);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}

		protected void BtnAgregarCarrito3_Click(object sender, EventArgs e)
		{
			Productos compu = new Productos();
			compu.IdProducto = 10;
			compu.Marca = "Asus";
			compu.Modelo = "Vivobook 16";
			compu.Precio = 1400;
			compu.Stock = 13;
			compu.IdCategoria = 3;

			CarritoCompra.Instancia.AgregarProducto(compu);
			msg = "Producto agregado al carrito";
			ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
		}
	}
}