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
    public partial class Acceso : System.Web.UI.Page
    {
		CN_Productos conexion = new CN_Productos();
		string msg;

		protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				ClientScript.RegisterForEventValidation(ButtonAcceder.UniqueID);
				panelAdmin.Visible = false;
				panelCliente.Visible = false;
				panelRegistroCliente.Visible = true;
			}
		}

		protected void ButtonAcceder_Click(object sender, EventArgs e)
		{
			string usuario = txtAdmin.Text;
			string contrasenia = txtContrasenia.Text;

			if (usuario == "admin@gmail.com" && contrasenia == "123")
			{
				// Redirección en el servidor
				Response.Redirect("Administrador.aspx", false);
			}
			else
			{
				txtAdmin.Text = "";
				txtContrasenia.Text = "";

				LiteralMessage.Text = "<div class='alert alert-danger'>Usuario o contraseña incorrectos.</div>";
			}
		}

		protected void btnAdmin_Click(object sender, EventArgs e)
		{
			panelAdmin.Visible = true;
			panelCliente.Visible = false;
			panelRegistroCliente.Visible = false;
		}

		protected void btnCliente_Click(object sender, EventArgs e)
		{
			panelAdmin.Visible = false;
			panelCliente.Visible = true;
			panelRegistroCliente.Visible = false;
		}

		protected void ButtonAccederCliente_Click(object sender, EventArgs e)
		{
			bool esValido = conexion.VerificarUsuario(txtClienteUsuario.Text);

			if (esValido)
			{
				msg = "Sesión iniciada correctamente.";
				string script = $@"
				alert('{msg}');
				setTimeout(function() {{
					window.location.href = 'Default.aspx';
				}}, 1000);";
				ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

			}
			else
			{
				LiteralMessageCliente.Text = "<div class='alert alert-danger'>Email o contraseña incorrectos</div>";
			}
		}

		protected void btnRegistrarse_Click(object sender, EventArgs e)
		{
			Clientes persona = new Clientes();

			try
			{
				persona.Nombre = txtNombre.Text;
				persona.Apellido = txtApellido.Text;
				persona.Edad = int.Parse(txtEdad.Text);
				persona.Email = txtEmail.Text;
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
				string script = $@"
				alert('{msg}');
				setTimeout(function() {{
					window.location.href = 'Default.aspx';
				}}, 1000);";
				ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
			}
			else
			{
				LiteralRegistroMessage.Text = "<div class='alert alert-danger'>No se pudo completar el registro. Por favor, verifica los datos e inténtalo de nuevo.</div>";
			}
		}
	}
}