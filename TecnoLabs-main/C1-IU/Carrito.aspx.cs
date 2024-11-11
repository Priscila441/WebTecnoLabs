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
		string msg;
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
				panelConfirmarPago.Visible = !panelConfirmarPago.Visible;
			}
			else
			{
				ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor, inicie sesión para completar la compra.');", true);
				panelRegistroRapido.Visible = !panelRegistroRapido.Visible;
			}
		}

		protected void btnCancelPayment_Click(object sender, EventArgs e)
		{
			panelConfirmarPago.Visible = !panelConfirmarPago.Visible;
		}

		protected void btnRegister_Click(object sender, EventArgs e)
		{
			panelRegistroRapido.Visible= !panelRegistroRapido.Visible;
			Clientes persona = new Clientes();

			try
			{
				persona.Nombre = txtNombre.Text;
				persona.Apellido = txtApellido.Text;
				persona.Edad = int.Parse(txtEdad.Text);
				persona.Email = txtEmailRegistro.Text;
				persona.Direccion = txtDireccion.Text;
			}
			catch (Exception ex)
			{
				LiteralRegistroMessage.Text = "<div class='alert alert-danger'>Verifique que los campos contengan el tipo de dato esperado.</div>";
				return;
			}

			bool esRegistrado = conexion.NuevoRegistro(persona);

			if (esRegistrado)
			{
				msg = $"¡Felicitaciones {persona.Nombre}, te registraste exitosamente!";
				ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
				pnlRegister.Visible = !pnlRegister.Visible;
				panelConfirmarPago.Visible= !panelConfirmarPago.Visible;
			}
			else
			{
				LiteralRegistroMessage.Text = "<div class='alert alert-danger'>No se pudo completar el registro. Por favor, verifica los datos e inténtalo de nuevo.</div>";
			}
		}

		protected void btnPay_Click(object sender, EventArgs e)
		{
			try
			{
				int idCompra = conexion.RealizarCompra(dropMetodoPago.Text);

				if (idCompra != 0 && dropMetodoPago.Text != "Seleccionar")
				{
					gvCarrito.DataSource = null;
					CarritoCompra.Instancia.listProductos.Clear();

					msg = $"Compra realizada con éxito. ID de Compra: {idCompra}";
					string script = $@"
					alert('{msg}');
					setTimeout(function() {{
						window.location.href = 'Default.aspx';
					}}, 500);";
					ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
				}
				else
				{
					msg = "Se produjo un error al realizar la compra. Recuerde seleccionar un método de pago.";
					ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);
				}
			}
			catch (Exception ex)
			{
				msg = "Verifique que los campos contengan el tipo de dato esperado.";
				ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);

				ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
			}
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			bool esValido = conexion.VerificarUsuario(txtEmail.Text);

			if (esValido)
			{
				msg = "Sesión iniciada correctamente.";
				ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{msg}');", true);

				panelRegistroRapido.Visible = !panelRegistroRapido.Visible;
				panelConfirmarPago.Visible = !panelConfirmarPago.Visible;
			}
			else
			{
				LiteralInicioMessage.Text = "<div class='alert alert-danger'>Email o contraseña incorrectos</div>";
			}
		}

		protected void btnCalcularTotal_Click(object sender, EventArgs e)
		{
			decimal total = CarritoCompra.Instancia.CalcularTotal();
			lblTotal.Text = $"Total: ${total}";
		}
	}
}